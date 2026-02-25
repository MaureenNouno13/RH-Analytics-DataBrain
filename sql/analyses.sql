-- Combien d’employés sont actuellement actifs ?

SELECT COUNT(*) AS employes_actifs
FROM employes
WHERE date_depart is NULL;


-- Combien de départs avons-nous eu sur les 12 derniers mois ?

SELECT COUNT(*) AS nombre_departs_12_mois
FROM turnover
WHERE date_depart >= CURRENT_DATE - INTERVAL '12 months';


-- Quels départements ont le turnover le plus élevé ?

SELECT 
    d.nom_departement,
    COUNT(t.date_depart) AS nombre_departs
FROM turnover t 
JOIN employes e ON e.id_employe = t.id_employe
JOIN departements d ON d.id_departement = e.departement_id
GROUP BY d.id_departement
ORDER BY nombre_departs DESC;


-- Quel est le salaire moyen par département ?

SELECT
    d.nom_departement,
    ROUND(AVG(e.salaire), 2) AS salaire_moyen
FROM employes e
JOIN departements d ON d.id_departement = e.departement_id
GROUP BY d.id_departement


-- Quels employés ont plus de 5 ans d’ancienneté ?

SELECT 
    nom,
    prenom,
    anciennete
FROM employes
WHERE anciennete > 5


-- Classez les départements par performance moyenne trimestrielle.

SELECT
    d.nom_departement,
    ROUND(AVG(p.score), 2) AS score_moyen
FROM departements d
JOIN employes e ON e.departement_id = d.id_departement
JOIN performances p ON p.id_employe =  e.id_employe
GROUP BY id_departement
ORDER BY score_moyen DESC


-- Identifier les 10 meilleurs employés sur 3 derniers trimestres.

WITH trimestres_dataset AS (
    SELECT DISTINCT date_trunc('quarter', date_evaluation) AS trimestre
    FROM performances
),
top_3_trimestres AS (
    SELECT trimestre
    FROM trimestres_dataset
    ORDER BY trimestre DESC
    LIMIT 3
)
SELECT 
    e.id_employe,
    e.nom,
    AVG(p.score) AS score_moyen
FROM employes e
JOIN performances p ON e.id_employe = p.id_employe
JOIN top_3_trimestres t 
    ON date_trunc('quarter', p.date_evaluation) = t.trimestre
GROUP BY e.id_employe, e.nom
ORDER BY score_moyen DESC
LIMIT 10;

-- Sur tous les trimestres 

SELECT
    e.nom,
    e.prenom,
    ROUND(AVG(p.score), 2) AS score_moyen,
    COUNT(*) AS nombre_trimestres
FROM employes e
JOIN performances p ON e.id_employe = p.id_employe
GROUP BY e.id_employe
HAVING COUNT(*) >=3
ORDER BY score_moyen DESC
LIMIT 10


-- Identifier les employés les moins performants et leur département.

SELECT
    e.nom,
    e.prenom,
    ROUND(AVG(p.score), 2) AS score_moyen,
    d.id_departement
FROM departements d
JOIN employes e ON e.departement_id = d.id_departement
JOIN performances p ON p.id_employe =  e.id_employe
GROUP BY e.id_employe, d.id_departement
HAVING AVG(p.score) < 60
ORDER BY score_moyen ASC


-- Calculer la rétention moyenne par cohorte d’embauche.

SELECT 
    cohorte_embauche,
    ROUND(AVG(anciennete), 2) AS retention_moyenne
FROM employes
GROUP BY cohorte_embauche
ORDER by cohorte_embauche


-- Quels départements recrutent le plus souvent ?

SELECT
    nom_departement,
    COUNT(id_employe) AS recrutements
FROM departements d
JOIN employes e ON e.departement_id = d.id_departement
GROUP BY d.id_departement
ORDER BY recrutements DESC;


-- Quelle proportion des départs est volontaire vs involontaire ?

SELECT
    type_depart,
    COUNT(*) AS nombre_departs,
    ROUND(
        (COUNT(*) / SUM(COUNT(*)) OVER())*100,
        2
    ) AS pourcentage
FROM turnover
GROUP BY type_depart


-- Quelle est la distribution des postes par ancienneté ?

SELECT
    poste,
    CASE
        WHEN anciennete < 2 THEN '0-2 ans'
        WHEN anciennete BETWEEN 2 AND 5 THEN '2-5 ans'
        ELSE '5+ ans'
    END AS categorie_anciennete,
    COUNT(*) AS nombre_employes
FROM employes
GROUP BY poste, categorie_anciennete
ORDER BY poste, categorie_anciennete


-- Quels employés n’ont pas encore reçu de feedback cette année ?

SELECT
    e.nom,
    e.prenom,
    p.date_evaluation
FROM employes e
LEFT JOIN performances p ON e.id_employe = p.id_employe
AND EXTRACT(YEAR FROM p.date_evaluation)  = EXTRACT(YEAR FROM CURRENT_DATE)
WHERE p.id_employe IS NULL
AND e.date_depart IS NULL


-- Segmentez les employés par niveau de performance : faible / moyen / élevé.

SELECT
    categorie_performance,
    COUNT(*) AS nombre_employes
FROM performance_categorie
GROUP BY categorie_performance


-- Générer un tableau résumé avec KPIs par département et par cohorte.

SELECT
    nom_departement AS Departement,
    cohorte_embauche AS Cohorte_embauche,
    COUNT(DISTINCT e.id_employe) AS Effectif,
    ROUND(AVG(e.salaire), 2) AS Salaire_Moyen,
    ROUND(AVG(p.score), 2) AS Ssore_Moyen,
    ROUND(AVG(e.anciennete), 2) AS Ancienneté_moyenne
FROM performances p 
JOIN employes e ON e.id_employe = p.id_employe
JOIN departements d ON d.id_departement = e.departement_id
GROUP BY nom_departement, cohorte_embauche
ORDER BY nom_departement, cohorte_embauche ASC


-- By Maureen 

# 📊 Projet RH Analytics – SQL (PostgreSQL)

## 👤 Contexte du projet

Ce projet simule une mission réelle de **Data Analyst SQL** au sein de l'entreprise fictive DataBrain, pour le compte du service **Ressources Humaines (RH)**.

L’objectif est d’exploiter des données RH afin de fournir :

* Des **indicateurs clés**
* Des **analyses de performance**
* Des **insights décisionnels**
* Un **tableau de bord RH exploitable**

---

## 🎯 Compétences démontrées

Ce projet met en avant :

* SQL avancé (PostgreSQL)
* Analyse de données RH
* Structuration d’un projet data
* Traduction de besoins business en requêtes analytiques
* Utilisation de CTE, JOIN, agrégations, fonctions fenêtres

---

## 🏢 Objectifs business

Le service RH souhaite :

* Comprendre l’évolution des effectifs
* Identifier les départements à risque (turnover élevé)
* Évaluer la performance des employés
* Analyser la rétention par cohorte d’embauche
* Disposer d’indicateurs exploitables pour la prise de décision

👉 **15 questions business** ont été formulées par le manager RH et résolues exclusivement en SQL.

---

## 🗄️ Données utilisées

Le projet repose sur 4 tables principales (format CSV).

### 1️⃣ Table `employes`

| Colonne             | Description                    |
| ------------------- | ------------------------------ |
| id_employe (PK)     | Identifiant unique             |
| nom                 | Nom                            |
| prenom              | Prénom                         |
| poste               | Intitulé du poste              |
| departement_id (FK) | Référence au département       |
| date_embauche       | Date d’entrée                  |
| date_depart         | Date de sortie (si applicable) |
| salaire             | Salaire annuel                 |

---

### 2️⃣ Table `departements`

| Colonne             | Description             |
| ------------------- | ----------------------- |
| id_departement (PK) | Identifiant département |
| nom_departement     | Nom du département      |
| manager             | Responsable             |
| budget              | Budget alloué           |

---

### 3️⃣ Table `performances`

| Colonne             | Description                     |
| ------------------- | ------------------------------- |
| id_performance (PK) | Identifiant performance         |
| id_employe (FK)     | Référence employé               |
| date_evaluation     | Date d’évaluation               |
| score               | Score de performance            |
| objectifs_atteints  | Indicateur d’objectifs atteints |

---

### 4️⃣ Table `turnover`

| Colonne        | Description                    |
| -------------- | ------------------------------ |
| id_depart (PK) | Identifiant départ             |
| id_employe     | Employé concerné               |
| date_depart    | Date de départ                 |
| type_depart    | Volontaire / Involontaire      |
| anciennete     | Ancienneté au moment du départ |

---

## 🛠️ Outils & Technologies

* PostgreSQL
* SQL (CTE, JOIN, GROUP BY, fonctions fenêtres)
* VS Code

---

## 🔄 Transformations & Enrichissement des données

Pour rendre les données exploitables pour l’analyse RH, plusieurs colonnes dérivées ont été créées :

### 📌 Colonnes calculées

* **Ancienneté** :
  Durée entre la date d’embauche et aujourd’hui (ou date de départ)

* **Cohorte d’embauche** :
  Année d’entrée dans l’entreprise

* **Score moyen** :
  Moyenne des scores de performance par employé

* **Catégorie de performance** :

  * Faible (< 60)
  * Moyenne (60–80)
  * Élevée (> 80)

Ces transformations permettent :

* Une analyse temporelle
* Une segmentation stratégique
* Une meilleure lecture des performances RH

---

## 📊 Analyses réalisées (15 questions business)

Les analyses couvrent notamment :

* Effectif actuel
* Turnover global et par département
* Répartition des départs (volontaire / involontaire)
* Salaire moyen par département
* Employés à forte ancienneté
* Performance moyenne par département
* Top 10 des employés les plus performants
* Employés en difficulté
* Rétention par cohorte d’embauche
* Départements qui recrutent le plus
* Employés sans feedback récent
* Segmentation des performances
* Tableau KPI RH par département et cohorte

⚡ Toutes les analyses sont réalisées exclusivement en SQL (sans outil de visualisation).

---

## 📈 Exemples de KPIs produits

* Effectif par département
* Salaire moyen
* Score de performance moyen
* Ancienneté moyenne
* Turnover par type
* Rétention par cohorte

Ces indicateurs peuvent être exploités par :

* La Direction RH
* La Direction Financière
* Les managers opérationnels

---

## 🧠 Insights & Recommandations RH

À partir des analyses réalisées :

* Mettre en place des plans de rétention pour les employés à forte ancienneté
* Auditer les départements à turnover élevé
* Renforcer les processus de feedback
* Adapter les politiques salariales selon la performance
* Améliorer l’onboarding des nouvelles cohortes

---

## 👨‍💻 Auteur

**Maureen DOMCHE**
Data Analyst | SQL | Power BI | Microsoft Fabric

---

## 🚀 Pourquoi ce projet est pertinent ?

* Cas métier réaliste
* SQL avancé et structuré
* Démarche analytique claire
* Génération d’insights actionnables
* Projet directement exploitable en entreprise



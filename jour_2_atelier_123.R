#---------------------------------------------------------------------------#
# jour_2_atelier_123.R
# Formation "Machine Learning avancé avec R et tidymodels" - Pyranhia
#
# Régler un boosting par recherche en grille et validation croisée,
# l'évaluer avec des métriques adaptées au déséquilibre, puis corriger le
# déséquilibre par pondération et par ajustement du seuil de décision.
#---------------------------------------------------------------------------#


## Lecture et exploration des données ----------------------------------------
#---------------------------------------------------------------------------#

# Charger les packages
library(tidyverse)
library(tidymodels)
library(patchwork)
library(lightgbm)
library(bonsai)
library(datapyranhia)

# Charger le jeu de données
# <Votre code ici>

# Aperçu rapide
# <Votre code ici>


## Séparation des données ----------------------------------------------------
#---------------------------------------------------------------------------#

# Split initial entre training et test
# <Votre code ici>

# Récupération des jeux training et test
# <Votre code ici>

# Cross validation sur le training set
# <Votre code ici>


## Définition du modèle, recette et workflow ---------------------------------
#---------------------------------------------------------------------------#

# Définition du modèle
# <Votre code ici>

# Recette
# <Votre code ici>

# Workflow
# <Votre code ici>


## Optimisation des hyperparamètres du modèle --------------------------------
#---------------------------------------------------------------------------#

# Définition de la grille
# <Votre code ici>

# Gridsearch
# <Votre code ici>

# Afficher les résultats
# <Votre code ici>


## Finalisation du modèle ----------------------------------------------------
#---------------------------------------------------------------------------#

# Sélectionner le meilleur modèle
# <Votre code ici>

# Finaliser le workflow
# <Votre code ici>

# Entraîner sur l'ensemble du jeu d'entraînement
# <Votre code ici>


## Évaluation du modèle ------------------------------------------------------
#---------------------------------------------------------------------------#

# Prédictions sur le jeu de test
# <Votre code ici>

# Calcul de l'accuracy
# <Votre code ici>

# Matrice de confusion
# <Votre code ici>

# Calcul de la précision et du recall
# <Votre code ici>


## ROC-AUC : évaluer la discrimination globale -------------------------------
#---------------------------------------------------------------------------#

# Calculer les probabilités sur le test set
# <Votre code ici>

# Calculer ROC-AUC
# <Votre code ici>

# Tracer la courbe ROC
# <Votre code ici>


## PR-AUC : focus sur la classe minoritaire ----------------------------------
#---------------------------------------------------------------------------#

# Calculer PR-AUC
# <Votre code ici>

# Tracer la courbe Precision-Recall
# <Votre code ici>


## Pondération des observations ----------------------------------------------
#---------------------------------------------------------------------------#

# Calculer le ratio de déséquilibre
# <Votre code ici>

# Définir le modèle pondéré
# <Votre code ici>

# Créer le workflow et entraîner
# <Votre code ici>

# Prédire sur le jeu de test
# <Votre code ici>

# Matrices de confusion sans et avec pondération, côte à côte
# <Votre code ici>


## Ajuster le seuil de décision ----------------------------------------------
#---------------------------------------------------------------------------#

# Obtenir des prédictions de validation croisée sur le modèle finalisé
# <Votre code ici>

# Tracer la courbe Precision-Recall sur les prédictions de validation croisée
# <Votre code ici>

# Choisir le seuil qui atteint un recall d'au moins 0.75
# <Votre code ici>

# Superposer ce point sur la courbe
# <Votre code ici>

# Reclassifier le test set avec le seuil choisi sur la CV
# <Votre code ici>

# Vérifier précision et recall obtenus
# <Votre code ici>

# Matrices de confusion au seuil par défaut et au seuil choisi, côte à côte
# <Votre code ici>

#---------------------------------------------------------------------------#
# jour_2_atelier_5.R
# Formation "Machine Learning avancé avec R et tidymodels" - Pyranhia
#
# Repérer les prédicteurs colinéaires de `housing_train` (VIF), identifier
# ceux que supprime `step_corr()`, puis combiner les prédicteurs numériques
# d'`ames` en 5 composantes principales.
#---------------------------------------------------------------------------#


## Préparation des données ---------------------------------------------------
#---------------------------------------------------------------------------#

# Charger les packages
library(tidyverse)
library(tidymodels)
library(datapyranhia)

# Charger le jeu de données et créer les jeux d'entraînement et de test
data(housing)

set.seed(123)
housing_split <- initial_split(housing, prop = 0.8)
housing_train <- training(housing_split) |> select(-longitude, -latitude)
housing_test  <- testing(housing_split)  |> select(-longitude, -latitude)


## Détecter les colinéarités -------------------------------------------------
#---------------------------------------------------------------------------#

# Charger le package qui calcule le VIF
# <Votre code ici>

# Préparer les prédicteurs numériques avec une recette
# <Votre code ici>

# Ajuster un modèle linéaire
# <Votre code ici>

# Calculer le VIF pour chaque prédicteur
# <Votre code ici>


## Gérer la colinéarité : step_corr() ----------------------------------------
#---------------------------------------------------------------------------#

# Construire et préparer la recette avec step_corr()
# <Votre code ici>

# Identifier les prédicteurs supprimés
# <Votre code ici>


## Gérer la colinéarité : ACP ------------------------------------------------
#---------------------------------------------------------------------------#

# Charger le jeu de données et créer les jeux d'entraînement et de test
data(ames)

set.seed(123)
ames_split <- initial_split(ames, prop = 0.8)
ames_train <- training(ames_split)
ames_test  <- testing(ames_split)

# Construire et préparer la recette avec step_normalize() puis step_pca()
# <Votre code ici>

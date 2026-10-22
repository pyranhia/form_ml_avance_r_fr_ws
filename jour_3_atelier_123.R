#---------------------------------------------------------------------------#
# jour_3_atelier_123.R
# Formation "Machine Learning avancé avec R et tidymodels" - Pyranhia
#
# Calculer l'importance par permutation de `final_fit` avec `DALEX`, tracer
# des PDP, calculer les valeurs SHAP d'une observation avec `DALEX`, puis
# celles de tout le jeu de test avec `shapviz` et les explorer.
#---------------------------------------------------------------------------#


## Préparation : le modèle de référence du jour 2 ----------------------------
#---------------------------------------------------------------------------#

# Charger les packages
library(tidyverse)
library(tidymodels)
library(patchwork)
library(lightgbm)
library(bonsai)
library(datapyranhia)

# Charger le jeu de données et reconstituer les mêmes splits qu'au jour 2
data(adult)

set.seed(123)
adult_split <- initial_split(adult, prop = 0.8, strata = "income")
adult_train <- training(adult_split)
adult_test  <- testing(adult_split)

# Modèle de boosting avec la meilleure configuration trouvée au jour 2
lgb_spec <- boost_tree(
  trees = 1000,
  learn_rate = 0.1,
  tree_depth = 2
) |>
  set_engine("lightgbm") |>
  set_mode("classification")

final_wf <- workflow() |>
  add_recipe(recipe(income ~ ., data = adult_train)) |>
  add_model(lgb_spec)

set.seed(123)
final_fit <- fit(final_wf, data = adult_train)


## Importance par permutation ------------------------------------------------
#---------------------------------------------------------------------------#

# Charger le package DALEXtra
library(DALEXtra)

# Créer l'explainer
# <Votre code ici>

# Calculer l'importance par permutation
# <Votre code ici>

# Visualiser (plot automatique de DALEX)
# <Votre code ici>


## Créer des PDP pour les variables clés -------------------------------------
#---------------------------------------------------------------------------#

# Créer les PDP
# <Votre code ici>

# Visualiser et combiner les 3 plots avec patchwork
# <Votre code ici>


## Calculer les valeurs SHAP d'une observation -------------------------------
#---------------------------------------------------------------------------#

# Sélectionner une observation du jeu de test
# <Votre code ici>

# Calculer les valeurs SHAP pour cette observation
# <Votre code ici>

# Visualiser (plot automatique de DALEX)
# <Votre code ici>


## Construire l'objet sv avec shapviz ----------------------------------------
#---------------------------------------------------------------------------#

library(shapviz)

# Prédicteurs du jeu de test, préparés par la recette ajustée
# <Votre code ici>

# Mêmes prédicteurs, encodés comme lightgbm les a vus
# <Votre code ici>

# Extraire le modèle lightgbm du workflow
# <Votre code ici>

# Valeurs SHAP (TreeSHAP) pour tout le jeu de test
# <Votre code ici>

# Vérification : les valeurs SHAP reconstituent bien la prédiction du modèle
# Probabilité de >50K prédite par le modèle
p_model <- predict(final_fit, adult_test, type = "prob")$`.pred_>50K`

# Probabilité reconstruite à partir des valeurs SHAP
p_shap <- plogis(get_baseline(sv) + rowSums(get_shap_values(sv)))

# Plus grand écart absolu
max(abs(p_model - p_shap))


## Explorer les valeurs SHAP avec shapviz ------------------------------------
#---------------------------------------------------------------------------#

# Waterfall plot de la première observation du jeu de test
# <Votre code ici>

# Summary plot (beeswarm) sur tout le jeu de test
# <Votre code ici>

# Dependence plot de education, sans couleur
# <Votre code ici>

# Dependence plot de age, sans couleur
# <Votre code ici>

# Dependence plot de sex, sans couleur
# <Votre code ici>

# Dependence plot de sex, points colorés par relationship
# <Votre code ici>

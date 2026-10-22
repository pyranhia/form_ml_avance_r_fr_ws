#---------------------------------------------------------------------------#
# jour_1_demo_credit.R
# Formation "Machine Learning avancé avec R et tidymodels" - Pyranhia
#
# Démonstration du pipeline tidymodels sur `credit` : recette, modèle,
# workflow, prédictions et évaluation.
#---------------------------------------------------------------------------#


## Charger les données -------------------------------------------------------
#---------------------------------------------------------------------------#

# Charger les packages
library(tidyverse)
library(tidymodels)
library(datapyranhia)

# Charger le jeu de données
data(credit)

glimpse(credit)
summary(credit)


## Séparer les données -------------------------------------------------------
#---------------------------------------------------------------------------#

set.seed(123)

# Split stratifié sur la variable cible : 80% train, 20% test
credit_split <- initial_split(credit, prop = 0.8, strata = default)

train_set <- training(credit_split)
test_set  <- testing(credit_split)

credit_split


## Définir la recette de prétraitement ---------------------------------------
#---------------------------------------------------------------------------#

# Prédicteurs choisis arbitrairement, log de limit_bal, encodage dummy d'education
credit_rec <- recipe(default ~ limit_bal + age + education + months_late, data = train_set) |>
  step_log(limit_bal) |>
  step_dummy(all_nominal_predictors())

tidy(credit_rec)


## Spécifier le modèle -------------------------------------------------------
#---------------------------------------------------------------------------#

log_spec <- logistic_reg() |>
  set_engine("glm") |>
  set_mode("classification")

log_spec


## Assembler le workflow -----------------------------------------------------
#---------------------------------------------------------------------------#

credit_wf <- workflow() |>
  add_recipe(credit_rec) |>
  add_model(log_spec)

credit_wf


## Entraîner le modèle -------------------------------------------------------
#---------------------------------------------------------------------------#

credit_fit <- credit_wf |>
  fit(data = train_set)

credit_fit

credit_fit |>
  tidy() |>
  select(term, estimate)


## Générer des prédictions ---------------------------------------------------
#---------------------------------------------------------------------------#

predict(credit_fit, new_data = test_set)

augment(credit_fit, new_data = test_set) |>
  select(default, limit_bal, age, education, months_late, .pred_class, .pred_no, .pred_yes)


## Évaluer le modèle ---------------------------------------------------------
#---------------------------------------------------------------------------#

# Prédictions sur le jeu de test, avec les valeurs observées
credit_preds <- augment(credit_fit, new_data = test_set)

# Matrice de confusion : classes prédites en lignes, classes observées en colonnes
conf_mat(credit_preds, truth = default, estimate = .pred_class)

# Jeu de métriques de classification
credit_metrics <- metric_set(accuracy, precision, recall)

credit_metrics(
  credit_preds,
  truth = default,
  estimate = .pred_class,
  event_level = "second"     # la classe positive est "yes", 2e niveau du facteur
)

# Proportion de chaque classe dans le jeu de test
test_set |>
  count(default) |>
  mutate(prop = n / sum(n))

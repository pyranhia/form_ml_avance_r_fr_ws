#---------------------------------------------------------------------------#
# jour_2_atelier_4.R
# Formation "Machine Learning avancé avec R et tidymodels" - Pyranhia
#
# Construire une validation croisée spatiale sur `ames`, sans entraîner de
# modèle.
#---------------------------------------------------------------------------#


## Préparation des données ---------------------------------------------------
#---------------------------------------------------------------------------#

# Charger les packages
library(tidyverse)
library(tidymodels)
library(datapyranhia)
library(sf)
library(spatialsample)

# Charger le jeu de données
data(ames)

# Convertir ames en objet spatial
ames_sf <- ames |>
  st_as_sf(
    coords = c("Longitude", "Latitude"),
    crs = 4326,
    remove = FALSE # conserve Longitude et Latitude comme colonnes
  )


## Validation croisée spatiale -----------------------------------------------
#---------------------------------------------------------------------------#

# Validation croisée spatiale à 5 plis
# <Votre code ici>

# Visualisation des plis
# <Votre code ici>

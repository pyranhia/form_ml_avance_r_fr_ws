# Formation Machine Learning avancé avec R et tidymodels

Dépôt officiel de la formation **Machine Learning avancé avec R et tidymodels** proposée par [Pyranhia](https://pyranhia.eu).

Il contient les scripts et fichiers de configuration nécessaires pour suivre les ateliers pratiques.

## Contenu

```
form_ml_avance_r_fr_ws/
├── jour_1_demo_credit.R               # Démo du pipeline tidymodels
├── jour_1_atelier_2_ames_mlp.R        # Réseau de neurones (MLP)
├── jour_1_atelier_3_ames_boosting.R   # Boosting
├── jour_2_atelier_123.R               # Hyperparamètres, déséquilibres, seuil de décision
├── jour_2_atelier_4.R                 # Validation croisée spatiale
├── jour_2_atelier_5.R                 # Colinéarité des prédicteurs
├── jour_3_atelier_123.R               # Importance, PDP, valeurs SHAP
└── renv.lock                          # Versions des packages (reproductibilité)
```

Les scripts des ateliers sont pré-remplis avec des sections `<Votre code ici>` à compléter au fil des exercices. Les corrigés (`_solution.R`) vous seront communiqués à l'issue de chaque atelier.

## Utilisation

Cette formation se déroule sur un serveur RStudio Server mis à disposition par Pyranhia : aucune installation locale n'est requise.

1. Connectez-vous au RStudio Server avec les identifiants qui vous ont été communiqués.
2. Ouvrez le terminal (onglet *Terminal* dans RStudio) et clonez ce dépôt :

```bash
git clone https://github.com/pyranhia/form_ml_avance_r_fr_ws.git
```

3. Ouvrez le projet ainsi cloné pour activer l'environnement `renv`.
4. Restaurez les packages :

```r
renv::restore()
```

## Prérequis

Cette formation prend la suite de [Premiers pas en Machine Learning avec R](https://pyranhia.eu/formations/premiers_pas_ml_r.html) : vous devez en maîtriser le contenu (validation croisée, métriques, surapprentissage, arbres de décision et Random Forest).

En R, vous êtes à l'aise avec `dplyr` et `ggplot2`. Aucune connaissance de `tidymodels` n'est nécessaire : le premier jour commence par sa prise en main.

## Ressources associées

- [datapyranhia](https://github.com/pyranhia/datapyranhia) : package R qui regroupe les jeux de données de la formation
- Contact : [contact@pyranhia.eu](mailto:contact@pyranhia.eu)

## Licence

Le code de ce dépôt est distribué sous licence [MIT](LICENSE.md).

© 2026 Pyranhia, Thelma Panaïotis

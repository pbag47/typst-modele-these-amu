
<!---
Copyright 2025 Pierre BAGNARA

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->


# Modèle de thèse Typst pour Aix-Marseille Université

Ce projet est une conversion vers Typst du [modèle LaTeX officiel d'Aix-Marseille Université](https://github.com/SCD-Aix-Marseille-Universite/latexamu/tree/master).
Il contient des templates qui permettent d'imiter la mise en page, le style et le format du modèle de thèse LaTeX.

> [!IMPORTANT]
> Ce projet est issu d'une initiative personnelle. Aix-Marseille Université (AMU) n'est aucunement affiliée à ce répertoire -> il ne s'agit pas d'un répertoire officiel validé par AMU. Les écoles doctorales restent donc décisionnaires, au cas par cas, quant à la validité de ce modèle et de son utilisation pour rédiger le manuscrit de thèse.


## Ligne de conduite

Ce répertoire propose uniquement des templates qui fonctionnent avec l'installation minimale de Typst, c'est-à-dire sans aucune dépendance à un package externe.
L'objectif derrière cette contrainte est d'obtenir un projet "plug-&-play" qui fonctionne dès l'installation, n'impose pas le choix d'un package externe particulier et ne risque pas de casser au fil du temps avec les différentes mises-à-jour.

Une conséquence de cette contrainte est que l'implémentation de fonctionnalités absentes sur l'installation de base de Typst doit se faire "à la main", en les codant soi-même (par exemple : les notes de fin de document). 

Ainsi, malgré mes efforts pour reproduire au mieux le modèle de thèse LaTeX, plusieurs différences sont à noter :
- Certaines fonctionnalités restent manquantes
    - Index
    - Glossaire
    - Table des matières locale pour chaque chapitre
> [!NOTE]
> Ces fonctionnalités peuvent être ajoutées par des packages externes (voir [Glossarium](https://typst.app/universe/package/glossarium/) par exemple). C'est à chaque utilisateur de rechercher les packages externes dont il a besoin.
- Certaines parties ne sont pas tout-à-fait reproduites à l'identique
    - Liens manquants sur les notes de fin de document pour retourner au texte d'origine
    - Les styles de bibliographie disponibles sur Typst sont moins nombreux que sur LaTeX, et le format des citations est moins flexible
- Parfois, Typst impose certaines contraintes
    - Il est impossible d'inclure un PDF tel quel dans un document Typst. Une solution est de convertir les PDF à inclure au format SVG (un autre format vectoriel), puis de les ajouter au document Typst sous forme d'images

> [!NOTE]
> Les fonctionnalités manquantes par rapport au modèle officiel sont marquées par les balises "TODO:" dans les fichiers sources, et suivies dans des Issues sur GitHub

<b><p align="center"> Le répertoire est en évolution et les contributions au code sont bienvenues. </p></b>


## Structure

Les templates sont défninis dans le dossier "templates".
Parmi eux, on compte : 
- ```default``` : le template principal pour le corps du manuscrit
- ```appendix``` : le template pour les annexes
- ```endnotes``` et ```showendnotes``` : l'implémentation "à la main" des notes de fin de document
- ```page_headers``` : l'implémentation "à la main" des en-têtes des pages.
- ```cover_page```: le template pour la page de garde
- ```affidavit```: le template pour l'Affidavit

Le fichier ```amu_templates.typ``` sert à regrouper ces templates dans un conteneur qui peut être importé et appelé par n'importe quel autre fichier du projet.

Il est recommandé de fragmenter les différents chapitres, voire les différentes sections, dans des fichiers séparés, puis de les inclure un-à-un dans un fichier principal (appelé ```thèse.typ``` dans ce projet).

Sur chaque fichier, on commence par importer et appliquer le template ```default``` à partir du fichier ```amu_templates.typ```. 
Puis, on ajoute le contenu.

```typst
#import "amu_templates.typ"
#show: amu_templates.default

// Contenu
```

Ces lignes appliquent les règles globales de mise en page qui ont été définies pour tout le corps du manuscrit.
Si besoin, ces règles globales peuvent être réécrites localement pour des parties qui dérogent au format de base.


## Fichiers et dépendances

![Diagramme drawio de l'organisation des fichiers et des imports](drawio_diagrams/dependancies.drawio.svg)

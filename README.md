
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


## Points à noter sur les commandes ```#set``` et ```#show```

Lorsqu'une commande ```#show``` ou ```#set``` est appliquée, elle se propage dans toute une zone d'effet. La zone d'effet est délimitée entre l'appel de la commande, et... : 
- la fin du bloc courant (```}```)
- s'il n'y a pas de bloc courant, la fin du fichier courant

Ainsi : 
- Les commandes ```#show``` et ```#set``` écrites dans le document principal se propagent dans toute la suite du document, y compris dans les fichiers ajoutés avec ```#include```
- Les commandes ```#show``` et ```#set``` écrites à l'intérieur des fichiers ajoutés avec ```#include``` ne sont appliquées que sur ces fichiers, elles n'ont pas d'autres répercussions sur le document principal
- Les commandes ```#show``` et ```#set``` écrites à l'intérieur des templates ne sont appliquées que sur ces templates, elles n'ont pas d'autres répercussions ailleurs


## Application des templates

Le template par défaut est appliqué sur le fichier principal, au tout début du fichier :
```typst
#import "amu_templates.typ"
#show: amu_templates.default

// Contenu
```
A partir de là, tous les fichiers inclus au document principal avec ```#include``` utilisent ce template.

Lorsqu'une partie du document déroge aux règles fixées par le template principal, deux solutions :
- Soit isoler la partie dans un fichier et écrire les commandes ```#set``` et ```#show``` que l'on veut appliquer au début du fichier (exemple dans ```abstract.typ```)
- Soit écrire un template spécifique (exemple dans ```affidavit.typ```)

>[!WARNING]
> Ecrire une commande ```#set``` ou ```#show``` dans le fichier principal revient à modifier les règles globales du template ```default``` qui sont appliquées sur tout le document. Mieux vaut directement modifier le template ```default``` dans ```templates/default.typ``` pour stocker toutes les règles globales au même endroit.


## Fichiers et dépendances

![Diagramme drawio de l'organisation des fichiers et des imports](drawio_diagrams/dependancies.drawio.svg)

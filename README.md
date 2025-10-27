
# Modèle de thèse Typst pour Aix-Marseille Université


Ce projet est une conversion vers Typst du [modèle LaTeX officiel d'Aix-Marseille Université](https://github.com/SCD-Aix-Marseille-Universite/latexamu/tree/master).
Il contient des templates qui permettent d'imiter la mise en page, le style et le format du modèle de thèse LaTeX.

> [!IMPORTANT]
> Ce projet est issu d'une initiative personnelle. Aix-Marseille Université (AMU) n'est aucunement affiliée à ce répertoire -> il ne s'agit pas d'un répertoire officiel validé par AMU. L'école doctorale reste donc décisionnaire, au cas par cas, quant à la validité de ce modèle et de son utilisation pour le manuscrit de thèse.

## "Guidelines"

Ce répertoire propose uniquement des templates qui fonctionnent avec l'installation minimale de Typst, c'est-à-dire sans aucune dépendance à un package externe.
L'objectif derrière cette contrainte est d'obtenir un projet "plug-&-play" qui fonctionne dès l'installation, n'impose pas le choix d'un package externe particulier et qui ne risque pas de casser au fil du temps avec les différentes mises-à-jour.

Une conséquence de cette contrainte est que l'implémentation de fonctionnalités absentes sur l'installation de base de Typst doit se faire "à la main", en les codant soi-même (par exemple : les notes de fin de document). 

Ainsi, malgré mes effort, plusieurs éléments sont à noter :
- Certaines fonctionnalités restent manquantes par rapport au modèle de thèse LaTeX
    - Index
    - Glossaire
    - Table des matières locale pour chaque chapitre
- Certaines parties ne sont pas tout-à-fait reproduites à l'identique
    - Table des annexes séparée de la table des matières principale
    - Liens manquants sur les notes de fin de document pour retourner au texte d'origine
    - Les styles de bibliographie disponibles sur Typst sont moins nombreux que sur LaTeX, et le format des citations est moins flexible
- Parfois, Typst impose certaines contraintes
    - Il est impossible d'inclure un PDF dans un document Typst. Une solution est de convertir les PDF à inclure au format SVG (un autre format vectoriel), puis de les ajouter au document Typst sous forme d'images

> [!NOTE]
> Les fonctionnalités manquantes par rapport au modèle officiel sont marquées par les balises "TODO:" dans les fichiers sources, et suivies dans des Issues sur GitHub


<b><p style="text-align: center;"> Le répertoire est en évolution et les contributions au code sont bienvenues. </p></b>

## Structure

Les templates sont défninis dans le dossier "templates".
Parmi eux, on compte : 
- ```default_amu_template``` : le template principal pour le corps du manuscrit
- ```default_appendix_template``` : le template pour les annexes
- ```endnotes``` et ```showendnotes``` : implémentation "à la main" des notes de fin de document
- ```page_headers``` : implémentation "à la main" des en-têtes des pages.

Le fichier ```_config.typ``` sert à regrouper ces templates dans un conteneur qui peut être importé et appelé par n'importe quel autre fichier du projet.

Il est recommandé de fragmenter les différents chapitres, voire les différentes sections, dans des fichiers séparés, puis de les inclure un-à-un dans un fichier principal (appelé ```main.typ``` dans ce projet).

Sur chaque fichier, on commence par importer et appliquer ```default_amu_template``` à partir du fichier ```_config.typ```. 
Puis, on ajoute le contenu.

```typst
#import "_config.typ"
#show: _config.default_amu_template

```

Ces lignes appliquent les règles globales de mise en page qui ont été définies pour tout le corps du manuscrit.
Si besoin, ces règles globales peuvent être réécrites localement pour des parties qui dérogent au format de base (par exemple : la page de garde, les annexes).
Dans ce cas, on commence toujours par importer ```default_amu_template```, puis on définit un template local qui réécrit uniquement les règles à modifier, et on l'applique en suivant. Voir un exemple sur ```page de garde.typ```.


## Fichiers et dépendances

![](drawio_diagrams/dependancies.drawio.svg)

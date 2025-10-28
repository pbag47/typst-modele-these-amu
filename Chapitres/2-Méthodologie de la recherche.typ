
#import "../_config.typ"
#show: _config.default_amu_template

= Méthodologie de la recherche

== Matériel et méthodes

=== Modèle animal

#lorem(150)

Une première note de fin de document #_config.endnote[Première note de fin de document.], 
une deuxième #_config.endnote[Deuxième note de fin de document.] et ...
#_config.endnote[... note de fin de document.] 
#_config.endnote[... note de fin de document.] 
#_config.endnote[... note de fin de document.] 
#_config.endnote[... note de fin de document.] 
#_config.endnote[... note de fin de document.] 
#_config.endnote[... note de fin de document.] 
#_config.endnote[... note de fin de document.] 
#_config.endnote[#lorem(50)].


=== Traitement expérimental

==== Hypergravité <Chap-Methodo_Part-Hypergravité>

L'hypergravité consiste à augmenter la force du vecteur gravitaire en lui sur-imposant la force centrifuge. En effet, la force centrifuge induite par la rotation se surimpose à la gravité terrestre ce qui permet d'avoir une force résultante dépendante de la vitesse de rotation. On utilise pour cela des centrifugeuses qui sont des carrousels équipés de nacelles suspendues à des axes libres permettant à la force résultante d'être perpendiculaire au plancher de la nacelle et ainsi obtenir une «gravité» dont la force est supérieure à la gravité terrestre tout en maintenant, pour les individus expérimentaux, l'orientation "naturelle" de celle-ci.

==== La centrifugeuse

Les caractéristiques techniques de la centrifugeuse 
// TODO: #_config.index[centrifugeuse] 
ont été décrites dans un article de @jamon_ground-based_2008
et dans la partie @Chap-Methodo_Part-Hypergravité. 
Brièvement, la centrifugeuse (Figure @Fig-Centrifugeuse)
est de grand diamètre (jusqu'à 3.6m en rotation). Pour limiter les vibrations, la centrifugeuse repose sur des dispositifs anti-vibrations. 
Le bruit produit par la centrifugeuse est faible. 
A un mètre de distance, le niveau sonore n'est que de 58dB contre 52dB si la centrifugeuse est arrêtée. 
Les nacelles sont sur des axes libres et chacune peut contenir trois cages de type standard 364~x~206~x~131mm avec 4 souris par cage, soit un total de 48 souris. 
La centrifugeuse est équipée de caméras infra-rouge couplées à un système de vidéo-surveillance accessible sur internet. 
Cela nous permet de contrôler les niveaux d'eau et de nourriture ainsi que de conduire des études de l'activité des individus expérimentaux à distance, de jour comme de nuit. 
La quantité d'eau et de nourriture disponible par cage permet de faire fonctionner la centrifugeuse 3 semaines sans interruption. 
Les animaux ont à disposition 400g de nourriture et 500mL d'eau, mais la consommation de nourriture sur cette période est en moyenne de (209~#sym.plus.minus~14)g, et la consommation d'eau de (258~#sym.plus.minus~21)mL pour une cage de 4 souris.

#figure(
  image(
    "../figures/photo_centrifugeuse.png", width: 70%, 
  ),
  caption: [Photographie de la centrifugeuse utilisée],
) <Fig-Centrifugeuse>

#lorem(50)

== Deuxième partie du deuxième chapitre

Le faisceau passe ensuite dans un module comprenant un cristal non linéaire permettant de doubler le féquence (excitation de 345nm à 500nm). 
Toutes les mesures ont été faites entre 400nm et 1200nm avec un pas de 5nm.

#lorem(100)

=== Première sous-partie de la deuxième partie

#lorem(50)

=== Deuxième sous-partie de la deuxième partie

Ajout d'une nouvelle entrée d'index pour la centrifugeuse
// TODO: \index{centrifugeuse} 
et pour le mot éléphant
// TODO: \index{elephant@éléphant} 
dont la première lettre est accentuée. Les entrées 
// TODO: \gls{+a} \gls{2a} \gls{ca} \gls{Aa} \gls{aa} \gls{alpha} {\NoAutoSpaceBeforeFDP}
sont dans la nomenclature. 
On peut utiliser les commandes personnelles pour appeler rapidement des formules lors de la rédaction 
// TODO: \acc 
et passer des arguments aux commandes pour en modifier l'éxécution. 
// TODO: \emiss[\nu]{\Omega}.


==== Ce titre de partie ne s'affiche pas dans la table des matières <exclude_heading_from_table_of_contents>

Voir (Tableaux~@Table-Alpha~et~@Table-Butcher)


#set heading(numbering: none)  // Numérotation des titres désactivée jusqu'à la fin du fichier, si elle n'est pas réactivée manuellement
==== Ce titre de partie n'est pas numéroté <exclude_heading_from_table_of_contents>

Ajout d'une citation entre parenthèses 
#cite(<godard_borreliose_2012>, style: "chicago-author-date").
Ajout d'une citation simple de 
#cite(<zohdy_mapping_2012>, style: "chicago-author-date", form: "prose").
Ajout d'une citation avec année et page entre parenthèses de \textcite[9]{godard_borreliose_2012} 
// TODO: 
// #cite(<godard_borreliose_2012>, style: "templates/cite_with_page_number.csl")
avec la commande \textit{\textbackslash textcite}. 
La citation suivante, sur la même page, de \textcite[12]{godard_borreliose_2012} 
// TODO:
// #cite(<godard_borreliose_2012>)
utilise ibidem avec le style de citation 
\textit{authoryear-ibid} et l'utilisation des options biblatex \textit{pagetracker} et \textit{ibidtracker}.


==== Plusieurs figures côte à côte <exclude_heading_from_table_of_contents>

#figure(
  grid(
    columns: (50%, 50%),
    gutter: 0.5em,
    column-gutter: 1em,
    image("../figures/example-image-a.png", width: 50%),
    image("../figures/example-image-b.png", width: 50%),
    "a)",
    "b)",
  ),
  caption: [Deux figures]
)

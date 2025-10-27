
#import "_config.typ"
#show: _config.default_amu_template

= Généralités

== Généralités sur la fusion thermonucléaire

Lors d'une réaction de fusion, deux noyaux légers s'assemblent pour former un noyau plus lourd. Pour obtenir une réaction de fusion, il faut rapprocher suffisamment deux noyaux qui, puisqu'ils sont tous deux chargés positivement, se repoussent. Une certaine énergie est donc indispensable pour franchir cette barrière et arriver dans la zone, très proche du noyau, où se manifeste l'interaction forte capable de l'emporter sur la répulsion électrostatique.

La réaction de fusion la plus favorable est celle faisant intervenir le deutérium et le tritium :
$ attach(D, bl: 1, tl: 2)^+ + attach(T, bl: 1, tl: 3)^+ arrow 
attach(H e, bl: 2, tl: 4)^(2+) med (3,5 "MeV") + n med (14,1 "MeV") $ <Eq:Fusion>

#lorem(100)

// TODO: Glossaire

Un acronyme utilisé une première fois \gls{asb} puis une seconde fois \gls{asb}. Une définition du glossaire \gls{rutile} et une entrée de la nomenclature \gls{+a}.

== Deuxième partie du premier chapitre

#lorem(100)

L'utilisation des formules dans un environnement autorise les références croisées. Par exemple, nous pouvons faire appel à la formule de la fusion deutérium-tritium @Eq:Fusion. 
Contrairement à une simple formule centrée :
$ (2 "Na"^+, attach("SO", br: 4)^(2-)) + ("Ba"^(2+), 2 "Cl"^-) arrow 
"BaSO"4 arrow.b + 2 "NaCl" $

#lorem(50)

#quote(lorem(50), attribution: "Auteur")

A titre d'exemple, nous venons d'insérer une courte citation fictive.

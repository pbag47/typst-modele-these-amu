
#import "_config.typ": default_amu_template, showendnotes
#show: default_amu_template

#include "page de garde.typ"
#include "affidavit.typ"
#include "liste des publications.typ"
#include "résumé.typ"
#include "abstract.typ"
#include "remerciements.typ"
#outline(
  title: [= Table des matières],
  target: heading.where(supplement: [Default heading])
)
#outline(
  title: [= Annexes],
  target: heading.where(supplement: [Annexe])
)
#pagebreak()
#outline(
  title: [= Table des figures],
  target: figure.where(kind: image),
)
#pagebreak()
#outline(
  title: [= Liste des tableaux],
  target: figure.where(kind: table),
)

#include "introduction.typ"
#include "1-Généralités.typ"
#include "2-Méthodologie de la recherche.typ"
#include "3-Résultats.typ"
#include "conclusion.typ"
#showendnotes()
#counter(heading).update(0)
#include "A1-Intitulé des doctorats.typ"
#include "A2-Consignes de présentation.typ"
#include "A3-Presentation guidelines.typ"


#import "_config.typ"
#show: _config.default_amu_template

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
#include "Chapitres/1-Généralités.typ"
#include "Chapitres/2-Méthodologie de la recherche.typ"
#include "Chapitres/3-Résultats.typ"
#include "conclusion.typ"
#bibliography("biblio.bib")
// TODO:
// #pagebreak()
// #context _config.showindex()
#pagebreak()
#_config.showendnotes()
#include "annexes.typ"


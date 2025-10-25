
#import "project_config.typ": *
#show: default_amu_template

#include "page_de_garde.typ"
#pagebreak()
#include "affidavit.typ"
#pagebreak()
#include "liste_de_publications.typ"
#pagebreak()
#include "résumé.typ"
#pagebreak()
#include "abstract.typ"
#pagebreak()
#include "remerciements.typ"
#pagebreak()
#outline(
  title: [Table des matières],
  target: heading.where(supplement: [Default heading])
)
#outline(
  title: [Annexes],
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

outline(target: heading.where(supplement: [Annexe]), title: [Annexe])
#include "introduction.typ"
#pagebreak()
#include "1-Généralités.typ"
#pagebreak()
#include "2-Méthodologie_de_la_recherche.typ"
#pagebreak()
#include "3-Résultats.typ"
#pagebreak()
#include "conclusion.typ"
#pagebreak()
#showendnotes()
#pagebreak()
#include "A1-Intitulé des doctorats.typ"

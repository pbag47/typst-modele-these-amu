
#import "amu_templates.typ"

#show: amu_templates.default
// #show: amu_templates.custom

#include "page de garde.typ"
#pagebreak()
#include "Préambule/Préambule.typ"
#pagebreak()
#include "table des matières.typ"
#pagebreak()
#include "introduction.typ"
#pagebreak()
#include "Chapitres/1-Généralités.typ"
#pagebreak()
#include "Chapitres/2-Méthodologie de la recherche.typ"
#pagebreak()
#include "Chapitres/3-Résultats.typ"
#pagebreak()
#include "conclusion.typ"
#pagebreak()
#bibliography("biblio.bib")

// TODO:
// #pagebreak()
// #amu_templates.showindex()

#pagebreak()
#amu_templates.showendnotes()

#show: amu_templates.default_appendix
// #show: amu_templates.custom_appendix
#include "annexes.typ"


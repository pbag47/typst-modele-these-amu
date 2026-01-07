
#import "amu_templates.typ"
#show: amu_templates.default


#include "page de garde.typ"
#pagebreak()
#include "affidavit.typ"
#pagebreak()
#include "liste des publications.typ"
#pagebreak()
#include "résumé.typ"
#pagebreak()
#include "abstract.typ"
#pagebreak()
#include "remerciements.typ"
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
#include "annexes.typ"


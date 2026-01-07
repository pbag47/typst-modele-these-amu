

#import "amu_templates.typ"


// Le compteur de titres est remis à zéro pour que la première annexe soit numérotée "A", au lieu de reprendre la numérotation là où la partie précédente s'était arrétée.
#counter(heading).update(0)


#show: amu_templates.appendix
#amu_templates.appendix_title_page
#pagebreak()
#include "Annexes/A1-Intitulé des doctorats.typ"
#pagebreak()
#include "Annexes/A2-Consignes de présentation.typ"
#pagebreak()
#include "Annexes/A3-Presentation guidelines.typ"

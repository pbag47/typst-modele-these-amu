
#import "_config.typ"
#show: _config.default_amu_template
#show: _config.appendix

// Le compteur de titres est remis à zéro pour que la première annexe soit numérotée "A", au lieu de reprendre la numérotation là où la partie précédente s'était arrétée.
#counter(heading).update(0)

// Page où "ANNEXES" est écrit au centre
#set page(header: none)
#v(1fr)
#align(center)[= #upper[Annexes]]
#v(1fr)

#include "Annexes/A1-Intitulé des doctorats.typ"
#include "Annexes/A2-Consignes de présentation.typ"
#include "Annexes/A3-Presentation guidelines.typ"

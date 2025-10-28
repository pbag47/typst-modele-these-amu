
#import "_config.typ"
#show: _config.default_amu_template
#show: _config.appendix

#set page(header: none)

#counter(heading).update(0)

#v(1fr)
#align(center)[= #upper[Annexes]]
#v(1fr)

#include "Annexes/A1-Intitulé des doctorats.typ"
#include "Annexes/A2-Consignes de présentation.typ"
#include "Annexes/A3-Presentation guidelines.typ"

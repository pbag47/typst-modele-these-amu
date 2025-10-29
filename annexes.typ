// Copyright 2025 Pierre BAGNARA

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


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

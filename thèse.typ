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
#outline(title: [= Table des matières])
#pagebreak()
#outline(title: [= Table des figures], target: figure.where(kind: image))
#pagebreak()
#outline(title: [= Liste des tableaux], target: figure.where(kind: table))
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


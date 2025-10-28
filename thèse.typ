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


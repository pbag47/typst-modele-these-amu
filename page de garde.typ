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


// ---- Définition des templates locaux ---- //
// Définit les règles locales qui s'ajoutent aux règles globales de "default_amu_template", ou qui les remplacent.
#let local_template(doc) = {
  set page(
    paper: "a4",
    margin: (
      top: 2em,
      bottom: 2em,
      x: 2em,
      // left=3em, right=2em, top=2em, bottom=2em marge pour la reliure en cas d'exemplaire imprimé
    ),
    numbering: none,
  )

  set par(
    first-line-indent: (amount: 0cm, all: true),
    justify: false,
  )

  set text(
    font: "Arial",
    size: 12pt
  )

  doc
}

#let detail_entry_template(
  title: "Titre", 
  description: "Description",
  ) = {
  text(title, weight: "bold")
  linebreak()
  description
}

#let jury_entry_template(
  name: "Nom", 
  role: "Rôle", 
  description: "Titre et affiliation",
  ) = {
  grid(
    columns: (50%, 1fr),
    row-gutter: 0.5em,
    name,
    role,
    grid.cell(
      colspan: 2,
      description,
    ),
  )
}


#let cover_page(
  main_title: [--TITRE--], 
  secondary_title: [--SOUS-TITRE--],
  name: [--NOM--], 
  date: [--DATE--],
  national_thesis_number: [NNT : 2025AIXM0000],
  discipline: [Liste des disciplines en annexe A],
  specialty: [Liste des spécialités en annexe A],
  doctoral_school: [Liste des écoles doctorales en annexe A], 
  partners: [
    Renseigner les partenaires institutionnels et les partenaires privés.

    (un partenaire par ligne)
    ],
  jury: (
    "1": (name: [--NOM-1--], role: [Rapporteur-e], titre: [Titre et affiliation],),
    "2": (name: [--NOM-2--], role: [Rapporteur-e], titre: [Titre et affiliation],),
    "3": (name: [--NOM-3--], role: [Examinateur-rice], titre: [Titre et affiliation],),
    "4": (name: [--NOM-4--], role: [Président-e du jury], titre: [Titre et affiliation],),
    "5": (name: [--NOM-5--], role: [Directeur de thèse], titre: [Titre et affiliation],),
    "6": (name: [--NOM-6--], role: [Membre invité-e], titre: [Titre et affiliation],),
  ),
  international_joint_supervision_logo: none,
  research_partner_logo: (
    "figures/example-image-a.png", 
    "figures/example-image-b.png", 
    "figures/example-image-c.png",
  ),
  guidelines: [
    Consignes de présentation détaillées des pages liminaires en annexe B 
  ],
) = {

  show: _config.default_amu_template
  show: local_template

  grid(
    columns: (50%, 50%),
    image("logos/logo_amu.svg", height: 7em),
    if international_joint_supervision_logo != none {
      align(right, image(international_joint_supervision_logo, height: 7em))
    }
  )
  v(1em)
  grid(
    columns: (75%, 1fr),
    align: center + horizon,
    line(
      length: 100%,
      stroke: 4pt + rgb(255,255,133),
    ),
    national_thesis_number,
  )
  v(1em)
  text(upper("Thèse de doctorat"), size: 28pt, fill: rgb(30,100,222))
  linebreak()
  v(0.25em)
  text(
    [
      Soutenue à AMU  Aix-Marseille Université
      
      Le #date par
    ],
    size: 17pt, // 17 sur le modèle Word, 22 sur le modèle LaTeX
  )
 

  v(1fr)


  align(center, text(name, size: 28pt, weight: "bold"))
  align(center,
    text(
      [Titre de la thèse : #main_title],
      size: 28pt,  // 24 sur le modèle Word, ?? sur le modèle LaTeX
    ),
  )
  align(center,
    text(secondary_title, size: 22pt),
    // size 24 sur le modèle Word, ?? sur le modèle LaTeX
  )


  v(1fr)


  grid(
    columns: (45%, 3%, 1fr),
    grid(
      columns: (100%),
      row-gutter: 1.5em,
      detail_entry_template(
        title: [Discipline],
        description: discipline,
      ),
      detail_entry_template(
        title: [Spécialité],
        description: specialty,
      ),
      detail_entry_template(
        title: [#upper[é]cole doctorale],
        description: doctoral_school,
      ),
      detail_entry_template(
        title: [Laboratoire/Partenaires de recherche],
        description: partners,
      ),
      linebreak(),
      guidelines,
    ),

    line(
      start: (0%, 0%),
      end: (0%, 10cm),
      angle: 9deg,
      stroke: 1pt,
    ),
    
    grid(
      columns: (100%),
      rows: auto,
      row-gutter: 1.5em,
      text(weight: "bold")[Composition du jury :],
      for (key, info) in jury {
        jury_entry_template(
          name: info.name,
          role: info.role,
          description: info.titre,
        )
        v(1em)
      }
    )
  )


  v(1fr)


  // Logos en bas de la page
  set image(height: 5em)
  align(center,
    grid(
      columns: (1fr, ) * research_partner_logo.len(),
      ..research_partner_logo.map(image)
    )
  )
}

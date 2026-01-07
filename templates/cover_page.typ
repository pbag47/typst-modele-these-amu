// Copyright 2025-2026 Pierre BAGNARA

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


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


#let description_entry_template(
  title: "Titre", 
  value: "Description",
  ) = {
  text(title, weight: "bold")
  linebreak()
  value
}


#let jury_entry_template(input_dictionary) = {
  // input_dictionary est un dictionnaire qui prend la forme suivante : 
  // (
  //    name: content,
  //    role: content,
  //    title: content,
  // )
  // "content" est à remplacer par le contenu désiré.
  grid(
    columns: (50%, 1fr),
    row-gutter: 0.5em,
    input_dictionary.name,
    input_dictionary.role,
    grid.cell(
      colspan: 2,
      input_dictionary.title,
    ),
  )
}


#let cover_page(

  main_title: [--TITRE--], 
  secondary_title: [--SOUS-TITRE--],
  name: [--NOM--], 
  date: [--DATE--],
  national_thesis_number: [--NNT--],
  discipline: [Liste des disciplines en annexe A],
  specialty: [Liste des spécialités en annexe A],
  doctoral_school: [Liste des écoles doctorales en annexe A], 
  lab_and_research_partners: [
    Renseigner les partenaires institutionnels et les partenaires privés.

    (un partenaire par ligne)
    ],
  jury_members_array: {
    let jury = ()
    for i in range(6) {
      let index = str(i + 1)
      jury.push(
        (
          name: [--NOM-- #index],
          role: [--ROLE-- #index],
          title: [--TITRE-ET-AFFILIATION-- #index],
        )
      )
    }
    jury
  },
  international_joint_supervision_logo: "template_images/example-image-a.png",
  research_partner_logo_array: (
    "template_images/example-image-a.png", 
    "template_images/example-image-b.png", 
    "template_images/example-image-c.png",
  ),
  guidelines: [
    Consignes de présentation détaillées des pages liminaires en annexe B 
  ],


) = {

  show: local_template

  grid(
    columns: (50%, 50%),
    image("template_images/logo_amu.svg", height: 7em),
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
    [NNT : #national_thesis_number],
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
      size: 24pt,  // 24 sur le modèle Word, ?? sur le modèle LaTeX
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
      description_entry_template(
        title: [Discipline],
        value: discipline,
      ),
      description_entry_template(
        title: [Spécialité],
        value: specialty,
      ),
      description_entry_template(
        title: [#upper[é]cole doctorale],
        value: doctoral_school,
      ),
      description_entry_template(
        title: [Laboratoire/Partenaires de recherche],
        value: lab_and_research_partners,
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
      text(weight: "bold")[Composition du jury],
      ..jury_members_array.map(jury_entry_template)
    )
  )


  v(1fr)


  // Logos en bas de la page
  set image(height: 5em)
  align(center,
    grid(
      columns: (1fr, ) * research_partner_logo_array.len(),
      ..research_partner_logo_array.map(image)
    )
  )
}

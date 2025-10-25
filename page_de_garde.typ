
// ctrl + k + c
// ctrl + k + u


// ---- Imports ---- //
// Importe tout le contenu du fichier "project_config.typ"
#import "project_config.typ": *


// ---- Définition des templates locaux ---- //
// Définit les règles locales qui s'ajoutent aux règles globales de "project_config.typ", ou qui les remplacent.
#let local_template(doc) = {
  set page(
    paper: "a4",
    margin: (
      top: 2em,
      bottom: 2em,
      x: 2em,
    ),
  )
  // TODO:
  // left=3em, right=2em, top=2em, bottom=2em marge pour la reliure en cas d'exemplaire imprimé
  // 

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


// ---- Application des templates ---- //
// On applique d'abord les règles globales : default_amu_template. Puis on applique les règles locales de local_template sur toute la suite du document
#show: default_amu_template
#show: local_template


// ---- Contenu ---- // 
// Logos en haut de la page
#grid(
  columns: (50%, 50%),
  image("logos/logo_amu.svg", height: 7em),
  //  image("logos/logo_amu.svg", height: 7em),
)

// Trait jaune et numéro national de thèse
#grid(
  columns: (75%, 1fr),
  align: center + horizon,
  line(
    length: 100%,
    stroke: 4pt + rgb(255,255,133),
  ),
  [NNT : 2025AIXM0000],
)

#text(
  upper("Thèse de doctorat"),
  size: 28pt,
  fill: rgb(30,100,222),
)

#text(
  [
    Soutenue à AMU  Aix-Marseille Université
    
    Le --DATE-- par
  ],
  size: 17pt, // 17 sur le modèle Word, 22 sur le modèle LaTeX
)

#align(center,
  text(
    [--NOM--],
    size: 28pt,
    weight: "bold",
  ),
)

#align(center,
  text(
    [
      Titre de la thèse : 
      --TITRE--
    ],
    size: 28pt,  // 24 sur le modèle Word
  ),
)

#align(center,
  text(
    [--SOUS-TITRE],
    size: 22pt,  // 24 sur le modèle Word
  ),
)


#v(1fr)


#grid(
  columns: (45%, 3%, 1fr),
  grid(
    columns: (100%),
    row-gutter: 1.5em,
    detail_entry_template(
      title: [Discipline],
      description: [Liste des disciplines en annexe A],
    ),
    detail_entry_template(
      title: [Spécialité],
      description: [Liste des spécialités en annexe A],
    ),
    detail_entry_template(
      title: [Ecole doctorale],
      description: [Liste des écoles doctorales en annexe A],
    ),
    detail_entry_template(
      title: [Laboratoire/Partenaires de recherche],
      description: [
        Renseigner les partenaires institutionnels et les partenaires privés.

        (un partenaire par ligne)
      ],
    ),
    linebreak(),
    [Consignes de présentation détaillées des pages liminaires en annexe B],
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
    jury_entry_template(
      name: [Prénom NOM],
      role: [Rapporteur-e],
      description: [Titre et affiliation],
    ),
    jury_entry_template(
      name: [Prénom NOM],
      role: [Rapporteur-e],
      description: [Titre et affiliation],
    ),
    jury_entry_template(
      name: [Prénom NOM],
      role: [Examinateur-rice],
      description: [Titre et affiliation],
    ),
    jury_entry_template(
      name: [Prénom NOM],
      role: [Président-e du jury],
      description: [Titre et affiliation],
    ),
    jury_entry_template(
      name: [Prénom NOM],
      role: [Directeur de thèse],
      description: [Titre et affiliation],
    ),
    jury_entry_template(
      name: [Prénom NOM],
      role: [Membre invité-e],
      description: [Titre et affiliation],
    ),
  )
)

#v(1fr)

// Logos en bas de la page
#align(center,
  grid(
    columns:(33%, 33%, 1fr),
    image("logos/logo_amu.svg", height: 5em),
    image("logos/logo_amu.svg", height: 5em),
    image("logos/logo_amu.svg", height: 5em),
  )
)

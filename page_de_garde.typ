
// ctrl + k + c
// ctrl + k + u

#import "templates.typ": cover_details
#import "templates.typ": jury_details
#import "project_config.typ": project_config
#show: project_config

#set page(
  paper: "a4",
  margin: (
    top: 2em,
    bottom: 2em,
    x: 2em,
  ),
)
// TODO
// left=3em, right=2em, top=2em, bottom=2em marge pour la reliure en cas d'exemplaire imprimé
// 
#set par(justify: false)

#set text(
  font: "Arial",
  size: 12pt
)

#place(
  dy: 100% - 5em ,
  grid(
    columns:(33%, 33%, 1fr),
    figure(
      image("logos/logo_amu.svg", height: 5em),
      outlined: false,
      numbering: none,
    ),
    figure(
      image("logos/logo_amu.svg", height: 5em),
      outlined: false,
      numbering: none,
    ),
    figure(
      image("logos/logo_amu.svg", height: 5em),
      outlined: false,
      numbering: none,
    ),
  ),
)

#grid(
  columns: (50%, 50%),
  figure(
    image("logos/logo_amu.svg", height: 7em),
    outlined: false,
    numbering: none,
  ),
  //figure(
  //  image("logos/logo_amu.svg", height: 7em),
  //),
)

#grid(
  columns: (75%, 1fr),
  align: center + horizon,
  line(
    length: 100%,
    stroke: 4pt + rgb(255,255,133),
  ),
  text(
    size: 12pt,
  )[
    NNT : 2025AIXM0000
  ]
)

#text(
  upper("Thèse de doctorat"),
  size: 28pt,
  fill: rgb(30,100,222),
)
#linebreak()
#text(
  size: 17pt, // 17 sur le modèle Word, 22 sur le modèle LaTeX
)[
  Soutenue à AMU  Aix-Marseille Université #linebreak()
  Le --DATE-- par
]

#align(center,
  text(
    size: 28pt,
    weight: "bold",
  )[
    --NOM--
  ]
)

#align(center,
  text(
    size: 28pt,  // 24 sur le modèle Word
  )[
    Titre de la thèse : --TITRE--
  ]
)

#align(center,
  text(
    size: 22pt,  // 24 sur le modèle Word
  )[
    --SOUS TITRE--
  ]
)

#linebreak()

#grid(
  columns: (45%, 3%, 1fr),
  grid(
    columns: (100%),
    row-gutter: 1.5em,
    cover_details(
      title: "Discipline",
      description: "Liste des disciplines en annexe A",
    ),
    cover_details(
      title: "Spécialité",
      description: "Liste des spécialités en annexe A",
    ),
    cover_details(
      title: "Ecole doctorale",
      description: "Liste des écoles doctorales en annexe A",
    ),
    cover_details(
      title: "Laboratoire/Partenaires de recherche",
      description: "Renseigner les partenaires institutionnels et les partenaires privés. \n(un partenaire par ligne)",
    ),
    linebreak(),
    text[Consignes de présentation détaillées des pages liminaires en annexe B]
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
    jury_details(
      name: "Prénom NOM",
      role: "Rapporteur-e",
      description: "Titre et affiliation",
    ),
    jury_details(
      name: "Prénom NOM",
      role: "Rapporteur-e",
      description: "Titre et affiliation",
    ),
    jury_details(
      name: "Prénom NOM",
      role: "Examinateur-rice",
      description: "Titre et affiliation",
    ),
    jury_details(
      name: "Prénom NOM",
      role: "Président-e du jury",
      description: "Titre et affiliation",
    ),
    jury_details(
      name: "Prénom NOM",
      role: "Directeur de thèse",
      description: "Titre et affiliation",
    ),
    jury_details(
      name: "Prénom NOM",
      role: "Membre invité-e",
      description: "Titre et affiliation",
    ),
  )
)



#let cover_details(title: "Titre", description: "Description") = {
  text(weight: "bold",)[#title]
  linebreak()
  text[#description]
}

#let jury_details(name: "Nom", role: "Rôle", description: "Titre et affiliation") = {
  grid(
    columns: (50%, 1fr),
    row-gutter: 0.65em,
    text[#name],
    text[#role],
    grid.cell(
      colspan: 2,
      text[#description],
    )
  )
}

#let measure_size(body_to_measure) = context {
  let size = measure(body)
}
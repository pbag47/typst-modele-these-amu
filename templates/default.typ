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


#import "page_headers.typ": default_page_header


#let default(content) = {

  // ------------- Pages //
  set page(
    paper: "a4",
    margin: 2.5cm,
    numbering: "1",
    header: context default_page_header(),
  )


  // ------------- Paragraphes //
  set par(
    leading: 0.55em, 
    spacing: 0.55em, 
    first-line-indent: (amount: 0.5cm, all: true),
    justify: true,
  )


  // ------------- Texte //
  set text(
    font: "Cambria", // "Cambria", "New Computer Modern"
    size: 12pt, 
    lang: "fr",
  )


  // ------------- Titres //
  // Numérotation des titres
  set heading(numbering: "1.1.1.1")

  // Format des titres
  show heading.where(level: 1): set text(weight: "bold", size: 24pt) 
  show heading.where(level: 2): set text(weight: "bold", size: 20pt)
  show heading.where(level: 3): set text(weight: "bold", size: 18pt)
  show heading.where(level: 4): set text(weight: "bold", size: 16pt)

  // Espacement autour des titres
  show heading.where(level: 1): set block(above: 1.4em, below: 1.5em)
  show heading.where(level: 2): set block(above: 1.4em, below: 1.4em)
  show heading.where(level: 3): set block(above: 1.4em, below: 1.2em)
  show heading.where(level: 4): set block(above: 1.4em, below: 1em)


  // ------------- Figures //
  // Remise à zéro de la numérotation des figures lorqu'on entre dans un nouveau chapitre
  show heading.where(level: 1): it => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    it
  }

  // Format des numéros de figure
  set figure(
    numbering: (n, ..) => {
      numbering("1.1", counter(heading).get().first(), n)
    },
  )

  // Format des références aux figures
  show figure.where(kind: image): set figure(supplement: smallcaps[Figure])
  show figure.where(kind: table): set figure(supplement: smallcaps[Tableau])

  // Espacement autour des figures
  show figure: set block(spacing: 2em)


  // ------------- Images //
  // Espacement autour des images
  show image: set block(spacing: 1em)
  

  // ------------- Liens //
  // Format des liens
  show link: set text(fill: blue)


  // ------------- Citations //
  // Format des blocs de citation
  set quote(block: true)
  show quote: set pad(x: 3em)


  // ------------- Equations //
  // Format des numéros d'équation
  set math.equation(numbering: "(1)", supplement: none)


  // ------------- Références
  // Format des références dans le texte
  // Source: documentation Typst
  // https://typst.app/docs/reference/model/ref/#customization
  // Réadapté pour le format des références aux chapitres et aux figures.
  show ref: it => {
    if it.element != none and it.element.func() in (
      math.equation,
      heading,
      figure,
    ){
      link(
        it.element.location(),
        numbering(
          it.element.numbering,
          ..counter(it.element.func()).at(it.element.location()),
        )
      )
    } else {
      it
    }
  }

  // Label servant à exclure le précédent titre de la table des matières
  show <exclude_heading_from_table_of_contents>: set heading(outlined: false)

  content
}
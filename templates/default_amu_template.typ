
#import "page_headers.typ": default_page_header


#let default_amu_template(content) = {
  set page(
    paper: "a4",
    margin: 2.5cm,
    numbering: "1",
    header: context default_page_header(),
  )

  set par(
    leading: 0.55em, 
    spacing: 0.55em, 
    first-line-indent: (amount: 0.5cm, all: true), // 1.8em
    justify: true,
  )

  set text(
    font: "Cambria", // "Cambria", "New Computer Modern"
    size: 12pt, 
    lang: "fr",
  )

  // Format of headers
  set heading(numbering: "1.1.1.1")
  show heading.where(level: 1): set text(weight: "bold", size: 24pt) 
  show heading.where(level: 2): set text(weight: "bold", size: 20pt)
  show heading.where(level: 3): set text(weight: "bold", size: 18pt)
  show heading.where(level: 4): set text(weight: "bold", size: 16pt)
  show heading.where(level: 1): set block(above: 1.4em, below: 1.5em)

  // Resets figure and table counters when entering a new chapter
  show heading.where(level: 1): it => {
    // counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    it
  }

  // Format of figure numbers
  set figure(
    numbering: (n, ..) => {
      numbering("1.1", counter(heading).get().first(), n)
    },
  )
  show figure.where(kind: image): set figure(
    supplement: smallcaps[Figure],
  )
  show figure.where(kind: table): set figure(
    supplement: smallcaps[Tableau],
  )

  // Format of links
  show link: set text(fill: blue)

  // Format of quotes
  set quote(block: true)
  show quote: set pad(x: 3em)

  // Format of equation numbers
  set math.equation(numbering: "(1)", supplement: none)

  // Format of references when cited in text
  // Source: Typst documentation
  // https://typst.app/docs/reference/model/ref/#customization
  // Adapted to also format chapter parts and figure references the same way.
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
      // Other references as default
      it
    }
  }

  // Label to exclude marked headers from the table of contentts
  show <exclude_heading_from_table_of_contents>: set heading(outlined: false)

  content
}
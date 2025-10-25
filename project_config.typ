
// Default configuration used by all .typ files of this project
// If needed, it can be overridden by local per-file or per-block configurations.

#let default_amu_template(doc) = {
  set page(
    paper: "a4",
    margin: 2.5cm,
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
  set heading(
    numbering: "1.1.1.1", 
    supplement: [Default heading],
  )
  // Heading supplement is a hacky workaround to separate default headers and appendix headers, so they appear in dedicated outlines.
  // At the time this script is written, this feature is not implemented in Typst.
  // This method is not optimal as it is hard to debug and not very fast.
  // TODO: Watch for future updates of Typst if a clean implementation is made possible.
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
    // counter(figure.where(kind: raw)).update(0)
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
    let el = it.element
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

  doc
}

// Endnotes
// At the time this script is written, endnotes are not in the list of default features in Typst.
// The following lines implement the endnotes logic from scratch.
// Source: public Typst user project
// https://typst.app/project/rnU99-7IT8dbMjGTVceOqs
// (Adapted to match AMU template)
#let all_endnotes = state("endnotes", ())
#let amount_of_endnotes = counter("amount-of-endnotes")

#let endnote(content) = {
  amount_of_endnotes.step(level: 2)
  context {
    // TODO: Implement return link from showendnotes note numbers to respective note locations in text.

    all_endnotes.update(x => x + (content + parbreak(),))
  
    let idx = amount_of_endnotes.get().last()
    let num = amount_of_endnotes.get().map(str).join(".")  // pseudo-uuid

    let is_in_document = query(selector(label(num))).len() >= 1

    if not is_in_document {
      return // showendnotes() was called before last endnotes
    }
  
    link(
      label(num),
      super[#idx]
    )
  }
}

#let showendnotes(name: "Notes") = context {
  if amount_of_endnotes.get().len() == 1 {
    return
  }

  heading(numbering: none)[#name]

  let (level, amt) = amount_of_endnotes.get()

  for idx in range(amt) {
    let num = str(level) + "." + str(idx + 1)
    
    [#link("")[#(idx + 1). ]] + [#all_endnotes.get().at(idx) #label(num)]
  }

  amount_of_endnotes.step()
  all_endnotes.update(x => ())
}

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Annexe])
  counter(heading).update(0)
  body
}

#let switch_to_appendix(content) = {
	set heading(numbering: "A.1")
	counter(heading).update(0)
	state("appendix").update(true)
	content
}
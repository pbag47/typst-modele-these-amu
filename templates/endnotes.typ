
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
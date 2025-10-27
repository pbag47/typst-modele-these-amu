
// Endnotes
// At the time this script is written, endnotes are not in the list of default features in Typst.
// This script implements the endnotes logic from scratch.
// Inspired by: public Typst user project
// https://typst.app/project/rnU99-7IT8dbMjGTVceOqs
// 
// TODO: Implement return link from showendnotes to respective note locations in text.

#let all_endnotes = state("endnotes", ())
#let amount_of_endnotes = counter("amount_of_endnotes")
#let endnote_label_prefix = "endnote:"


#let endnote(content) = {
  amount_of_endnotes.step(level: 2)
  context {
    all_endnotes.update(
      x => {
        x.push(content + parbreak())
        return x
      }
    )
    let idx = amount_of_endnotes.get().last()
    let label_str = endnote_label_prefix + amount_of_endnotes.get().map(str).join(".")

    [#link(label(label_str), super[#idx])]
  }
}


#let showendnotes(name: "Notes") = context{
  if amount_of_endnotes.get().len() == 1 {
    return
  }

  heading(numbering: none)[#name]

  let (level, amt) = amount_of_endnotes.get()
  for idx in range(amt) {
    let label_str = endnote_label_prefix + str(level) + "." + str(idx + 1)
    let endnote_content = all_endnotes.get().at(idx)
    let endnote_number_str = [#(idx + 1).]
    let tab = "test \t "
    [
      #box(width: 1cm)[#align(right, endnote_number_str)]
      #h(1em)
      #all_endnotes.get().at(idx) 
      #label(label_str)
    ]
  }
  amount_of_endnotes.step()
  all_endnotes.update(x => ())
}

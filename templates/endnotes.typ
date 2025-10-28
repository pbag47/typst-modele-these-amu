
// Notes de fin de document
// Lors de l'écriture de ce script, les notes de fin de document ne sont pas dans la liste des fonctionnalités par défaut de Typst.
// Ce script implémente une version "artisanale" des notes de fin de document
// 
// Inspiré par un projet Typst public :
// https://typst.app/project/rnU99-7IT8dbMjGTVceOqs


// TODO: Lien de retour depuis la note de fin de document vers le texte d'origine.


#let all_endnotes = state("endnotes", (:))
#let amount_of_endnotes = counter("amount_of_endnotes")
#let endnote_label_prefix = "endnote:"


#let endnote(content) = {
  amount_of_endnotes.step(level: 2)
  context {
    let idx = amount_of_endnotes.get().last()
    let label_str = endnote_label_prefix + amount_of_endnotes.get().map(str).join(".")
    all_endnotes.update(
      x => {
        x.insert(str(idx), (label_str, content + parbreak()))
        return x
      }
    )
    [#link(label(label_str), super[#idx])]
  }
}


#let showendnotes(name: "Notes") = context{
  if amount_of_endnotes.get().len() == 1 {
    return
  }
  heading(numbering: none)[#name]
  show par: set par(first-line-indent: 0cm)
  let (level, amt) = amount_of_endnotes.get()
  table(
    columns: (1cm, 1fr),
    stroke: none,
    ..for (number, (label_str, endnote_content)) in all_endnotes.get() {
      (
        align(right, number + "."), 
        [#endnote_content #label(label_str)]
      )
    }
  )
  amount_of_endnotes.step()
  all_endnotes.update(x => (:))
}

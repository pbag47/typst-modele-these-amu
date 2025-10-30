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


// Notes de fin de document
// Lors de l'écriture de ce script, les notes de fin de document ne sont pas dans la liste des fonctionnalités par défaut de Typst.
// Ce script implémente une version "artisanale" des notes de fin de document
// 
// Inspiré par :
// - Projet Typst public :
//   https://typst.app/project/rnU99-7IT8dbMjGTVceOqs
// - Package "basalt-backlinks" :
//   https://typst.app/universe/package/basalt-backlinks


#let all_endnotes = state("endnotes", (:))
#let amount_of_endnotes = counter("amount_of_endnotes")
#let endnote_label_prefix = "amu_templates.endnote:"
#let returnlink_label_prefix = "returnlink:"


// Fonctionnement : 
// 
// Lorsqu'une note de fin de document est déclarée : 
// - Le numéro de la note est attributé par un compteur : amount_of_endnotes. Ce compteur est incrémenté à chaque nouvelle note
// - Un label est attaché au texte d'origine. Il suit le schéma suivant : 
//      returnlink_label_prefix + endnote_label_prefix + numéro de la note
//      exemple : "returnlink:amu_templates.endnote:1"
//   Son rôle est de servir de destination pour le lien qui permet de revenir de la note de fin de document vers le texte d'origine.
// - Le contenu de la note est stocké dans un dictionnaire all_endnotes sous la forme : (numéro de la note : contenu)
// - Le texte d'origine est complété d'un lien : le numéro de la note en superscript, dont le label de destination suit le schéma suivant :
//      endnote_label_prefix + numéro de la note
//      exemple : "amu_templates.endnote:1"
//   Ce label reste fictif/indéfini tant que #showendnotes n'a pas été appelé
// 
// Lorsque #showendnote est appelé :
// - all_endnotes est passé en revue. le contenu de chaque note et son numéro sont extraits
// - Le numéro de la note est affiché sous forme de lien qui pointe vers son texte d'origine (label <returnlink_label_prefix + endnote_label_prefix + numéro de la note>)
// Le contenu de la note est affiché tel quel, et le label <endnote_label_prefix + numéro de la note> vient le compléter, ce qui résout le lien affiché dans le texte d'origine.


#let endnote(content) = {
  amount_of_endnotes.step()
  context {
    let idx = amount_of_endnotes.get().last()
    all_endnotes.update(
      x => {
        x.insert(str(idx), content + parbreak())
        return x
      }
    )
    [
      #link(
        label(endnote_label_prefix + str(idx)), 
        super[#idx]
      ) #label(returnlink_label_prefix + endnote_label_prefix + str(idx))
    ]
  }
}


#let showendnotes(name: "Notes") = context{
  heading(numbering: none)[#name]
  show par: set par(first-line-indent: 0cm)
  let amt = amount_of_endnotes.get()
  table(
    columns: (1cm, 1fr),
    stroke: none,
    ..for (idx, endnote_content) in all_endnotes.get() {
      (   
        align(
          right, 
          link(
            label(returnlink_label_prefix + endnote_label_prefix + str(idx)), 
            [#{idx + "."}])
        ), 
        [#endnote_content #label(endnote_label_prefix + str(idx))]
      )
    }
  )
}

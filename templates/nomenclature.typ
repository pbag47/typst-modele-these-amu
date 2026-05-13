// Copyright 2025-2026 Pierre BAGNARA

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
 
 
// Ce script implémente une version "artisanale" de la nomenclature.
// La nomenclature est pensée pour être présentée au début de chaque chapitre en affichant uniquement les éléments présents dans le chapitre.
// Une logique de remise à zéro des entrées est implémentée dans la fonction setup_nomenclature().
// Par défaut, cette fonction de remise à zéro est appelée à chaque titre de niveau 1 (voir le template "default").
// Pour afficher une nomenclature unique qui couvre tout le document, il suffit de supprimer cette remise à zéro.


// Limites : 
// - Le classement par ordre alphabétique n'est pas au point, il manque de robustesse (lettres grecques, symboles mathématiques) ;


// ------------- Paramètres
#let check_for_duplicates = true 
#let sort_entries_by_alphabetic_order = true


// ------------- Variables internes
#let all_nomenclature = state("nomenclature", (:))
#let entry_counter = counter("nomenclature_entry_counter")
#let nomenclature_counter = counter("nomenclature_counter")


// ------------- Fonctions

// Remise à zéro de la nomenclature.
#let setup_nomenclature() = {
  // Les entrées précédentes ne sont pas supprimées, elle sont toujours accessibles avec des valeurs précises de "nomenclature_counter".
  // Cette fonction ne fait que déclarer une nouvelle nomenclature courante.
  nomenclature_counter.step()
  entry_counter.update(0)
  context {
    let index = nomenclature_counter.get().last()
    all_nomenclature.update(
      x => {
        x.insert(str(index), (:))
        return x
      }
    )
  }
}


// Ajout d'un champ à la nomenclature
#let nomenclature(symbol, description) = {
  entry_counter.step()
  context {
    let nomenclature_index = nomenclature_counter.get().last()
    let entry_index = entry_counter.get().last()
    all_nomenclature.update(
      x => {
        x.at(str(nomenclature_index)).insert(
          str(entry_index), 
          (symbol, description)
        )
        return x
      }
    )
  }
}


// Conversion d'un texte de type content vers une chaîne de caractères.
// Cette fonction est un pré-requis pour le classement par ordre alphabétique de la nomenclature.
// /!\ Fonction inélégante et peu robuste. Idéalement, il faudrait trouver un moyen de s'en passer.
#let content_to_str(content) = {
  if content.has("text") {
    if type(content.text) == str {content.text} 
    else {content_to_str(content.text)}
  } else if content.has("children") {
    content.children.map(content_to_str).join("")
  } else if content.has("body") {
    content_to_str(content.body)
  } else if content.has("child") {
    content_to_str(content.child)
  } else if content.has("base") {
    content_to_str(content.base)
  } else if content == [ ] {
    " "
  }
}


// Affiche la nomenclature courante
#let show_nomenclature(name: "Nomenclature") = {
  show par: set par(first-line-indent: 0cm)
  context{
    let next_chapter = query(heading.where(level: 1).after(here())).first()
    let nomenclature_index = nomenclature_counter.at(next_chapter.location()).last()

    let nomenclature_at_this_chapter = all_nomenclature.final().at(str(nomenclature_index))

    if nomenclature_at_this_chapter.len() != 0 {
      // heading(
      //   numbering: none, 
      //   level: nomenclature_header_level, 
      //   outlined: false,
      //   [#name]
      // )

      let entries = {
        for (entry_index, entry) in nomenclature_at_this_chapter {
          (entry,)
        }
      }

      if check_for_duplicates {
        let unique_entries = {
          // Recherche de doublons uniquement sur les symboles, ne prend pas en compte la mise en forme (italique, gras, etc...)
          // entries.dedup(key: it => it.at(0))
          
          // Recherche de doublons à la fois sur les symboles et les descriptions
          entries.dedup()
        }
        entries = unique_entries
      }

      if sort_entries_by_alphabetic_order {
        entries = entries.sorted(key: it => upper(content_to_str(it.first())))
      }

      table(
        columns: (auto, 1fr),
        align: (center, left),
        stroke: none,
        ..entries.join()
      )
    }
  }
}


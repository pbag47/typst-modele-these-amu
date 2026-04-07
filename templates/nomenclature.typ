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


#let all_nomenclature = state("nomenclature", (:))
#let entry_counter = counter("nomenclature_entry_counter")
#let nomenclature_counter = counter("nomenclature_counter")


#let setup_nomenclature() = {
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


#let nomenclature(symbol: content, description: content) = {
  entry_counter.step()
  context {
    let nomenclature_index = nomenclature_counter.get().last()
    let entry_index = entry_counter.get().last()
    all_nomenclature.update(
      x => {
        x.at(str(nomenclature_index)).insert(
          str(entry_index), 
          (
            symbol + parbreak(), 
            description + parbreak()
          )
        )
        return x
      }
    )
  }
}


#let show_nomenclature(name: "Nomenclature") = {
  show par: set par(first-line-indent: 0cm)
  context{
    let next_chapter = query(heading.where(level: 1).after(here())).first()
    let nomenclature_index = nomenclature_counter.at(next_chapter.location()).last()

    if all_nomenclature.at(next_chapter.location()).at(str(nomenclature_index)).len() != 0 {
      heading(numbering: none, level: 2, outlined: false)[#name]
      table(
        columns: (1cm, 1fr),
        stroke: none,
        ..for (entry_index, entry) in all_nomenclature.at(next_chapter.location()).at(str(nomenclature_index)) {
          entry
        }
      )
    }
  }
}

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


#let default_page_header() = {
  // On recense tous les titres précédents qui sont listés dans la table des matières
  let header_selector = selector(heading)
    .before(here())
    .and(heading.where(outlined: true))
  let previous_headers = query(header_selector)

  // Pas d'en-tête s'il n'y a pas eu de titre avant la page actuelle
  if previous_headers.len() == 0 {
    return
  }
  
  // Pas d'en-tête sur les pages où un chapitre commence (chapitre = titre de niveau 1)
  if query(heading.where(level: 1)).any(it => it.location().page() == here().page()) {
    return
  }

  // On sélectionne uniquement les titres de niveaux 1 et 2 pour les afficher dans l'en-tête
  let shown_header_levels = (1, 2)

  // On ignore tous les niveaux supérieurs à celui du dernier titre trouvé : Lorsqu'un nouveau chapitre commence et qu"il n'y a pas encore de nouvelle partie, on veut pouvoir afficher seulement le titre du chapitre. 
  // Si ce filtrage est enlevé, l'en-tête recopie tel-quel le titre de la dernière partie trouvée, même si elle appartient à un autre chapitre
  let last_header_level = previous_headers.last().level
  let shown_header_levels = shown_header_levels.filter(it => it <= last_header_level)

  // On définit ici le texte qui sera affiché dans l'en-tête
  // Pour chaque niveau de titre :
  // - on identifie le dernier titre qui correspond au niveau traité
  // - on affiche sa numérotation suivie d'un point et d'un espace (si elle existe)
  // - on affiche son texte
  // Toutes ces entrées sont ensuite concaténées, et le passage d'un niveau à l'autre est marqué par "---"
  let page_header_text = shown_header_levels.map(
    (i) => {
      let header_numbering = []
      let last_header_at_level_i = previous_headers.filter(h => h.level == i).last()
      if last_header_at_level_i.numbering != none {
        header_numbering = [
          #numbering(
            last_header_at_level_i.numbering,
            counter(heading).at(last_header_at_level_i.location()).last()
          ).#h(0.5em)
        ]
      }
      header_numbering
      last_header_at_level_i.body
    }
  ).filter(it => it != none).join([#h(1em) --- #h(1em)])

  // On définit l'alignement selon le numéro de la page (pair/impair)
  let page_number = counter(page).get().first()
  let alignment = if calc.odd(page_number) {
    right 
  } else {
    left 
  }

  // On écrit le texte de l'en-tête
  align(alignment)[#page_header_text]
}
...

#let custom_page_header() = {
  // On recense tous les titres précédents qui sont listés dans la table des matières
  let chapter_header_selector = selector(heading)
    .before(here())
    .and(heading.where(outlined: true, level: 1))
  let part_header_selector = selector(heading)
    .before(here())
    .and(heading.where(outlined: true, level: 2))
  let previous_chapter_headers = query(chapter_header_selector)
  let previous_part_headers = query(part_header_selector)

  // Pas d'en-tête s'il n'y a pas eu de titre avant la page actuelle
  if previous_chapter_headers.len() == 0 {
    return
  }
  
  // Pas d'en-tête sur les pages où un chapitre commence (chapitre = titre de niveau 1)
  if query(heading.where(level: 1)).any(it => it.location().page() == here().page()) {
    return
  }

  let page_header_text = []
  let alignment = center
  let header_numbering = []
  let page_number = counter(page).get().first()
  if calc.even(page_number) {
    // Pages paires : on affiche le titre du chapitre (niveau 1)
    let last_chapter_header = previous_chapter_headers.last()
    if last_chapter_header.numbering != none {
      header_numbering = [
        #numbering(
          last_chapter_header.numbering,
          counter(heading).at(last_chapter_header.location()).last()
        ).#h(0.5em)
      ]
    }
    page_header_text = last_chapter_header.body
    alignment = left
  } else {
      // Pages impaires : on affiche le titre de la partie (niveau 2)
      // 
      // Pas d'en-tête s'il n'y a pas eu de titre avant la page actuelle
      if previous_part_headers.len() == 0 {
        return
      }
      let last_part_header = previous_part_headers.last()
      if last_part_header.numbering != none {
      header_numbering = [
        #numbering(
          last_part_header.numbering,
          counter(heading).at(last_part_header.location()).last()
        ).#h(0.5em)
      ]
    }
    page_header_text = last_part_header.body
    alignment = right
  }

  // On écrit le texte de l'en-tête
  align(alignment)[#header_numbering #page_header_text]
}


#let appendix_page_header() = {
  let header_selector = selector(heading)
    .before(here())
    .and(heading.where(outlined: true))
  let previous_headers = query(header_selector)
  
  // Pas d'en-tête sur les pages où une annexe commence
  if query(heading.where(level: 2)).any(it => it.location().page() == here().page()) {
    return
  }

  // On ne sélectione que les titres de niveau 2 pour les afficher dans l'en-tête :
  // Le titre de niveau 1 est "ANNEXES"
  // Les titres de niveau 2 sont les titres de chaque annexe (A, B, C, etc...)
  let last_appendix_header = previous_headers.filter(h => h.level == 2).last()

  // On définit l'alignement selon le numéro de la page (pair/impair)
  let page_number = counter(page).get().first()
  let alignment = if calc.odd(page_number) {
    right 
  } else {
    left 
  }
  let header_numbering = []
  if last_appendix_header.numbering != none {
    header_numbering = [
      #numbering(
        last_appendix_header.numbering,
        counter(heading).at(last_appendix_header.location()).last()
      )
      #h(0.5em)
    ]
  }

  align(
    alignment,
    [
      #header_numbering
      #last_appendix_header.body
    ]
  )
}
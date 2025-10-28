
#let default_page_header() = {
  let selector = selector(heading).before(here())
  let level = counter(selector)
  let headings = query(selector)
  
  // Pas d'en-tête sur les pages où un chapitre commence
  if query(heading.where(level: 1)).any(it => it.location().page() == here().page()) {
    return
  }

  // On sélectionne uniquement les titres de niveaux 1 et 2 pour les afficher dans l'en-tête
  let headings_shown = (1, 2)
  let heading_max_level = calc.max(..headings_shown)
  let heading_text = headings_shown.map(
    (i) => {
      let headings_at_this_level = headings
        .filter(h => h.level == i)

      if headings_at_this_level.len() == 0 {
        return none 
      }

      numbering(
        heading.numbering, 
        counter(heading).at(headings_at_this_level.last().location()).last()
      )
      [.]
      h(1em)
      headings_at_this_level.last().body
    }
  ).filter(it => it != none).join([#h(1em) --- #h(1em)])

  align(right)[#heading_text]
}


#let appendix_page_header() = {
  let selector = selector(heading).before(here())
  let level = counter(selector)
  let headings = query(selector)
  
  // Pas d'en-tête sur les pages où une annexe commence
  if query(heading.where(level: 2)).any(it => it.location().page() == here().page()) {
    return
  }

  // On ne sélectione que les titres de niveau 2 pour les afficher dans l'en-tête :
  // Le titre de niveau 1 est "ANNEXES"
  // Les titres de niveau 2 sont les titres de chaque annexe (A, B, C, etc...)
  let level_2_headings = headings.filter(h => h.level == 2)
  if level_2_headings.len() == 0 {
    return none 
  }

  align(
    right,
    [
      #numbering(
        "A.",
        counter(heading).at(level_2_headings.last().location()).last()
      )
      #h(1em)
      #level_2_headings.last().body
    ]
  )
}
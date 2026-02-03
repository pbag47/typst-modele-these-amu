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


#import "page_headers.typ": default_appendix_page_header, custom_appendix_page_header


#let default_appendix(content) = {

  // ------------- Pages //
  set page(header: context default_appendix_page_header())


  // ------------- Titres //
  // Titre de niveau 1 : "ANNEXES"
  show heading.where(level: 1): set heading(numbering: none)
  // Titres de niveau 2 : titres de chaque annexe
  // On modifie la fonction de numérotation pour ignorer le niveau 1
  show heading.where(level: 2): set heading(
    numbering: {(..num) => numbering("A", num.pos().last())}
  )
  show heading.where(level: 3): set heading(
    numbering: none,
    outlined: false,
  )
  show heading.where(level: 4): set heading(
    numbering: none,
    outlined: false,
  )

  // Début des annexes toujours sur une page impaire
  show heading.where(level: 2): it => {
    {
      set page(header: none, numbering: none)
      pagebreak(to: "odd", weak: true)
    }
    it
  }


  // ------------- Références //
  // Références à d'autres parties depuis un texte dans les annexes
  show ref: it => {
    if it.element != none and it.element.func() == heading {
      link(
        it.element.location(),
        [#text(it.element.body)]
      )
    } else {
      it
    }
  }
  content
}


#let custom_appendix(content) = {
  show: default_appendix
  
  // ------------- Pages //
  set page(header: context custom_appendix_page_header())

  // Début des annexes toujours sur une page impaire
  show heading.where(level: 2): it => {
    {
      set page(header: none, numbering: none)
      pagebreak(to: "odd", weak: true)
    }
    it
  }
  content
}



#let appendix_title_page(text: [Annexes]) = {
  // Page où "ANNEXES" est écrit au centre
  set page(header: none)
  align(
    center + horizon, 
    heading(
      text, 
      level: 1, 
      numbering: none
    )
  )
}
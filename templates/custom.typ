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


#import "page_headers.typ": custom_page_header
#import "default.typ": default


#let text_font = "Cambria"
// #let text_font = "Arial"
// #let text_font = "Helvetica"
// #let text_font = "New Computer Modern"
#let math_font = "New Computer Modern Math"

#let custom(content) = {
  show: default
  
  // ------------- Pages //
  set page(
    //margin: 2.5cm,
    margin: (
      top: 2.5cm, 
      bottom: 2.5cm,
      inside: 3cm, 
      outside: 2cm,
    ),
    header: context custom_page_header(),
    header-ascent: 2.5em,
    footer-descent: 2.5em,
  )


  // ------------- Paragraphes //
  set par(
    first-line-indent: (amount: 0.5cm, all: false),
  )


  // ------------- Texte //
  set text(
    font: text_font,
  )


  // ------------- Titres //
  // Espace supplémentaire au dessus des titres de niveau 1
  show heading.where(level: 1): it => {
    // v(1cm)
    it
  }

  // Début des chapitres toujours sur une page impaire
  show heading.where(level: 1): it => {
    {
      set page(header: none, numbering: none)
      pagebreak(to: "odd", weak: true)
    }
    it
  }

  content
}


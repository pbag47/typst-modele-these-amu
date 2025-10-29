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


#import "default.typ": default


#let affidavit(
  name: [--NOM--],
  supervisor: [--DIRECTEUR-DE-TH#upper[è]SE--],
  place: [--LIEU--],
  date: [--DATE--], 
  signature_file: "template_images/example-image-a.png", 
  language: "fr",
) = {

  show: default

  set heading(numbering: none)
  set page(numbering: none)

  [= Affidavit <Affidavit>]

  if language == "fr" {
    [
      Je soussigné·e, #name,
      déclare par la présente que le travail présenté dans ce manuscrit est mon propre travail, réalisé sous la direction scientifique de #supervisor,
      dans le respect des principes d'honnêteté, d'intégrité et de responsabilité inhérents à la mission de recherche. Les travaux de recherche et la rédaction de ce manuscrit ont été réalisés dans le respect à la fois de la charte nationale de déontologie des métiers de la recherche et de la charte AMU relative à la lutte contre le plagiat.

      Ce travail n'a pas été précédemment soumis en France ou à l'étranger dans une version identique ou similaire à un organisme examinateur.
      #v(1em)
      Fait à #place le #date
    ]
  } else if language == "en" {
    set text(lang: "en")
    [
      I, undersigned, #name,
      hereby declare that the work presented in this manuscript is my own work, carried out under the scientific supervision of #supervisor,
      in accordance with the principles of honesty, integrity and responsibility inherent to the research mission. The research work and the writing of this manuscript have been carried out in compliance with both the french national charter for Research Integrity and AMU charter on the fight against plagiarism.
      
      This work has not been submitted previously either in this country or in another country in the same or in a similar version to any other examination body.
      #v(1em)
      #place, #date
    ]
  }


  align(
    right, 
    image(signature_file, height: 5em)
  )


  v(1fr)


  align(
    center,
    image("template_images/by-nc-nd-eu.svg"),
  )


  if language == "fr" {
    align(
      center,
      text[
        Cette œuvre est mise à disposition selon les termes de la 
        #link(
          "https://creativecommons.org/licenses/by-nc-nd/4.0/deed.fr"
        )[
            Licence Creative Commons Attribution - Pas d'Utilisation Commerciale - Pas de Modification 4.0 International
        ]
        // consultez les conditions de la licence cc by-nc-nd, vous pouvez appliquer une licence moins restrictive, cc by-nc-sa par exemple)
      ]
    )
  } else if language == "en" {
    align(
      center,
      text[
        This work is licensed under 
        #link(
          "https://creativecommons.org/licenses/by-nc-nd/4.0/deed.en"
        )[
          Creative Commons Attribution - NonCommercial - NoDerivatives 4.0 International Public License
        ]
      ]
    )
  }
}


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


#import "../amu_templates.typ"
#show: amu_templates.appendix

#show ref: it => {
  let el = it.element
  if it.element != none and it.element.func() == heading {
    link(
      it.element.location(),
      [#text(it.element.body)]
      )
  } else {
    it
  }
}

#set text(lang: "en")


== Presentation guidelines

You have just downloaded the Typst template for AMU doctoral thesis. 
Some elements must be used:

#align(
  center,
  image("../figures/titre.svg", height: 50%),
)

+ The title page of AMU thesis: it is written in French and complies with the AMU graphic charter;
+ In the case of international cotutelle, the logo of the partner institution must appear at the top right of the title page;
+ The composition of the jury, the doctoral school, the discipline and the specialty (if applicable) must be in accordance with the Adum application form for the thesis defense;
+ The national thesis number (NNT) must be displayed on the title page;
+ Where appropriate, logos of partner institutions or research units can be added to the bottom of the title page;
+ The @Affidavit page: according to the language used for writing your thesis, choose the French or English version, then complete, date and sign it;
+ The #lower[@Publications] page made during the course of your thesis project;
+ @Résumé in French and @Abstract in English pages: each summary must not exceed 4,000 characters.


Depending on your needs, you can add the following elements: summary and/or table of contents, list of figures, list of tables, list of acronyms, glossary, index, nomenclature...
For the body of your thesis, if your doctoral school does not give you more specific instructions, you can use the styles established in this template or your own styles following these recommendations:
- Neutral font: It is recommended to use a standard serif font for text and a standard sans-serif font for titles;
- Geometry: paper=a4, fontsize=12pt, DIV=12;
- Single-line spacing;
- Justified text.

#align(
  center,
  image("../figures/geometry.svg"),
)

Your thesis must be submitted online in PDF 1.5 minimum version format on #link("https://www.adum.fr/")[adum.fr].

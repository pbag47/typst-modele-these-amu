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


#let algorithm(header: none, body) = {
  block(breakable: false)[
    #if header != none {
      line(length: 100%)
      header
    }
    #line(length: 100%)
    #body
    #line(length: 100%)
  ]
}

#let algorithm_text_part(title: none, lines: ()) = {
  if title != none {
    set par(hanging-indent: 0em, first-line-indent: 0em)
    text(title, weight: "bold")
    linebreak()
  }
  set par(hanging-indent: 1em, first-line-indent: 1em)
  lines.join(linebreak())
}

#let algorithm_math_part(title: none, lines: ()) = {
  if title != none {
    set par(hanging-indent: 0em, first-line-indent: 0em)
    text(title, weight: "bold")
    linebreak()
  }
  set par(hanging-indent: 1em, first-line-indent: 1em, leading: 1em)
  lines.join(linebreak())
}

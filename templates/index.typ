// // Copyright 2025-2026 Pierre BAGNARA

// // Licensed under the Apache License, Version 2.0 (the "License");
// // you may not use this file except in compliance with the License.
// // You may obtain a copy of the License at

// //     https://www.apache.org/licenses/LICENSE-2.0

// // Unless required by applicable law or agreed to in writing, software
// // distributed under the License is distributed on an "AS IS" BASIS,
// // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// // See the License for the specific language governing permissions and
// // limitations under the License.

// // TODO
// // Work in progress

// // Index
// // At the time this script is written, index is not in the list of default features in Typst.
// // The following lines implement the index logic from scratch.
// // Code inspired by endnotes implementation
// // 
// // TODO: Implement return link from showindex to respective index locations in text.

// #let all_indices = state("document_indices", ())
// #let amount_of_indices = counter("amount_of_document_indices")
// #let index_label_prefix = "index:"


// #let index(content) = {
//   amount_of_indices.step(level: 2)
//   context {
//     all_indices.update(
//       x => {
//         x.push((content + parbreak()))
//         return x
//       }
//     )

//     all_indices.update(x => x + (content + parbreak(),))
  
//     let idx = amount_of_indices.get().last()
//     let num = "index:" + amount_of_indices.get().map(str).join(".")  // pseudo-uuid
//   }
//   content
// }


// #let showindex(name: "Index") = {

//   heading(numbering: none)[#name]

//   if amount_of_indices.get().len() == 1 {
//     return
//   }

//   let (level, amt) = amount_of_indices.get()
//   for idx in range(amt) {
//     let num = str(level) + "." + str(idx + 1)
//     [#link("")[#(idx + 1). ]] + [#all_indices.get().at(idx) #label(num)]
//   }

//   amount_of_indices.step()
//   all_indices.update(x => ())
// }

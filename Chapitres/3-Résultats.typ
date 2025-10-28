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


#import "../_config.typ"
#show: _config.default_amu_template


= Résultats


== Modèles

#figure(
  table(
    align: center + horizon,
    columns: 6,
    rows: 6,
    stroke: none,
    table.vline(stroke: black, x: 1, start: 0),
    table.hline(stroke: black, y: 5, start: 0),
    [0],        [],           [],           [],             [],             [],
    [$c_2$],    [$a_21$],     [],           [],             [],             [],
    [$c_3$],    [$a_31$],     [$a_32$],     [],             [],             [],
    [$dots.v$], [$dots.v$],   [],           [$dots.down$],  [],             [],
    [$c_s$],    [$a_(s 1)$],  [$a_(s 2)$],  [$dots$],       [$a_(s, s-1)$], [], 
    [],         [$b_1$],      [$b_2$],      [$dots$],       [$b_(s-1)$],    [$b_s$], 
  ),
  caption: [Tableau de Butcher]
) <Table-Butcher>


#figure(
  table(
    align: center + horizon,
    columns: 3,
    rows: 6,
    stroke: none,
    table.hline(stroke: black, y: 0, start: 0),
    table.hline(stroke: black, y: 1, start: 0),
    table.hline(stroke: black, y: 6, start: 0),
    [$lambda "(nm)"$], [$(alpha_lambda slash alpha_426.7)_"moy"$], [Ecart type], 
    [391.9 & 392.1], [0.12], [0.01],
    [588.9 & 589.2], [0.45], [0.07],
    [657.8 & 658.3], [6.70], [0.06],
    [711.3], [0.16], [0.01],
    [712], [0.31], [0.02],
    ),
  caption: [
    Valeur moyenne et écart type des rapports 
    $alpha_lambda slash alpha_426.7$
    mesurés pour les chocs plasma de la deuxième série.
  ]
) <Table-Alpha>


== Articles

// TODO: 
// Citation avec le style "alphabetic", qui n'est pas supporté par défaut sur Typst
#cite(<mohamed_clinical_2014>, form: "full")
#pagebreak()
#image("../articles/BMC-1471-2334-14-S2-O1.svg", width: 100%, height: 100%)


#import "project_config.typ": *
#show: default_amu_template

#set heading(numbering: none)

= Affidavit

Je soussigné·e, --NOM--,
déclare par la présente que le travail présenté dans ce manuscrit est mon propre travail, réalisé sous la direction scientifique de --NOM--,
dans le respect des principes d'honnêteté, d'intégrité et de responsabilité inhérents à la mission de recherche. Les travaux de recherche et la rédaction de ce manuscrit ont été réalisés dans le respect à la fois de la charte nationale de déontologie des métiers de la recherche et de la charte AMU relative à la lutte contre le plagiat.

Ce travail n'a pas été précédemment soumis en France ou à l'étranger dans une version identique ou similaire à un organisme examinateur.

Fait à --LIEU-- le --DATE--

// La signature est centrée à droite, ce qui va à l'encontre du comportement par défaut des figures (centrées).
// On crée donc un template spécifique pour cette figure, sur lequel toutes les propriétés peuvent être modifiées sans que cela n'impacte le reste du document
#let signature_figure(signature_image_path) = {
  show figure: set align(right)
  figure(
    image(signature_image_path, height: 5em),
    outlined: false,
    numbering: none,
  )
}
#signature_figure("logos/logo_amu.svg")

#v(1fr)

#figure(
  image("logos/by-nc-nd-eu.svg"),
  outlined: false,
  numbering: none,
)

#align(
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


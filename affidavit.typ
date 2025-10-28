
#import "_config.typ"
#show: _config.default_amu_template

#set heading(numbering: none)
#set page(numbering: none)


= Affidavit
<Affidavit>

Je soussigné·e, --NOM--,
déclare par la présente que le travail présenté dans ce manuscrit est mon propre travail, réalisé sous la direction scientifique de --NOM--,
dans le respect des principes d'honnêteté, d'intégrité et de responsabilité inhérents à la mission de recherche. Les travaux de recherche et la rédaction de ce manuscrit ont été réalisés dans le respect à la fois de la charte nationale de déontologie des métiers de la recherche et de la charte AMU relative à la lutte contre le plagiat.

Ce travail n'a pas été précédemment soumis en France ou à l'étranger dans une version identique ou similaire à un organisme examinateur.

Fait à --LIEU-- le --DATE--

#align(
  right, 
  image("figures/example-image-a.png", height: 5em)
)

#v(1fr)

#align(
  center,
  image("logos/by-nc-nd-eu.svg"),
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


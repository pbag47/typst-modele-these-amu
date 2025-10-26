
#import "_config.typ": default_amu_template, appendix
#show: default_amu_template
#show: appendix


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


= Consignes de présentation

Vous venez de télécharger le modèle Typst pour les thèses de doctorat AMU.
Certains éléments doivent obligatoirement être utilisés~:

#align(
  center,
  image("figures/titre.svg", height: 50%),
)

+ La page de titre des thèses AMU~: elle est rédigée en langue française et respecte la charte graphique AMU~;
+ En cas de cotutelle internationale, le logo de l'établissement partenaire doit apparaître en haut à droite de la page de titre~;
+ La composition du jury, l'école doctorale, la discipline et la spécialité (le cas échéant) doivent être conformes au formulaire Adum de demande de soutenance de thèse~;
+ Le numéro national de thèse (NNT) doit être apposé sur la page de titre~;
+ Le cas échéant, les logos d'institutions ou d'unité de recherche partenaires peuvent être ajoutés en bas de la page de titre~;
+ La page @Affidavit~: selon la langue utilisée pour la rédaction de de votre thèse, opter pour la version en français ou en anglais, puis la compléter, la dater et la signer~;
+ La #lower[@Publications] réalisées au cours de votre projet de thèse~;
+ Les pages @Résumé en français et @Abstract en anglais~: chaque résumé ne doit pas dépasser 4000 caractères.

#linebreak()

Selon vos besoins, vous pouvez ajouter les éléments suivants: sommaire et/ou table des matières, liste des figures, liste des tableaux, liste des acronymes, glossaire, index, nomenclature…

Pour le corps de votre thèse, si votre école doctorale ne vous donne pas de consignes plus précises, vous pouvez utiliser les styles établis dans ce modèle ou vos propres styles en suivant ces recommandations~:

- Police neutre~: Il est conseillé d'utiliser une police serif standard pour le texte et une police sans-serif standard pour les titres~;
- Géométrie~: paper=a4, fontsize=12pt, DIV=12~;
- Interligne simple~;
- Texte justifié.

#align(
  center,
  image("figures/geometry.svg"),
)

Votre thèse devra être déposée en ligne en format PDF version 1.5 minimum sur #link("https://www.adum.fr/")[adum.fr].

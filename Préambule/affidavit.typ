
#import "../amu_templates.typ"

#set heading(numbering: none)
#set page(numbering: none)


= Affidavit <Préambule:Affidavit>

#amu_templates.affidavit(
  name: [[Prénom NOM]],
  supervisor: [[Prénom NOM]],
  place: [[ville]],
  date: [[date]], 
  // signature_file: "image de signature.png", 
  language: "fr",  // "fr" or "en"
)


#import "amu_templates.typ"


#amu_templates.cover_page(
  international_joint_supervision_logo: none,

  date: [29 octobre 2025],
  // date: datetime.today().display("[day] [month repr:long] [year]"),
  // TODO: surveiller les nouvelles MàJ de Typst pour afficher la date en français (fonctionnalité absente pour le moment).
  // Voir https://typst.app/docs/reference/foundations/datetime/#definitions-today

  name: [Prénom NOM],
  main_title: [],
  secondary_title: [sous-titre de la thèse],
  national_thesis_number: [2025AIXM0000],
  discipline: [Liste des disciplines en annexe @Annexe-Intitulé],
  specialty: [Liste des spécialités en annexe @Annexe-Intitulé],
  doctoral_school: [Liste des écoles doctorales en annexe @Annexe-Intitulé],
  guidelines: [
    Consignes de présentation détaillées des pages liminaires en annexe @Annexe-Consignes 
  ],
  jury_members_array: (
    (name: [Prénom NOM], role: [Rapporteur-e], title: [Titre et affiliation],),
    (name: [Prénom NOM], role: [Rapporteur-e], title: [Titre et affiliation],),
    (name: [Prénom NOM], role: [Examinateur-rice], title: [Titre et affiliation],),
    (name: [Prénom NOM], role: [Président-e du jury], title: [Titre et affiliation],),
    (name: [Prénom NOM], role: [Directeur de thèse], title: [Titre et affiliation],),
    (name: [Prénom NOM], role: [Membre invité-e], title: [Titre et affiliation],),
  ),
  // research_partner_logo_array: (
  //   "logo_partenaire_1.png", 
  //   "logo_partenaire_2.png",
  //   ...
  // ),
)

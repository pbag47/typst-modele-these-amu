
#import "page_headers.typ": appendix_page_header


#let appendix(content) = {
  set heading(numbering: "A.1.", supplement: [Annexe])
  set page(header: context appendix_page_header())
  content
}
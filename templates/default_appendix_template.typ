
#import "page_headers.typ": appendix_page_header


#let appendix(content) = {
  show heading.where(level: 1): set heading(numbering: none)
  set heading(numbering: (first, ..nums) => numbering("A.1", ..nums))
  set page(header: context appendix_page_header())
  content
}
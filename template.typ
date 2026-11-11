#let navy = rgb("#1f3a5f")
#let ink = rgb("#222831")
#let muted = rgb("#5f6b7a")
#let rule = rgb("#d5dae1")
#let paper = rgb("#f5f6f8")

#let report(title: "", subtitle: "", meta: (), body) = {
  set document(title: title, author: "M3RICK")
  set text(font: "Roboto", size: 10pt, fill: ink)
  set par(justify: true, leading: 0.7em)
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    v(1.2em)
    block(below: 0.8em, stroke: (bottom: 1pt + navy), inset: (bottom: 5pt), width: 100%,
      text(size: 15pt, weight: "bold", fill: navy, it))
  }
  show heading.where(level: 2): it => block(above: 1.3em, below: 0.7em,
    text(size: 12pt, weight: "bold", fill: navy, it))
  show raw: set text(font: "DejaVu Sans Mono", size: 7.8pt)
  show raw.where(block: false): box.with(fill: paper, inset: (x: 2pt), outset: (y: 2pt), radius: 1pt)
  show raw.where(block: true): it => block(width: 100%, fill: paper, stroke: (left: 2pt + navy),
    inset: 9pt, it)
  set table(stroke: 0.5pt + rule, inset: 6pt, fill: (_, y) => if y == 0 { paper })
  show table.cell.where(y: 0): set text(weight: "bold")

  set page(paper: "a4", margin: (x: 2.2cm, top: 2.6cm, bottom: 2.4cm),
    header: context if counter(page).get().first() > 1 {
      set text(size: 8pt, fill: muted)
      grid(columns: (1fr, 1fr), title + " | " + subtitle, align(right, "M3RICK"))
      line(length: 100%, stroke: 0.5pt + rule)
    },
    footer: context if counter(page).get().first() > 1 {
      set text(size: 8pt, fill: muted)
      align(right, counter(page).display("1 / 1", both: true))
    })

  v(5cm)
  text(size: 10pt, weight: "bold", fill: muted, upper(subtitle))
  v(0.3em)
  text(size: 34pt, weight: "bold", fill: navy, title)
  v(0.6em)
  line(length: 100%, stroke: 1.5pt + navy)
  v(1.5em)
  grid(columns: (4cm, 1fr), row-gutter: 10pt,
    ..meta.map(((k, v)) => (text(fill: muted, k), v)).flatten())
  pagebreak()
  body
}

#let note(title, body) = block(width: 100%, fill: paper, stroke: (left: 2pt + muted),
  inset: 10pt, [*#title.* #body])

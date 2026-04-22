#set page(margin: 1.75in)
#set par(leading: 0.55em, spacing: 0.55em, first-line-indent: 1.8em, justify: true)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show heading: set block(above: 1.4em, below: 1em)
//#set page(paper: "a5")
#set heading(numbering: "1.")

#show link: set text(fill: blue, weight: 700)
#show link: underline

= The Typst Playground

Welcome to the Typst Playground! This is a sandbox where you can experiment with Typst. You can type anywhere in the editor panel on the left. The preview panel to the right will update live.

= Basics <basics>

Typst is a _markup_ language. You use it to express not just the content, but also the structure and formatting of your document. For example, surrounding a word with underscores _emphasizes_ it with italics and starting a line with an equals sign creates a section heading.

Typst has lightweight syntax like this for the most common formatting needs. Among other things, you can use it to:

- *Strongly emphasize* some text
- Refer to @basics
- Typeset math: $a, b in { 1/2, sqrt(4 a b) }$

That's just the surface though! Typst has powerful systems for scripting, styling, introspection, and more. In the realm of a Typst document, there is nothing you can't automate.
#table(
  columns: (auto, 1fr, 1fr), // Three columns: content-sized, then two equal shares
  inset: 10pt,              // Padding inside cells
  align: horizon,           // Vertical alignment
  fill: (x, y) =>           // Alternating row colors
    if y == 0 { gray.lighten(40%) } 
    else if calc.even(y) { white } 
    else { gray.lighten(90%) },
  
  // The Header
  table.header(
    [*Feature*], [*Description*], [*Status*],
  ),

  // The Data
  [Columns], [Defined by an array of widths.], [✅],
  [Cells], [Passed as positional arguments.], [✅],
  [Styling], [Supports fills, strokes, and insets.], [✅],
  [Merging], [Use #table.cell(colspan: 2)[...] to merge.], [🚀],
)


#table(
  columns: (auto, 1fr, 1fr),
  inset: 7pt,
  align: horizon,
  stroke: none, // This removes the standard grid

  // 1. Top Rule (Thicker)
  table.hline(y: 0, stroke: 1.5pt),
  
  // 2. The Header
  table.header(
    [*Variable*], [*Coefficient*], [*Standard Error*],
  ),
  
  // 3. Middle Rule (Thinner, placed after the header row)
  table.hline(y: 1, stroke: 0.7pt),

  [Intercept], [2.453], [0.12],
  [Growth Rate], [1.102], [0.04],
  [Volatility], [0.891], [0.09],

  // 4. Bottom Rule (Thicker)
  table.hline(stroke: 1.5pt),
)

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr),
    inset: (x: 8pt, y: 5pt),
    stroke: none, // Kill the default grid entirely
    align: (left, center, center, center),
    
    // --- The Rules (Exact LaTeX Weights) ---
    table.hline(y: 0, stroke: 0.08em), // \toprule
    table.header(
      [*Method*], [*Precision*], [*Recall*], [*F1-Score*],
    ),
    table.hline(y: 1, stroke: 0.05em), // \midrule

    // --- Data ---
    [Baseline Model], [0.72], [0.65], [0.68],
    [Neural Engine], [0.85], [0.82], [0.83],
    [Proposed Arc], [0.91], [0.89], [0.90],
    
    table.hline(stroke: 0.08em), // \bottomrule
  ),
  caption: [Comparison of model performance on the test set.],
)

= Next steps

To learn more about Typst, we recommend you to check out our tutorial at https://typst.app/docs/tutorial.

Once you've explored Typst a bit, why not set yourself up a proper editing environment?

#import "@preview/tiaoma:0.3.0"
#let next-step(url, body) = grid(
  columns: 2,
  gutter: 1em,
  tiaoma.qrcode(url, width: 3em),
  {
    show strong: link.with(url)
    body
  }
)

#next-step("https://typst.app/signup")[
  To get access to multi-file projects, live collaboration, and more, *sign up* to our web app for free.
]

#next-step("https://typst.app/open-source/#download")[
  You can also *download* our free and open-source command line tool to continue your journey locally.
]

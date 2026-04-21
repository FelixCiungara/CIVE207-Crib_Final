#import "@preview/cetz:0.3.4": canvas, draw

#set page(
  paper: "a4",
  margin: (x: 0.5cm, y: 0.5cm),
)
#set text(size: 8pt)
#set par(leading: 2pt, spacing: 2pt)
#show math.equation: set block(spacing: 2pt, above: 2pt, below: 2pt)

#let st(title) = {
  v(3pt)
  text(size: 7pt, weight: "bold")[#title]
  v(-1pt)
  line(length: 100%, stroke: 0.4pt)
  v(2pt)
}

#let sst(title) = {
  v(2pt)
  text(size: 6pt, weight: "bold")[#title]
  linebreak()
}

#align(center)[
  #text(size: 14pt, weight: "bold")[CIVE 207 --- Crib Sheet] \
  #text(size: 10pt)[Final]
]
#v(-4pt)

#columns(5, gutter: 8pt)[

// ============================================================
// COLUMN 1
// ============================================================

#st[Hooke's Law]

#grid(columns: (1fr, 1fr), gutter: 4pt,
  [$sigma = E epsilon$], [$tau = G gamma$],
  [$sigma = F/A$], [$delta = (P L)/(A E)$],
)

#v(3pt)
$tau = V/A$ (single shear) \
$tau = V/(2A)$ (double shear)

#v(4pt)
#align(right)[#image("images/image1.png", width: 0.8in)]

#st[Bearing Stress]
$sigma_B = V / "Projected Area"$ \
$sigma_"gross"$: normal stress on full area \
$sigma_"net"$: stress at smallest area

#st[Stress on Oblique Plane]

#grid(columns: (1fr,), gutter: 2pt,
  [$sigma = P/A cos^2 theta$],
  [$tau = P/A sin theta cos theta$],
)

#v(2pt)
$sigma_"max"$: $theta = 0°$ \
$tau_"max"$: $theta = plus.minus 45°$

#st[Factor of Safety]

$ F S = sigma_"ultimate" / sigma_"allowable" $

#st[Shear Strain]

$gamma > 0$: inside angle decreases
$ gamma = theta_"initial" - theta_"final" $

#st[Thermal Deformation]

$ delta = alpha dot Delta T dot L $

#st[3D Stress--Strain]

$E epsilon_x = sigma_x - nu(sigma_y + sigma_z)$ \
$E epsilon_y = sigma_y - nu(sigma_x + sigma_z)$ \
$E epsilon_z = sigma_z - nu(sigma_x + sigma_y)$

#v(2pt)
#sst[Poisson Ratio]
$ nu = -(epsilon_"lateral") / (epsilon_"axial") $

#sst[Dilatation (Unit Volume Change)]
#text(size: 7pt)[
  $ e &= epsilon_x + epsilon_y + epsilon_z \
    v &approx (1+epsilon_x)(1+epsilon_y)(1+epsilon_z) approx 1 + e \
    e &= v - 1 $
]
$e$: unit change in volume
$ e = (1 - 2nu)/E (sigma_x + sigma_y + sigma_z) $

#sst[Hydrostatic Pressure $p$]
$ e = -(3(1 - 2nu))/E p $

#sst[Bulk Modulus / Modulus of Compression]
$ k = E/(3(1 - 2nu)), quad e = -p/k $
$ G = E/(2(1 + nu)) $

#st[Saint-Venant Principle]

At distance $>=$ width of member, stress distribution is uniform whether plate-loaded or point-loaded.

#colbreak()

// ============================================================
// COLUMN 2
// ============================================================

#st[Stress Concentration]

$ K = sigma_"max" / sigma_"avg" $

*Torsion:*
$ tau_"max" = K (T c / J)_"smaller shaft" $

#st[Torsion & Shear Strain]

#grid(columns: (auto, 1fr), gutter: 4pt, align: (horizon, horizon),
  [$gamma = (rho phi)/L$], [#image("images/image2.png", width: 0.65in)],
)
#v(3pt)
#grid(columns: (auto, 1fr), gutter: 4pt, align: (horizon, horizon),
  [$tau = (T rho)/J$], [#image("images/image3.png", width: 0.5in)],
)

#v(2pt)
$phi = (T L)/(G J)$

#v(4pt)
#st[Polar Moment of Inertia]

$ J_"circle" = pi/2 r^4 = pi/32 d^4 $

#v(-4pt)

#st[Gear Ratios]

$ T_1/R_1 = T_2/R_2, quad phi_1 R_1 = phi_2 R_2 $

#v(-4pt)
#st[Power]

$ P = T omega = 2 pi f T $
$1 "W" = 1 ("N" dot.op "m") \/ "s"$ \
$1 "hp" = 550 ("ft" dot.op "lb") \/ "s"$

#v(-4pt)
#st[Variable Cross-Section]

$ phi = integral_0^L T/(G J) d x $

$ phi_(E \/ B) = phi_E - phi_B $
(E moves w.r.t. B)

#v(4pt)
#st[Modulus of Rupture in Torsion]

$ R_T = (T_U c)/J $

#v(-4pt)
#st[Plastic Torsion]
#sst[Not Yield]
$ T = J/c tau_"max" $
#sst[Yield]
$ T_Y = J/c tau_y = pi/2 c^3 tau_Y $

#text(size: 7pt)[
  #table(
    columns: (0.45fr, 0.55fr),
    stroke: none,
    inset: (x: 0pt, y: 3pt),
    [$0 <= rho <= rho_Y$:], [$rho_Y <= rho <= c$:],
    [$tau = tau_Y / rho_Y rho$], [$tau = tau_Y$],
  )
]

#text(size: 7pt)[
  $ T = integral.double rho tau d A = 2pi integral_a^b tau rho^2 d rho $
]

$T_(E-P) = 4/3 T_Y (1 - 1/4 rho_Y^3/c^3)$ \
$phi = (gamma_Y L)/rho_Y = (tau_Y L)/(rho_Y G)$ \
$T_P = 4/3 T_Y$

$rho_Y/c = phi_Y/phi$ \
#text(size: 6pt)[$phi_Y$ = angle when outer starts yielding]

// Residual stress TikZ diagram -- recreated with cetz
// Shows 3 cross-sections: (a) EP loading, (b) elastic unloading, (c) residual

#canvas(length: 0.28cm, {
  import draw: *
  let blue-fill = rgb(220, 235, 245)
  let red = rgb(220, 50, 50)

  // Figure (a): EP Loading
  circle((1.5, 0), radius: 1.5, fill: blue-fill, stroke: 0.4pt)
  circle((1.5, 0), radius: 0.8, stroke: (paint: blue.darken(30%), dash: "dashed", thickness: 0.3pt))
  line((1.5, 0), (3.3, 0), mark: (end: "stealth"), stroke: 0.3pt)
  content((3.5, 0), text(size: 5pt)[$rho$], anchor: "west")
  line((1.5, 0), (1.5, 1.8), mark: (end: "stealth"), stroke: 0.3pt)
  content((1.3, 1.9), text(size: 5pt)[$tau$], anchor: "south")
  // Stress profile: linear up to rho_Y=0.8, then flat
  line((1.5, 0), (2.3, 1.2), stroke: (paint: red, thickness: 1.5pt))
  line((2.3, 1.2), (3.0, 1.2), stroke: (paint: red, thickness: 1.5pt))
  // Arrows
  for x in (0.2, 0.4, 0.6, 0.8) {
    let y = 1.5 * x
    line((1.5 + x, y), (1.5 + x, 0), mark: (end: "stealth"), stroke: (paint: red, thickness: 0.2pt))
  }
  for x in (1.0, 1.25, 1.5) {
    line((1.5 + x, 1.2), (1.5 + x, 0), mark: (end: "stealth"), stroke: (paint: red, thickness: 0.2pt))
  }
  content((3.2, 1.4), text(size: 5pt, fill: red)[$tau_Y$], anchor: "west")
  line((1.5, 1.5), (2.3, 1.5), mark: (start: "stealth", end: "stealth"), stroke: 0.2pt)
  content((1.9, 1.6), text(size: 5pt)[$rho_Y$], anchor: "south")
  content((3.1, -0.3), text(size: 5pt)[$c$])
  content((2.25, -2.2), text(size: 5pt)[(a)])

  // Figure (b): Elastic Unloading
  let bx = 4.5
  circle((bx + 1.5, 0), radius: 1.5, fill: blue-fill, stroke: 0.4pt)
  circle((bx + 1.5, 0), radius: 0.8, stroke: (paint: blue.darken(30%), dash: "dashed", thickness: 0.3pt))
  line((bx + 1.5, 0), (bx + 3.3, 0), mark: (end: "stealth"), stroke: 0.3pt)
  content((bx + 3.5, 0), text(size: 5pt)[$rho$], anchor: "west")
  line((bx + 1.5, 0), (bx + 1.5, 1.8), mark: (end: "stealth"), stroke: 0.3pt)
  content((bx + 1.3, 1.9), text(size: 5pt)[$tau$], anchor: "south")
  line((bx + 1.5, 0), (bx + 3.0, -1.6), stroke: (paint: red, thickness: 1.5pt))
  for x in (0.3, 0.6, 0.9, 1.2, 1.5) {
    let y = -1.066 * x
    line((bx + 1.5 + x, y), (bx + 1.5 + x, 0), mark: (end: "stealth"), stroke: (paint: red, thickness: 0.2pt))
  }
  content((bx + 3.2, -1.8), text(size: 5pt, fill: red)[$tau'_m$], anchor: "north")
  content((bx + 3.1, 0.3), text(size: 5pt)[$c$])
  content((bx + 2.25, -2.2), text(size: 5pt)[(b)])

  // Figure (c): Residual Stress
  let cx = 9.0
  circle((cx + 1.5, 0), radius: 1.5, fill: blue-fill, stroke: 0.4pt)
  circle((cx + 1.5, 0), radius: 0.8, stroke: (paint: blue.darken(30%), dash: "dashed", thickness: 0.3pt))
  line((cx + 1.5, 0), (cx + 3.3, 0), mark: (end: "stealth"), stroke: 0.3pt)
  content((cx + 3.5, 0), text(size: 5pt)[$rho$], anchor: "west")
  line((cx + 1.5, 0), (cx + 1.5, 1.8), mark: (end: "stealth"), stroke: 0.3pt)
  content((cx + 1.3, 1.9), text(size: 5pt)[$tau$], anchor: "south")
  // Stress profile: linear up to rho_Y, then decreasing
  line((cx + 1.5, 0), (cx + 2.3, 0.6), stroke: (paint: red, thickness: 1.5pt))
  line((cx + 2.3, 0.6), (cx + 3.0, -0.4), stroke: (paint: red, thickness: 1.5pt))
  for x in (0.2, 0.4, 0.6, 0.8) {
    let y = 0.75 * x
    line((cx + 1.5 + x, y), (cx + 1.5 + x, 0), mark: (end: "stealth"), stroke: (paint: red, thickness: 0.2pt))
  }
  // rho_Y dashed line
  line((cx + 2.3, 0.6), (cx + 2.3, 1.5), stroke: (dash: "dashed", thickness: 0.3pt))
  line((cx + 1.5, 1.5), (cx + 2.3, 1.5), mark: (start: "stealth", end: "stealth"), stroke: 0.2pt)
  content((cx + 1.9, 1.6), text(size: 5pt)[$rho_Y$], anchor: "south")
  content((cx + 3.1, 0.3), text(size: 5pt)[$c$])
  content((cx + 2.25, -2.2), text(size: 5pt)[(c)])
})

#v(-4pt)
#st[Torsion Rectangular]
#v(-9pt)
$ tau_"max" = T/(c_1 a b^2) quad phi = (T L)/(c_2 a b^3 G) $

#colbreak()

// ============================================================
// COLUMN 3
// ============================================================

#sst[Residual Shear Strain]
#text(size: 7pt)[
  $ phi_r = phi - phi' = (gamma_Y L)/rho_Y - (T L)/(J G), quad G = tau_Y / gamma_Y $
]

#st[Thin-Walled Hollow Shafts]

$ tau = T/(2t cal(A)), quad q = tau t $
$ phi = (T L)/(4 cal(A)^2 G) integral.cont d s/t quad (sum_(i=1)^n s_i/t_i) $

$cal(A)$: area enclosed by centerline

#align(right)[#image("images/image6.png", width: 0.8in)]

#st[Pure Bending]

$ epsilon_x = -y/rho, quad epsilon_"max" = c/rho $
$ sigma_x = -y/c E epsilon_"max" = -y/c sigma_"max" $

Neutral axis must pass through the centroid.

$ sigma_x = -(M y)/I, quad sigma_"max" = (M c)/I = M/S $

#v(4pt)
#st[Moment of Inertia]

#grid(columns: (auto, 1fr), gutter: 2pt,
  [Rectangle:], [$I = 1/12 b h^3$],
  [Circle:], [$I = pi/4 r^4$],
  [Parallel axis:], [$I = I_"CM" + A d^2$],
)

#v(2pt)
$S = I/c$ --- section modulus \
Rectangle: $S = 1/6 b h^2$

#align(right)[#image("images/image7.png", width: 0.6in)]

#st[Curvature]

$ 1/rho = epsilon_"max"/c = sigma_"max"/(E c) = M/(E I) $

#sst[Anticlastic Curvature $rho'$]
$ epsilon_y = epsilon_z = -nu epsilon_x = (nu y)/rho, quad 1/rho' = nu/rho $

#st[Composite Materials]

Replace higher-$E$ material with low-$E$ material but multiply the width by $n = E_2/E_1$. \
Multiply stress by $n$ for stiff material.
#v(-4pt)

#align(center)[
  #canvas(length: 0.22cm, {
    import draw: *
    let grey = luma(80%)
    let blue-grey = rgb(100, 160, 200, 80)
    let red = rgb(220, 50, 50)

    // LEFT FIGURE
    rect((0, 3), (2, 5.5), fill: luma(85%), stroke: 0.4pt)
    rect((0, 0), (2, 3), fill: blue-grey, stroke: 0.4pt)
    // dimension lines
    line((0, 5.7), (0, 6.5))
    line((2, 5.7), (2, 6.5))
    line((0, 6.2), (2, 6.2), mark: (start: "stealth", end: "stealth"), stroke: 0.4pt)
    content((1, 6.4), text(size: 5pt)[$b$])
    line((0, -0.2), (0, -1.5))
    line((2, -0.2), (2, -1.5))
    line((0, -1.2), (2, -1.2), mark: (start: "stealth", end: "stealth"), stroke: 0.4pt)
    content((1, -1.4), text(size: 5pt)[$b$])
    // dA
    rect((0.5, 0.6), (1.2, 1.2), fill: rgb(128, 0, 128, 180), stroke: 0.4pt)
    content((1.4, 0.9), text(size: 5pt)[$d A$], anchor: "west")

    // EQUALS sign
    line((3.0, 3.0), (4.0, 3.0), stroke: (paint: red, thickness: 1.7pt))
    line((3.0, 2.5), (4.0, 2.5), stroke: (paint: red, thickness: 1.7pt))

    // RIGHT FIGURE
    rect((7, 3), (9, 5.5), fill: luma(85%), stroke: 0.4pt)
    rect((5, 0), (11, 3), fill: luma(85%), stroke: 0.4pt)
    line((7, 5.7), (7, 6.5))
    line((9, 5.7), (9, 6.5))
    line((7, 6.2), (9, 6.2), mark: (start: "stealth", end: "stealth"), stroke: 0.4pt)
    content((8, 6.4), text(size: 5pt)[$b$])
    line((5, -0.2), (5, -1.5))
    line((11, -0.2), (11, -1.5))
    line((5, -1.2), (11, -1.2), mark: (start: "stealth", end: "stealth"), stroke: 0.4pt)
    content((8, -1.4), text(size: 5pt)[$n b$])
    rect((6.3, 0.6), (8.7, 1.2), fill: rgb(128, 0, 128, 180), stroke: 0.4pt)
    content((9.0, 0.9), text(size: 5pt)[$n d A$], anchor: "west")

    // Neutral axis lines
    line((-0.5, 2.75), (2.5, 2.75), stroke: (paint: red, thickness: 1.2pt))
    line((4.5, 2.75), (11.5, 2.75), stroke: (paint: red, thickness: 1.2pt))
    line((1.2, 1.2), (6.3, 1.2), stroke: (dash: "dashed", thickness: 0.3pt))
    line((1.2, 0.6), (6.3, 0.6), stroke: (dash: "dashed", thickness: 0.3pt))
    line((7, 3), (9, 3), stroke: (dash: "dashed", thickness: 0.3pt))
  })
]
#v(-10pt)

#st[Stress Concentration (Bending)]

$ sigma_"max" = K (M c / I)_"critical" $

#v(4pt)
#st[Modulus of Rupture in Bending]

$ R_B = (M_U c)/I $

#v(4pt)
#st[Plastic Bending]
#sst[Not Yield]
#v(-10pt)
$ T = (sigma_"max" I)/c $

#sst[Yield]
#v(-10pt)
#text(size: 7pt)[
  $ M_Y = I/c sigma_Y = 2/3 b c^2 sigma_Y $
]

#text(size: 7pt)[
  #table(
    columns: (0.45fr, 0.55fr),
    stroke: none,
    inset: (x: 0pt, y: 3pt),
    [$0 <= |y| <= y_Y$:], [$y_Y <= |y| <= c$:],
    [$sigma = -(sigma_Y)/(y_Y) y$], [$sigma = sigma_Y$],
  )
]

#text(size: 7pt)[
  $ M = integral.double y sigma d A = 2 b integral_0^c sigma y d y $

  $M_(E-P) = 3/2 M_Y (1 - y_Y^2/(3 c^2))$ \
  $1/rho = epsilon_Y/y_Y$ \
  $M_P = 3/2 M_Y$
]

#sst[Residual Curvature]
#text(size: 7pt)[
  $ 1/rho_r = 1/rho - 1/rho' = epsilon_Y/y_Y - M/(E I) $
]

#v(2pt)
#line(length: 100%, stroke: 0.3pt)
#v(2pt)

#text(size: 7pt)[
  #grid(columns: (0.5fr, 0.5fr), gutter: 4pt,
    [$Z = M_p/sigma_Y$], [(plastic section modulus)],
    [$k = M_p/M_Y = Z/S$], [(shape factor)],
  )
]

#align(center)[#image("images/image9.png", width: 1.5in)]

#v(4pt)
#grid(columns: (1fr, 1fr), gutter: 0pt,
  [#image("images/image35.png", width: 0.5in)],
  [#align(right)[#image("images/image36.png", width: 0.5in)]],
)

#v(-1cm)
#st[Unsymmetric Cross-Section (Plastic)]

For non-symmetric sections, neutral axis $!=$ centroidal axis.

#v(2pt)
Neutral axis divides cross-section into *equal areas*.

#text(size: 7pt)[
  $M_p = (1/2 A sigma_Y) d$
]

#v(2pt)
$d$: distance between tension/compression centroids

#v(4pt)
#grid(columns: (1fr, auto), gutter: 4pt,
  [],
  [#image("images/image12.png", width: 1.0in)],
)
#grid(columns: (1fr, auto), gutter: 4pt,
  [],
  [#image("images/image11.png", width: 1.0in)],
)
#grid(columns: (1fr, auto), gutter: 4pt,
  [],
  [#image("images/image37.png", width: 1.0in)],
)

#st[Unsymmetric Bending]

Resolve moment into principal axes:
$ M_z = M cos theta, quad M_y = M sin theta $

Superpose stress distributions:
$ sigma = -(M_z y)/I_z + (M_y z)/I_y $

#sst[Neutral axis orientation]
$tan phi = y/z = I_z/I_y tan theta$

#st[Eccentric Axial Loading]

$ sigma_x = P/A - (M_z y)/I_z + (M_y z)/I_y $

#v(2pt)
*Neutral axis:*
$ M_z/I_z y - M_y/I_y z = P/A $

#colbreak()

// ============================================================
// COLUMN 4 (Page 1 col 4 -- Elastic Curve etc.)
// ============================================================

#st[Elastic Curve]

$ 1/rho = (d^2 y)/(d x^2) = M/(E I), quad (d^4 y)/(d x^4) = w/(E I) $

$M > 0$: sagging \
$M < 0$: hogging \
Pin/Roller/Journal/Thrust support: $y = 0$, $y' != 0$ \
Fixed support: $y = 0$, $y' = 0$ \
#grid(columns: (0.35fr, 0.65fr), gutter: 6pt,
  [Free End:],
  [$cases(M = E I y'' = 0, V = E I y''' = 0)$],
)
#grid(columns: (0.35fr, 0.65fr), gutter: 6pt,
  [Segments:],
  [$cases(y_1(a) = y_2(a), y_1'(a) = y_2'(a))$],
)
#grid(columns: (0.35fr, 0.65fr), gutter: 6pt,
  [Symmetry:],
  [$cases(y("center") = y_"max", y'("center") = 0)$],
)
Complementary Coordinates: \
$x_2 = L - x_1$ \
$y_1'(x_1=a) = - y_2'(x_2=L-a)$

#st[Transverse and Longitudinal Shear]
#grid(columns: (auto, 1fr), gutter: 4pt, align: (horizon, horizon),
  [$tau = (V Q)/(I t)$],
  [#image("images/image15.png", width: 0.65in)],
)

$V$: shear force \
$Q$: first moment of area \
$I$: second moment of inertia \
$t$: width

#sst[Narrow Rectangular Beam]
#v(-5pt)
$ tau_(x y) = (3P)/(2A) (1 - y^2/c^2) $
#v(-5pt)
#sst[Shear Flow]
#v(-15pt)
$ q = (V Q)/I $
#v(-5pt)
#sst[Force for One Nail]
#v(-2pt)
$ F_"nail" = (q dot s)/n $
#text(size: 6pt)[
  $("Force"/"Length" dot "Length"/"Nail" div "rows" = "Force"/"Nail")$
]
$s$: spacing between nails \
$n$: number of rows of nails

#sst[Unsymmetric Beam / Shear Center]
$ F = integral_A^B q d s, quad V = integral_B^D q d s, quad e = (F h)/V $

#align(center)[
  #grid(columns: (auto, auto), gutter: 10pt, align: (horizon, horizon),
    [#image("images/image16.png", width: 0.6in)],
    [#image("images/image26.png", width: 0.6in)],
  )
]
#v(-5pt)
#align(center)[
  #grid(columns: (auto, auto), gutter: 10pt, align: (horizon, horizon),
    [#image("images/image17.png", width: 1in)],
    [#image("images/image18.png", width: 1in)],
  )
]
#v(-5pt)

#sst[Composite Section]
$ tau = (V Q_"tr")/(I_"tr" t_"actual") $

]

// ============================================================
// PAGE 2
// ============================================================
#pagebreak()

#columns(3, gutter: 8pt)[

// ============================================================
// PAGE 2, COLUMN 1
// ============================================================

#st[Transformations of Plane Stress]
#v(-2pt)
Let $sigma_"avg" = (sigma_x + sigma_y)/2$, $R = sqrt(((sigma_x - sigma_y)/2)^2 + tau_(x y)^2)$
#v(-4pt)
#text(size: 7pt)[
  $ sigma_(x') &= sigma_"avg" + (sigma_x - sigma_y)/2 cos 2theta + tau_(x y) sin 2theta \
    sigma_(y') &= sigma_"avg" - (sigma_x - sigma_y)/2 cos 2theta - tau_(x y) sin 2theta \
    tau_(x' y') &= -(sigma_x - sigma_y)/2 sin 2theta + tau_(x y) cos 2theta \
    sigma_(x') + sigma_(y') &= sigma_x + sigma_y $
]
#v(-6pt)
$tan 2theta_p = (2 tau_(x y))/(sigma_x - sigma_y)$, #h(4pt) $sigma_("max","min") = sigma_"avg" plus.minus R$ \
\
$tan 2theta_s = -(sigma_x - sigma_y)/(2 tau_(x y))$, #h(4pt) $tau_"max" = R$, #h(4pt) $sigma' = sigma_"avg"$ \
\
$theta_(p 1)$ brings the $x$ face to $sigma_"max"$ (principal plane)

#st[Transformations of Plane Strain]
#v(-2pt)
Let $epsilon_"avg" = (epsilon_x + epsilon_y)/2$, $R = sqrt(((epsilon_x - epsilon_y)/2)^2 + (gamma_(x y)/2)^2)$
#v(-4pt)
#text(size: 7pt)[
  $ epsilon_(x') &= epsilon_"avg" + (epsilon_x - epsilon_y)/2 cos 2theta + gamma_(x y)/2 sin 2theta \
    epsilon_(y') &= epsilon_"avg" - (epsilon_x - epsilon_y)/2 cos 2theta - gamma_(x y)/2 sin 2theta \
    gamma_(x' y')/2 &= -(epsilon_x - epsilon_y)/2 sin 2theta + gamma_(x y)/2 cos 2theta \
    epsilon_(x') + epsilon_(y') &= epsilon_x + epsilon_y $
]
#v(-6pt)
$tan 2theta_p = gamma_(x y)/(epsilon_x - epsilon_y)$, #h(4pt) $epsilon_("max","min") = epsilon_"avg" plus.minus R$ \
\
$tan 2theta_s = -(epsilon_x - epsilon_y)/gamma_(x y)$, #h(4pt) $gamma_"max"/2 = R$, #h(4pt) $epsilon' = epsilon_"avg"$ \
\
$theta_(p 1)$ brings the $x$ face to $epsilon_"max"$ (principal plane)

#st[Mohr's Circle]
#v(-10pt)

#align(center)[
  #canvas(length: 0.2cm, {
    import draw: *
    let sigmax = 9.0
    let sigmay = 3.0
    let tauxy  = 4.0
    let sigmam = (sigmax + sigmay) / 2
    let sigmad = (sigmax - sigmay) / 2
    let r = calc.sqrt(sigmad * sigmad + tauxy * tauxy)
    let s  = 0.5
    let xoff = 3.0
    let w = sigmam + r + s
    let h = r + s

    // Axes
    line((-xoff, -h), (-xoff, h), mark: (end: "stealth"), stroke: 1pt)
    content((-xoff, h + 0.4), text(size: 5pt)[$tau$], anchor: "south")
    line((-xoff, 0), (w + 1.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((w + 2.0, 0), text(size: 5pt)[$sigma$], anchor: "west")

    // Circle
    circle((sigmam, 0), radius: r, stroke: (paint: blue, thickness: 1pt), fill: none)

    // Diameter
    line((sigmax, -tauxy), (sigmay, tauxy), stroke: (paint: gray, thickness: 1.2pt))
    circle((sigmax, -tauxy), radius: 0.15, fill: black, stroke: none)
    circle((sigmay, tauxy), radius: 0.15, fill: black, stroke: none)
    content((sigmax + 0.3, -tauxy - 0.3), text(size: 5pt)[$x(sigma_x, -tau_(x y))$], anchor: "north-west")
    content((sigmay + 0.3, tauxy + 0.3), text(size: 5pt)[$y(sigma_y, tau_(x y))$], anchor: "south-east")

    // sigma_avg
    line((sigmam, 0), (sigmam, -0.3), stroke: 0.4pt)
    content((sigmam, -0.5), text(size: 5pt)[$sigma_"avg"$], anchor: "north")

    // Principal stress points
    circle((sigmam + r, 0), radius: 0.15, fill: black, stroke: none)
    content((sigmam + r, -0.3), text(size: 5pt)[$sigma_"max"$], anchor: "north")
    circle((sigmam - r, 0), radius: 0.15, fill: black, stroke: none)
    content((sigmam - r, -0.3), text(size: 5pt)[$sigma_"min"$], anchor: "north")

    // tau max/min
    circle((sigmam, r), radius: 0.15, fill: black, stroke: none)
    content((sigmam, r + 0.3), text(size: 5pt)[$tau_"max"$], anchor: "south")
    circle((sigmam, -r), radius: 0.15, fill: black, stroke: none)
    content((sigmam, -r - 0.3), text(size: 5pt)[$tau_"min"$], anchor: "north")

    // Angle arcs
    let psi = calc.atan2(-tauxy, sigmad)
    arc((sigmam, 0), start: psi, stop: 0deg, radius: 0.52 * r, mark: (end: "stealth"), stroke: 0.8pt)
    content((sigmam + 0.52 * r * calc.cos(psi / 2), 0.52 * r * calc.sin(psi / 2)),
      text(size: 5pt)[$2theta_(p 1)$], anchor: "north-west")
    arc((sigmam, 0), start: psi, stop: 90deg, radius: 0.33 * r, mark: (end: "stealth"), stroke: 0.8pt)
    content((sigmam + 0.33 * r * calc.cos((psi + 90deg) / 2), 0.33 * r * calc.sin((psi + 90deg) / 2)),
      text(size: 5pt)[$2theta_(s 1)$], anchor: "south-west")
  })
]

#v(-10pt)
#st[Mohr's Circle --- 3D]
#v(-8pt)

#align(center)[
  #image("images/image29.png", width: 0.8in)
  #image("images/image30.png", width: 0.8in)
]

// 3D Mohr's circles (two principal stress cases)
#v(-20pt)
#grid(columns: (0.55fr, 0.43fr), gutter: 4pt,
  [
    // sigma_1, sigma_2 both positive
    #align(center)[
      #canvas(length: 0.12cm, {
        import draw: *
        let siga = 10.0
        let sigb = 4.0
        let rA = siga / 2
        let rB = sigb / 2
        let rAB = (siga - sigb) / 2
        let cA = rA
        let cB = rB
        let cAB = (siga + sigb) / 2
        let s = 0.5
        let h = rA + s + 1.5

        // Shading
        circle((cAB, 0), radius: rAB, fill: blue.lighten(85%), stroke: none)

        // Three circles
        circle((cAB, 0), radius: rAB, stroke: (paint: blue, thickness: 1pt), fill: none)
        circle((cB, 0), radius: rB, stroke: (paint: blue, thickness: 1pt), fill: none)
        circle((cA, 0), radius: rA, stroke: (paint: blue, thickness: 1pt), fill: none)

        // Axes
        line((0, -h), (0, h), mark: (end: "stealth"), stroke: 1pt)
        content((0, h + 0.4), text(size: 5pt)[$tau$], anchor: "south")
        line((0, 0), (siga + 2, 0), mark: (end: "stealth"), stroke: 1pt)
        content((siga + 2.5, 0), text(size: 5pt)[$sigma$], anchor: "west")

        // Points
        circle((sigb, 0), radius: 0.18, fill: black, stroke: none)
        content((sigb, -0.4), text(size: 5pt)[$sigma_2$], anchor: "north")
        circle((siga, 0), radius: 0.18, fill: black, stroke: none)
        content((siga, -0.4), text(size: 5pt)[$sigma_1$], anchor: "north")
        circle((cA, rA), radius: 0.18, fill: black, stroke: none)
        content((cA, rA + 0.4), text(size: 5pt)[$tau_"abs,max"$], anchor: "south")
      })
    ]
  ],
  [
    // sigma_1 > 0, sigma_2 < 0
    #align(center)[
      #canvas(length: 0.1cm, {
        import draw: *
        let siga = 10.0
        let sigb = -3.0
        let rA = siga / 2
        let rB = calc.abs(sigb) / 2
        let rAB = (siga - sigb) / 2
        let cA = rA
        let cB = sigb / 2
        let cAB = (siga + sigb) / 2
        let s = 0.5
        let xoff = calc.abs(sigb) + 1.5
        let h = rAB + s + 1.5

        // Shading
        circle((cAB, 0), radius: rAB, fill: blue.lighten(85%), stroke: none)

        // Three circles
        circle((cAB, 0), radius: rAB, stroke: (paint: blue, thickness: 1pt), fill: none)
        circle((cB, 0), radius: rB, stroke: (paint: blue, thickness: 1pt), fill: none)
        circle((cA, 0), radius: rA, stroke: (paint: blue, thickness: 1pt), fill: none)

        // Axes
        line((0, -h), (0, h), mark: (end: "stealth"), stroke: 1pt)
        content((0, h + 0.4), text(size: 5pt)[$tau$], anchor: "south")
        line((-xoff, 0), (siga + 2, 0), mark: (end: "stealth"), stroke: 1pt)
        content((siga + 2.5, 0), text(size: 5pt)[$sigma$], anchor: "west")

        // tau abs max
        circle((cAB, rAB), radius: 0.18, fill: black, stroke: none)
        content((cAB, rAB + 0.4), text(size: 5pt)[$tau_"abs,max"$], anchor: "south")
        content((cAB, h + 14.0), text(size: 5pt)[One $sigma$ compressive], anchor: "south")
      })
    ]
  ],
)

#sst[2D & 3D Shear Sign]
#text(size: 6pt)[
  $(+)$: Face & arrow both positive or both negative direction \
  $(-)$: Otherwise
]
#sst[Axis Substitution]
#v(-0.5cm)
#text(size: 7pt)[
  #align(center)[
    #table(
      columns: (auto, auto),
      inset: 4pt,
      [*Stress Plane*], [*Plot*],
      [$(x,y)$], [$( sigma_x, -tau_(x y))$ \ $(sigma_y, tau_(x y))$],
      [$(y,z)$], [$( sigma_y, -tau_(y z))$ \ $(sigma_z, tau_(y z))$],
      [$(z,x)$], [$( sigma_z, -tau_(x z))$ \ $(sigma_x, tau_(x z))$],
    )
  ]
]

#st[Strain Transformations]
#v(-10pt)

#align(center)[
  #canvas(length: 0.2cm, {
    import draw: *
    let ex = 9.0
    let ey = 3.0
    let gxy = 4.0
    let eavg = (ex + ey) / 2
    let ediff = (ex - ey) / 2
    let r = calc.sqrt(ediff * ediff + gxy * gxy)
    let s = 0.5
    let xoff = 3.0
    let w = eavg + r + s
    let h = r + s

    // Axes
    line((-xoff, -h), (-xoff, h), mark: (end: "stealth"), stroke: 1pt)
    content((-xoff, h + 0.4), text(size: 5pt)[$gamma\/2$], anchor: "south")
    line((-xoff, 0), (w + 1.5, 0), mark: (end: "stealth"), stroke: 1pt)
    content((w + 2.0, 0), text(size: 5pt)[$epsilon$], anchor: "west")

    // Circle
    circle((eavg, 0), radius: r, stroke: (paint: blue, thickness: 1pt), fill: none)

    // Diameter
    line((ex, -gxy), (ey, gxy), stroke: (paint: gray, thickness: 1.2pt))
    circle((ex, -gxy), radius: 0.15, fill: black, stroke: none)
    circle((ey, gxy), radius: 0.15, fill: black, stroke: none)
    content((ex + 0.3, -gxy - 0.3), text(size: 5pt)[$x(epsilon_x, -gamma_(x y)\/2)$], anchor: "north-west")
    content((ey + 0.3, gxy + 0.3), text(size: 5pt)[$y(epsilon_y, gamma_(x y)\/2)$], anchor: "south-east")

    // eps_avg
    line((eavg, 0), (eavg, -0.3), stroke: 0.4pt)
    content((eavg, -0.5), text(size: 5pt)[$epsilon_"avg"$], anchor: "north")

    // Principal strain points
    circle((eavg + r, 0), radius: 0.15, fill: black, stroke: none)
    content((eavg + r, -0.3), text(size: 5pt)[$epsilon_"max"$], anchor: "north")
    circle((eavg - r, 0), radius: 0.15, fill: black, stroke: none)
    content((eavg - r, -0.3), text(size: 5pt)[$epsilon_"min"$], anchor: "north")

    // gamma max/min
    circle((eavg, r), radius: 0.15, fill: black, stroke: none)
    content((eavg, r + 0.3), text(size: 5pt)[$gamma_"max"\/2$], anchor: "south")
    circle((eavg, -r), radius: 0.15, fill: black, stroke: none)
    content((eavg, -r - 0.3), text(size: 5pt)[$gamma_"min"\/2$], anchor: "north")

    // Angle arcs
    let psi = calc.atan2(-gxy, ediff)
    arc((eavg, 0), start: psi, stop: 0deg, radius: 0.52 * r, mark: (end: "stealth"), stroke: 0.8pt)
    content((eavg + 0.52 * r * calc.cos(psi / 2), 0.52 * r * calc.sin(psi / 2)),
      text(size: 5pt)[$2theta_(p 1)$], anchor: "north-west")
    arc((eavg, 0), start: psi, stop: 90deg, radius: 0.33 * r, mark: (end: "stealth"), stroke: 0.8pt)
    content((eavg + 0.33 * r * calc.cos((psi + 90deg) / 2), 0.33 * r * calc.sin((psi + 90deg) / 2)),
      text(size: 5pt)[$2theta_(s 1)$], anchor: "south-west")
  })
]

#colbreak()

// ============================================================
// PAGE 2, COLUMN 2
// ============================================================

#grid(columns: (1fr, auto), gutter: 4pt,
  [], [#image("images/image29.png", width: 0.8in)],
)
#grid(columns: (1fr, auto), gutter: 4pt,
  [], [#image("images/image30.png", width: 0.8in)],
)

#st[Plastic Deformation due to Shear]
$P x = 3/2 M_Y (1 - y^2/(3 c^2))$ \
$x$: distance from free end
#v(5pt)
#sst[Shear Stress]
$tau_(x y) = 3/2 V/A' (1 - y^2/y_Y^2)$ \
$A'$: area of elastic section \
$A' = 2 b y_Y$ for rectangular cross section

#grid(columns: (auto, 1fr, auto), gutter: 4pt,
  [#image("images/image27.png", width: 0.8in)],
  [],
  [#image("images/image28.png", width: 0.5in)],
)

#st[Thin-walled Pressure Vessels]
$ sigma_1 = (p r)/t "(hoop)", quad sigma_2 = (p r)/(2t) "(longitudinal)" $

#st[Strain Rosette]

#align(center)[#image("images/image25.png", width: 0.6 * 100%)]

$ epsilon_1 = epsilon_x cos^2 theta_1 + epsilon_y sin^2 theta_1 + gamma_(x y)/2 sin 2theta_1 $
$ epsilon_2 = epsilon_x cos^2 theta_2 + epsilon_y sin^2 theta_2 + gamma_(x y)/2 sin 2theta_2 $
$ epsilon_3 = epsilon_x cos^2 theta_3 + epsilon_y sin^2 theta_3 + gamma_(x y)/2 sin 2theta_3 $

#v(-0.5cm)
#align(center)[#image("images/image31.png", width: 2.0in)]
same principle for centroid

#grid(columns: (1fr, auto), gutter: 4pt,
  [], [#image("images/image38.png", width: 0.6in)],
)

#sst[Transmission Shaft Design]

$tau_"max" = c/J sqrt(M_y^2 + M_z^2 + T^2)$

#st[Buckling of Columns]
#grid(columns: (0.60fr, 0.40fr), gutter: 4pt, align: (top, top),
  [
    $P_"cr" = (pi^2 E I)/L_e^2, quad sigma_"cr" = (pi^2 E)/((L_e\/r)^2)$ \
    #text(size: 7pt)[
      $r = sqrt(I\/A)$: radius of gyration \
      $y_"max"$ undeterminate for axial load
    ]
  ],
  [
    #text(size: 6pt)[
      #table(
        columns: (auto, auto),
        inset: 2pt,
        [*$L_e\/L$*], [*Supports*],
        [1.0], [Pin-Pin],
        [0.5], [Fixed-Fixed],
        [0.7], [Fixed-Pin],
        [2.0], [Fixed-Free],
      )
    ]
  ],
)

#sst[Eccentric Loading]
#text(size: 7pt)[
  $ y_"max" = e (sec(sqrt(P/(E I)) L/2) - 1) = e (sec(pi/2 sqrt(P/P_"cr")) - 1) $
]
#text(size: 7pt)[
  $ sigma_"max" &= P/A (1 + ((y_"max" + e)c)/r^2) \
               &= P/A (1 + (e c)/r^2 sec(pi/2 sqrt(P/P_"cr"))) \
               &= P/A (1 + (e c)/r^2 sec(sqrt(P/(E I)) L/2)) $
]

#grid(columns: (1fr, auto), gutter: 0pt,
  [],
  stack(
    image("images/image39.png", width: 1in),
    image("images/image40.png", width: 1in),
    image("images/image41.png", width: 1in),
  ),
)

#st[Allowable Stress Design Steel]
*AB* ($L\/r < 4.71 sqrt(E\/sigma_y)$): \
$sigma_"cr" = [0.658^(sigma_y\/sigma_e)] sigma_y$, #h(4pt) $sigma_e = (pi^2 E)/((L\/r)^2)$ \
*BC* ($L\/r >= 4.71 sqrt(E\/sigma_y)$): \
$sigma_"cr" = 0.877 sigma_e$ \
*Allowable:* $sigma_"all" = sigma_"cr" \/ 1.67$

*Aluminum Alloys ($sigma_"all"$)* \
*6061-T6:* $L\/r<66$: $[20.3-0.127(L\/r)]$ ksi $=[140-0.874(L\/r)]$ MPa \
#h(48pt) $L\/r>=66$: $51400\/(L\/r)^2$ ksi $=354 times 10^3\/(L\/r)^2$ MPa \
*2014-T6:* $L\/r<55$: $[30.9-0.229(L\/r)]$ ksi $=[213-1.577(L\/r)]$ MPa \
#h(48pt) $L\/r>=55$: $55400\/(L\/r)^2$ ksi $=382 times 10^3\/(L\/r)^2$ MPa

#colbreak()

// ============================================================
// PAGE 2, COLUMN 3
// ============================================================

*Wood (ASD):* \
$sigma_"all" = sigma_C C_p$, \
#text(size: 7pt)[
  $C_p = (1 + (sigma_"CE"\/sigma_C))/(2c) - sqrt([(1 + (sigma_"CE"\/sigma_C))/(2c)]^2 - (sigma_"CE"\/sigma_C)/c)$
]
$sigma_"CE" = (0.822 E)/((L\/d)^2)$ \
$c = 0.8$ (sawn), $c = 0.9$ (glued laminated wood) \
$L\/d <= 50$

#sst[Centric Load Design]
$ gamma_D P_D + gamma_L P_L <= phi P_U $
$P_U = sigma_"cr" A$, $phi = 0.9$ (Steel)

#sst[Eccentric Load Design]
$ sigma = sigma_"centric" + sigma_"bending" = P/A + (M c)/I <= sigma_"all" $

#sst[Interaction Method]
$ (P\/A)/(sigma_"all"_"centric") + (|M_x| z_"max"\/I_x)/(sigma_"all"_"bending") + (|M_z| x_"max"\/I_z)/(sigma_"all"_"bending") <= 1 $

]

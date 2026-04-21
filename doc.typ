#block[
#strong[CIVE 207 --- Crib Sheet] \
Final

]
#block[
5

#strong[Hooke's Law]

#horizontalrule

height 0.4pt

#figure(
  align(center)[#table(
    columns: 3,
    align: (left,left,left,),
    [$sigma = E epsilon$], [$tau = G gamma$], [],
    [$sigma = F / A$], [$delta = frac(P L, A E)$], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    [$tau = V / A$ (single shear)], [],
    [$tau = frac(V, 2 A)$ (double shear)], [],
  )]
  , kind: table
  )

#block[
#strong[Bearing Stress]

#horizontalrule

height 0.4pt

$sigma_B = V / upright("Projected Area")$ \
$sigma_(upright("gross"))$: normal stress on full area \
$sigma_(upright("net"))$: stress at smallest area

]
#strong[Stress on Oblique Plane]

#horizontalrule

height 0.4pt

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    [$sigma = P / A cos^2 #h(-1em) theta$], [],
    [$tau = P / A sin theta cos theta$], [],
  )]
  , kind: table
  )

$sigma_(upright("max"))$: $theta = 0^compose$ \
$tau_(upright("max"))$: $theta = plus.minus 45^compose$

#strong[Factor of Safety]

#horizontalrule

height 0.4pt

$ F S = sigma_(upright("ultimate")) / sigma_(upright("allowable")) $

#strong[Shear Strain]

#horizontalrule

height 0.4pt

$gamma > 0$: inside angle decreases
$ gamma = theta_(upright("initial")) - theta_(upright("final")) $

#strong[Thermal Deformation]

#horizontalrule

height 0.4pt

$ delta = alpha dot.op Delta T dot.op L $

#strong[3D Stress--Strain]

#horizontalrule

height 0.4pt

$E epsilon_x = sigma_x - nu \( sigma_y + sigma_z \)$ \
$E epsilon_y = sigma_y - nu \( sigma_x + sigma_z \)$ \
$E epsilon_z = sigma_z - nu \( sigma_x + sigma_y \)$

#strong[Poisson Ratio] \
$ nu = - epsilon_(upright("lateral")) / epsilon_(upright("axial")) $

#strong[Dilatation (Unit Volume Change)] \
$ e & = epsilon_x + epsilon_y + epsilon_z\
v & = \( 1 + epsilon_x \) \( 1 + epsilon_y \) \( 1 + epsilon_z \) approx 1 + e\
e & = v - 1 $ $e$: unit change in volume
$ e = frac(1 - 2 nu, E) (sigma_x + sigma_y + sigma_z) $

#strong[Hydrostatic Pressure $p$] \
$ e = - frac(3 \( 1 - 2 nu \), E) thin p $

#strong[Bulk Modulus / Modulus of Compression] \
$ k = frac(E, 3 \( 1 - 2 nu \)) \, #h(2em) e = - p / k $
$ G = frac(E, 2 \( 1 + nu \)) $

#strong[Saint-Venant Principle]

#horizontalrule

height 0.4pt

At distance $gt.eq$ width of member, stress distribution is uniform
whether plate-loaded or point-loaded.

#strong[Stress Concentration]

#horizontalrule

height 0.4pt

$ K = sigma_max / sigma_(upright("avg")) $

#strong[Torsion:]
$ tau_max = K (frac(T c, J))_(#h(-1em) upright("smaller shaft")) $

#strong[Torsion & Shear Strain]

#horizontalrule

height 0.4pt

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    [$gamma = frac(rho thin phi.alt, L)$], [],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    [$tau = frac(T rho, J)$], [],
  )]
  , kind: table
  )

$phi.alt = frac(T L, G J)$

#strong[Polar Moment of Inertia]

#horizontalrule

height 0.4pt

$ J_(upright("circle")) = pi / 2 r^4 = pi / 32 d^4 $

#strong[Gear Ratios]

#horizontalrule

height 0.4pt

$ T_1 / R_1 = T_2 / R_2 \, #h(2em) phi.alt_1 R_1 = phi.alt_2 R_2 $

#strong[Power]

#horizontalrule

height 0.4pt

$ P = T omega = 2 pi f T $
$ 1 #h(0em) upright("W") & = 1 #h(0em) frac(upright("N") dot.op upright("m"), upright("s"))\
1 #h(0em) upright("hp") & = 550 #h(0em) frac(upright("ft") dot.op upright("lb"), upright("s")) $

#strong[Variable Cross-Section]

#horizontalrule

height 0.4pt

$ phi.alt = integral_0^L frac(T, G J) thin d x $

$ phi.alt_(E \/ B) = phi.alt_E - phi.alt_B $ (E moves w.r.t.~B)

#strong[Modulus of Rupture in Torsion]

#horizontalrule

height 0.4pt

$ R_T = frac(T_U c, J) $

#strong[Plastic Torsion]

#horizontalrule

height 0.4pt

#strong[Not Yield] \
$ T = J / c thin tau_max $ #strong[Yield] \
$ T_Y = J / c thin tau_y = pi / 2 thin c^3 tau_Y $

#figure(
  align(center)[#table(
    columns: (40%, 50%),
    align: (left,left,),
    [$0 lt.eq rho lt.eq rho_Y$:], [$rho_Y lt.eq rho lt.eq c$:],
    [$tau = tau_Y / rho_Y rho$], [$tau = tau_Y$],
  )]
  , kind: table
  )

$ T = integral.double rho thin tau thin d A = 2 pi integral_a^b tau thin rho^2 thin d rho $

$T_(E - P) = 4 / 3 T_Y (1 - 1 / 4 rho_Y^3 / c^3)$ \
$phi.alt = frac(gamma_Y L, rho_Y) = frac(tau_Y L, rho_Y G)$ \
$T_P = 4 / 3 T_Y$

$rho_Y / c = phi.alt_Y / phi.alt$ \
$phi.alt_Y$ = angle when outer starts yielding

#strong[Torsion Rectangular]

#horizontalrule

height 0.4pt

$ tau_max = frac(T, c_1 a b^2) #h(2em) phi.alt = frac(T L, c_2 a b^3 G) $

#strong[Residual Shear Strain] \
$ phi.alt_r = phi.alt - phi.alt' = frac(gamma_Y L, rho_Y) - frac(T L, J G) \, G = tau_Y / gamma_Y $

#strong[Thin-Walled Hollow Shafts]

#horizontalrule

height 0.4pt

$ tau = frac(T, 2 t cal(A)) \, #h(2em) q = tau t $
$ phi.alt = frac(T L, 4 cal(A)^2 G) integral.cont frac(d s, t) quad (sum_(i = 1)^n s_i / t_i) $

$cal(A)$: area enclosed by centerline

#strong[Pure Bending]

#horizontalrule

height 0.4pt

$ epsilon_x = - y / rho \, epsilon_max = c / rho $
$ sigma_x = - y / c thin E epsilon_max = - y / c thin sigma_max $

Neutral axis must pass through the centroid.

$ sigma_x = - frac(M y, I) \, sigma_max = frac(M c, I) = M / S $

#strong[Moment of Inertia]

#horizontalrule

height 0.4pt

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    [Rectangle:], [$I = 1 / 12 b h^3$],
    [Circle:], [$I = pi / 4 r^4$],
    [Parallel axis:], [$I = I_(C M) + A d^2$],
  )]
  , kind: table
  )

$S = I / c$ --- section modulus

Rectangle: $S = 1 / 6 b h^2$

#strong[Curvature]

#horizontalrule

height 0.4pt

$ 1 / rho = epsilon_max / c = frac(sigma_max, E c) = frac(M, E I) $

#strong[Anticlastic Curvature $rho'$] \
$ epsilon_y = epsilon_z = - nu epsilon_x = frac(nu y, rho) \, 1 / rho' = nu / rho $

#strong[Composite Materials]

#horizontalrule

height 0.4pt

Replace higher-$E$ material with low-$E$ material but multiply the width
by $n = E_2 / E_1$. \
Multiply stress by $n$ for stiff material.

#block[
]
#strong[Stress Concentration (Bending)]

#horizontalrule

height 0.4pt

$ sigma_max = K #h(-1em) (frac(M c, I))_(#h(-1em) upright("critical")) $

#strong[Modulus of Rupture in Bending]

#horizontalrule

height 0.4pt

$ R_B = frac(M_U c, I) $

#strong[Plastic Bending]

#horizontalrule

height 0.4pt

#strong[Not Yield] \

$ T = frac(sigma_max I, c) $

#strong[Yield] \
$ M_Y = I / c thin sigma_Y = 2 / 3 b c^2 sigma_Y $

#figure(
  align(center)[#table(
    columns: (40%, 50%),
    align: (left,left,),
    [$0 lt.eq \| y \| lt.eq y_Y$:], [$y_Y lt.eq \| y \| lt.eq c$:],
    [$sigma = - sigma_Y / y_Y y$], [$sigma = sigma_Y$],
  )]
  , kind: table
  )

$ M = integral.double y thin sigma thin d A = 2 b integral_0^c sigma thin y thin d y $

$M_(E - P) = 3 / 2 M_Y (1 - frac(y_Y^2, 3 c^2))$ \
$1 / rho = epsilon_Y / y_Y$ \
$M_P = 3 / 2 M_Y$

#strong[Residual Curvature] \
$ 1 / rho_r = 1 / rho - 1 / rho' = epsilon_Y / y_Y - frac(M, E I) $

#horizontalrule

height 0.3pt

#figure(
  align(center)[#table(
    columns: (45%, 45%),
    align: (left,left,),
    [$Z = M_p / sigma_Y$], [\(plastic section modulus)],
    [$k = M_p / M_Y = Z / S$], [\(shape factor)],
  )]
  , kind: table
  )

#block[
#box(image("image9.png", width: 1.5in))

]
#strong[Unsymmetric Cross-Section (Plastic)]

#horizontalrule

height 0.4pt

For non-symmetric sections, neutral axis $eq.not$ centroidal axis.

Neutral axis divides cross-section into #strong[equal areas].

$M_p = (1 / 2 A sigma_Y) d$

$d$: distance between tension/compression centroids

#strong[Unsymmetric Bending]

#horizontalrule

height 0.4pt

Resolve moment into principal axes:
$ M_z = M cos theta \, M_y = M sin theta $

Superpose stress distributions:
$ sigma = - frac(M_z y, I_z) + frac(M_y z, I_y) $

#block[
#strong[Neutral axis orientation] \
$tan phi.alt = y / z = I_z / I_y tan theta$

]
#strong[Eccentric Axial Loading]

#horizontalrule

height 0.4pt

$ sigma_x = P / A - frac(M_z y, I_z) + frac(M_y z, I_y) $

#strong[Neutral axis:] $ M_z / I_z y - M_y / I_y z = P / A $

#strong[Elastic Curve]

#horizontalrule

height 0.6pt

$ 1 / rho = frac(d^2 y, d x^2) = frac(M, E I) \, quad frac(d^4 y, d x^4) = frac(w, E I) $

$M > 0$: sagging \
$M < 0$: hogging \
Pin/Roller/Journal/Thrust support: $y = 0$, $y' eq.not 0$ \
Fixed support: $y = 0$, $y' = 0$ \

#figure(
  align(center)[#table(
    columns: (35%, 60%),
    align: (left,left,),
    [Free End:], [${M = E I y'' = 0\
    V = E I y''' = 0$],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: (35%, 60%),
    align: (left,left,),
    [Segments:], [${y_1 \( a \) = y_2 \( a \)\
    y'_1 \( a \) = y'_2 \( a \)$],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: (35%, 60%),
    align: (left,left,),
    [Symmetry:], [${y \( upright("center") \) = y_max\
    y' \( upright("center") \) = 0$],
  )]
  , kind: table
  )

Complementary Coordinates: \
$x_2 = L - x_1$ \
$y'_1 \( x_1 = a \) = - y'_2 \( x_2 = L - a \)$

#strong[Transverse and Longitudinal Shear]

#horizontalrule

height 0.6pt

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    [$tau = frac(V Q, I t)$], [],
  )]
  , kind: table
  )

$V$: shear force \
$Q$: first moment of area \
$I$: second moment of inertia \
$t$: width

#strong[Narrow Rectangular Beam] \
$ tau_(x y) = frac(3 P, 2 A) (1 - y^2 / c^2) $ #strong[Shear Flow] \

$ q = frac(V Q, I) $ #strong[Force for One Nail] \
$ F_(upright("nail")) = frac(q dot.op s, n) $
$(upright("Force") / upright("Length") dot.op upright("Length") / upright("Nail") div upright("rows") = upright("Force") / upright("Nail"))$
$s$: spacing between nails \
$n$: number of rows of nails

#strong[Unsymmetric Beam / Shear Center] \
$ F = integral_A^B q thin d s \, quad V = integral_B^D q thin d s \, quad e = frac(F h, V) $

#block[
]
#block[
]
#strong[Composite Section] \
$ tau = frac(V Q_(upright("tr")), I_(upright("tr")) t_(upright("actual"))) $

]
#block[
3

#strong[Transformations of Plane Stress]

#horizontalrule

height 0.6pt

Let $sigma_(upright("avg")) = frac(sigma_x + sigma_y, 2)$,
$R = sqrt((frac(sigma_x - sigma_y, 2))^(#h(-1em) 2) + tau_(x y)^2)$
$ sigma_(x') & = sigma_(upright("avg")) + frac(sigma_x - sigma_y, 2) cos 2 theta + tau_(x y) sin 2 theta\
sigma_(y') & = sigma_(upright("avg")) - frac(sigma_x - sigma_y, 2) cos 2 theta - tau_(x y) sin 2 theta\
tau_(x' y') & = - frac(sigma_x - sigma_y, 2) sin 2 theta + tau_(x y) cos 2 theta\
sigma_(x') + sigma_(y') & = sigma_x + sigma_y $
$tan 2 theta_p = frac(2 tau_(x y), sigma_x - sigma_y)$,
$sigma_(max \, min) = sigma_(upright("avg")) plus.minus R$ \
\
$tan 2 theta_s = - frac(sigma_x - sigma_y, 2 tau_(x y))$, $tau_max = R$,
$sigma' = sigma_(upright("avg"))$ \

#strong[Transformations of Plane Strain]

#horizontalrule

height 0.6pt

Let $epsilon_(upright("avg")) = frac(epsilon_x + epsilon_y, 2)$,
$R = sqrt((frac(epsilon_x - epsilon_y, 2))^(#h(-1em) 2) + (gamma_(x y) / 2)^2)$
$ epsilon_(x') & = epsilon_(upright("avg")) + frac(epsilon_x - epsilon_y, 2) cos 2 theta + gamma_(x y) / 2 sin 2 theta\
epsilon_(y') & = epsilon_(upright("avg")) - frac(epsilon_x - epsilon_y, 2) cos 2 theta - gamma_(x y) / 2 sin 2 theta\
gamma_(x' y') / 2 & = - frac(epsilon_x - epsilon_y, 2) sin 2 theta + gamma_(x y) / 2 cos 2 theta\
epsilon_(x') + epsilon_(y') & = epsilon_x + epsilon_y $
$tan 2 theta_p = frac(gamma_(x y), epsilon_x - epsilon_y)$,
$epsilon_(max \, min) = epsilon_(upright("avg")) plus.minus R$ \
\
$tan 2 theta_s = - frac(epsilon_x - epsilon_y, gamma_(x y))$,
$gamma_max / 2 = R$, $epsilon' = epsilon_(upright("avg"))$ \

#strong[Mohr's Circle]

#horizontalrule

height 0.6pt

#block[
]
#strong[Mohr's Circle --- 3D]

#horizontalrule

height 0.6pt

#block[
]
#block[
]
#block[
]
#strong[2D & 3D Shear Sign] \
$\( + \)$: Face & arrow both positive or both negative direction \
$\( - \)$: Otherwise \
#strong[Axis Substitution] \

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([#strong[Stress Plane]], [#strong[Plot]],),
    table.hline(),
    [$\( x \, y \)$], [],
    [$\( sigma_y \, tau_(x y) \)$], [],
    [$\( y \, z \)$], [],
    [$\( sigma_z \, tau_(y z) \)$], [],
    [$\( z \, x \)$], [],
    [$\( sigma_x \, tau_(x z) \)$], [],
  )]
  , kind: table
  )

]
#strong[Strain Transformations]

#horizontalrule

height 0.6pt

#block[
]
#strong[Plastic Deformation due to Shear]

#horizontalrule

height 0.6pt

$P x = 3 / 2 M_Y (1 - frac(y^2, 3 c^2))$ \
$x$: distance from free end \
#strong[Shear Stress] \
$tau_(x y) = 3 / 2 V / A' (1 - y^2 / y_Y^2)$ \
$A'$: area of elastic section \
$A' = 2 b y_Y$ for rectangular cross section \

#block[
#strong[Thin-walled Pressure Vessels]

#horizontalrule

height 0.6pt

$ sigma_1 = frac(p r, t) upright(" (hoop)") \, quad sigma_2 = frac(p r, 2 t) upright(" (longitudinal)") $

]
#strong[Strain Rosette]

#horizontalrule

height 0.6pt

$ epsilon_1 = epsilon_x cos^2 theta_1 + epsilon_y sin^2 theta_1 + gamma_(x y) / 2 sin 2 theta_1 $
$ epsilon_2 = epsilon_x cos^2 theta_2 + epsilon_y sin^2 theta_2 + gamma_(x y) / 2 sin 2 theta_2 $
$ epsilon_3 = epsilon_x cos^2 theta_3 + epsilon_y sin^2 theta_3 + gamma_(x y) / 2 sin 2 theta_3 $

#block[
#box(image("image31.png", width: 2in))

]
same principle for centroid

#strong[Transmission Shaft Design] \
$tau_max = c / J sqrt(M_y^2 + M_z^2 + T^2)$

#strong[Buckling of Columns]

#horizontalrule

height 0.6pt

#block[
$P_(c r) = frac(pi^2 E I, L_e^2) \, sigma_(c r) = frac(pi^2 E, \( L_e \/ r \)^2)$
\
$r = sqrt(I \/ A)$: radius of gyration \
$y_max$ undeterminate for axial load

]
#block[
\[0pt\]\[0pt\]

#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([#strong[$L_e \/ L$]], [#strong[Supports]],),
    table.hline(),
    [1.0], [Pin-Pin],
    [0.5], [Fixed-Fixed],
    [0.7], [Fixed-Pin],
    [2.0], [Fixed-Free],
  )]
  , kind: table
  )

]
#strong[Eccentric Loading] \
$ y_max = e (sec (sqrt(frac(P, E I)) L / 2) - 1) = e (sec (pi / 2 sqrt(P / P_(c r))) - 1) $
$ sigma_max & = P / A (1 + frac(\( y_max + e \) c, r^2))\
 & = P / A (1 + frac(e c, r^2) sec (pi / 2 sqrt(P / P_(c r))))\
 & = P / A (1 + frac(e c, r^2) sec (sqrt(frac(P, E I)) L / 2)) $

#strong[Allowable Stress Design Steel]

#horizontalrule

height 0.6pt

#strong[AB] ($L \/ r < 4.71 sqrt(E \/ sigma_y)$):
$sigma_(c r) = [0.658^(\( sigma_y \/ sigma_e \))] sigma_y$,
$sigma_e = frac(pi^2 E, \( L \/ r \)^2)$ \
#strong[BC] ($L \/ r gt.eq 4.71 sqrt(E \/ sigma_y)$):
$sigma_(c r) = 0.877 thin sigma_e$ \
#strong[Allowable:] $sigma_(a l l) = sigma_(c r) / 1.67$

#strong[Aluminum Alloys ($sigma_(a l l)$)] \
#strong[6061-T6:] $L \/ r < 66$: $\[ 20.3 - 0.127 \( L \/ r \) \]$ ksi
$= \[ 140 - 0.874 \( L \/ r \) \]$ MPa \
$L \/ r gt.eq 66$: $frac(51 \, 400, \( L \/ r \)^2)$ ksi
$= frac(354 times 10^3, \( L \/ r \)^2)$ MPa \
#strong[2014-T6:] $L \/ r < 55$: $\[ 30.9 - 0.229 \( L \/ r \) \]$ ksi
$= \[ 213 - 1.577 \( L \/ r \) \]$ MPa \
$L \/ r gt.eq 55$: $frac(55 \, 400, \( L \/ r \)^2)$ ksi
$= frac(382 times 10^3, \( L \/ r \)^2)$ MPa

#strong[Wood (ASD):] $sigma_(a l l) = sigma_C C_p$, \
$C_p = frac(1 + \( sigma_(C E) \/ sigma_C \), 2 c) - sqrt([frac(1 + \( sigma_(C E) \/ sigma_C \), 2 c)]^2 - frac(sigma_(C E) \/ sigma_C, c))$
$sigma_(C E) = frac(0.822 E, \( L \/ d \)^2)$ \
$c = 0.8$ (sawn),~$c = 0.9$ (glued laminated wood) \
$L \/ d lt.eq 50$

#strong[Centric Load Design] \
$ gamma_D P_D + gamma_L P_L lt.eq phi.alt P_U $
$P_U = sigma_(upright("cr")) A$, $phi.alt = 0.9$ (Steel)

#strong[Eccentric Load Design] \
$ sigma = sigma_(upright("centric")) + sigma_(upright("bending")) = P / A + frac(M c, I) lt.eq sigma_(upright("all")) $
#strong[Interaction Method] \
$ frac(P \/ A, \( sigma_(upright("all")) \)_(upright("centric"))) + frac(\| M_x \| z_(upright("max")) \/ I_x, \( sigma_(upright("all")) \)_(upright("bending"))) + frac(\| M_z \| x_(upright("max")) \/ I_z, \( sigma_(upright("all")) \)_(upright("bending"))) lt.eq 1 $

]

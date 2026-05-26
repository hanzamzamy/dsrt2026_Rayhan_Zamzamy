#set text(font: "New Computer Modern", size: 10pt, lang: "id")
#set par(justify: true, first-line-indent: (all: true, amount: 1.8em))
#set heading(numbering: "1.1.")
#set math.equation(numbering: "(1)")
#set page(
  paper: "a4",
  margin: (left: 20mm, right: 20mm, top: 35mm, bottom: 20mm),
  header-ascent: 12mm,
  header: context {
    stack(
      dir: ttb,
      grid(
        columns: (1fr, 1fr),
        align(left)[#image("ITS_pojok.pdf", width: 2cm)],
        align(right)[#text(size: 10pt)[#datetime.today().display("[year]-[month]-[day]")]]
      ),
      v(0.4em),
      line(length: 100%, stroke: 0.5pt)
    )
  }
)

#show figure.where(kind: image): it => {
  set align(center)
  it.body
  set text(12pt)
  block[
    #it.caption
  ]
}

#show figure.where(kind: table): it => {
  set align(center)
  set text(12pt)
  block[
    #it.caption
  ]
  it.body
}

// Bagian Judul
#align(center)[
  #v(1em)
  #text(size: 18pt)[Laporan Desain Skematik dan Analisis \ Generator Paritas Genap 8-Bit]
  #v(1em)
]

// Tabel Metadata
#grid(
  columns: (auto, auto, 1fr),
  gutter: 1em,
  [*Penulis*], [:], [ Alvaro (5022231166) \ Rayhan Rizqi Zamzamy (5022231078) \ Zalfa Nafila Khairunnisa (5022231124)],
  [*Dosen*], [:], [ Astria Nur Irfansyah, S.T., M.Eng., Ph.D.],
  [*Nama Kelas*], [:], [ Divais Semikonduktor dan Rangkaian Terintegrasi],
  [*Link GitHub*], [:], [ #link("https://github.com/hanzamzamy/dsrt2026_Rayhan_Zamzamy/tree/main/even_parity_generator")]
)

= Pendahuluan
Laporan ini menyajikan desain skematik, simulasi, dan analisis komparatif dari sebuah generator paritas genap 8-bit yang diimplementasikan pada tingkat transistor menggunakan _Process Design Kit_ (PDK) Skywater 130nm. Proyek ini bertujuan untuk mengeksplorasi berbagai topologi gerbang logika dan struktur rangkaian untuk membangun generator paritas, serta menganalisis _trade-off_ antara kecepatan, konsumsi daya, dan jumlah transistor. 

Tiga implementasi gerbang logika utama dievaluasi: XOR 12 transistor (12T) konvensional, XOR 6 transistor (6T) berbasis _transmission gate_, dan XNOR 6 transistor (6T) dengan _buffer_. Selanjutnya, dua topologi rangkaian utama—_cascaded_ dan _balanced tree_—dianalisis untuk setiap jenis gerbang. Analisis performa dilakukan melalui simulasi SPICE untuk karakterisasi DC dan transien, serta verifikasi fungsional menggunakan Verilog untuk memastikan kebenaran logika.

= Desain Rangkaian Skematik

== Gerbang Logika Dasar
Generator paritas dibangun dengan logika kombinasional, sehingga dibutuhkan gerbang logika. Berikut adalah deskripsi dan skematik tingkat transistor dari setiap gerbang.

- *Gerbang NOT*: Gerbang NOT CMOS standar digunakan sebagai _buffer_ pada beberapa desain. Terdiri dari satu transistor PMOS di _pull-up network_ dan satu transistor NMOS di _pull-down network_.
  #figure(
    image("not_std.svg", width: 40%),
    caption: [Skematik _transistor-level_ gerbang NOT]
  )

- *Gerbang XOR 12T*: Implementasi XOR CMOS konvensional yang menggunakan 12 transistor. Desain ini menjamin _output_ _rail-to-rail_ dan karakteristik _switching_ yang baik, namun dengan area yang lebih besar.
  #figure(
    image("xor_12t.svg", width: 100%),
    caption: [Skematik _transistor-level_ gerbang XOR 12T]
  )

- *Gerbang XOR 6T*: Implementasi ini menggunakan topologi _transmission gate_ yang secara signifikan mengurangi jumlah transistor menjadi enam. Keuntungannya adalah area yang lebih kecil, namun kekurangannya adalah degradasi level tegangan pada _output_, yang dapat mengurangi _noise margin_.
  #figure(
    image("xor_6t.svg", width: 100%),
    caption: [Skematik _transistor-level_ gerbang XOR 6T]
  )

- *Gerbang XNOR 6T dengan _Buffer_*: Untuk mengatasi masalah pada XOR 6T, desain ini menggunakan gerbang XNOR yang dibangun dari XOR 6T diikuti oleh _inverter_. Desain ini mempertahankan jumlah transistor yang rendah sambil memastikan sinyal _output_ terestorasi dan _rail-to-rail_.
  #figure(
    image("xnor_6t_buf.svg", width: 45%),
    caption: [Skematik _transistor-level_ gerbang XNOR 6T]
  )

== Topologi Generator Paritas
Struktur generator paritas sangat mempengaruhi determinisme waktu propagasi. Dalam studi komparatif ini, dua topologi utama dianalisis: _cascaded_ dan _balanced tree_.

=== Topologi Berantai (_Cascaded_)
Topologi ini menyusun gerbang XOR secara berurutan. Kelemahannya adalah jalur sinyal yang tidak seragam. Sinyal dari _input_ awal (A0, A1) harus melewati lebih banyak gerbang daripada sinyal dari _input_ akhir, menyebabkan _delay_ yang bervariasi dan lebih besar secara keseluruhan. Secara matematis, fungsi paritas dapat diekspresikan sebagai berikut.
$ P = ((((((A_0 xor A_1) xor A_2) xor A_3) xor A_4) xor A_5) xor A_6) xor A_7 $
#figure(
    image("even_parity_gen_xor_6t_ub.svg", width: 100%),
    caption: [Skematik topologi _cascaded_]
)

=== Topologi Pohon Seimbang (_Balanced Tree_)
Topologi ini menyusun gerbang secara hierarkis untuk menyamakan panjang jalur sinyal. Topologi ini memastikan bahwa sinyal dari setiap _input_ melintasi jumlah gerbang yang sama, menghasilkan _delay_ yang lebih seragam dan dapat diprediksi. Secara matematis, fungsi paritas dapat diekspresikan sebagai berikut.
$ P = (((A_0 xor A_1) xor (A_2 xor A_3)) xor ((A_4 xor A_5) xor (A_6 xor A_7))) $

#figure(
    image("even_parity_gen_xor_6t.svg", width: 90%),
    caption: [Skematik topologi _balanced tree_ XOR]
)

Salah satu keuntungan lainnya dari topologi ini adalah kemampuannya untuk menggunakan gerbang XNOR sebagai pengganti XOR. Hal ini dapat dibuktikan secara metematis.

$ A xor B = overline(A)B + A overline(B) 
\ overline(A) xor overline(B) = overline(overline(A)) overline(B) + overline(A) overline(overline(B)) = A overline(B) + overline(A) B
\ therefore overline(A) xor overline(B) equiv A xor B $

#h(-1.8em)_Inverter_ hanya diperlukan pada akhir rangkaian untuk menghasilkan paritas genap. Dengan menggunakan gerbang XNOR, fungsi paritas dapat diekspresikan sebagai berikut.

$ P = overline((((A_0 dot.o A_1) dot.o (A_2 dot.o A_3)) dot.o ((A_4 dot.o A_5) dot.o (A_6 dot.o A_7)))) $

#figure(
    image("even_parity_gen_xnor_6t_buf.svg", width: 90%),
    caption: [Skematik topologi _balanced tree_ XNOR]
)

= Metodologi Simulasi

Simulasi rangkaian dilakukan dengan mengekstraksi _netlist_ dari skematik Xschem untuk divalidasi menggunakan beberapa metode.

- *Simulasi Transien (SPICE)*: Dilakukan untuk menganalisis respons dinamis rangkaian terhadap sinyal _input_ pulsa. Pengaturan simulasi menggunakan suplai tegangan $V_"DD" = 1.8 "V"$ pada kondisi temperatur nominal. Sinyal _input_ berupa pulsa periodik untuk mengukur _propagation delay_, _rise time_, _fall time_, dan konsumsi daya dinamis.
- *Simulasi DC Sweep (SPICE)*: Dilakukan untuk mendapatkan kurva VTC (_Voltage Transfer Characteristic_) dan menganalisis _noise margin_ dari setiap gerbang logika.
- *Verifikasi Fungsional (Verilog)*: Dilakukan untuk memvalidasi kebenaran logika dari generator paritas 8-bit. Sebuah _testbench_ Verilog dibuat untuk melakukan tes menyeluruh terhadap semua 256 kombinasi _input_ yang mungkin. _Testbench_ ini membandingkan _output_ dari desain (DUT) dengan hasil kalkulasi paritas referensi dan melaporkan setiap kesalahan.

= Hasil Simulasi dan Analisis

#figure(
  table(
    align: (col, row) => if col == 0 and row > 0 { left } else { center + horizon },
    columns: (auto, auto, auto, auto, auto, auto, auto),
    table.header([*_Gate_*], [*$t_(p d)$*], [*$t_r$*], [*$t_f$*], [*$P_(d y n)$*], [*$P_(s t)$*], [*PDP*]
    ),
    [NOT], [18.97 ps], [30.47 ps], [21.95 ps], [111.08 nW], [0.58 nW], [2.11 fJ],
    [XOR 6T], [9.13 ns], [9.19 ns], [19.01 ns], [73.08 nW], [0.59 nW], [667.40 fJ],
    [XOR 12T], [9.17 ns], [9.16 ns], [19.10 ns], [2.41 µW], [11.06 nW], [22.11 pJ],
    [XNOR 6T (_Buffered_)], [9.16 ns], [20.03 ps], [15.35 ps], [361.34 nW], [1.62 nW], [3.31 pJ],
  ),
  kind: table,
  caption: "Metrik performa gerbang logika",
)

#figure(
  table(
    align: (col, row) => if col == 0 and row > 0 { left } else { center + horizon },
    columns: (auto, auto, auto, auto, auto, auto, auto),
    table.header(
      [*Implementasi*], [*$t_(p d)$*], [*$t_r$*], [*$t_f$*], [*$P_(d y n)$*], [*$P_(s t)$*], [*PDP*]
    ),
    [XOR 6T (_Unbalanced_)], [14.79 ps], [8.93 ns], [5.94 ns], [12.98 µW], [6.16 nW], [0.19 pJ],
    [XOR 6T (_Balanced_)], [4.30 ns], [9.11 ns], [5.87 ns], [5.55 µW], [57.44 nW], [23.87 pJ],
    [XOR 12T (_Unbalanced_)], [75.02 ps], [8.95 ns], [5.82 ns], [51.17 µW], [195.35 nW], [3.84 pJ],
    [XOR 12T (_Balanced_)], [4.40 ns], [60.49 ps], [60.95 ps], [22.68 µW], [104.18 nW], [99.69 pJ],
    [XNOR 6T (_Balanced_)], [4.34 ns], [29.52 ps], [21.62 ps], [24.23 µW], [25.28 nW], [105.09 pJ],
  ),
  kind: table,
  caption: "Metrik performa implementasi generator paritas genap 8-bit",
)

#figure(
  table(
    align: (col, row) => if col == 0 and row > 0 { left } else { center + horizon },
    columns: (1fr, 1fr, 1fr, 1fr),
    table.header(
      [*Implementasi*], [*Sukses*], [*Gagal*], [*Keberhasilan*]
    ),
    [XOR (_Balanced_)], [256], [0], [100%],
    [XOR (_Unbalanced_)], [256], [0], [100%],
    [XNOR (_Balanced_)], [256], [0], [100%],
  ),
  kind: table,
  caption: "Hasil verifikasi fungsional digital",
)

#pagebreak()

== Plot Hasil Simulasi

=== Plot Simulasi Gerbang NOT

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto, auto),
    gutter: 8pt,
    image("../simulations/not_std/dc_vtc.svg", width: 100%),
    image("../simulations/not_std/tran_output.svg", width: 100%),
    image("../simulations/not_std/dc_gain.svg", width: 100%),
    image("../simulations/not_std/tran_inputs.svg", width: 100%),
    image("../simulations/not_std/tran_current.svg", width: 100%),
    image("../simulations/not_std/tran_leakage.svg", width: 100%),
  ),
  caption: [Hasil simulasi untuk gerbang NOT standar.]
)

#pagebreak()

=== Plot Simulasi Gerbang XOR 6T

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto, auto),
    gutter: 8pt,
    image("../simulations/xor_6t/dc_vtc.svg", width: 100%),
    image("../simulations/xor_6t/tran_output.svg", width: 100%),
    image("../simulations/xor_6t/dc_gain.svg", width: 100%),
    image("../simulations/xor_6t/tran_inputs.svg", width: 100%),
    image("../simulations/xor_6t/tran_current.svg", width: 100%),
    image("../simulations/xor_6t/tran_leakage.svg", width: 100%),
  ),
  caption: [Hasil simulasi untuk gerbang XOR 6T.]
)

#pagebreak()

=== Plot Simulasi Gerbang XOR 12T

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto, auto),
    gutter: 8pt,
    image("../simulations/xor_12t/dc_vtc.svg", width: 100%),
    image("../simulations/xor_12t/tran_output.svg", width: 100%),
    image("../simulations/xor_12t/dc_gain.svg", width: 100%),
    image("../simulations/xor_12t/tran_inputs.svg", width: 100%),
    image("../simulations/xor_12t/tran_current.svg", width: 100%),
    image("../simulations/xor_12t/tran_leakage.svg", width: 100%),
  ),
  caption: [Hasil simulasi untuk gerbang XOR 12T.]
)

#pagebreak()

=== Plot Simulasi Gerbang XNOR 6T (_Buffered_)

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto, auto),
    gutter: 8pt,
    image("../simulations/xnor_6t_buf/dc_vtc.svg", width: 100%),
    image("../simulations/xnor_6t_buf/tran_output.svg", width: 100%),
    image("../simulations/xnor_6t_buf/dc_gain.svg", width: 100%),
    image("../simulations/xnor_6t_buf/tran_inputs.svg", width: 100%),
    image("../simulations/xnor_6t_buf/tran_current.svg", width: 100%),
    image("../simulations/xnor_6t_buf/tran_leakage.svg", width: 100%),
  ),
  caption: [Hasil simulasi untuk gerbang XNOR 6T dengan _buffer_.]
)

#pagebreak()

=== Plot Simulasi Generator Paritas XOR 6T (_Cascaded_)

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto, auto),
    gutter: 8pt,
    image("../simulations/even_parity_gen_xor_6t_ub/tran_inputs_0_3.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t_ub/tran_inputs_4_7.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t_ub/tran_output.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t_ub/tran_verification.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t_ub/tran_current.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t_ub/tran_energy.svg", width: 100%),
  ),
  caption: [Hasil simulasi untuk generator paritas 8-bit menggunakan XOR 6T dengan topologi _cascaded_.]
)

#pagebreak()

=== Plot Simulasi Generator Paritas XOR 6T (_Balanced_)

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto, auto),
    gutter: 8pt,
    image("../simulations/even_parity_gen_xor_6t/tran_inputs_0_3.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t/tran_inputs_4_7.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t/tran_output.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t/tran_verification.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t/tran_current.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_6t/tran_energy.svg", width: 100%),
  ),
  caption: [Hasil simulasi untuk generator paritas 8-bit menggunakan XOR 6T dengan topologi _balanced tree_.]
)

#pagebreak()

=== Plot Simulasi Generator Paritas XOR 12T (_Cascaded_)

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto, auto),
    gutter: 8pt,
    image("../simulations/even_parity_gen_xor_12t_ub/tran_inputs_0_3.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t_ub/tran_inputs_4_7.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t_ub/tran_output.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t_ub/tran_verification.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t_ub/tran_current.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t_ub/tran_energy.svg", width: 100%),
  ),
  caption: [Hasil simulasi untuk generator paritas 8-bit menggunakan XOR 12T dengan topologi _cascaded_.]
)

#pagebreak()

=== Plot Simulasi Generator Paritas XOR 12T (_Balanced_)

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto, auto),
    gutter: 8pt,
    image("../simulations/even_parity_gen_xor_12t/tran_inputs_0_3.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t/tran_inputs_4_7.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t/tran_output.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t/tran_verification.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t/tran_current.svg", width: 100%),
    image("../simulations/even_parity_gen_xor_12t/tran_energy.svg", width: 100%),
  ),
  caption: [Hasil simulasi untuk generator paritas 8-bit menggunakan XOR 12T dengan topologi _balanced tree_.]
)

#pagebreak()

=== Plot Simulasi Generator Paritas XNOR 6T (_Balanced_)

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: (auto, auto, auto),
    gutter: 8pt,
    image("../simulations/even_parity_gen_xnor_6t_buf/tran_inputs_0_3.svg", width: 100%),
    image("../simulations/even_parity_gen_xnor_6t_buf/tran_inputs_4_7.svg", width: 100%),
    image("../simulations/even_parity_gen_xnor_6t_buf/tran_output.svg", width: 100%),
    image("../simulations/even_parity_gen_xnor_6t_buf/tran_verification.svg", width: 100%),
    image("../simulations/even_parity_gen_xnor_6t_buf/tran_current.svg", width: 100%),
    image("../simulations/even_parity_gen_xnor_6t_buf/tran_energy.svg", width: 100%),
  ),
  caption: [Hasil simulasi untuk generator paritas 8-bit menggunakan XNOR 6T dengan topologi _balanced tree_.]
)

#pagebreak()
= Kesimpulan

// This section is pending until you can read data from raw output. I'm still convert it.

// Desain generator paritas genap 8-bit telah berhasil diimplementasikan dan disimulasikan menggunakan PDK Skywater 130nm. Analisis komparatif menunjukkan bahwa:
// - Desain berbasis **XOR 12T** dalam topologi seimbang memberikan performa yang andal dengan sinyal _rail-to-rail_, namun dengan konsumsi daya dan area tertinggi.
// - Desain berbasis **XOR 6T** secara signifikan mengurangi jumlah transistor, tetapi menderita degradasi sinyal yang membuatnya tidak ideal untuk topologi yang lebih dalam tanpa _buffer_.
// - Desain berbasis **XNOR 6T** dengan topologi seimbang menawarkan kompromi terbaik, mencapai _delay_ yang sebanding dengan desain 12T namun dengan jumlah transistor yang lebih sedikit dan konsumsi daya yang kompetitif.

// Berdasarkan analisis, implementasi XNOR 6T dengan _buffer_ dan topologi seimbang direkomendasikan sebagai pilihan yang paling efisien untuk desain ini, menyeimbangkan antara kecepatan, daya, dan area.
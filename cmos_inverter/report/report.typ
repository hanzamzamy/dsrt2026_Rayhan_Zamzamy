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

// Bagian Judul
#align(center)[
  #v(1em)
  #text(size: 18pt)[Laporan Inverter CMOS Berbasis PDK Skywater 130nm] 
  #v(1em)
]

// Tabel Metadata
#grid(
  columns: (auto, 1fr),
  gutter: 1em,
  [*Penulis*], [: Rayhan Rizqi Zamzamy (5022231078)],
  [*Dosen*], [: Astria Nur Irfansyah, S.T., M.Eng., Ph.D.],
  [*Nama Kelas*], [: 	Divais Semikonduktor dan Rangkaian Terintegrasi],
  [*Link GitHub*], [: #link("https://github.com/hanzamzamy/SRO26_Assignment/tree/5")]
)
#v(1cm)

= Pendahuluan
Laporan ini membahas desain dan simulasi rangkaian gerbang logika dasar, yaitu Inverter CMOS (_Complementary Metal-Oxide-Semiconductor_), menggunakan teknologi PDK (_Process Design Kit_) Skywater 130nm. Tujuan dari tugas ini adalah untuk mengimplementasikan skematik inverter pada perangkat lunak Xschem dan menyimulasikan karakteristik operasionalnya pada simulator Ngspice, baik dalam domain waktu (_transient_) maupun karakteristik transfer tegangan (DC), menggunakan simulator Ngspice. Desain disesuaikan dengan parameter spesifik berdasarkan aturan penugasan yang merujuk pada digit terakhir NRP.

= Desain Rangkaian Skematik
Desain inverter CMOS dibangun menggunakan konfigurasi standar dua buah transistor, yaitu satu transistor PMOS (`pfet_01v8`) pada bagian _pull-up network_ dan satu transistor NMOS (`nfet_01v8`) pada bagian _pull-down network_. Sesuai dengan spesifikasi minimum teknologi Sky130, panjang kanal (Length / $L$) untuk kedua transistor diatur pada batas minimum resolusi fabrikasi, yaitu $0.15 mu "m"$.

Lebar kanal (Width / $W$) ditentukan berdasarkan digit terakhir NRP (8). Lebar untuk transistor NMOS ditetapkan sebesar $W_n = 8 mu "m"$. Untuk menjaga keseimbangan performa kecepatan transisi logika (kompensasi mobilitas _hole_ yang lebih rendah dari elektron), lebar transistor PMOS didesain sebesar tiga kali lipat dari lebar NMOS, sehingga $W_p = 24 mu "m"$. Tegangan suplai ($V_"DD"$) operasional yang digunakan adalah $1.8 "V"$.

= Hasil Simulasi dan Analisis
Simulasi rangkaian dilakukan melalui pengekstraksian _netlist_ SPICE dari skematik Xschem untuk kemudian dieksekusi oleh mesin kalkulasi Ngspice. Parameter simulasi yang diujikan mencakup respons dinamis (Transient) dan respons statis DC (_DC Sweep_).

#pagebreak()

== Analisis Transient
Simulasi transient bertujuan mengamati respons tegangan keluaran (_output_) terhadap perubahan tegangan masukan (_input_) seiring berjalannya waktu. Sinyal eksitasi masukan ($V_"in"$) berupa pulsa kotak periodik yang berayun dari $0 "V"$ hingga $1.8 "V"$.

#figure(
  image("grafik_transient.svg", width: 80%),
  caption: [Kurva simulasi transient tegangan input vs output terhadap waktu.],
)

Berdasarkan _plot_ pada Gambar 1, rangkaian terbukti berfungsi secara ideal sebagai gerbang NOT. Ketika sinyal $V_"in"$ (garis merah) berada pada level logika TINGGI ($1.8 "V"$), transistor NMOS aktif dan menarik tegangan keluaran $V_"out"$ (garis biru) menuju level logika RENDAH ($0 "V"$). Sebaliknya, saat $V_"in"$ turun ke $0 "V"$, transistor PMOS aktif mengalirkan arus dari suplai, menarik $V_"out"$ kembali ke $1.8 "V"$. Terdapat sedikit distorsi berupa lonjakan tegangan (_spike/overshoot_) sesaat pada titik transisi sinyal. Hal ini merupakan fenomena alami akibat adanya kapasitansi parasitik (_coupling capacitance_) antara terminal _Gate_ dan _Drain_ yang melekat pada model fisik transistor silikon.

#pagebreak()

== Analisis Karakteristik DC (Voltage Transfer Curve)
Simulasi DC Sweep dilakukan dengan memvariasikan tegangan input $V_"in"$ secara linear perlahan dari $0 "V"$ hingga $1.8 "V"$. Pengujian ini menghasilkan kurva _Voltage Transfer Characteristic_ (VTC) yang merepresentasikan batas toleransi tegangan logika dari inverter.

#figure(
  image("grafik_dc.svg", width: 80%),
  caption: [Karakteristik transfer tegangan DC (VTC) Inverter CMOS.],
)

Berdasarkan _plot_ VTC pada Gambar 2, terlihat profil transisi logika yang mulus dan tegas. Pada fase awal (tegangan $V_"in"$ di bawah ambang transisi), logika output bertahan stabil di level $1.8 "V"$. Transisi penurunan drastis (_switching_) terjadi pada area sekitar $1.2 "V"$. Profil transisi yang sedikit tergeser ke kanan ini selaras dengan rasio _sizing_ yang digunakan ($W_p / W_n = 3$), di mana tarikan PMOS dibuat sangat kuat, mendominasi konduktivitas jaringan saat fase pergantian logika. Rentang transisi ini memastikan margin derau (_noise margin_) yang memadai untuk sirkuit digital standar.

= Kesimpulan
Desain Inverter CMOS berbasis PDK Skywater 130nm telah berhasil digambar dan disimulasikan sesuai dengan parameter fisik W/L yang ditugaskan. Hasil pengujian menunjukkan bahwa desain mampu membalikkan status logika (inversi) dengan respons transient yang akurat, dengan karakteristik peralihan transfer tegangan (VTC) yang stabil pada _domain_ tegangan $1.8 "V"$.

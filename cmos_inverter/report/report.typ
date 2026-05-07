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
  [*Link GitHub*], [: #link("https://github.com/hanzamzamy/dsrt2026_Rayhan_Zamzamy/tree/main/cmos_inverter")]
)
#v(1cm)

= Pendahuluan
Laporan ini membahas desain dan simulasi rangkaian gerbang logika dasar, yaitu _inverter_ CMOS (_Complementary Metal-Oxide-Semiconductor_), menggunakan teknologi PDK (_Process Design Kit_) Skywater 130nm. Tujuan dari tugas ini adalah untuk mengimplementasikan skematik _inverter_ pada perangkat lunak Xschem dan menyimulasikan karakteristik operasionalnya pada simulator Ngspice, baik dalam domain waktu (_transient_) maupun karakteristik transfer tegangan (DC), menggunakan simulator Ngspice. Desain disesuaikan dengan parameter spesifik berdasarkan aturan penugasan yang merujuk pada digit terakhir NRP.

= Desain Rangkaian Skematik
Desain gerbang logika _inverter_ pada tugas ini mengimplementasikan arsitektur CMOS (_Complementary Metal-Oxide-Semiconductor_) standar yang terdiri dari dua buah transistor berlawanan tipe. Rangkaian ini dibangun dengan meletakkan satu transistor PMOS (`pfet_01v8`) pada bagian _pull-up network_ (PUN) yang terhubung ke sumber tegangan suplai ($V_"DD"$), dan satu transistor NMOS (`nfet_01v8`) pada bagian _pull-down network_ (PDN) yang terhubung ke _ground_ (GND). Konfigurasi komplementer ini memastikan bahwa dalam keadaan _steady state_, hanya ada satu jaringan yang aktif, sehingga meminimalisasi disipasi daya statis dan terhindar dari kondisi _short-circuit_. Tegangan suplai operasional ($V_"DD"$) yang digunakan pada rancangan ini adalah 1.8 V, yang merupakan tegangan nominal standar untuk divais logika dasar pada _Process Design Kit_ (PDK) Skywater 130nm.

Penentuan dimensi fisik tiap transistor merupakan parameter paling krusial dalam menentukan performa rangkaian terintegrasi. Sesuai dengan spesifikasi _design rules_ pada teknologi Sky130, panjang _channel_ (_Length_ / $L$) untuk kedua transistor diatur pada batas resolusi fabrikasi minimum yang diizinkan, yaitu $0.15 mu"m"$. Penggunaan panjang _channel_ minimum ini bertujuan untuk mereduksi kapasitansi parasitik internal, menurunkan resistansi saluran, dan memaksimalkan kecepatan peralihan status logika (_switching speed_). Di sisi lain, parameter lebar _channel_ (_Width_ / $W$) didesain secara spesifik berdasarkan kombinasi aturan penugasan dan prinsip fisika semikonduktor. Lebar transistor NMOS ditetapkan mengikuti digit terakhir Nomor Registrasi Pokok (NRP), yaitu $W_n = 8 mu"m"$. Berbeda dengan NMOS, lebar _channel_ transistor PMOS tidak dibuat identik, melainkan didesain tiga kali lipat lebih besar menjadi $W_p = 24 mu"m"$. 

Rasio asimetris $W_p / W_n = 3$ ini diimplementasikan untuk menjaga keseimbangan karakteristik dinamis rangkaian. Dalam struktur silikon kristalin, elektron---pembawa muatan mayoritas pada NMOS---memiliki tingkat mobilitas ($mu_n$) sekitar dua hingga tiga kali lebih tinggi dibandingkan dengan _hole_---pembawa muatan mayoritas pada PMOS, $mu_p$. Apabila PMOS dan NMOS dibuat dengan dimensi yang persis sama, resistansi konduksi pada PUN akan jauh lebih besar daripada PDN, yang mengakibatkan pelebaran waktu transisi naik (_rise time_) dibandingkan dengan waktu transisi turun (_fall time_). 

Dengan memperbesar area penampang PMOS sebesar tiga kali lipat, konduktivitas saluran PMOS dikompensasi agar setara dengan kemampuan NMOS. Kesetaraan tarikan arus ini menghasilkan kurva peralihan yang simetris, di mana titik tegangan ambang logika (_switching threshold_ / $V_M$) akan terpusat ideal di kisaran separuh dari tegangan suplai ($V_"DD" / 2$). Kondisi simetris ini sangat vital untuk mengoptimalkan _noise margin_ gerbang logika digital terhadap fluktuasi sinyal.

= Hasil Simulasi dan Analisis
Simulasi rangkaian dilakukan melalui pengekstraksian _netlist_ SPICE dari skematik Xschem untuk kemudian dieksekusi oleh simulator Ngspice. Parameter simulasi yang diujikan mencakup respons dinamis (_Transient_) dan respons statis DC (_DC Sweep_).

== Analisis Transien
Simulasi transien bertujuan mengamati respons tegangan keluaran (_output_) terhadap perubahan tegangan masukan (_input_) seiring berjalannya waktu. Sinyal eksitasi masukan ($V_"in"$) berupa pulsa kotak periodik yang berayun dari $0 "V"$ hingga $1.8 "V"$.

#figure(
  image("grafik_transient.svg", width: 80%),
  caption: [Kurva simulasi transient tegangan _input_ dan _output_ terhadap waktu.],
) <transient>

#h(-1.8em)Berdasarkan _plot_ pada @transient, rangkaian terbukti berfungsi secara ideal sebagai gerbang NOT (_inverter_). Dinamika pergantian logika ini sangat bergantung pada tegangan _Gate-to-Source_ ($V_"GS"$) dari masing-masing transistor. Ketika sinyal masukan $V_"in"$ (garis merah) didorong menuju level logika `HIGH` ($1.8 "V"$), tegangan $V_"GS"$ pada transistor NMOS melampaui tegangan ambangnya ($V_"TH,n"$). Hal ini menyebabkan NMOS memasuki mode konduktif dan secara aktif menarik (_pull-down_) tegangan keluaran $V_"out"$ (garis biru) menuju level logika `LOW` ($0 "V"$). Pada saat yang bersamaan, nilai $|V_"GS"|$ pada transistor PMOS berada di bawah tegangan ambangnya, sehingga PMOS memasuki mode _cut-off_ dan mengisolasi _node_ keluaran dari suplai $V_"DD"$. 

Sebaliknya, saat transisi $V_"in"$ turun drastis menuju $0 "V"$, transistor NMOS akan _cut-off_, sementara $|V_"GS"|$ pada PMOS menjadi cukup besar untuk melampaui $|V_"TH,p"|$. PMOS yang kini aktif akan berfungsi sebagai sakelar tertutup, mengalirkan arus dari suplai utama untuk mengisi muatan (_charging_) pada kapasitansi parasitik dan beban di _node_ keluaran, sehingga menarik tegangan $V_"out"$ kembali naik secara eksponensial ke level $1.8 "V"$. Berkat implementasi _sizing_ asimetris $W_p / W_n = 3$ yang telah dibahas sebelumnya, kemampuan PMOS dalam mengisi muatan (_rise time_) dan kemampuan NMOS dalam membuang muatan (_fall time_) menjadi setara, sehingga waktu tunda propagasi (_propagation delay_) menjadi simetris dan ideal.

Lebih lanjut, pada pengamatan mikroskopis di setiap titik balik tegangan (_switching point_), terlihat adanya sedikit distorsi berupa lonjakan tegangan sesaat (_spike_ berupa _overshoot_ maupun _undershoot_). Hal ini bukanlah sebuah galat simulasi, melainkan cerminan dari akurasi model fisik transistor PDK Skywater 130nm. Fenomena ini merupakan representasi dari efek _feedthrough_ sinyal yang disebabkan oleh kapasitansi parasitik internal (_coupling capacitance_), khususnya kapasitansi _Gate-to-Drain_ ($C_"GD"$). Ketika sinyal masukan berubah dengan laju hambatan (_slew rate_) yang sangat tajam, sinyal tersebut secara kapasitif "menembus" langsung ke saluran keluaran akibat Efek Miller. Hal ini terjadi tepat sesaat sebelum kanal inversi di bawah _gate_ terbentuk atau terputus secara sempurna untuk mengambil alih level tegangan, yang menghasilkan distorsi transien berdurasi sangat singkat (dalam orde pikosekon).

== Analisis Karakteristik DC (Voltage Transfer Curve)
Simulasi DC Sweep dilakukan dengan memvariasikan tegangan input $V_"in"$ secara linear perlahan dari $0 "V"$ hingga $1.8 "V"$. Pengujian ini menghasilkan kurva _Voltage Transfer Characteristic_ (VTC) yang merepresentasikan batas toleransi tegangan logika dari _inverter_.

#figure(
  image("grafik_dc.svg", width: 80%),
  caption: [Karakteristik transfer tegangan DC (VTC).],
) <dc>

Berdasarkan _plot_ VTC pada @dc, terlihat profil transisi logika yang mulus dan tegas. Karakteristik ini dapat dianalisis melalui lima wilayah operasi transistor yang bergantung pada besarnya tegangan masukan $V_"in"$. Pada fase awal, saat $V_"in"$ berada di bawah tegangan ambang NMOS ($V_"in" < V_"th,n"$), NMOS berada dalam kondisi _cut-off_ sementara PMOS berada dalam wilayah linear, sehingga tegangan keluaran bertahan stabil pada level ideal $V_"DD" = 1.8 "V"$.

Titik krusial dalam analisis ini adalah _Switching Threshold_ ($V_M$), yaitu kondisi di mana $V_"in" = V_"out"$. Pada titik ini, kedua transistor berada dalam wilayah saturasi. Secara teoritis, nilai $V_M$ diturunkan dari penyetaraan arus _drain_ ($I_"Dn" = |I_"Dp"|$) menggunakan model arus kuadratik:

$ 1/2 k_n (V_M - V_"th,n")^2 = 1/2 k_p (V_"DD" - V_M - |V_"th,p"|)^2 $ <eq:current_match>

#h(-1.8em)Dimana $k = mu C_"ox" (W/L)$ adalah parameter transkonduktansi proses. Dengan menyederhanakan @eq:current_match, kita mendapatkan persamaan untuk ambang pensakelaran:

$ V_M = (V_"th,n" + r(V_"DD" - |V_"th,p"|)) / (1 + r) , r = sqrt(k_p / k_n) = sqrt((mu_p W_p) / (mu_n W_n)) $ <eq:vm_theory>

Pada desain ini, transisi penurunan drastis (_switching_) terjadi pada area sekitar $1.2 "V"$. Profil transisi yang sedikit tergeser ke kanan (lebih besar dari $V_"DD"/2 = 0.9 "V"$) ini selaras dengan rasio _sizing_ yang digunakan ($W_p / W_n = 3$). Berdasarkan @eq:vm_theory, peningkatan rasio lebar PMOS ($W_p$) meningkatkan nilai $r$, yang secara matematis menarik nilai $V_M$ mendekati $V_"DD"$. Hal ini dilakukan secara sengaja untuk mengompensasi mobilitas _hole_ ($mu_p$) yang lebih rendah, sehingga kekuatan tarik PUN dan PDN menjadi seimbang dan menghasilkan kurva transisi yang curam.

Rentang transisi yang tegas ini sangat penting karena menentukan kualitas _Noise Margin_. _Noise Margin High_ ($"NM"_"H"$) dan _Noise Margin Low_ ($"NM"_"L"$) didefinisikan sebagai:

$ "NM"_"L" = V_"IL" - V_"OL" $
$ "NM"_"H" = V_"OH" - V_"IH" $

#h(-1.8em)Dimana $V_"IL"$ dan $V_"IH"$ adalah titik-titik pada kurva di mana degradasi penguatan ($(dif V_"out") / (dif V_"in")$) bernilai $-1$. Dengan kemiringan (_gain_) yang sangat tinggi pada wilayah transisi di @dc, _inverter_ ini memiliki _noise margin_ yang lebar, yang berarti rangkaian memiliki kekebalan yang sangat baik terhadap gangguan fluktuasi tegangan pada sinyal digital masukan.

= Kesimpulan
Desain _inverter_ CMOS berbasis PDK Skywater 130nm telah berhasil digambar dan disimulasikan sesuai dengan parameter fisik W/L yang ditugaskan. Hasil pengujian menunjukkan bahwa desain mampu membalikkan status logika dengan respons transient yang akurat, dengan karakteristik peralihan transfer tegangan (VTC) yang stabil pada _domain_ tegangan $1.8 "V"$.

# Shopious Mobile
Nama :Muhammad Luthfi Febriyan

NPM : 2306245913

Kelas : PBP B

<details>
    <summary>Tugas 7</summary>

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget.

#### StatelessWidget vs StatefulWidget

Flutter memiliki dua jenis widget utama: `StatelessWidget` dan `StatefulWidget`, yang berbeda dalam cara mereka menangani perubahan data atau keadaan aplikasi.

| **StatelessWidget**                        | **StatefulWidget**                                |
|--------------------------------------------|---------------------------------------------------|
| Tidak memiliki state yang dapat diubah.    | Memiliki state yang dapat diubah.                 |
| Konten tidak berubah setelah dibuat.       | Konten dapat berubah sebagai respons terhadap interaksi atau data baru. |
| Digunakan untuk elemen statis.             | Digunakan untuk elemen dinamis.                   |
| Lebih ringan dan tidak perlu dikelola ulang. | Membutuhkan lebih banyak memori dan sering diperbarui. |

- Gunakan `StatelessWidget` untuk konten yang **tidak berubah**.
- Gunakan `StatefulWidget` untuk konten yang **berubah** atau memerlukan pembaruan berdasarkan interaksi atau data baru.

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

#### Widget yang Digunakan dan Fungsinya

1. **Scaffold** - Menyediakan struktur dasar halaman, termasuk `AppBar` dan `body`. Digunakan sebagai kerangka halaman utama.
2. **AppBar** - Menampilkan bagian atas halaman yang berisi judul aplikasi "Shopious". 
3. **Padding** - Menambahkan jarak atau ruang di sekitar elemen dalam halaman.
4. **Column** - Menyusun widget secara vertikal, digunakan untuk menampilkan `InfoCard` dan `GridView`.
5. **Row** - Menyusun widget secara horizontal, digunakan untuk menampilkan tiga `InfoCard`.
6. **InfoCard** - Widget khusus yang menampilkan informasi dalam bentuk kartu, seperti `NPM`, `Name`, dan `Class`.
7. **SizedBox** - Memberikan jarak vertikal antara elemen.
8. **Center** - Menyusun widget di tengah layar, digunakan untuk teks sambutan dan `GridView`.
9. **Text** - Menampilkan teks pada layar.
10. **GridView.count** - Menampilkan item dalam bentuk grid dengan jumlah kolom tetap.
11. **ItemCard** - Widget khusus yang menampilkan ikon dan nama item dalam bentuk kartu.
12. **Card** - Menyediakan tampilan kartu dengan bayangan.
13. **Material** - Menyediakan properti visual untuk `InkWell`.
14. **InkWell** - Memberikan efek klik pada widget dan menampilkan `SnackBar`.
15. **Icon** - Menampilkan ikon sesuai nama item pada `ItemCard`.
16. **SnackBar** - Menampilkan pesan singkat di bagian bawah layar.

### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Fungsi `setState()` digunakan untuk memperbarui UI ketika ada perubahan data pada `StatefulWidget`. Variabel yang terdampak adalah semua variabel dalam kelas `State` yang nilainya diubah di dalam blok `setState()`.

### 4. Jelaskan perbedaan antara const dengan final.

- `const`: Nilai tetap dan ditentukan saat **kompilasi**.
- `final`: Nilai tetap setelah inisialisasi, ditentukan saat **runtime**.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

#### Implementasi Checklist

1. **Membuat Proyek Flutter**
   - Membuat proyek Flutter baru dengan command:
     ```bash
     flutter create shopious_mobile
     ```

2. **Struktur File**
   - Membuat file `menu.dart` di direktori `shopious_mobile/lib` agar struktur proyek lebih rapi.

3. **Modifikasi `main.dart`**
   - Menghapus class `_MyHomePageState` karena `MyHomePage` dirancang sebagai `StatelessWidget`.
   - Mengubah parent class dari `MyHomePage` dari `StatefulWidget` menjadi `StatelessWidget`.

4. **Membuat Tiga Tombol Sederhana**
   - Menambahkan tiga tombol dengan ikon dan teks: "Lihat Daftar Produk," "Tambah Produk," dan "Logout."
   - Menggunakan `ItemHomepage` dan `ItemCard` untuk menampilkan ikon dan teks dalam bentuk kartu:

   ```dart
   final List<ItemHomepage> items = [
     ItemHomepage("Lihat Daftar Produk", Icons.production_quantity_limits_sharp),
     ItemHomepage("Tambah Produk", Icons.add),
     ItemHomepage("Logout", Icons.logout),
   ];
    ```

5. **Mengimplementasikan Warna Berbeda untuk Setiap Tombol**
- Menerapkan warna berbeda untuk setiap tombol di dalam widget ItemCard dengan menggunakan kondisi if pada backgroundColor untuk setiap item:
    ```dart
    class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  
  const ItemCard(this.item, {super.key});
  
  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    if (item.name == "Lihat Daftar Produk") {
      backgroundColor = Colors.blueGrey;
    } else if (item.name == "Tambah Produk") {
      backgroundColor = Colors.teal;
    } else if (item.name == "Logout") {
      backgroundColor = Colors.red.shade900;
    } else {
      backgroundColor = Theme.of(context).colorScheme.secondary;
    }

    return Material(
      color: backgroundColor,
        .....
    )
    ```
6. **Memunculkan Snackbar dengan Pesan yang Sesuai untuk Setiap Tombol**
   - Menambahkan aksi `onTap` pada setiap `ItemCard` menggunakan widget `InkWell`.
   - Setiap kali tombol ditekan, `ScaffoldMessenger` menampilkan `SnackBar` dengan pesan yang sesuai:
     - Untuk tombol "Lihat Daftar Produk", menampilkan pesan **"Kamu telah menekan tombol Lihat Daftar Produk"**.
     - Untuk tombol "Tambah Produk", menampilkan pesan **"Kamu telah menekan tombol Tambah Produk"**.
     - Untuk tombol "Logout", menampilkan pesan **"Kamu telah menekan tombol Logout"**.

   ```dart
   InkWell(
     onTap: () {
       ScaffoldMessenger.of(context)
         ..hideCurrentSnackBar()
         ..showSnackBar(
           SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
         );
     },
     child: Container(
       padding: const EdgeInsets.all(8),
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(
               item.icon,
               color: Colors.white,
               size: 30.0,
             ),
             const Padding(padding: EdgeInsets.all(3)),
             Text(
               item.name,
               textAlign: TextAlign.center,
               style: const TextStyle(color: Colors.white),
             ),
           ],
         ),
       ),
     ),
   );
    ```
</details>

<details>
  <summary>Tugas 8</summary>

  #### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
  Di Flutter, const digunakan untuk membuat objek yang bersifat immutable dan diproses pada waktu kompilasi (compile-time constant). Menggunakan const memungkinkan Flutter untuk menghindari pembuatan ulang objek yang sama berulang kali saat rebuild, sehingga meningkatkan efisiensi aplikasi. Misalnya, jika sebuah widget atau nilai dideklarasikan dengan const, Flutter akan menyimpannya sebagai satu objek tunggal dalam memori, dan referensi yang sama akan digunakan setiap kali diperlukan, yang menghemat sumber daya.

  Kapan Menggunakan const Sebaiknya gunakan const pada widget atau nilai yang tidak berubah sepanjang waktu, seperti teks statis atau ikon yang tetap. Ini sangat berguna dalam mengoptimalkan performa aplikasi, terutama saat bekerja dengan widget yang sering di-rebuild.

  Kapan Tidak Menggunakan const Hindari penggunaan const jika nilai atau tampilan suatu widget bergantung pada data dinamis yang bisa berubah saat aplikasi berjalan, karena const tidak dapat digunakan untuk elemen yang berubah di runtime.

  #### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
  1. Column : Menyusun anaknya secara vertikal
  ```
  Column(
    children: [
      Image.network(
        _image,
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Text('Gagal memuat gambar');
        },
      ),
      Text('Name: $_name'),
      Text('Price: $_price'),
      Text('Ready: $_ready'),
      Text('Description: $_description'),
    ],
  ),
  ```
  2. Row : Menyusun anaknya secara horizontal
  ```
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      InfoCard(title: 'NPM', content: npm),
      InfoCard(title: 'Name', content: name),
      InfoCard(title: 'Class', content: className),
    ],
  ),
  ```
  #### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

  1. `TextFormField`:
  Digunakan untuk beberapa input teks:
  URL Image: Input untuk URL gambar dari menu.
  Name: Input untuk nama menu.
  Price: Input untuk harga menu.
  Description: Input untuk deskripsi menu.
  Masing-masing TextFormField memiliki properti validator untuk memvalidasi data.


  2. `ElevatedButton`:
  Digunakan untuk tombol "Save" yang memunculkan dialog konfirmasi ketika form valid.

  Elemen Input Lain yang Tidak Digunakan:

  1. `DropdownButtonFormField`: Widget ini dapat digunakan untuk membuat dropdown pilihan.

  2. `Checkbox` atau Switch: Berguna untuk input tipe boolean atau status aktif/tidak aktif.

  3. `Slider`: Berguna untuk input angka dalam rentang tertentu, seperti memilih harga dalam rentang yang sudah ditentukan.

  4. `DatePicker` dan `TimePicker`: Untuk input tanggal atau waktu.



  #### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
   Menggunakan `ThemeData` pada sebuah `MaterialApp` untuk mendapatkan warna yang konsistent di keseluruhan aplikasi.

  #### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
  Navigasi dalam aplikasi ini diatur menggunakan widget Navigator. Berikut pendekatan yang digunakan:

  - Navigator.push(): Menambahkan halaman baru ke dalam stack navigasi.
  - Navigator.pop(): Kembali ke halaman sebelumnya.
  - Navigator.pushReplacement(): Mengganti halaman saat ini tanpa menambahkannya ke stack.

  Selain itu, ditambahkan drawer untuk mempermudah pengguna berpindah antar halaman, seperti dari halaman utama ke halaman form.
</details>
<details>
<summary>Tugas 9</summary>

#### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

Membuat model untuk pengambilan dan pengiriman data JSON sangat penting karena model berfungsi sebagai struktur atau blueprint yang mendefinisikan bagaimana data JSON dipetakan ke dalam objek di aplikasi. Dengan model, data JSON yang diterima dari API dapat diubah menjadi objek Dart yang mudah digunakan, dan data yang dikirim ke API dapat dipastikan sesuai dengan format yang diperlukan. Selain itu, model membantu validasi data dan memudahkan debugging karena struktur data yang digunakan menjadi lebih jelas.

Jika kita tidak membuat model, kita tetap bisa menggunakan data JSON secara langsung dengan struktur map atau list. Namun, ini dapat membuat kode sulit dipahami dan dikelola. Tanpa model, tidak ada jaminan bahwa data yang diterima atau dikirim sesuai dengan struktur yang diharapkan, sehingga berisiko terjadi error runtime yang sulit dilacak. Model memberikan tipe data yang jelas, membantu mengurangi kesalahan, dan meningkatkan keandalan aplikasi.

#### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Dalam tugas ini, library http berguna untuk:

- Fungsi GET digunakan untuk mengirim permintaan HTTP GET ke server dan menerima respons JSON.
- Fungsi POST digunakan untuk mengirim data dari aplikasi Flutter ke server melalui body request.
- http menyediakan mekanisme untuk menangani status kode respons (200, 404, dll.) dan parsing data dari respons server.

Dengan library http, aplikasi dapat mengirim data JSON ke server dan menerima respons JSON. Hal ini digunakan untuk fitur seperti login, register, pengambilan data, atau menambahkan data baru. Library ini menyederhanakan proses pengelolaan permintaan dan respons HTTP, sehingga pengembangan aplikasi menjadi lebih efisien.

#### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest menyimpan cookie yang diterima dari server setelah login, yang digunakan untuk autentikasi di permintaan selanjutnya. Cookie membantu menjaga sesi pengguna tetap aktif tanpa harus login ulang. CookieRequest memungkinkan pengiriman permintaan HTTP GET dan POST dengan menyertakan cookie secara otomatis. Dengan cookie, server dapat mengenali pengguna yang sedang terautentikasi.

#### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. **Input dari Pengguna:** Pengguna mengisi form di aplikasi Flutter, seperti menambahkan menu baru. Data ini divalidasi sebelum dikirim.
2. **Pengiriman Data ke Server:** Data yang sudah divalidasi dikirim ke server Django menggunakan permintaan HTTP POST dalam format JSON.
3. **Pemrosesan di Server:** Server menerima data, memvalidasinya, menyimpannya ke database, dan mengirim respons dalam format JSON.
4. **Menampilkan Data di Flutter:** Aplikasi menerima respons dari server, memprosesnya, dan menampilkan data di UI, seperti memperbarui daftar menu.

Dengan alur ini, data dapat dikirim dari input pengguna, diproses di server, dan ditampilkan kembali di aplikasi secara terintegrasi.

#### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.


- **Register:**

Pengguna mengisi form register di Flutter.
Data akun dikirim ke server menggunakan permintaan POST.
Server memproses data, menyimpannya ke database, dan mengirimkan respons.
Flutter menampilkan pesan keberhasilan atau kegagalan, dan pengguna diarahkan ke halaman login jika sukses.


- **Login:**

Pengguna memasukkan kredensial login.
Data dikirim ke server dengan POST.
Server memverifikasi kredensial dan mengirimkan cookie sesi jika valid.
Flutter menyimpan cookie sesi, dan pengguna diarahkan ke halaman utama.


- **Logout:**

Pengguna menekan tombol logout.
Aplikasi mengirim permintaan logout ke server.
Server menghapus sesi pengguna, dan Flutter menghapus cookie lokal.
Mekanisme ini memastikan autentikasi yang aman dan pengalaman pengguna yang konsisten.

#### Implementasi Checklist
1. Saya install PIP yang sudah disediakan oleh kakak Asdos dan mengikuti persiapan yang diarahkan di tutorial seperti mengubah beberapa hal di main.dart
2. Saya membuat sebuah file baru bernama `register.dart` di direktori `shopious_mobile/lib/screens` untuk halaman registrasi akun.
3. Saya mengintegrasikan sistem autentikasi Django dengan proyek Flutter menggunakan package `pbp_django_auth` dan `provider`.
4. Saya membuat halaman login pada proyek tugas Flutter di file `login.dart` di direktori `shopious_mobile/lib/screens`.
5. Saya membuat model kustom sesuai dengan proyek aplikasi Django di file `add_item.dart` di direktori `shopious_mobile/lib/models`.
6. Model itu didapatkan menggunakan quicktype dengan menggunakan json
7. Saya membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah saya deploy di file `list_additem.dart` di direktori `shopious_mobile/lib/screens`.
7. Saya membuat halaman detail untuk setiap item yang terdapat pada halaman daftar item di file `product_detail.dart` di direktori `shopious_mobile/lib/screens`.
8. Saya melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login di file `list_additem.dart`.
</details>
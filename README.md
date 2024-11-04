# Shopious Mobile
Nama :Muhammad Luthfi Febriyan
NPM : 2306245913
Kelas : PBP B

<details>
    <summary>Tugas 7</summary>

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget.

#### StatelessWidget vs StatefulWidget

Flutter memiliki dua jenis widget utama: `StatelessWidget` dan `StatefulWidget`, yang berbeda dalam cara mereka menangani perubahan data atau keadaan aplikasi.

#### StatelessWidget
- `StatelessWidget` adalah widget yang **tidak memiliki state** atau **keadaan yang dapat berubah** setelah widget tersebut dibuat.
- Tampilan atau konten `StatelessWidget` akan selalu tetap sama dan tidak akan mengalami perubahan dinamis dari waktu ke waktu.
- Semua data yang ditampilkan oleh `StatelessWidget` harus diterima melalui konstruktor dan tidak dapat diubah setelah widget dibuat.

#### StatefulWidget
- `StatefulWidget` adalah widget yang memiliki **state** atau **keadaan yang dapat berubah seiring waktu**. Biasanya, perubahan ini terjadi sebagai respons terhadap interaksi pengguna atau perubahan data.
- `StatefulWidget` terdiri dari dua bagian:
  - **StatefulWidget**: Kerangka atau definisi dari widget itu sendiri.
  - **State**: Bagian yang menyimpan data atau keadaan widget yang dapat berubah.
- Setiap kali `State` diubah, widget akan membangun ulang tampilannya sesuai dengan keadaan terbaru.

#### Perbedaan Utama antara StatelessWidget dan StatefulWidget

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
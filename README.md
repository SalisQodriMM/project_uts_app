# SAKTI (Saku TI)
Aplikasi "Saku" Mahasiswa Teknik Informatika

SAKTI (Saku TI) adalah aplikasi mobile berbasis Flutter yang dirancang sebagai pusat akademik terpadu (*academic hub*) untuk mahasiswa Teknik Informatika.

---

## 📝 Deskripsi dan Tujuan

Tujuan utama aplikasi ini adalah untuk mengatasi masalah informasi akademik yang sering tersebar di berbagai platform (LMS, catatan, kalender). SAKTI berupaya menyatukan semua kebutuhan esensial mahasiswa—mulai dari materi kuliah, catatan pribadi, progres proyek, hingga jadwal tes—ke dalam satu aplikasi yang ringkas, modern, dan mudah diakses kapan saja.

Aplikasi ini dibangun sebagai proyek untuk demonstrasi implementasi UI/UX dari Figma ke Flutter, serta penerapan navigasi *mobile* yang efektif.

---

## 📱 Halaman dan Fungsionalitas

Aplikasi ini terdiri dari beberapa halaman utama dengan fungsi spesifik:

* **Halaman Login:**
    * Berfungsi sebagai gerbang otentikasi pengguna.
    * Menggunakan data *dummy* statis untuk *login* (Username: `admin`, Password: `1234`).

* **Halaman Utama (Home):**
    * Bertindak sebagai *dashboard* utama setelah *login* berhasil.
    * Menampilkan sapaan kepada pengguna dan navigasi visual berbasis kartu (Materi, Proyek, Jurnal) yang dapat ditekan untuk berpindah *tab*.

* **Halaman Materi:**
    * Menampilkan daftar materi kuliah yang dikelompokkan per semester.
    * Menggunakan `ListView` untuk menyajikan data.

* **Halaman Tes:**
    * Serupa dengan halaman Materi, halaman ini menampilkan daftar modul tes atau ujian yang tersedia per semester.

* **Halaman Proyek:**
    * Berfungsi sebagai repositori untuk melihat daftar proyek yang telah di-*submit* oleh mahasiswa.
    * Dilengkapi tombol "Add Projects" (saat ini belum fungsional).

* **Halaman Jurnal:**
    * Fitur catatan digital yang menampilkan folder-folder jurnal per semester dalam format `GridView`.
    * Dilengkapi dengan *search bar* di bagian atas.

* **Halaman Settings:**
    * Berisi informasi profil pengguna.
    * Menyediakan opsi pengaturan seperti "Dark Theme" (UI *switch* fungsional, logika tema belum diimplementasi) dan tombol "Log Out" yang fungsional untuk kembali ke halaman *login*.

---

## 🚀 Cara Menjalankan Aplikasi

Pastikan Anda telah menginstal **Flutter SDK** (versi 3.x atau lebih baru) dan **Android Studio/VS Code** di komputer Anda.

1.  **Clone Repositori**
    ```bash
    git clone [URL_REPOSITORI_ANDA_DI_SINI]
    ```

2.  **Masuk ke Direktori Proyek**
    ```bash
    cd nama-folder-proyek
    ```

3.  **Instal Dependencies**
    Jalankan perintah berikut untuk mengunduh semua *package* yang dibutuhkan:
    ```bash
    flutter pub get
    ```
    *Catatan: Proyek ini mungkin memerlukan `shared_preferences` jika Anda mengaktifkan fitur "Remember Me".*

4.  **Siapkan Aset**
    * Pastikan Anda memiliki folder `assets/` di *root* proyek.
    * Di dalamnya, buat folder `assets/images/` dan `assets/fonts/`.
    * Masukkan semua gambar (seperti `logo.png`, `welcome_illustration.png`) ke `assets/images/`.
    * Pastikan file `pubspec.yaml` Anda sudah mendaftarkan aset-aset ini:
        ```yaml
        flutter:
          assets:
            - assets/images/
          fonts:
            - family: Poppins
              fonts:
                - asset: assets/fonts/Poppins-Regular.ttf
                # ... (dan style font lainnya)
        ```

5.  **Jalankan Aplikasi**
    Pastikan *emulator* Anda sedang berjalan atau perangkat *mobile* fisik telah terhubung.
    ```bash
    flutter run
    ```
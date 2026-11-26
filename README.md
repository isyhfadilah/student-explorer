# Student Explorer

Aplikasi Flutter demo untuk komunitas kampus. Profil mahasiswa disediakan
sebagai data lokal; foto profil diambil dari URL gambar dan menampilkan avatar
inisial jika gambar tidak tersedia.

## Fitur

- Login demo menuju Home menggunakan `Navigator.pushReplacement()`.
- Bottom navigation Home, Mahasiswa, dan Profile.
- Drawer Home, About, dan Logout; Logout menghapus navigation stack dengan
  `Navigator.pushAndRemoveUntil()`.
- Daftar lima mahasiswa, pencarian nama/NIM, detail biodata dan akademik.
- Hero animation pada foto, serta pengeditan nama yang mengembalikan hasil
  melalui `Navigator.pop()`.
- Tema pastel editorial dengan panel krem bergaris hitam dan ilustrasi maskot.

## Menjalankan

```shell
flutter pub get
flutter run
```

Login menggunakan tombol **Masuk ke Student Explorer**. Kredensial pada form
hanya contoh dan tidak diverifikasi karena aplikasi ini tidak memakai backend.

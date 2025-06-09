# Reyy Portfolio App

Aplikasi portfolio sederhana yang dibuat dengan Flutter untuk memenuhi tugas UTS mata kuliah Aplikasi Komputasi Bergerak.

## Ringkasan Project

Aplikasi ini adalah portfolio pribadi yang menampilkan informasi tentang diriku, aktivitas sehari-hari, minat, dan galeri foto. Aplikasi ini terdiri dari beberapa fitur utama:

- **Splash Screen & Onboarding**: Tampilan awal aplikasi dengan animasi dan pengenalan fitur
- **Home**: Menampilkan informasi pribadi, aktivitas terbaru, dan daftar teman
- **Daily**: Galeri foto dan aktivitas sehari-hari
- **Interest**: Menampilkan hal-hal yang disukai dan tidak disukai
- **Profile**: Informasi detail tentang profil pribadi

## Teknologi yang Digunakan

Aplikasi ini dibangun menggunakan:

- **Clean Architecture**: Menggunakan pembagian layer domain, data, dan presentation untuk memisahkan tanggung jawab dan memudahkan pengujian
  - **Domain Layer**: Berisi entities, use cases, dan repository interfaces
  - **Data Layer**: Berisi implementasi repository dan data sources
  - **Presentation Layer**: Berisi UI, controllers, dan state management

- **GetX**: Sebagai state management, navigation, dan dependency injection yang ringan dan mudah digunakan

- **Hive**: Sebagai pengganti Room di Android native, digunakan untuk local storage yang cepat dan efisien

- **GetIt**: Sebagai pengganti Hilt di Android native, digunakan untuk dependency injection

## Dependencies Utama

```yaml
dependencies:
  convex_bottom_bar: ^3.2.0
  dartz: ^0.10.1
  flutter:
    sdk: flutter
  font_awesome_flutter: ^10.8.0
  get: ^4.7.2
  hive: ^2.2.3
  http: ^1.4.0
  lottie: ^3.0.0
  url_launcher: ^6.3.1
```

## Screenshot Aplikasi

| Splash Screen | Onboarding | Home |
|:-------------:|:----------:|:----:|
| ![Splash Screen](/screenshoot/splash.png) | ![Onboarding](/screenshoot/onboarding.png) | ![Home](/screenshoot/home.png) |

| Daily | Interest | Profile |
|:-----:|:--------:|:-------:|
| ![Daily](/screenshoot/daily.png) | ![Interest](/screenshoot/interest.png) | ![Profile](/screenshoot/profile.png) |

## Struktur Folder

![Struktur Folder](/screenshoot/struktur_folder.png)

## Getting Started

Untuk menjalankan aplikasi ini:

1. Pastikan Flutter sudah terinstall di komputer
2. Clone repository ini
3. Jalankan `flutter pub get` untuk menginstall dependencies
4. Jalankan `flutter run` untuk memulai aplikasi

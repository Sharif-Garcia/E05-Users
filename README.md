# E05-Users

App Flutter que consume la API de [DummyJSON](https://dummyjson.com/users) para listar usuarios, filtrarlos por color de cabello y ver su detalle. Usa Riverpod para el manejo de estado y un sistema de diseño de tokens de color con soporte de tema claro/oscuro.

## Cómo correrlo

    git clone https://github.com/Sharif-Garcia/E05-Users.git
    cd E05-Users/flutter_application_27
    flutter pub get
    flutter run

## Estructura

```
lib/
├── models/          # Modelos de datos (Hair, User) con fromJson/toJson
├── providers/        # Providers de Riverpod (usuarios, filtro, tema)
├── services/          # Acceso HTTP a DummyJSON
├── theme/              # Tokens de color + ThemeData light/dark
├── ui/                  # Vistas y widgets
└── main.dart            # Punto de entrada (ProviderScope)
```

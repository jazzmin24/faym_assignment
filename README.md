# Faym Collections

A new Flutter project.


## What it does

- Opens with a splash screen, then takes you to the main collections page
- Each collection is a card that you can tap to expand/collapse
- When expanded, it shows product images in a horizontal scroll
- If there are more than 4 images, the last one shows a +N badge — tap it to reveal the rest
- Only one collection stays open at a time (tapping another one closes the previous)

## How to run

```
flutter pub get
flutter run
```


## API

I'm using (https://picsum.photos/) to fetch images. It's a free API, no authentication required. Each collection pulls 6 random images from a different page.

## Project structure

```
lib/
├── main.dart                  -- app entry point, provider setup, theme
├── models/
│   └── collection_model.dart  -- data classes for ProductImage & ProductCollection
├── services/
│   └── api_service.dart       -- handles API calls and JSON parsing
├── providers/
│   └── collection_provider.dart -- state management (loading, errors, which card is open)
├── screens/
│   ├── splash_screen.dart     -- animated splash with logo
│   └── collections_screen.dart -- main screen with the list of collections
└── widgets/
    ├── collection_card.dart   -- the accordion card with images and +N badge
    └── shimmer_loading.dart   -- shimmer placeholder while data loads
```

## Packages used

- **provider** — for state management
- **http** — for making API calls
- **cached_network_image** — caches images so they don't reload every time
- **shimmer** — loading placeholder effect
- **google_fonts** — using Poppins font to match the design

## Things I focused on

- Keeping the code clean with separate layers (models, services, providers, widgets)
- Smooth animations on expand/collapse and the chevron rotation
- Error handling with a retry button if the API fails
- Only one collection open at a time, like the design shows

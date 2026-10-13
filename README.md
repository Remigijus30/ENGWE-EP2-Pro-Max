# ENGWE EP-2 Pro Max Android programėlė

Vietinė „WebView“ programėlė. Skaičiuoklės HTML, CSS, JavaScript ir piktograma supakuojami į APK; programėlė neturi tinklo leidimo. Įvestys saugomos Android `SharedPreferences` saugykloje per siaurą JavaScript sąsają.

## Sukompiliuoti APK

Reikia „Android Studio“ (ji pateikia JDK) ir Android SDK platformos 36 bei Build Tools 36.0.0. Atverk šį aplanką „Android Studio“; jei SDK komponentų trūksta, leisk IDE juos įdiegti. Tada projekto aplanke vykdyk:

```sh
./gradlew assembleRelease
```

Pirmo paleidimo metu įtrauktas `gradlew` scenarijus atsisiunčia oficialų Gradle 8.13 platinį. „Windows“ naudok `gradlew.bat assembleRelease`.

APK: `app/build/outputs/apk/release/app-release.apk`. Šiame projekte `release` variantas pasirašomas Gradle debug sertifikatu, kuris tinka rankiniam diegimui ir APK persiuntimui. Jis nėra skirtas „Google Play“ publikavimui. Norint vėliau įdiegti programos naujinį virš tos pačios versijos, reikia išsaugoti pasirašymo raktą.

## Diegimas telefone

Perkelk APK į telefoną, atverk jį ir, jei „Android“ paprašys, leisk šiai programai diegti programas iš nežinomų šaltinių. Programa atsiras programėlių sąraše kaip „ENGWE EP-2 Pro Max“.

Tikslinė SDK versija yra 36 („Android 16“); minimali palaikoma versija – API 23 („Android 6.0“). Jokių tinklo leidimų neprašoma.

# Krzysztof Blecharczyk
## Programowanie w języku Fortran Zadanie 2

### Opis rozwiązania::
Szanowny Panie Doktorze, przy rozwiązaniu zadania powstały pliki z kodem źródłowym, są to kolejno :

#### Katalog src
* **cosinus.F90** zawierający pierwszą część zadania, tj zaszumienie funkcji cosinus, przeprowadzenie na niej fft oraz dft
* **signal.F90** zawierający transformatę sygnału będącegu sumą sinusów
* **fftw3.f03** plik niezbędny do przeprowadzenia fft
* **Makefile** plik makefile, ułatwiający kompilację

oraz dodatwkowo katalog z rezultatami

#### Katalog res
Katalog zawiera pliki z rozszerzeniem **.txt** stanowiące wynik odpowiedniej operacji, **.p** będącą komendą dla programu **gnuplot** do stworzenia wykresu, oraz sam wykres zapisany w formacie **.pdf**.


### Sprawozdanie

## Część pirwsza:
Zacznę od zaprezentowania wykresów:
Odpowiednie operaje zostały zapisane w kolejnych plikach:

![image](https://user-images.githubusercontent.com/45050808/58750084-14298a80-848e-11e9-9831-f01227d98ee5.png)

Nasza wyjściowa funkcja cosinus generowana wraz z zaszumioną funkcją cosinus w tym miejsci w kodzie:

![image](https://user-images.githubusercontent.com/45050808/58750098-33c0b300-848e-11e9-8911-72e06861c482.png)

Wykres funkcji cosinus:

![image](https://user-images.githubusercontent.com/45050808/58750038-4090d700-848d-11e9-9951-707bada9dc79.png)

Wykres zaszumionej funkcji cosinus:

![image](https://user-images.githubusercontent.com/45050808/58750116-6074ca80-848e-11e9-9704-609bb49fbf13.png)

Następnie wykonana została transformata fouriera, jej odszumienie, oraz odwrotna transformata. W kodzie operacje te prezentują się następująco:

![image](https://user-images.githubusercontent.com/45050808/58750135-b5b0dc00-848e-11e9-9c3b-6e7d00e8197e.png)

Oraz kolejne wykresy:
Zaszumiona transformata:

![image](https://user-images.githubusercontent.com/45050808/58750159-0cb6b100-848f-11e9-8346-7b748d90a067.png)

Odszumiona transformata:

![image](https://user-images.githubusercontent.com/45050808/58750165-27892580-848f-11e9-936a-feaff5c4d5e8.png)

Oraz wykres rezultat wykonania dft:

![image](https://user-images.githubusercontent.com/45050808/58750179-4b4c6b80-848f-11e9-9d93-64082d00b310.png)

Jak widzimy otrzymane wykresy są zgodne z tymi, jakie byłyby oczekiwane. Funkcja po dft przypomina funkcję cosinus, jednak jest zniekształcona. Wynikać to może z szumu, jaki został nałożony na wykres.

## Część druga:
Druga część polegała na zamianie sygnału na sumę sygnałów:

![image](https://user-images.githubusercontent.com/45050808/58750218-d7f72980-848f-11e9-83b9-1bf2bdc869c7.png)

Sporządzony został wykres funkcji:

![image](https://user-images.githubusercontent.com/45050808/58750228-f5c48e80-848f-11e9-8cba-db29a74f855c.png)

Oraz wykonana została transformata Fouriera. Kod jest analogiczny do przypadku wcześniejszego, dlatego nie będę go wklejać.
Wynik transformaty:

![image](https://user-images.githubusercontent.com/45050808/58750239-20164c00-8490-11e9-9cb5-4ebb7ee4e604.png)

Jak możemy zaobserwować, na wykresie są widoczne 2 "szpilki" odpowiadające częśtotliwościom **200Hz** oraz **400Hz**. Umiejscownienie ich na wykresie nie jest przypadkowe, gdyż są to miejsca odpowiadające składowym naszego sygnału wejsciowego.



###### Z wyrazami szacunku
###### Krzysztof Blecharczyk


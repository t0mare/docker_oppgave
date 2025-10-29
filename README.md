# Oppdrag: Bygg og kjør din første kontainer

Velkommen til IT-drift! I denne oppgaven skal du lære grunnprinsippet i moderne drift: Å pakke en applikasjon (en nettside) inn i en **kontainer**, og kjøre den.

Vi bruker **Play with Docker (PWD)**, som gir oss en terminal i nettleseren.

---

### Trinn 1: Klargjør terminalen (5 min)

1.  Gå til [Play with Docker](https://labs.play-with-docker.com/) og logg inn med Docker Hub-kontoen din.
2.  Klikk på **Start**.
3.  Klikk på **+ ADD NEW INSTANCE** på venstre side.
4.  Du har nå en Linux-terminal. **Alle kommandoer skal skrives i denne terminalen.**

---

### Trinn 2: Hent kildekoden (Dette prosjektet) (5 min)

Nå skal vi "klone" (laste ned) kildekoden fra GitHub til PWD-terminalen.

1.  Kjør denne kommandoen for å laste ned prosjektet:
    *(Bytt ut URL-en med den du fikk av veileder)*
    ```bash
    git clone [https://github.com/](https://github.com/)[DITT_BRUKERNAVN]/[DITT_REPO_NAVN].git
    ```

2.  Gå inn i mappen du nettopp lastet ned:
    *(Bytt ut [MAPPE_NAVN] med navnet på repoet)*
    ```bash
    cd [MAPPE_NAVN]
    ```

3.  Se filene du har hentet. Du skal se `README.md`, `index.html` og `Dockerfile`.
    ```bash
    ls -l
    ```

---

### Trinn 3: Bygg ditt Docker "Image" (10-15 min)

Et **Image** er "oppskriften" eller "malen" for kontaineren din. Vi bygger den ved hjelp av filen `Dockerfile`.

1.  Kjør `docker build`-kommandoen.
    ```bash
    docker build -t min-webserver .
    ```
    * `docker build`: Kommandoen for å bygge.
    * `-t min-webserver`: Gir imaget et "tag" (et navn) vi kan bruke senere.
    * `.` (punktum): Betyr "se etter en `Dockerfile` i mappen jeg står i nå".

2.  Du vil se at Docker laster ned `nginx` (base-imaget) og deretter kjører kommandoen `COPY` fra vår `Dockerfile`.

3.  Sjekk at imaget ditt er bygget:
    ```bash
    docker images
    ```
    (Du skal se `min-webserver` i listen).

---

### Trinn 4: Kjør din kontainer! (10 min)

Nå skal vi "starte" imaget. Når et image kjører, kalles det en **kontainer**.

1.  Kjør `docker run`-kommandoen:
    ```bash
    docker run -d -p 80:80 min-webserver
    ```
    * `docker run`: Kommandoen for å starte.
    * `-d`: "Detached mode" (kjør i bakgrunnen).
    * `-p 80:80`: "Publish port". Kobler port **80** på PWD-maskinen til port **80** *inni* kontaineren (der Nginx lytter).

2.  **Se resultatet!** Ved siden av instans-navnet ditt i PWD, vil en blå **[ 80 ]**-lenke dukke opp. **Klikk på den.**

3.  Du skal nå se "Hello World"-siden din! Gratulerer!

4.  Sjekk at kontaineren kjører:
    ```bash
    docker ps
    ```
    (Viser alle kontainere som kjører).

---

### ⭐ Bonusoppgave: Oppdatering (15-20 min)

I ekte drift må vi oppdatere ting. La oss endre nettsiden.

1.  Bruk en enkel teksteditor (nano) for å endre hilsenen:
    ```bash
    nano index.html
    ```

2.  Endre `<h1>Hello World! 👋</h1>` til `<h1>Jeg har oppdatert siden min! 🚀</h1>`.
3.  Lagre og lukk `nano` (Trykk **Ctrl+X**, så **Y**, så **Enter**).

4.  **VIKTIG:** Du må stoppe og fjerne den *gamle* kontaineren før du kan starte en ny på samme port.
    * Finn ID-en til kontaineren: `docker ps`
    * Stopp den: `docker stop [Container-ID eller navn her]`
    * Fjern den: `docker rm [Container-ID eller navn her]`

5.  Bygg imaget på nytt med endringene dine:
    ```bash
    docker build -t min-webserver .
    ```
    (Legg merke til hvor mye raskere det går nå! Docker "cacher" lagene).

6.  Start den nye kontaineren:
    ```bash
    docker run -d -p 80:80 min-webserver
    ```

7.  **Sjekk resultatet:** Gå til den blå **[ 80 ]**-lenken igjen (eller last inn siden på nytt). Du skal nå se den nye teksten!

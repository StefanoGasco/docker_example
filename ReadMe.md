# Test 0.0.2
## Descrizione
Non ero contento di dover lanciare e soprattutto restartare il container con
tutti quei comandi. Inoltre, non ero contento di dover distruggere e ricreare
il container ogni volta.

Per questo motivo, ho introdotto `docker-file.yml`, replicando una serie di
dati che passavamo da linea di comando

## Lanciare il container
```
docker-compose build
docker-compose up
```
`docker-compose` e' il comando che indica di usare `docker-compose.yml`.

`build` Va lanciato ad ogni cambiamento, `up` crea un nuovo container

## Aggiornare il container
```
docker-compose build
docker-compose restart
```
`restart` rilancia i container specificati in `docker-compose.yml`.

# Test 0.0.1

## Descrizione
Ho scelto di usare python perche' immagino tu non lo abbia installato:
non installarlo! Dovrebbe pensarci Docker.

Solo al primo lancio
dovrai scaricare l'immagine.

In `Dockerfile` puoi vedere le istruzioni per generare il container,
in `website.py` un paio di righe scritte male per lanciare un sito.

---

## Lanciare il container
```
docker build -t nome_immagine:v1.0 .
docker run -p 8080:8000 --name NomeContainer nome_immagine:v1.0
```
`docker build` e' il comando per costruire l'immagine di Docker.

`-t nome_immagine:v1.0` e' la tag che assegni all'immagine.

`.` e' la cartella in cui cercare Dockerfile, in questo caso il punto
identifica la cartella corrente.

`docker run` lancia un'immagine di docker, identificata dalla tag.

`-p 8080:8000` mappa la porta dell'host alla porta del container (`website.py`
espone il sito alla porta 8000, raggiungibile dalla porta dell'host 8080).

`NomeContainer` e' il nome che assegni a questo container, arbitrario.

`nome_immagine:v1.0` e' l'immagine che vuoi lanciare su questo container.

dovresti poter raggiungere `http://localhost:8080`

---

## Aggiornare il container dopo modifiche
```
docker stop NomeContainer
docker rm NomeContainer
docker build -t nome_immagine:v1.1 .
docker run -p 8080:8000 --name NomeContainer nome_immagine:v1.1
```
I primi due comandi stoppano e rimuovono il container, gli altri due avviano.
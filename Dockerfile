# Indicare quale immagine di docker scaricare.
# In questo caso, l'immagine di python 3.10.
# Vedi https://hub.docker.com/_/python
FROM python:3.10

# Cartella dove verra' salvato il codice da eseguire
WORKDIR /usr/src/app

# Copia dei file della repository nella cartella WORKDIR
# (da . (cartella corrente, locale) a . (cartella corrente, container))
COPY . .

# Porta da esporre nel container
EXPOSE 8000

# Comando da eseguire per lanciare il sito
CMD ["python", "./website.py"]
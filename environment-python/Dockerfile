FROM ubuntu:20.04 as environment-python

RUN apt -y update
RUN apt -y -f install build-essential zlib1g-dev libncurses5-dev 
RUN apt -y -f install libgdbm-dev libnss3-dev libssl-dev libreadline-dev 
RUN apt -y -f install libffi-dev wget && apt update -y
RUN apt -y -f install python3-pip && apt update -y
RUN pip install beautifulsoup4 

## diretorios de trabalho
WORKDIR /usr/environment-python

## copia o arquivo de instalacao
COPY ./requirements.txt .

RUN pip install -r requirements.txt

## Copia projeto
COPY . .

## alterar permissóes par ao formato linux
RUN find . -type f -print0 | xargs -0 sed -i 's/\r$//'
RUN find . -type d -print0 | xargs -0 chmod 755  
RUN find . -type f -print0 | xargs -0 chmod 644
RUN chmod -R +x *.py

EXPOSE 5000

CMD [ "flask", "run", "--host=0.0.0.0" ]
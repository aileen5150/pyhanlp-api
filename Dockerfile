From python:3.8.5

RUN git clone https://github.com/hankcs/pyhanlp.git
WORKDIR /pyhanlp

RUN pip install --upgrade pip
RUN pip install -e .

RUN apt update
RUN apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common -yy
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt update
RUN apt install adoptopenjdk-8-hotspot -yy

EXPOSE 8765
CMD ["hanlp","serve"] 

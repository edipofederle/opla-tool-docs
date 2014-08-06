# Build OPLA-Tool
*Autor: Édipo Luis Féderle <edipofederle@gmail.com>*

<hr/>

Este documento tem como objetivo demostrar os passos necessário para realizar o build da ferramenta OPLA-Tool. Os passos aqui descritos são para sistema *nix.
Esse documento foi válido em dois sistemas operacionais: Max OSX e Linux (distribuição Fedora).

A OPLA-Tool está dividada em quatro projetos diferentes.

* https://github.com/edipofederle/architecture-representation/tree/working (Architecture Representation) - usa Maven

* https://github.com/edipofederle/OPLA-Patterns (OPLA-Patterns) - não usa Maven (owner: Giovani Guizzo)

* https://github.com/edipofederle/OPLA-algorithms (OPLA-Core) - usa Maven

* https://github.com/edipofederle/OPLA-Tool (GUI) - usa Maven.


Primeiramente crie um diretório comum para fazer checkout dos projetos. Aqui será usado o diretórios chamado **codes**.

`> mkdir codes`

`> cd codes`

Agora faça o checkout dos projetos acima citados, para isso:

`> git clone https://github.com/edipofederle/architecture-representation/tree/working `

`> git clone https://github.com/edipofederle/OPLA-Patterns`

`> git clone https://github.com/edipofederle/OPLA-algorithms`

`> git clone https://github.com/edipofederle/OPLA-Tool`


Feito isso começar o processo de build em cada um deles.

### Architecture Representation

`> cd architecture-representation`

Edite o arquivo **config/application.yaml** e em *directoryToExportModels* aponte para um diretório local. (path deve ser absoluto).

`> sudo chmod +X buildDeps.sh && sudo chmod 777 buildDeps.sh`

`> ./buildDeps.sh`

`> mvn clean && mvn install`

**Como esse projeto é dependência da OPLA-GUI precisamos instalar ele no repositório Maven local, para isso execute:**

`> mvn install:install-file -Dfile=target/opla-tool-0.0.1.jar -DgroupId=ufpr.br -DartifactId=opla-tool -Dversion=0.0.1 -Dpackaging=jar`

### OPLA-Patterns

Esse projeto não usa maven logo é preciso gerar o JAR via IDE (NetBeans no caso). Para facilitar mantenho o JAR deste projeto no seguinte link: https://dl.dropboxusercontent.com/u/6730822/bins/OPLA-Patterns.jar.

`> curl -O https://dl.dropboxusercontent.com/u/6730822/bins/OPLA-Patterns.jar`

**Como esse projeto é dependência da OPLA-GUI precisamos instalar ele no repositório Maven local, para isso execute:**

`> mvn install:install-file -Dfile=OPLA-Patterns.jar -DgroupId=ufpr.br -DartifactId=opla-patterns -Dversion=0.0.1 -Dpackaging=jar`

### OPLA-algorithms

`> cd opla-algorithms`

`> mvn clean && mvn install`

**Como esse projeto é dependência da OPLA-GUI precisamos instalar ele no repositório Maven local, para isso execute:**

`> mvn install:install-file -Dfile=target/OPLA-core-0.0.1.jar -DgroupId=ufpr.br -DartifactId=opla-core -Dversion=0.1 -Dpackaging=jar`

### OPLA-Tool

Por fim podemos dar build para obter a OPLA-Tool.

`> cd OPLA-Tool`
`> mvn clean && mvn install`



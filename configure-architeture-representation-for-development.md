# Configure Architecture Representation for development

URL: https://github.com/edipofederle/architecture-representation/

# Passos para configurar o projeto

### Requisitos
 - JDK 6 >
 - GIT - http://git-scm.com
 - Maven - http://maven.apache.org
 - Eclipse (pode-se usar outra IDE/Editor, porém recomenda-se o uso do Eclipse).
 - Plugin M2 (maven) para Eclipse.
 

### Geral[^2]

 - Clonar o repositório git:
 - [Terminal]: git clone git@github.com:edipofederle/architecture-representation.git

### Importar projeto no Eclipse[^1]

 Você deve importar o projeto como um projeto mavem. Para isso:
 
 - File -> Import ... -> Maven -> Existing Maven Projects -> Browse (selecione a pasta do projeto).

### Arquivo de configuração:
 - Você precisa realizar algumas pequenas alterações no arquivo application.yml (o da pasta config).
 
 <script src="https://gist.github.com/edipofederle/7355068.js"></script>
 
   Exemplo: https://gist.github.com/edipofederle/7355068

### Dependências

 - Instalar dependêcias I:
  - [Terminal]: sudo chmod +X buildDeps.sh && sudo chmod 777 buildDeps.sh [^3] [^4]
  - [Terminal]: sudo ./buildDeps
  
 - Instalar dependêcias II
 
  -[Terminal]: mvn install


  ou usando Eclipse, com o plugin do maven]: 

   * botão direito no projeto
   * Run As -> Maven Build

  Se tudo der certo (testes passarem)[^5], você irá ver algo assim no final do processo:
  
  [INFO] BUILD SUCCESS
  
  
### Quero contribuir com o projeto (enviando correções, melhorias, documentação...)
  
 Veja: <https://github.com/edipofederle/opla-tool-docs/blob/master/opla-tool-i-find-a-bug.md>
  
  
### Links externos
-http://git-scm.com/docs/gittutorial - git em geral

-https://help.github.com - github e git
    
    
  
  
[^1]: O projeto é estrtuturado com o Maven, logo é preciso importar o mesmo da forma aqui descrita. Caso importado da forma
tradicional o mesmo irá ficar "bagunçado". 

[^2]: A branch a ser usado é a working. Não se esqueça de fazer checkout para essa branch

[^3]: Usuários Windows favor abrir o arquivo buildDeps.sh e executar os comandos correspondentes em seu SO. (Requer Maven instalado)

[^4]: Esse passo é necessário pois algumas bibliotecas não foram encontradas em repositórios mavem.

[^5]: Lembre-se de alterar o path do application.yaml directoryToExportModels para um path do seu computador. (path absoluto)

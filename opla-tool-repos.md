# OPLA-Tool Repositories Modules.

- https://github.com/edipofederle/architecture-representation/tree/working (Architecture Representation) - usa maven
- https://github.com/edipofederle/OPLA-Tool (GUI) - usavem maven
- https://github.com/edipofederle/OPLA-Patterns (OPLA-Patterns) - não usa maven (owner: Giovani Guizzo)
- https://github.com/edipofederle/opla-core (OPLA-Core) - usa maven

## Build With Maven

### Architecture Representation

`mvn clean && mvn install`

`> mvn install:install-file -Dfile=target/architecture-representation-0.0.1.jar -DgroupId=opla -DartifactId=architecture-representation -Dversion=0.0.1 -Dpackaging=jar`

### Using has maven dependency (pom.xml):

	<dependency>
		<groupId>ufpr.br</groupId>
		<artifactId>opla-tool</artifactId>
		<version>0.0.1</version>
	</dependency>

### OPLA-Tool (GUI)

`mvn clean && mvn install`

### OPLA-Patterns

Use Netbeans to build and generate JAR file.

### OPLA-Core
`mvn clean && mvn install`
`> mvn install:install-file -Dfile=target/opla-core-0.0.1.jar -DgroupId=opla -DartifactId=opla-core -Dversion=0.0.1 -Dpackaging=jar`

### Using has maven dependency (pom.xml):

	<dependency>
		<groupId>opla</groupId>
		<artifactId>opla-core</artifactId>
		<version>0.0.1</version>
	</dependency>

# Git resources:

- http://git-scm.com/book/en/Getting-Started-Git-Basics
- https://try.github.io/
 




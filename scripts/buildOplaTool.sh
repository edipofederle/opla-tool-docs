#!/bin/bash

echo 'Build OPLA-Tool Script'
echo '------------------------------------------------------------'
echo ''

rm -Rf opla_tool_sources

echo 'Cloning projects...'
echo '=========================================================='
mkdir -p opla_tool_sources && cd opla_tool_sources
git clone https://github.com/edipofederle/architecture-representation.git
git clone https://github.com/edipofederle/opla-core.git
git clone https://github.com/edipofederle/OPLA-Tool.git
echo '=========================================================='
echo '' 

echo 'Configure Architecture Representation....'
echo '=========================================================='
cd architecture-representation
git checkout working
chmod +x ./buildDeps.sh
./buildDeps.sh  

echo '=========================================================='
echo ''
echo 'Updating config/application.yaml file...'
rm config/application.yaml
mkdir -p /tmp/output/

cat <<EOF >config/application.yaml
--- !DirTarget
pathToTemplateModelsDirectory: filesTemplates/
directoryToSaveModels: manipulation/
directoryToExportModels: /tmp/output/
pathToProfile: perfis/smarty.profile.uml
pathToProfileConcern: perfis/concerns.profile.uml
pathToProfileRelationships: perfis/relationships.profile.uml
pathToProfilePatterns:  perfis/patterns.profile.uml
EOF
echo ''


echo 'Resolve Dependencies...'
mvn clean && mvn install 
echo '=========================================================='
echo '' 
echo 'Removing output directory...'
rm -Rf /tmp/output 
echo ' '
echo 'Installing on Maven Local Repository...' 
mvn install:install-file -Dfile=target/architecture-representation-0.0.1.jar -DgroupId=opla -DartifactId=architecture-representation -Dversion=0.0.1 -Dpackaging=jar
echo '=========================================================='
echo ' '

echo 'Configure OPLA Patterns'
curl -O https://dl.dropboxusercontent.com/u/6730822/OPLA-Patterns.jar
mvn install:install-file -Dfile=OPLA-Patterns.jar -DgroupId=opla -DartifactId=opla-patterns -Dversion=0.0.1 -Dpackaging=jar
rm OPLA-Patterns.jar
echo '=========================================================='
echo ''

echo 'Configure OPLA Core'
cd ../opla-core && mvn clean && mvn install

echo '=========================================================='
echo ' '
echo 'Installing on Maven Local Repository...' 
mvn install:install-file -Dfile=target/opla-core-0.0.1.jar -DgroupId=opla -DartifactId=opla-core -Dversion=0.0.1 -Dpackaging=jar 

echo '=========================================================='
echo ''
echo 'Bulding OPLA-Tool'
cd ../OPLA-Tool
curl -O https://dl.dropboxusercontent.com/u/6730822/bins/loglog-0.0.1-SNAPSHOT.jar
mvn install:install-file -Dfile=loglog-0.0.1-SNAPSHOT.jar -DgroupId=logs -DartifactId=loglog-0.0.1 -Dversion=0.0.1 -Dpackaging=jar
rm loglog-0.0.1-SNAPSHOT.jar
mvn clean && mvn install

cd ../OPLA-Tool && cp target/OPLA-Tool-1.0-SNAPSHOT-jar-with-dependencies.jar .
mv OPLA-Tool-1.0-SNAPSHOT-jar-with-dependencies.jar OPLA-Tool-1.0.jar
echo 'Done.'
echo 'Choose a location for save the OPLA-Tool Jar File: (complete path)'
read path 
mv OPLA-Tool-1.0.jar $path
echo "Write in $path"

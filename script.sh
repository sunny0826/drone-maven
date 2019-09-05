#!/bin/sh

FILES=$(cat env.yaml | shyaml get-values checkList)

IS_DEPLOY=false
for element in $FILES
    do
        if [ $element == ${PLUGIN_MODNAME} ]; then
            IS_DEPLOY=true
            echo "+ Maven build start. "
            mvn clean install -U -P${PLUGIN_ENV} -Dmaven.test.skip=true -s /usr/share/maven/ref/settings.xml
            break
        fi
    done

if $IS_DEPLOY ; then
   echo "+ Maven build success."
fi
#!/bin/bash

set -e

IS_DEPLOY=false

if [ -z $PLUGIN_MODNAME ];then
    mvn clean install -U -P${PLUGIN_ENV} -Dmaven.test.skip=true -s /usr/share/maven/ref/settings.xml
    IS_DEPLOY=true
else
    FILES=$(cat env.yaml | shyaml get-values checkList)
    for element in $FILES
    do
        if [ $element == ${PLUGIN_MODNAME} ]; then
            IS_DEPLOY=true
            echo "+ Maven build start. "
            mvn clean install -U -P${PLUGIN_ENV} -Dmaven.test.skip=true -s /usr/share/maven/ref/settings.xml
            break
        fi
    done
fi

if $IS_DEPLOY ; then
   echo "+ Maven build success."
else
    echo "+ skip module package maven build."
fi
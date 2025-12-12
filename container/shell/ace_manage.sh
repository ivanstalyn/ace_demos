#!/bin/bash

set -e

stop()
{
    echo " ";
    echo "************************************************************************"
    echo "Deteniendo servidor de integración ${ACE_SERVER_NAME} ..."
    mqsistop --admin-host localhost --admin-port 7600
    echo "************************************************************************"
}

start()
{

    echo "************************************************************************"
    ${MQSI_BASE_FILEPATH}/ace version
    echo "************************************************************************"

    if [ ! -f "/tmp/temp.bar" ]; 
    then
        echo " ";
        echo "************************************************************************"
        echo "Desplegando aplicación en servidor de integración ${ACE_SERVER_NAME} ..."
        echo "************************************************************************"
        
        ibmint package --compile-maps-and-schemas --input-path proyectos --output-bar-file /tmp/temp.bar  2>&1 | tee -a /tmp/deploys
        ibmint apply overrides proyectos/overrides/* --bar-file /tmp/temp.bar 2>&1 | tee -a /tmp/deploys
        ibmint deploy --input-bar-file /tmp/temp.bar --output-work-directory ${ACE_WORKPATH}/ 2>&1 | tee -a /tmp/deploys
        echo " ";
        echo "************************************************************************"
        echo "Optimizando servidor de integración ${ACE_SERVER_NAME} ..."
        echo "************************************************************************"
        ibmint optimize server --work-directory ${ACE_WORKPATH}
    else
        echo " ";
        echo "************************************************************************"
        echo "Aplicación ya está desplegada en servidor de integración ${ACE_SERVER_NAME}."
        echo "Servidor de integración ${ACE_SERVER_NAME} ya está optimizado."
        echo "************************************************************************"
    fi

    echo " ";
    echo "************************************************************************"
    echo "Inicializando servidor de integración ${ACE_SERVER_NAME} ..."
    echo "************************************************************************"
    IntegrationServer --work-dir ${ACE_WORKPATH} --name ${ACE_SERVER_NAME}

}

monitor()
{
        echo " ";
        echo "************************************************************************"
        echo "Ejecutando - detener contenedor para salir"
        echo "************************************************************************"

        while true; do
                sleep 1
        done
}

start
trap stop SIGTERM SIGINT
monitor

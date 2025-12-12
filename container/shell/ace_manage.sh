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
    echo " ";
    echo "************************************************************************"
    echo "Inicializando servidor de integración ${ACE_SERVER_NAME} ..."
    echo "************************************************************************"
    IntegrationServer --work-dir /home/aceuser/ace-server --name ${ACE_SERVER_NAME}

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

#!/bin/sh
#if ! $(influx -username admin -password admin -execute "show databases" &> /dev/null) ; then
    influxd "$@" &
    pid="$!"
    sleep 3

    INFLUX_CMD="influx -execute "
    INIT_QUERY="CREATE USER \"admin\" WITH PASSWORD 'admin' WITH ALL PRIVILEGES"
    $INFLUX_CMD "$INIT_QUERY"
    sleep 5

    INFLUX_CMD="influx -username admin -password admin -execute "
    INIT_QUERY="CREATE DATABASE ft_services"
    $INFLUX_CMD "$INIT_QUERY"

    kill -s TERM "$pid"
    sleep 2
#fi

exec influxd
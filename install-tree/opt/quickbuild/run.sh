#!/bin/bash

HIBERNATE_CONF="/opt/quickbuild/conf/hibernate.properties"

if [ ! -f $HIBERNATE_CONF ]; then
    case "$QUICKBUILD_DB_TYPE" in
	postgres)
	    [ -z $QUICKBUILD_DB_HOST ] && QUICKBUILD_DB_HOST="localhost:5432"
	    [ -z $QUICKBUILD_DB_NAME ] && QUICKBUILD_DB_NAME="quickbuild"
	    [ -z $QUICKBUILD_DB_USER ] && QUICKBUILD_DB_USER="quickbuild"
	    [ -z $QUICKBUILD_DB_PASSWD ] && QUICKBUILD_DB_PASSWD="quickbuild"

	    # Write config
	    cat <<EOF > $HIBERNATE_CONF
hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
hibernate.connection.driver_class=org.postgresql.Driver
hibernate.connection.url=jdbc:postgresql://$QUICKBUILD_DB_HOST/$QUICKBUILD_DB_NAME
hibernate.connection.username=$QUICKBUILD_DB_USER
hibernate.connection.password=$QUICKBUILD_DB_PASSWD
EOF
	    ;;
	*)
	    QUICKBUILD_DB_TYPE="h2"
	    # Write config
	    cat <<EOF > $HIBERNATE_CONF
hibernate.dialect=org.hibernate.dialect.H2Dialect
hibernate.connection.driver_class=org.h2.Driver
hibernate.connection.url=jdbc:h2:/data;DB_CLOSE_ON_EXIT=FALSE
hibernate.connection.username=sa
hibernate.connection.password=
EOF
	    ;;
    esac
fi

sh /opt/quickbuild/bin/server.sh console

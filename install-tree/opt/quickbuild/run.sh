#!/bin/sh

# Use postgres by default
if [ -z $QUICKBUILD_DB_TYPE ]; then
    QUICKBUILD_DB_TYPE="postgres"
fi

if [ "$QUICKBUILD_DB_TYPE" = "postgres" ]; then 
    [ -z $QUICKBUILD_DB_HOST ] && QUICKBUILD_DB_HOST="localhost:5432"
    [ -z $QUICKBUILD_DB_NAME ] && QUICKBUILD_DB_NAME="postgres"
    [ -z $QUICKBUILD_DB_USER ] && QUICKBUILD_DB_USER="postgres"
    [ -z $QUICKBUILD_DB_PASSWD ] && QUICKBUILD_DB_PASSWD="postgres"

    # Write config
    cat <<EOF > /opt/quickbuild/conf/hibernate.properties
hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
hibernate.connection.driver_class=org.postgresql.Driver
hibernate.connection.url=jdbc:postgresql://$QUICKBUILD_DB_HOST/quickbuild
hibernate.connection.username=$QUICKBUILD_DB_USER
hibernate.connection.password=$QUICKBUILD_DB_PASSWD
EOF
fi

sh /opt/quickbuild/bin/server.sh console

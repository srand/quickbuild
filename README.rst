QuickBuild
==========

Containerized QuickBuild. Images provided:

  - ``robrt/quickbuild:<version>``: The server image.


Server Configuration
--------------------

These environment variables can be set to customize the container:

  - ``QUICKBUILD_DB_TYPE``: Accepted values are ``h2`` (default) and ``postgres``.

When ``QUICKBUILD_DB_TYPE=postgres``:

  - ``QUICKBUILD_DB_HOST``: Server host and port. (default: ``postgres:5432``)
  - ``QUICKBUILD_DB_NAME``: Database name. Default: ``quickbuild``
  - ``QUICKBUILD_DB_USER``: Username. Default: ``quickbuild``
  - ``QUICKBUILD_DB_PASSWD``: Password. Default: ``quickbuild``


Docker Compose
--------------

A Docker Compose file is provided in the source repository for convenience. It can be used to
deploy QuickBuild, QuickBuild Build Agents and the Postgres DBMS all at once.

Deployment checklist:

  - Change all default usernames and passwords.
  - Configure the server to store data in the mounted volume at ``/data``.
  - Create a server admin user account matching credentials configured for build agents.

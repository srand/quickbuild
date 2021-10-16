QuickBuild
==========

Containerized QuickBuild. Two images are provided:

  - ``robrt/quickbuild:<version>``: The server image.
  - ``robrt/quickbuild-agent:<version>``: The build agent image.


Server Configuration
--------------------

These environment variables can be set to customize the container:

  - ``QUICKBUILD_DB_TYPE``: Accepted value is ``postgres``.
  - ``QUICKBUILD_DB_HOST``: Server host and port. (default: ``postgres:5432``)
  - ``QUICKBUILD_DB_NAME``: Database name. Default: ``quickbuild``
  - ``QUICKBUILD_DB_USER``: Username. Default: ``quickbuild``
  - ``QUICKBUILD_DB_PASSWD``: Password. Default: ``quickbuild``


Build Agent Configuration
-------------------------

These environment variables must be set to customize the container:

  - ``QUICKBUILD_URL``: URL of the QuickBuild Server.
  - ``QUICKBUILD_USER``: QuickBuild administrator username. This user must be authorized to download the Build Agent software from the server. Default: ``admin``
  - ``QUICKBUILD_PASSWD``: Administrator password. Default: ``quickbuild``

Note that the source IP-address of build agents must be reachable by the server. Run agents with host networking.


Docker Compose
--------------

A Docker Compose file is provided in the source repository for convenience. It can be used to
deploy QuickBuild, QuickBuild Build Agents and the Postgres DBMS all at once.

Deployment checklist:

  - Change all default usernames and passwords.
  - Configure the server to store data in the mounted volume at ``/data``.
  - Create a server admin user account matching credentials configured for build agents.

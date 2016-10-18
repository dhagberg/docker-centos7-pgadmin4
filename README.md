Build image with:

    sudo docker build -t pgadmin4 .

Run with port mapping for exposed port 5050 and a persistent volume mounted for /var/lib/pgadmin4
to store persistent data, starting with the username/password database for pgadmin4 login.  The
examples below add the :Z flag to set selinux context on the host directory, required for CentOS-7
with the default docker version on that OS.

The first time you run, make sure "/host/dir/for/pgadmin4" (example) is writeable by group 533
(sudo mkdir -p /host/dir/for/pgadmin4 && sudo chmod 2770 /host/dir/for/pgadmin4) and run with
the terminal mapped because pgadmin will prompt for the initial username and password:

    sudo docker run --rm -ti -v /host/dir/for/pgadmin4:/var/lib/pgadmin4:Z -p 5050:5050 \
            --name pgadmin4 pgadmin4

        Enter the email address and password to use for the initial pgAdmin user     account:
    
    Email address: firstuser@co811.org
    Password: 
    Retype password:
    
    The configuration database has been created at /var/lib/pgadmin4/pgadmin4.db
    Starting pgAdmin 4. Please navigate to http://0.0.0.0:5050 in your browser.

After that db file has been written, you can Ctrl-C and run the container in the background with
auto-restart.

    sudo docker run -d --restart=unless-stopped -v /host/dir/for/pgadmin4:/var/lib/pgadmin4:Z \
            -p 5050:5050 --name pgadmin4 pgadmin4

Data and logs will be placed under that mounted data directory for your inspection.


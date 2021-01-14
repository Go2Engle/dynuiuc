# dynuiuc
Docker container for DYNU IP Update Client

Provided in the repository is a sample docker-compose.yml to get the container up and running. If using portainer you should just be able to copy paste this compose file into a stack and be up and running.

Once the container is running modify the dynuiuc.conf file in your volume. You will need to provide your username and password. Once those changes are saved restart your container and your IP should now be updating in DYNU
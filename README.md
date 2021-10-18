# dynuiuc
Docker container for DYNU IP Update Client

Provided in the repository/below is a sample docker-compose.yml to get the container up and running. If using portainer you should just be able to copy paste this compose file into a stack and be up and running.

Other environment variables that can be set and there defaults are listed below

| Variable  | Default Value  |
|---|---|
| POLLINTERVAL  | 120  |
| DEBUG  | false  |
| IPV4  | true  |
| IPV6  | true  |
| QUIET  | false  |
| USERNAME | null |
| PASSWORD | null |
| LOCATION | null |

Make sure to update the below commands with your correct username and password.

`docker run -d --name dynuiuc -e "USERNAME=Your_Username" -e "PASSWORD=Your_Password" go2engle/dynuiuc:latest`

```
version: "2.1"
services:
  dynuiuc:
    image: go2engle/dynuiuc
    container_name: dynuiuc
    environment:
      - USERNAME=Your_username
      - PASSWORD=Your_password
    restart: unless-stopped
 ```

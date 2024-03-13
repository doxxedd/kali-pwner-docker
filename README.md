build with: 
`docker buildx build -t <your_docker_name_here> .`

create an alias for quick launch:
`alias kalid='docker run -it --rm -v "`pwd`:/chal" kali-pwner /bin/bash'`

run with:
executing the above alias `kalid` in this case, in the directory of the challange you are trying to solve as the working dir files will be visible to the container

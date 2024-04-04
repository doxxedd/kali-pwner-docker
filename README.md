This will take a few mins to build

Navigate to the directory of the Dockerfile and build with: 
`docker buildx build -t kali-pwner .`

create an alias for quick launch:
```alias kalid='docker run -it --rm -v "`pwd`:/chal" kali-pwner /bin/bash'```

run with:
executing the above alias `kalid` in this case, in the directory of the challange you are trying to solve as the working dir files will be visible to the container

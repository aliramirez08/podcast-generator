FROM ubuntu:20.04

WORKDIR /usr/src/app

# Debug Step: Copy files minimally
COPY . .

CMD ["ls", "-la"]

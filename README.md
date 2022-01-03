# NR-CORE - Dockerized

This is a fork of nillys nr-core, with an updated Docker setup. While nr-core has some docker files, it's of a much older version and is more focused around building. We're going to be using this more for easy Development on windows.

NR-Core can be found here: https://github.com/cp-nilly/NR-CORE

# Requirements
- Docker For Windows - https://docs.docker.com/desktop/windows/install/

# Features
	- Automatically restarts on a crash.
	- Reviewable logs. (Base sources exit before you can even see the log)
	- No need to install database.
	- No, "it works on my machine".
	- Easy to tweak and secure this docker-compose.yml for production.
	- Easy to integrate into a CI/CD pipeline.
	
# Commands

All commands should be ran from the NR-Core/ directory. It should be at the same file as the Dockerfiles.

## Starting
This will start all three containers detached.
`docker-compose up -d`. 

## Rebuilding & Restarting
`docker-compose up -d --rebuild``

## Stopping
`docker-compose stop`

## Checking Logs
The easiest way to do this on Windows is to use to the Docker Desktop GUI installed automatically when using Docker on Windows. Run the GUI and you will see your containers. 
[Imgur](https://imgur.com/se6OKDf)

## Accessing the redis-cli
1) Enter into the container to run bash scripts
`docker exec -it nr-core_redis_1 sh`
2) Connect to the redis-cli
`redis-cli -h redis`
3) Authenticate
`auth mypassword`



# Windows
	- Install Docker for Windows, which also installs Compose. 
	- server.json and wServer.json are bound to 0.0.0.0 - this is due to a bug in Docker concerning local loopback.
	- In the same vein, you'll notice the redis config is bound to `redis`. This is an interface we create in the compose to circumvent the same loopback issue.

# To Know
	- Redis is persistent after container restarts and rebuilt. The saving is a basic 60s save, and disables appendonly. In prod, you prob want appendonly on, with better saving - but I want to use less space on this laptop as appendonly uses more, and it's just for dev.
	- Fixed a minor log4net bug where RED/YELLOW isn't supported on Unix setups and throws nasty errors.
	- To support windows and odd networking setups, the network-mode is host. This will bind the services to your IP ports, and if you do not have a firewall/all ports are forwarded this means they are exposed to the internet.
	- Default password for redis is `mypassword`. Even in development, I just prefer to run it with a password. :shrug:

# Credit
	- Nillys & Original Credits to the NR-Core team. (https://github.com/cp-nilly/NR-CORE)
	- creepylava - Created the original source this work is based off of. Without him, this would not exist.
	- cp-nilly
	- tuvior
	- ossimc82
	- TheSnowQueen
	- Cyeclops
	- Varanus-Komodoensis
	- Moloch-horridus
	- Zolmex (resources for nr-core, and dungeon gen)

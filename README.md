Midonet Dockerfile
==================

This repository contains a set of Dockerfiles that build the pieces for a
[midonet](http://midonet.org) deployment.


Base Docker Images
------------------

* [Ubuntu 14.04](https://registry.hub.docker.com/u/library/ubuntu/)
* [Centos 7] (https://registry.hub.docker.com/_/centos/)


Installation
------------

**ATTENTION!**: Docker containers share kernel with the host. Midolman agent is
attached to openvswitch kernel datapath. We strongly recommend you to follow
this steps in a Virtual Machine.

* Install [Docker](http://www.docker.com/)

```bash
    $ wget -qO- https://get.docker.com/ | sh```
```

* Clone repo:

```bash
    $ git clone http://github.com/midonet/midonet-dockerfile
    $ cd midonet-dockerfile
```


Usage
-----

* Be sure the openvswitch module is loaded in you docker server machine

```
    $ modprobe openvswitch
```

* Run the [fig](https://github.com/docker/fig) script. (You may need to install
  fig via pip `pip install fig`)

```bash
    $ fig up -d
```

* All the services will be running in this moment. Run a new container using the
  midonet-cli binary linked to the midonet api to start playing with midonet
  cli:

```bash
    $ fig run cli midonet-cli
```

* If you want to try out the centos version of the midonet containers you can
  just modify the fig.yml file to point to the docker images for midolman,
  midonet-api and midonet-cli with tag 2014.11-rc3_centos (or newer '\_centos'
  tag). Then run the previous `fig run cli midonet-cli` command.



Scale Midonet Agents
--------------------

Midonet agents can be easily scaled. (Cassandra and Zookeeper can not now).
Deploy diferent midonet agents (in your enviroment they will behave as if they
were hypervisors)

```bash
    $ fig scale midolman=4
```

After a few seconds, log in into the midonet-cli and check your 'hosts':

![example fig scale](http://i.imgur.com/AkfUnYK.png)



Alternative installation
------------------------

If you enjoy watching how packages are installed and/or you don't mind
wasting you time and your vision in a terminal window, we have something for you:
build docker images by yourself instead of download them from docker registry!

* Run the `build_testing_images.sh` script. We will have the images pushed in
  [Docker Hub Registry](https://registry.hub.docker.com/) soon.

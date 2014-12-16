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
    $ docker run -ti --link midonetdockerfile_api_1:api midonet/midonet-cli midonet-cli
```

* If you want to try out the centos version of the midonet containers you can
  just modify the fig.yml file to point to the docker images for midolman,
  midonet-api and midonet-cli with tag 2014.11-rc3_centos (or newer '\_centos'
  tag). Then run:

```bash
    $ docker run -ti --link midonetdockerfile_api_1:api midonet/midonet-cli:2014.11-rc3_centos midonet-cli
```


Alternative installation
------------------------

If you enjoy watching how packages are installed and/or you don't mind
wasting you time and your vision in a terminal window, we have something for you:
build docker images by yourself instead of download them from docker registry!

* Run the `build_testing_images.sh` script. We will have the images pushed in
  [Docker Hub Registry](https://registry.hub.docker.com/) soon.

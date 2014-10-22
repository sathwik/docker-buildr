# Dockerized Apache Buildr

## What is Apache Buildr?

[Apache Buildr](http://buildr.apache.org/) is a build system for Java-based applications, including support for Scala, Groovy and a growing number of JVM languages and tools.

## Why a "dockerized" Buildr

Some (CI) systems are ready for docker but not so ready for Buildr and its dependencies. This projects aims at building a ready to use docker image so you don't have to. It provides an isolated space for the build process, i.e. you will probably have less troubles if your builds bind to sockets or ports that may be used by others.

## Supported Versions

| Buildr  | Ruby          | JDK    |
| ------- | ------------- | ------ |
| 1.4.20  | JRuby 1.17.16 | Java 7 |
| 1.4.20  | JRuby 1.17.16 | Java 8 |

## Limitations

Currently there are only containers with JRuby and Buildr. Containers for plain rubies may come in future.

## How to use "dockerized" Buildr?

The image bundles JRuby with a pre-installed version of buildr and its dependencies. The version is supposed to be the latest, each buildr release should be available via a docker hub tag.

The container can be run in the working folder of the project to build. It needs to be mounted as a docker volume.

    docker run --rm -ti -v `pwd`:/workspace

Any buildr arguments can be appended and will be passed to buildr. Buildr will operate on the current directory, so you will have immediate access to the build results.

## How to build the image?

Run `make` to create a new image, `make clean` to remove the image. JRuby and Buildr version numbers can be changed in the `Dockerfile`, docker tag names can be customized in the `Makefile`.

## Thanks
 * [Jimmy Dyson](https://github.com/jimmidyson) for [docker-jruby](https://github.com/jimmidyson/docker-jruby), which served as a template for this project.
 * [deis.io](http://deis.io/) for the Makefile inspiration.
 
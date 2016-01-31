# kitchen-salt-testing

This Dockerfile can be used in the combination of [test-kitchen](https://github.com/test-kitchen/test-kitchen), [kitchen-salt](https://github.com/simonmcc/kitchen-salt/) and [kitchen-docker](https://github.com/portertech/kitchen-docker) to test salt formulas.
With Docker it is possible to automatically run tests on Travis CI.
Examples can be found on https://github.com/corux.

Main purpose of this Dockerfile:
* Include Systemd support
* Latest salt-minion from the official salt repository
* Pre-installed software packages, which would be installed by test-kitchen in a later stage

The docker image is published on Docker Hub as [corux/centos7-salt](https://hub.docker.com/r/corux/centos7-salt/).

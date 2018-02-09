# Usage

```bash
$ docker build . -t varch/softethervpn-build-docker
$ docker run -it --rm -v /tmp/rpmbuild/RPMS:/root/rpmbuild/RPMS varch/softethervpn-build-docker
```
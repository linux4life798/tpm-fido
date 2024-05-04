# The tpm-fido Debian Package

## Build the package

*From the tpm-fido directory, run the following:*
```bash
# Install build dependencies (packages needed to build this package).
# You can build this in a docker container, if you don't like the idea of
# polluting you manually installed package list.
sudo apt-get build-dep .

# Build the package.
dpkg-buildpackage -b --no-sign
```

## User setup

```bash
# Install the package.
sudo adduser $USER tss
sudo adduser $USER uhid
# reboot
```

*Check on relevant services:*
```bash
sudo systemctl status uhid-permission
systemctl --user status tpm-fido

# Monitor logs for tpm-fido service.
journalctl --user -f -u tpm-fido
```

## Bump the debian changelog

The debian/changelog file controls the output package version/revision.

```bash
export DEBFULLNAME="First Last"
export DEBEMAIL="me@example.com"
debchange -i
debchange -r
```

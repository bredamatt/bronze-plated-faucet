# vagrant

Because BPF development is better suited on a Linux box, it is not that straightforward to setup a suitable Linux environment on an M1 Macbook. Consequently, I use Vagrant with Docker acting like a hypervisor/provider. This means I need to specify the Linux image I want to use as well as the Vagrant file I use to bootstrap the machine.

## x86_64

It makes more sense to use an x86_64 platform when working with BPF. Hence, specify:

```
FROM --platform=linux/x86_64 <linux-distro>:latest
```

in your `Dockerfile` accordingly.

## SSH setup

Some tutorials mention that it is recommended to setup your own private key for SSHing into the container, but in this case, Vagrant will automatically generate a private key for you whenever you use `vagrant ssh` in the `.vagrant/machines/default/docker/` directory. You can then `ssh` into the container with `vagrant ssh` accordingly. This is achieved by adding the `insecure public key` which will be overwritten whenever the machine is created.

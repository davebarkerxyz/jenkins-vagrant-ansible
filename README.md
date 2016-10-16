Jenkins Vagrant Ansible
=======================

A Vagrantfile and Ansible playbook to quickly fire up a Jenkins install.


Overview
--------

The Vagrantfile uses Debian Jessie and creates a private network, giving the host the address 192.168.56.12.

The Ansible playbook installs some basic development packages (most aren't actually needed to run Jenkins but handy for
hacking on the development server nonetheless), installs Jenkins and creates a new user with sudo privileges.

It expects to find a authorized_keys file containing your SSH public key in the files directory.


Usage
-----

```bash
$ git clone https://github.com/davb5/jenkins-vagrant-ansible
$ cd jenkins-vagrant-ansible
$ vagrant up
```

Then visit http://192.168.56.12:8080 to complete the installation.


Hacks
-----

### Virtualbox network cable connection

On some versions of Virtualbox, VMs created with Vagrant are initialised with their virtual LAN
cable in the disconnected state. The Vagrantfile explictly sets this cable state too connected.


### Apt list corruption

Apt lists sometimes end up with a binary file written, causing addition of the Jenkins
repository to appear to work but in fact fail. This is a recurrant issue with some Debian images
(the Wheezy image on Vagrant is affected). By deleting the contents of `/var/lib/apt/lists` then
re-updating apt caches we can rebuild the lists and resolve the issue.


### OpenJDK dependency order for Jenkins

The Jenkins deb has a dependency on openjdk-7-jre-headless, but tries to complete the Jenkins
configuration (including starting the Jenkins instance) before the OpenJDK configuration has
completed. This causes the Jenkins post-install configuration to fail and as a result causes
the Vagrant provisioning to halt.

We install OpenJDK separately (in the base package install task) before we install Jenkins
in order to avoid this issue.

Note that only the JRE is required but as this is a dev server I'm installing the JDK to
facilitate hacking on the VM.

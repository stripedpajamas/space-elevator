# Installation

## Prerequisites ##

The Space Elevator builder requires a Linux, macOS, or BSD system.

Complete all of these tasks on your local machine. All of the commands should be run inside a command-line session.

### SSH key

Make sure an SSH public key is present in `~/.ssh/id_rsa.pub`.

  * SSH keys are a more secure alternative to passwords that allow you to prove your identity to a server or service built on public key cryptography. The public key is something that you can give to others, whereas the private key should be kept secret (like a password).

To check if you already have an SSH public key, enter the following command at a command prompt:

```
ls ~/.ssh
```

If you see an `id_rsa.pub` file, then you have an SSH public key. If you do not have an SSH key pair, you can generate one by using this command and following the defaults:

```
ssh-keygen
```

* **Please note**: You will need these keys to access your Space Elevator instance over SSH. Please keep `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub` for the lifetime of the Space Elevator server.


## Bootstrap ##

Install the bootstrap packages: Git, and `pip` for Python 2.7. (Space Elevator still requires Python 2.7) Some environments need additional packages.

Here's how to set up these packages:

* On Debian and Ubuntu:

```
sudo apt-get install git python-pip
```

* On Fedora 27, some additional packages are needed later:

```
sudo dnf install git python2-pip gcc python2-devel \
     python2-crypto python2-pycurl libcurl-devel
```

* On CentOS 7, `pip` is available from the EPEL repository; some additional packages are needed later:

```
sudo yum -y update && sudo yum install -y epel-release
sudo yum -y update && sudo yum install -y \
    git gcc python-devel python-crypto python-pycurl \
    python-pip libcurl-devel
```

* On macOS, `git` is part of the Developer Tools, and it will be installed the first time you run it. If there isn't already a `pip` command installed, install it with:

```
sudo python2.7 -m ensurepip
```


## Execution ##

1. Clone the Space Elevator repository and enter the directory.

        git clone https://github.com/stripedpajams/space-elevator.git && cd space-elevator

1. Run the installer for Ansible and its dependencies. The installer will detect missing packages, and print the commands needed to install them. (Ignore the Python 2.7 `DEPRECATION` warning; ignore the warning from python-novaclient that pbr 5.1.3 is incompatible.)

       ./util/venv-dependencies.sh ./venv

1. Activate the Ansible packages that were installed.

        source ./venv/bin/activate

1. Execute the provisioning script.

        ./provision

1. Follow the prompts to choose your provider, the physical region for the server, and its name. You will also be asked to enter API information.
1. Once login information and API keys are entered, Space Elevator will begin spinning up a new remote server.
1. Wait for the setup to complete (this usually takes around ten minutes) and you are all done!

## Keep the results!

Remember to save your `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub` SSH keys too. You'll need them in case you want to troubleshoot or perform maintenance on your server later.

# space elevator

heavily based on the code from [streisand](https://github.com/StreisandEffect/streisand).

space elevator sets up a remote server that acts as your SSB identity. this allows you to run some of the SSB apps over SSH and the database is kept on the remote host. space elevator might be for people who fall into these categories:

- not enough space/power on personal computer to keep SSB running
- only computer is provided by work and don't want to (aren't allowed) to install SSB

## usage
before anything, you need to have `git`, `nvm` (node version manager), `pip`, and `python` (2.7)

you also need your ssh key present in `~/.ssh/id_rsa.pub`.

then, to provision a new space elevator server, run:

```shell
npx spel provision
```

it will ask about what platform to setup on and necessary auth keys, etc.

after it's done, you can access your server with:

```shell
ssh spaceman@<public ip>
```

the public IP of the server is saved in `~/.space-elevator/ip`.

and you can run a supported ssb app (like patchbay or scat) with this command:

```shell
npx spel patchbay

npx spel scat
```

### supported cloud providers
- amazon
- linode

### supported ssb apps
- patchbay
- scat (ssb-chat)

## cleanup
if you want to delete local remnants of a provisioning, run `npx spel cleanup`. this will not delete entities in the cloud -- that has to be done manually.

## license
MIT

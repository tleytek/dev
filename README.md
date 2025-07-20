# dev
ThePrimagens implementation but with my stuff

## Prerequisites for Devuan
### 1. Add yourself to the sudoers
- Login as root `su -`
- Add the user to the sudo group `usermod -aG sudo yourusername`
- Verify `groups yourusername`
- Logout and back in for the changes to take effect
### 2. Install git
- `sudo apt install git`
### (Bonus) Add ssh keys
- Generate a new SSH key `ssh-keygen -t ed25519 -C "your_email@example.com"`
- Spam enter for the defaults
- Start the SSH agent and add your key
```
  eval "$(ssh-agent -s)" \
  ssh-add ~/.ssh/id_ed25519
```
- Show and copy the public key output `cat ~/.ssh/id_ed25519.pub`
- Add the public key to what ever git hosting service you are using
- Test the connection `ssh -T git@github.com`, hit yes to add the key fingerprint

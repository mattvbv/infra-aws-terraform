#!/bin/bash

#
# Initial script to create users when launching an Ubuntu server EC2 instance
#

declare -A USERKEY

#
# Create one entry for every user who needs access. Be sure to change the key to their
# public key. The keys here are all my key.
#
USERKEY[matt]="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9tkbTmQS2yXhWiEFz+8XUebNx1qk+1NZwilxNaiYDM0EuecePTjWmWkLkL6OXUSrP3eZAG8dean+JgEeQctJUTigBhvfe7qNL4yy5aMABw7eMjE9b/ei02kOCXZmAFQgEF/5lE8tnVj1hzKGZrtU4h66M8DWD7zdCpW3V+QxyWZufH73ug40Bp+c52hcg3r6rDzWwlMki+NAYbdxtuoBYRZLiFjeUB+BmVGKbjnMlPPCT6uR6TV/q0R9KhbVUwAAl7epr3WgJulmxluUAu25f2jitxOmLalvvOPrKnL2jeqtwpTilFSY9NR/3L1y0AcSqNrp6osnbkG+vK5IS5Zyd matt@u130lx"

declare -A SUDOUSER

#
# Add one entry below for each user who needs sudo access.
# The usernames should be same as above.
#
SUDOUSER[matt]=y

# Iterate through all users (based on the associative array USERKEY)
for user in "${!USERKEY[@]}" ; do
  # Add the user (--gecos "" ensures that this runs non-interactively)
  useradd -b /home -m -s /bin/bash -K UID_MIN=2000 $user

  # Give read-only access to log files by adding the user to adm group
  # Other groups that you may want to add are apache, nginx, mysql etc. for their log files
  usermod -a -G adm $user

  # If the user needs sudo access, give that.
  if [ "${SUDOUSER[$user]}" == 'y' ] ; then
    # Give sudo access by adding the user to sudo group
    #usermod -a -G sudo $user
    # Allow passwordless sudo
    echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
  fi

  # Add the user's auth key to allow ssh access
  mkdir /home/$user/.ssh
  echo "${USERKEY[$user]}" >> /home/$user/.ssh/authorized_keys

  # Change ownership and access modes for the new directory/file
  chown -R $user:$user /home/$user/.ssh
  chmod -R go-rx /home/$user/.ssh
done

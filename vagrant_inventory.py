import os
import subprocess
import json

def get_vagrant_inventory():
    cmd = "vagrant status --machine-readable"
    output = subprocess.check_output(cmd, shell=True, universal_newlines=True)
    lines = output.strip().split('\n')

    inventory = {}
    for line in lines:
        fields = line.split(',')
        status = fields[3]
        name = fields[1]

        if status == 'running':
            inventory[name] = {
                'ansible_host': '192.168.0.32',
                'ansible_port': '22',
                'ansible_user': 'vagrant',
                'ansible_ssh_private_key_file': os.path.expanduser('~/.vagrant.d/insecure_private_key')
            }

    return inventory


def print_inventory():
    inventory = get_vagrant_inventory()
    print(json.dumps(inventory))


if __name__ == '__main__':
    print_inventory()
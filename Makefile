# This makefile is the user interface to jobs that the user may wish to carry
# out using virtual machines.

# This target builds a virtual hard disk file containing various open
# micromagnetics simulation technologies and other convenient packages.
full:
	ansible-playbook master.yml -c local -i localhost, -v -k --extra-vars="vm_name=virtualmicromagnetics-full playbook=provision_virtualmicromagnetics_full.yml hookbook=hook.yml extra_resources_dir=guest_resources/"

# This target builds a virtual hard disk file containing various open
# micromagnetics simulation technologies.
lite:
	ansible-playbook master.yml -c local -i localhost, -v -k --extra-vars="vm_name=virtualmicromagnetics-lite playbook=provision_virtualmicromagnetics_lite.yml hookbook=hook.yml extra_resources_dir=guest_resources/"

# This target builds a virtual hard disk file containing an OOMMF
# installation.
oommf:
	ansible-playbook master.yml -c local -i localhost, -v -k --extra-vars="vm_name=virtualmicromagnetics-oommf playbook=provision_virtualmicromagnetics_oommf.yml hookbook=hook.yml extra_resources_dir=guest_resources/"

# This target builds a virtual hard disk file containing a Magpar
# installation.
magpar:
	ansible-playbook master.yml -c local -i localhost, -v -k --extra-vars="vm_name=virtualmicromagnetics-magpar playbook=provision_virtualmicromagnetics_magpar.yml hookbook=hook.yml extra_resources_dir=guest_resources/"

# This target builds a virtual hard disk file containing a Nmag
# installation.
nmag:
	ansible-playbook master.yml -c local -i localhost, -v -k --extra-vars="vm_name=virtualmicromagnetics-nmag playbook=provision_virtualmicromagnetics_nmag.yml hookbook=hook.yml extra_resources_dir=guest_resources/"

# This target builds a virtual hard disk file containing a fidimag
# installation.
fidimag:
	ansible-playbook master.yml -c local -i localhost, -v -k --extra-vars="vm_name=virtualmicromagnetics-fidimag playbook=provision_virtualmicromagnetics_fidimag.yml hookbook=hook.yml extra_resources_dir=guest_resources/"

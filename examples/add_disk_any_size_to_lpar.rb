#
# Authors: Christopher M Wood (<woodc@us.ibm.com>)
#		   John F Hutchinson (<jfhutchi@us.ibm.com)
# © Copyright IBM Corporation 2015.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
# 
require_relative '../lib/rbvppc/hmc'
require_relative '../lib/rbvppc/lpar'
require_relative '../lib/rbvppc/vio'

frame_name = "rslppc09"
lpar_name  = "rslpl003"
vio1_name  = "rslppc09a"
vio2_name  = "rslppc09b"
hmc_fqdn    = ""
hmc_pass    = ""

#Create HMC Object
hmc = Hmc.new(hmc_fqdn, "hscroot", {:password => hmc_pass})

#Connect to HMC
hmc.connect

#Populate options hash with lpar information
lpar_hash = hmc.get_lpar_options(frame_name,lpar_name)

#Create LPAR Object based on the hash
lpar = Lpar.new(lpar_hash)

#Create a VIO object for both vios
vio1 = Vio.new(hmc,frame_name,vio1_name)
vio2 = Vio.new(hmc,frame_name,vio2_name)

#Get vSCSI Information
lpar_vscsi = lpar.get_vscsi_adapters

#Find the vHosts
first_vhost = vio1.find_vhost_given_virtual_slot(lpar_vscsi[0].remote_slot_num)
second_vhost = vio2.find_vhost_given_virtual_slot(lpar_vscsi[1].remote_slot_num)

#Attach a Disk
vio1.map_any_disk(first_vhost, vio2, second_vhost)

#Disconnect from the hmc
hmc.disconnect

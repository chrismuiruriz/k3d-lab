# K3D Labs

This repo holds the k3d labs for the Nairobi DevSecOps Bootcamp (NDSOBC). The directories are:

* infra/tf - terraform for a single ec2 instance (t3.2xl by default)
* infra/pkr - packer definition for ec2's ami
* apps/corpora - sample app
* platform/ingress - nginx ingress controller

You can run this on AWS using the terraform configuration in the `infra` folder, or you can just run it on your laptop (maybe -- if you have enough cores and ram). If you run it on your laptop, just run the provisioner script that is in the `infra/pkr` folder to locally install the tools you need. If you run it in aws, then we use packer build a new AMI with k3s and kubectl installed (and a bunch of other stuff too) and we use terraform to deploy that ami and do some other stuff to our aws environment. 

The makefile in the root of this project can start the k3s server and install the ingress controller and corpora. If you are in aws, then you may have to do a `git pull` in the copy of this repo to get the latest version though. That's because the packer script will clone this repo, and it may have been updated since you built the ami.

Once deployed locally, your services and apps will be available on http://localhost:30000 or https://localhost:30001 if you've configured tls for anything.

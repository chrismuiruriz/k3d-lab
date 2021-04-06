# K3D Labs

This repo holds the k3d labs for the Nairobi DevSecOps Bootcamp (NDSOBC). The directories are:

* infra/tf - terraform for a single ec2 instance (t3.2xl by default)
* infra/pkr - packer definition for ec2's ami
* apps/corpora - sample app
* platform/ingress - nginx ingress controller

This is similar to the k3s project in that we are standing up a kubernetes service in aws. We are building a new AMI with k3s and kubectl installed. The makefile in the root of this project can start the k3s server and install the ingress controller and corpora along with cloning this repo -- you may have to do a `git pull` in that repo to get the latest version though.

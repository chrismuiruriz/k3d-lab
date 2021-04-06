# K3D Labs

This repo holds the k3d labs for the Nairobi DevSecOps Bootcamp (NDSOBC). The directories are:

* infra/tf - terraform for a single ec2 instance (t3.2xl by default)
* apps/corpora - sample app
* platform/ingress - nginx ingress controller

This is similar to the k3s project in that we are standing up a kubernetes service in aws. We are reusing the bastion from the prior lab because I had already installed k3s using packer so its ready to use. The makefile in the root of this project can start the k3s server and install the ingress controller and corpora. It even has a target that will clone this repo on the bastion.

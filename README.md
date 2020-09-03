# [Xingpeds.com](https://xingpeds.com) website configuration

This repo is the configuration for my kubernetes cluster running my website.
All the yaml is in the kuber directory so to deploy the whole setup run

```fish
kubectl apply -f ./kuber
```

Provided the kuber folder also has the secrets needed. In fact to see a list of secret files missing from this repo see the .gitignore file. I am using kubernetes 1.17.9 because that is the highest GKE will go right now. The kubernetes ingress controller needs to be explicitly installed on a cluster. [Instrustrions for that](https://kubernetes.github.io/ingress-nginx/deploy/). I am using the kubernetes ignress controller because it works with GKE and minikube so the same config file works in both testing and production.

---

## Matrix

Dockerfile and text file for database setup. The homeserver.yaml file contains sensitive information. Thus is classified a secret and not included in this repo.
Also, the Dockerfile contains env vars specific to my installation. Change those if you want to use it for your own matrix server, and see the [synapse's docker hub page](https://hub.docker.com/r/matrixdotorg/synapse) for an example to generate a homeserver.yaml file

## Website

Dockerfile and html folder. This is just a stub/parking page. I am going to make some webapps which will be saved in their own git repo

## blog

I am using ghost for my blog. The base image with some environment variables works out of the box so it does not need a Dockerfile.
It was very tempting to create an image that is already setup with a username and password, so the main site doesn't even have a minute of an uninstalled ghost image.
This required a lot more effort than it was worth. However, now I need to make sure my mysql database and ghost install images in production are backed up. Easy to do in google cloud console.

## Building

The fish build script requires a file called project_ids that just has some environment variables to tag the docker images with the correct registery and repo. I hope to setup some sort of CI/CD pipeline.
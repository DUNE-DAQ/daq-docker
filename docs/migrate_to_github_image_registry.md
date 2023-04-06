# Migrating images from DockerHub to GitHub

## Push the image to GitHub Container Registry for the first time

The migration of images from Dockerhub to GitHub can be done by following the steps below:
1. Re-tag Dockerhub image name, e.g. `dunedaq/alma9-minimal:latest` to `ghcr.io/dune-daq/alma9-minimal:latest`;
2. Push the image to `ghcr.io` with `docker push ghcr.io/dune-daq/alma9-minimal:latest`;
    - If it is the first time the image is pushed to `ghcr.io`, regardless of the labels, you will need to ask GitHub DUNE-DAQ org admins to do the push; 
    - This step requires authentication to the GitHub's Container Registry. More details can be found [here](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-in-a-github-actions-workflow);
3. Go to the package settings page in a browser, e.g. https://github.com/orgs/DUNE-DAQ/packages/container/package/alma9-minimal, and change the following settings:
    - In "Manage Actions access" section, add repositories you would like to have CI jobs pull (read) or push (write) the image;
    - In "Manage access" section, add users or teams to the list with `read` or `write` permission;
    - In the "Danger Zone", "Change package visibility" to "public" (this applies to most, if not all, of our images).

## Use images hosted on GitHub

- If you are not on NP04 cluster, you can pull the image as simple as `docker pull ghcr.io/dune-daq/<image-name>:<label>`. 
- If you are on a node within NP04 cluster, you may need to use the Harbor proxy. 
  - Details can be found [here](https://hackmd.io/hLvDnTFEQBmQdjCBFwESTg). 
  - In short, the images can be pulled down like `docker pull np04docker.cern.ch/ghcr/dune-daq/<image-name>:<label>` (replace `docker` with `ctr` on nodes without docker installed).

## Push updated versions or new labels of the image to GitHub

Each image is treated as a GitHub package. You can see a list of images or packages [here](https://github.com/orgs/DUNE-DAQ/packages) or by going to the home page of `DUNE-DAQ` org in GitHub, and clicking the `packages` tab. If the image is listed, and you have "write" access to it (typically you are a member of a team which has "write" access), you can authenticate to the registry using your GitHub token, and then push the image. More details about the authentication can be found [here](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-in-a-github-actions-workflow). You may need to use the np04 web proxy if you are on a node within the NP04 cluster.







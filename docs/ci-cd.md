# Continuous Integration & Continuous Deployment

## How It Works
![Image of Architecture](/docs/figs/architecture.png)
Our architecture utilizes a Continuous Integration (CI) system known as Travis CI. It also utilizes a Continuous Deployment (CD) system, which is built on top the CI system. Once the CI system deems that a branch is ready to be merged and all developers approve it, Git Hooks will deploy these successfully tested artifacts to DockerHub and SingularityHub.

The testing process itself runs our containerized Bluesky Framework System and compares the output data from the container to the output data from the Bluesky Framework System that is currently running as an Ubuntu Server on the Aeolus High Performance Computing Cluster. These tests are run automatically any time that commits are pushed to a branch or pull requests are made against another branch. This ensures that all changes do not affect the output of the system when moved into the production environment.

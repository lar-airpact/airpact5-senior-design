# airpact5-senior-design

## Description
This repository contains the work for Broken Tooth's senior design capstone project (CptS 421/423 at Washington State University).

Overall, it's documentation of the process to containerize the BlueSky Framework and the *new* development process (testing, CI/CD, etc.). This repository also includes a few basic tutorials.

## Repository Guide
This is a brief explanation of the contents of the repository.

#### docs
This section summarizes [the importance of the work we did this semester](/docs/final-report.pdf) and discusses importance information like:
- [continous integration & continous deployment](/docs/ci-cd.md)
- [our testing infrastructure](/docs/testing.pdf)

#### help
Guides on how to do all basic tasks necessary for this project. Specifically, we have guides on:
- [running a cronjob](/help/crontab/readme.md)
- [how to build and run a (constrained) Docker image](/help/docker/readme.md)
- [a funny cli tool we discovered to mess around with your friends](/help/foaas/readme.md)
- [a git guide](/help/git/readme.md)
- [scp guide using ssh tunneling](/help/scp/readme.md)
- [building and running a Singularity image](/help/singularity/README.md)
- [running a Torque job on Aeolus](/help/torque/serial/readme.md)
- [running a parallelized Torque job on Aeolus](/help/torque/parallel/readme.md)

#### replace-bluesky
All work, scripts, and documentation for replacing the BlueSky Server with an official Singularity Image of BlueSky on Aeolus HPCC. For the ultimate guide, check [here](/replace-bluesky/README.md)

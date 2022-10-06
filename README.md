Group members: Ahsan Sabir, Prakash Thapa, Harry Hetherington, Anas Sumrani

## Project aim 
The aim of the project is to deploy the applications  "Sprint Pet Clinic Domain".

https://github.com/spring-petclinic/spring-petclinic-angular

https://github.com/spring-petclinic/spring-petclinic-rest

This project is built using two components: a frontend (using AngularJS) and a backend (using Java). 

## Kanban Board
![kanban](https://user-images.githubusercontent.com/92265482/194328928-90736a97-180c-4eae-88df-43bb5fb29728.JPG)
To track the creation of a CI/CD pipeline we used a Trello Kanban Board (which enforces the use of agile methodology). The project was initially broken down into multiple different tasks (which were further broken down into mini tasks) and each task was ordered depending on its importance to deliver a final finished product (and we took into account Moscow Prioritization).  

![kanban2](https://user-images.githubusercontent.com/92265482/194328974-bb013ff2-2f4b-46ab-ae48-2df9f423e99a.JPG)

Each task was initially kept in the product backlog (which were ordered depending on their importance). Then each task was assigned to group members by the scrum master within the project. The sprint backlog was limited to only 3 tasks at a time - ensuring that the more important tasks were proactively being done and completed. 

Once a task was completed, it would sit inside the review stage - this was mainly to ensure that it worked within our Jenkins pipeline and ensured that the task was completed at a high standard (and once this initial test was passed it would then be dragged to completed).

[Click here for kanban board](https://trello.com/invite/b/on6fy1De/0022b5ed00bf3928d4dc165fbf1b3fe2/project)

## Risk assessment 

![riskassessment](https://user-images.githubusercontent.com/92265482/194329289-6fc0df18-6e0e-4cef-bd33-8441cb07b9d6.JPG)

This is a risk assessment we conducted, reviewing all the potential risks in this project. We used the standard template which states out risk, explanation, likelihood, impact level, response and control measure. Likelihood means how likely it is that this risk will take place and the impact level states the impact it would have. Response is what we will do if this risk was to occur and control measure is what we are going to do to avoid it. 
 
[Click here for risk assessment](https://docs.google.com/spreadsheets/d/1_5DWAySKbS2vFYf7Z5W6cZ9d73s2_Rli_U_BB3_jfsk/edit#gid=0)

## Architecture
- Trello
- AWS
- Ansible
- Git
- Docker
- Terraform
- Kubernetes
- Jenkins
- Nginx

The project was initially within two different repositories (was split into a frontend and a backend repository, can be seen from the links above). Therefore each repository was cloned down and was given a specific folder within our own repository - which can be seen from above, the content of each application were in there own respective frontend and backend folder. This final repository was then forked by each member of our group, which ensured any work done on the project was done in its own isolated environment (and thus we were not disturbing the main code base).  The version control system used within this project was git and held in a github repository.

The main focus of the project was to create a CI/CD pipeline, which would automate the building and deployment of a given application. To achieve this CI/CD pipeline, we had an instance ready in AWS which would run our Jenkins build, and each build would be triggered by a push commits to the branch test.  The Jenkins VM was set to test the application, and to start or make changes to our kubernetes service (kubernetes was used to deploy the application).

Within this project we used a configuration management tool, which would automate the steps needed for the application to be deployed using Kubernetes. It mainly handled the installation of packages and softwares (i.e. docker compose), any software needed to test the application (i.e. chrome browser), build and push docker images that were built to docker hub. By using Ansible we have automated the configuration of our Jenkins VM, this makes it easier for us to scale up our Jenkins environment (especially important if our Jenkins VM goes down) and two reduces the time spent installing and updating software needed for the project to be deployed.  

Our main architecture for deployment was Kubernetes, which is a container orchestration system used for automating software deployment, scaling and management. The way the application was set, each image (frontend, backend and nginx) would run in its own pod (i.e. in its own VM/Environment) and the user would need to interact with a load balancer. This would disperse the http request to one of the pods available (and thus reducing the strain on the application and consequently a vm). The main cluster was created using eksctl (is a command line tool that allows us to create and interact with kubernetes clusters), however we have also added another alternative to create such clusters, known as Terraform.   

![kubern](https://user-images.githubusercontent.com/92265482/194329760-0fe6fe63-d149-4722-9fc2-aed32e7c7a73.JPG)

The main purpose of creating multiple clusters using a tool like Terraform, is so that the instacture used to host the application is reproducible in different locations (i.e. making it more accessible to users around the world), and or in case of failure of our current cluster .

Overall architecture can be seen below:

![architecture](https://user-images.githubusercontent.com/92265482/194329973-e2fb61cd-7244-4e7d-a321-3f63dccd9121.JPG)

## Tests
The testing phase was already built into the application, therefore our job was to implement this into our pipeline. From the image below, you can see a successful test being built and run using Jenkins.

![test-build](https://user-images.githubusercontent.com/92265482/194330248-283f3cd7-fe61-4815-87d3-5dfd5142d50a.JPG)

![test-finish](https://user-images.githubusercontent.com/92265482/194330264-f8f03e5c-3f8f-47a6-9132-d718109891dd.JPG)

## Application
The application was deployed in 2 different regions. One was deployed in the region eu-west2 and the other one was deployed in eu-west-3 to make it easier for people living in different areas to have easier access to it. It was deployed using the kubernetes cluster.

![web](https://user-images.githubusercontent.com/92265482/194330833-a6693ddf-b5ac-43cf-bea1-717dd92f44e9.JPG)

This application was hosted in a cluster built in the eu-west-2 region.
![web1](https://user-images.githubusercontent.com/92265482/194330786-a35c0cb5-20a6-4a33-b590-974895b6c23e.JPG)

This application was hosted in a cluster built in the eu-west-3 region.
![web2](https://user-images.githubusercontent.com/92265482/194330800-2bbc5d91-5d74-4389-a5db-708c46771ad0.JPG)

## Future
For future work on what could be improved. We can add a mysql database to the application so that the application could be fully functioning and data could be stored and saved.

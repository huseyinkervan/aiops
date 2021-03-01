# Local Development Kubernetes Cluster, Minikube and Scaffold.

This application automates building a local development Kubernetes cluster to standardize development environments. It consists of a simple containerized python application and MySQL. It is designed for Linux and Mac with **docker** installed.

To install required packages run the command below.
```
./installation.sh
```
>run **chmod +x installation.sh** if you get permission denied error.

It installs applications listed below based on your OS.

* minikube
    * Visit https://kubernetes.io/docs/tasks/tools/#minikube full documentation, examples and guides.
* kubectl
    * Visit https://kubernetes.io/docs/tasks/tools/#kubectl full documentation, examples and guides.
* skaffold
    * Visit https://skaffold.dev/ full documentation, examples and guides.


![GitHub Logo](/images/terminal.png)

>To stop and delete environment press **CTRL+C**

Skaffold watches your changes and when you change your code and save it, it automatically builds and pushes to the **kubernetes** cluster.

Skaffold forwards Kubernetes resources on your cluster to your local machine port. Open http://localhost:3000 in your browser to see your app.

![GitHub Logo](/images/localhost.png)

Also, MySQL is reachable at localhost port 3306

All resources will be deleted if you press **CTRL+C** except persistent volume and persistent volume claim that stores MySQL data.

After the first installation, there is no need to run ./installation.sh, but it does not affect your environment if you run ./installation.sh again.

Use **skaffold dev** to build and deploy your app every time your code changes

Use **skaffold run** to build and deploy your app once, similar to a CI/CD pipeline

Use **skaffold delete** to delete your environment.

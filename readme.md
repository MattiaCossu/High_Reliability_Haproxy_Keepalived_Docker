
# Table of Contents

1.  [Load Balancing and Failover Project with Docker Compose](#orge23f11d)
    1.  [Description](#org78619ad)
    2.  [Project Structure](#orgc53a36f)
    3.  [Technologies Used](#org81d4c7d)
        1.  [Docker Compose](#org9c75488)
        2.  [Keepalived](#orgddb179c)
        3.  [HAProxy](#org285d719)
        4.  [Nginx](#org8af1c02)
    4.  [Implementation Choices](#org1268c2c)
        1.  [Failover Strategy](#orga34ec96)
        2.  [Load Balancing](#org9351244)
        3.  [Containerization](#org8cf01ca)
    5.  [Usage](#org63f51ca)
        1.  [Environment](#org18e1c88)
        2.  [Project Setup](#orga443fcf)
        3.  [Testing Failover and Load Balancing](#org5e02eb3)
    6.  [Customization](#org37daf01)



<a id="orge23f11d"></a>

# Load Balancing and Failover Project with Docker Compose

This project showcases a load balancing and failover implementation using `Docker Compose`, `Keepalived`, and `HAProxy`.


<a id="org78619ad"></a>

## Description

The purpose of the project is to realize the following network:
![img](./pics/topologia.png)

The project comprises several Docker containerized services:

-   `keepalived-a` and `keepalived-b`: Two Keepalived instances configured for virtual IP failover.
-   `haproxy-a` and `haproxy-b`: Two HAProxy instances configured for load balancing across web servers.
-   <span class="underline">web-a</span> and <span class="underline">web-b</span>: Two Nginx (in this case, feel free to put any web serevr) web servers configured to host static content.


<a id="orgc53a36f"></a>

## Project Structure

The `docker-compose.yml` file defines the Docker service configuration and associated networks. The main services include:

-   `Keepalived`: Two instances set up to monitor server states and manage the virtual IP for failover.
-   `HAProxy`: Two instances configured to balance traffic load across web servers.
-   `Web Servers`: Two Nginx instances configured to host static content.

Following is the project tree:

    .
    ├── docker-compose.yml
    ├── Dockerfile
    ├── haproxy
    │   └── haproxy.cfg
    ├── keepalived
    │   ├── notify.sh
    │   ├── proxy-a
    │   └── proxy-b
    └── web
        ├── server-a
        └── server-b


<a id="org81d4c7d"></a>

## Technologies Used


<a id="org9c75488"></a>

### Docker Compose

Docker Compose is utilized for defining and running multi-container Docker applications. It simplifies the process of managing multiple interconnected containers.


<a id="orgddb179c"></a>

### Keepalived

Keepalived is used for high availability by providing failover capability with the virtual IP. It ensures continuous service availability by shifting traffic in case of a server failure.


<a id="org285d719"></a>

### HAProxy

HAProxy is employed as the load balancer to distribute incoming traffic across multiple web servers. It helps in optimizing resource usage and ensuring high performance by efficiently routing requests.


<a id="org8af1c02"></a>

### Nginx

Nginx serves as the web server to host static content in this setup. It's known for its high performance, stability, and low resource consumption.


<a id="org1268c2c"></a>

## Implementation Choices


<a id="orga34ec96"></a>

### Failover Strategy

Keepalived was chosen due to its simplicity and robustness in managing failover scenarios. It ensures continuous service availability by monitoring server states and diverting traffic when necessary.


<a id="org9351244"></a>

### Load Balancing

HAProxy was selected for load balancing because of its efficiency in evenly distributing incoming traffic across multiple servers. This aids in preventing overloading of individual servers and ensures better resource utilization.


<a id="org8cf01ca"></a>

### Containerization

Docker was chosen to containerize services for portability, scalability, and ease of deployment. It encapsulates each service, ensuring consistency across different environments.


<a id="org63f51ca"></a>

## Usage


<a id="org18e1c88"></a>

### Environment

For testing purposes and to comply with the configurations without making changes we recommend creating a VM (with hypervisor like VMWare or VirtualBox) in NAT with network 192.168.150.\*


<a id="orga443fcf"></a>

### Project Setup

To start the project, execute the following command in the project's root directory:

    docker-compose up -d

This command initiates all services defined in the docker-compose.yml file in the background.


<a id="org5e02eb3"></a>

### Testing Failover and Load Balancing

Access the web servers via the configured virtual IP address (e.g., 192.168.195.150:80).

    ┌──(kali㉿kali)-[~/App/TestCLE]
    └─$ curl http://192.168.195.150
    Server A
    
    ┌──(kali㉿kali)-[~/App/TestCLE]
    └─$ curl http://192.168.195.150
    Server B

Test the system's resilience by simulating the loss of a web server or HAProxy instances stopping them.


<a id="org37daf01"></a>

## Customization

Tailor the project by adjusting configurations specific to each service in their respective configuration files.

<span class="underline">A thank you to the creators of this project</span>:

-   [@Disturbante](https://github.com/Disturbante)
-   [@AleHelp](https://github.com/AleHelp)
-   [@MattiaCossu](https://github.com/MattiaCossu)


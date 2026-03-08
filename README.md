
    ## ✔ Architecture

                    YOUR PC (kubectl / terraform)
                              |
                              |  HTTPS :443
                              |
                       ┌──────────────────┐
                       │  EKS ControlPlane│
                       │  eks-free-tier   │
                       │ (Managed by AWS) │
                       └────────┬─────────┘
                                |
                 ----------------------------------
                 |                                |
          eu-north-1a                        eu-north-1b
                 |                                |
    ┌────────────────────┐         ┌────────────────────┐
    │   Private Subnet   │         │   Private Subnet   │
    │   10.0.1.0/24      │         │   10.0.2.0/24      │
    └─────────┬──────────┘         └─────────┬──────────┘
              |                                |
      (optional node)                  WORKER NODE
                                       t3.micro
                                       i-0012772f0cadf2b2d
                                       IAM: eks-node-role
                                       Private IP: 10.0.2.182
                                       AutoScalingGroup
                                       └─────────────┐
                                                     |
                                               Grafana Pod
                                               NodeExporter Pod
                                               Prometheus Pod
                                |
                                |
                       pulls images / bootstrap
                                |
                                v
                      ┌────────────────────┐
                      │   NAT Gateway      │
                      │  Elastic IP        │
                      │  13.63.102.201     │
                      └─────────┬──────────┘
                                |
                                |
                             Internet


---

## ✔ What this project does

This project creates:

- VPC with public/private subnets  
- NAT Gateway  
- EKS Cluster  
- Managed Node Group with t3.micro (Free-tier)  
- Grafana, Prometheus, and Node Exporter for monitoring  

All using **Terraform** and deployed via **kubectl**.

---

## ✔ Tech Stack

- Terraform  
- AWS  
- EKS  
- EC2  
- VPC  
- kubectl  

---

## ✔ How to deploy

```bash
terraform init
terraform plan
terraform apply

✔ Access cluster

aws eks update-kubeconfig --region eu-north-1 --name eks-free-tier
kubectl get nodes

✔ Access Grafana

kubectl port-forward svc/grafana 3000:3000 -n monitoring

http://publicIP:3000

## Features

Automated VPC and EKS cluster setup with Terraform.

Managed Node Group with Free Tier EC2 instances.

Monitoring stack with Grafana dashboards, Prometheus metrics, and Node Exporter.

Supports multi-AZ private subnets for high availability.

Easy access and management using kubectl and aws eks update-kubeconfig.



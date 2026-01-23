# 🚀 Laboratório DevOps: Do Docker à Orquestração

Bem-vindo ao meu **Laboratório DevOps**. Este repositório documenta minha jornada prática de aprendizado, saindo de aplicações locais até ambientes complexos, automatizados e escaláveis na nuvem.

O objetivo é simular cenários reais de engenharia de software e infraestrutura, evoluindo o mesmo projeto através de 4 fases distintas de maturidade DevOps.

---
### ✨ Créditos e Inspiração

Este projeto foi desenvolvido seguindo o roteiro de estudos e laboratórios práticos disponibilizados por **[Maria Lázara](https://github.com/marialazara)**.
Todo o fluxo foi executado com base na metodologia ensinada por ela.

---

## 🗺️ Roadmap do Laboratório

O projeto consiste em evoluir um website estático através das seguintes etapas:

| Fase | Projeto | Tecnologias Chave |
|------|---------|-------------------|
| **01** | **Containerização e Deploy Manual na AWS** | Docker, ECR, EC2, Linux, Nginx |
| **02** |  |  |
| **03** |  |  |
| **04** |  |  |

---

## 📂 Detalhes dos Projetos

### [Projeto 1: Containerização e Deploy Manual](./projeto-1)
> *Para ver a documentação técnica completa e passo-a-passo deste projeto, acesse a pasta fase-01*

Nesta primeira fase, o foco foi entender os fundamentos da containerização e como a nuvem interage com containers sem camadas de abstração complexas. O objetivo foi pegar uma aplicação web simples (HTML/CSS/JS) e colocá-la no ar na AWS "na unha".

#### 🏗️ Arquitetura Implementada
O fluxo construído foi:
1.  **Local:** Criação de Imagem Docker com Nginx Alpine.
2.  **Registry:** Upload da imagem para o Amazon ECR (Elastic Container Registry).
3.  **Compute:** Provisionamento manual de uma instância EC2 (Amazon Linux 2023).
4.  **Deploy:** Pull da imagem e execução do container na EC2.

#### 🧠 O que aprendi e apliquei:
* **Docker:** Criação de `Dockerfile` otimizado, comandos de build, tag e run, e mapeamento de portas.
* **AWS CLI:** Configuração de credenciais e autenticação via terminal.
* **Amazon ECR:** Criação de repositórios privados e gerenciamento de imagens (push/pull).
* **Segurança (IAM & Security Groups):** Criação de Roles para permitir que a EC2 acesse o ECR sem chaves hardcoded e configuração de firewall para liberar tráfego HTTP/SSH.
* **Linux/EC2:** Instalação do Docker engine em ambiente Linux e gerenciamento de permissões de usuário.

---

## 🛠️ Tecnologias Utilizadas no Laboratório
* **Cloud:** AWS (EC2, ECR, IAM, VPC)
* **Containers:** Docker, Docker Compose
* **OS:** Linux (Amazon Linux 2023, Alpine)
* **Web Server:** Nginx
* **Tools:** AWS CLI, VS Code, Git

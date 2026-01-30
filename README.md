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
| **02** | **Infraestrutura como Código (IaC) com Terraform** | Terraform, HCL, AWS (EC2, ECR, S3) |
| **03** | **Automação de IaC com GitHub Actions** | GitHub Actions, YAML, Terraform |
| **04** | **CI/CD de Aplicação e Deploy Automatizado** | GitHub Actions, Docker, SSH, CI/CD |

---

## 📂 Detalhes das Fases

### [Fase 1: Containerização e Deploy Manual](./fase-01)

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

### [Fase 2: Automatização de Infraestrutura com Terraform](./fase-02)

Nesta fase, o desafio foi eliminar o processo manual de criação de recursos no console da AWS. O objetivo foi aplicar o conceito de **Infrastructure as Code (IaC)**, garantindo que todo o ambiente fosse provisionado de forma automática, replicável e versionada.

#### 🏗️ Arquitetura Implementada
O fluxo de trabalho evoluiu para:
1.  **Definição:** Escrita dos arquivos de configuração em HCL.
2.  **Planejamento:** Uso do `terraform plan` para validar e visualizar as mudanças antes da execução real.
3.  **Provisionamento:** Execução automatizada para criar ECR, S3, Security Groups e a instância EC2.

#### 🧠 O que aprendi e apliquei:
* **Terraform CLI:** Ciclo de vida essencial através dos comandos `init`, `plan`, `apply` e `destroy`.
* **State Management:** Entendimento do funcionamento do `terraform.tfstate` para manter o rastreio da infraestrutura real.
* **Automação de Rede e Segurança:** Provisionamento automatizado de grupos de segurança e regras de entrada/saída.
* **Reprodutibilidade:** Capacidade de destruir e recriar todo o ambiente do projeto em minutos com comandos simples.

---

### [Fase 3: Provisionamento de IaC com GitHub Actions](./fase-03)

Nesta fase, o foco foi eliminar a necessidade de intervenção manual no terminal local para gerenciar a infraestrutura. Implementei um pipeline de **CI/CD** que automatiza todo o ciclo de vida do Terraform, garantindo padronização, auditoria e segurança no provisionamento dos recursos na AWS.

#### 🏗️ Arquitetura Implementada
O fluxo de automação foi estruturado em um arquivo de workflow (`iac.yaml`):
1.  **Gatilho (Workflow Dispatch):** Execução manual controlada via interface do GitHub, permitindo escolher entre aplicar ou destruir a infraestrutura.
2.  **Autenticação Segura (OIDC):** Configuração de relação de confiança entre GitHub e AWS, eliminando a necessidade de chaves fixas (`access keys`) no repositório.
3.  **Pipeline Steps:** 
    * **Checkout & Setup:** Preparação do ambiente no runner (Ubuntu).
    * **Init & Validate:** Inicialização do backend e validação sintática do código HCL.
    * **Plan:** Geração de um arquivo de plano (`tfplan`) para visualização das mudanças.
    * **Apply/Destroy:** Execução das alterações com base nos inputs fornecidos pelo usuário.

#### 🧠 O que aprendi e apliquei:
* **GitHub Actions:** Estruturação de workflows complexos utilizando sintaxe YAML.
* **Segurança Avançada (Least Privilege):** Uso de IAM Roles específicas e autenticação via OIDC.
* **Automação de Pipelines:** Criação de lógica condicional para execução de comandos `apply` ou `destroy`.
* **Padronização de Ambiente:** Garantia de que a infraestrutura é provisionada sempre em um ambiente isolado e controlado (GitHub Runners).

---

### [Fase 4: CI/CD de Aplicação e Deploy Automatizado](./fase-04)

Nesta fase final, o objetivo foi fechar o ciclo de entrega. Se na fase anterior automatizamos a "casa" (infraestrutura), aqui automatizamos a "mudança" (o código). Implementei um pipeline que detecta alterações no código-fonte, reconstrói a imagem e atualiza o servidor automaticamente.

#### 🏗️ Arquitetura Implementada
O fluxo de automação foi dividido em duas frentes:
1.  **CI (Integração Contínua):** Build da imagem Docker baseada no novo código e Push automático para o Amazon ECR, utilizando tags para versionamento.
2.  **CD (Entrega Contínua):** O pipeline se conecta de forma segura à instância EC2 via SSH, realiza o `docker pull` da nova imagem e reinicia o container com a versão atualizada.

#### 🧠 O que aprendi e apliquei:
* **GitHub Secrets:** Gerenciamento seguro de informações sensíveis, como chaves privadas SSH (.pem) e credenciais AWS, protegendo os dados de acesso.
* **Automação de Deploy Remoto:** Execução de comandos em servidores distantes diretamente através do GitHub Actions.
* **Ciclo de Vida de Imagens:** Estratégias de taggeamento e atualização de containers sem a necessidade de recriar a instância EC2.
* **Segurança (OIDC & SSH):** Reforço da política de "Least Privilege" (Menor Privilégio) para que o pipeline tenha acesso apenas ao necessário para o deploy.

---

* ## 🛠️ Tecnologias Utilizadas no Laboratório
* **Cloud:** AWS (EC2, ECR, IAM, VPC, S3)
* **Containers:** Docker, Docker Compose
* **IaC:** Terraform
* **CI/CD:** GitHub Actions
* **OS:** Linux (Amazon Linux 2023, Alpine, Ubuntu)
* **Web Server:** Nginx
* **Tools:** AWS CLI, VS Code, Git

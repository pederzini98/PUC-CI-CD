# Objetivo do projeto
Testar a eficácia do copilot para criar uma api simples, configurar um terraform junto a aws, os arquivos de deploy e realizar a documentação

# Rodando o projeto localmente

## Pré-requisitos

- Node.js instalado (versão 20 ou superior)
- npm instalado

## Passos

1. Clone o repositório:

   ```
   git clone <URL-do-repositório>
   cd <nome-do-repositório>
   ```

2. Instale as dependências:

   ```
   npm install
   ```

3. (Opcional) Crie um arquivo `.env` na raiz do projeto para variáveis de ambiente.

4. Inicie a aplicação:

   ```
   npm start
   ```

5. Acesse [http://localhost:3000/status](http://localhost:3000/status) para verificar se


## Como funciona a infraestrutura

A infraestrutura do projeto é provisionada automaticamente na AWS utilizando o Terraform. Ela é composta por três principais recursos:

1. **Instância EC2 (máquina virtual):**  
   Utilizada para hospedar e executar a API Node.js. Após o provisionamento, você pode acessar a instância via SSH para instalar dependências e rodar a aplicação.

2. **Grupo de Segurança:**  
   Controla o acesso à instância EC2. Está configurado para liberar a porta 80 (HTTP), permitindo que a API seja acessada publicamente, e a porta 22 (SSH) para deploy e manutenção.

3. **Bucket S3:**  
   Utilizado para armazenamento de arquivos, logs ou outros dados que a aplicação possa precisar.

O provisionamento é feito executando os comandos `terraform init` e `terraform apply` na pasta do projeto. Após isso, o endereço público da instância EC2 e o nome do bucket S3 são exibidos como outputs.

O deploy da API é realizado automaticamente via GitHub Actions. Sempre que há um push para a branch `main`, o workflow conecta na instância EC2 via SSH, atualiza o código, instala as dependências e reinicia a aplicação.

Essa abordagem garante que a infraestrutura e o deploy sejam automatizados, seguros

## Como funciona o CI/CD

O processo de CI/CD (Integração Contínua e Entrega Contínua) deste projeto é automatizado utilizando o GitHub Actions. Sempre que há uma alteração na branch `main`, o workflow de deploy é acionado automaticamente. O fluxo funciona assim:

1. **Integração Contínua (CI):**
   - O código é baixado do repositório.
   - As dependências do Node.js são instaladas.
   - O projeto é construído (se necessário).
   - Testes podem ser executados (caso configurados).

2. **Entrega Contínua (CD):**
   - O workflow conecta via SSH na instância EC2 provisionada pela infraestrutura Terraform.
   - O código da API é atualizado na máquina (via `git pull`).
   - As dependências são instaladas na EC2.
   - A aplicação é reiniciada usando o PM2.

Esse processo garante que toda alteração enviada para o repositório seja automaticamente publicada na infraestrutura AWS, mantendo o ambiente sempre atualizado e
# 🧾​ Food Core Database

Banco de dados de pedidos e usuários para restaurantes fast-food, desenvolvida como parte do curso de Arquitetura de Software
da FIAP (Tech Challenge).

<div align="center">
  <a href="#visao-geral">Visão Geral</a> •
  <a href="#tecnologias">Tecnologias</a> •
  <a href="#banco-de-dados">Banco de Dados</a>
  <a href="#cicd-infra">Governança e Fluxo de Deploy</a>
</div><br>

## 📖 Visão Geral

Este repositório contém os scripts de criação e evolução do **banco de dados PostgreSQL** utilizado pela aplicação **FoodCore API**.
Ele é provisionado no **Azure Database for PostgreSQL** via **Terraform** e estruturado para suportar o fluxo de pedidos, produtos, clientes e administração.

### Principais recursos

<h2 id="tecnologias">🔧 Tecnologias</h2>

- **Azure Cloud**
- **PostgreSQL (Azure Database)**
- **Terraform**
- **GitHub Actions** para CI/CD

### Recursos provisionados

- **Azure PostgreSQL Flexible Server**
- **Network security group para o banco de dados**

### Recursos delegados pelo repo de infra

- **Subnet delegada**
- **Zona de DNS privada**

### Observações

- Não foram configurados **backups customizados** ou **alta disponibilidade (HA/ZRS)** devido a limitações de crédito e ao caráter acadêmico da atividade.
- Os **scripts de migration** estão no repo da **API** (e não no repo de DB), pois sobem junto com a aplicação.
- Utilizamos **Liquibase** para gerenciar migrations.

<h2 id="banco-de-dados">💾 Banco de Dados</h2>

### Modelo Relacional

O sistema utiliza PostgreSQL como banco de dados principal, com o seguinte esquema:

![Diagrama Entidade e Relacionamento](docs/diagrams/DER.svg)

## 🔧 Justificativa da Modelagem

- Separação entre `orders` e `order_items` garante flexibilidade para combos.
- Índices otimizam consultas de acompanhamento.
- Enum padroniza categorias e status, evitando inconsistências.
- Estrutura segue **3FN (Terceira Forma Normal)** → evita redundância e melhora escalabilidade.

</details>

<h3 id="cicd-infra">🔐 Governança e Fluxo de Deploy de Infraestrutura</h3>

A gestão da infraestrutura segue um processo **automatizado, auditável e controlado** via **Pull Requests** no repositório de provisionamento.
Esse fluxo garante segurança, rastreabilidade e aprovação formal antes de qualquer mudança aplicada em produção.

---

### ⚙️ Processo de Alterações

1. **Criação de Pull Request**
   - Todas as alterações de infraestrutura (novos recursos, updates, ou ajustes de configuração) devem ser propostas via **Pull Request (PR)**.
   - O PR contém os arquivos `.tf` modificados e uma descrição detalhando o impacto da mudança.

2. **Execução Automática do Terraform Plan**
   - Ao abrir o PR, o pipeline de CI executa automaticamente o comando:

     ```
     terraform plan
     ```

   - Esse passo gera uma **prévia das alterações** que seriam aplicadas (criações, destruições, atualizações).
   - O resultado do `plan` é exibido diretamente nos logs do pipeline, permitindo revisão técnica pelos aprovadores.

3. **Revisão e Aprovação**
   - O repositório é **protegido**, exigindo no mínimo **2 aprovações** antes do merge.
   - Nenhum usuário pode aplicar alterações diretamente na branch principal (`main` ou `master`).
   - Revisores devem garantir:
     - Que o `plan` não tenha destruições indevidas (`destroy`)
     - Que as variáveis e roles estejam corretas
     - Que os módulos sigam o padrão organizacional

4. **Aplicação no Merge**
   - Após aprovação e merge do PR, o pipeline executa automaticamente:

     ```
     terraform apply -auto-approve
     ```

   - O **Terraform Apply** aplica as alterações descritas no `plan` aprovado, provisionando ou atualizando os recursos no Azure.

---

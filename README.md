# 🧾​ Food Core Database

Banco de dados de pedidos e usuários para restaurantes fast-food, desenvolvida como parte do curso de Arquitetura de Software
da FIAP (Tech Challenge).

<div align="center">
  <a href="#visao-geral">Visão Geral</a> •
  <a href="#tecnologias">Tecnologias</a> •
  <a href="#banco-de-dados">Banco de Dados</a>
</div><br>

> 📽️ Vídeo de demonstração da arquitetura: [https://www.youtube.com/watch?v=soaATSbSRPc](https://www.youtube.com/watch?v=XgUpOKJjqak)<br>

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

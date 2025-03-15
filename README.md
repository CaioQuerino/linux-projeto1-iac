# Linux - Projeto 1: Infraestrutura como Código

Este projeto consiste em scripts Bash para automatizar a criação de uma infraestrutura de diretórios, grupos, usuários e permissões no Linux. O objetivo é facilitar o provisionamento de ambientes em máquinas virtuais ou servidores Linux, garantindo que toda a estrutura necessária seja criada de forma rápida e consistente.

## Scripts

O projeto contém dois scripts principais:

1. **`criar_estrutura.sh`**:
   - Cria a estrutura de diretórios.
   - Cria grupos e usuários.
   - Define permissões de acesso para os diretórios.

2. **`apagar_users_groups.sh`**:
   - Remove os diretórios, grupos e usuários criados pelo script `criar_estrutura.sh`.
   - Útil para limpar o ambiente após testes ou quando a infraestrutura não é mais necessária.

## Estrutura de Diretórios

O script `criar_estrutura.sh` cria a seguinte estrutura de diretórios:

```
estrutura/
├── publico/ # Permissão 777 (todos podem ler, escrever e executar)
├── adm/ # Permissão 770 (dono e grupo GRP_ADM têm permissão total)
├── ven/ # Permissão 770 (dono e grupo GRP_VEN têm permissão total)
└── sec/ # Permissão 770 (dono e grupo GRP_SEC têm permissão total)
```

## Grupos e Usuários

Os seguintes grupos e usuários são criados:

- **Grupos**:
  - `GRP_ADM`: Grupo para o departamento administrativo.
  - `GRP_VEN`: Grupo para o departamento de vendas.
  - `GRP_SEC`: Grupo para o departamento de segurança.

- **Usuários**:
  - **GRP_ADM**: carlos, maria, joao
  - **GRP_VEN**: debora, sebastiana, roberto
  - **GRP_SEC**: josefina, amanda, rogerio

## Permissões

- **Diretório `publico`**:
  - Permissão `777`: Todos os usuários têm permissão total (leitura, escrita e execução).

- **Diretórios `adm`, `ven` e `sec`**:
  - Permissão `770`: Apenas o dono (root) e o grupo associado têm permissão total.
  - Outros usuários não têm permissão de acesso.

## Como Usar

### Pré-requisitos

- Sistema operacional Linux.
- Permissões de superusuário (sudo) para executar os scripts.

### Passos

1. Clone o repositório:
   ```bash
   git clone https://github.com/CaioQuerino/linux-projeto1-iac.git
   ```

2. Navegue até o diretório do projeto:
   ```bash
   cd linux-projeto1-iac
   ```

3. Execute o script de criação:
   ```bash
   sudo ./criar_estrutura.sh
   ```

4. Para limpar o ambiente (remover diretórios, grupos e usuários), execute:
   ```bash
   sudo ./apagar_users_groups.sh
   ```


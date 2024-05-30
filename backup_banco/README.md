# Backup do Banco de Dados

Esta pasta contém os arquivos de backup do banco de dados. Os backups são essenciais para garantir a recuperação dos dados em caso de falhas. 

## Arquivos de Backup

- **BK_structure_db_campeonato_brasileiro.sql**
  - Contém a estrutura do banco de dados, incluindo tabelas, functions, stored procedures e triggers.

- **BK_data_db_campeonato_brasileiro.sql**
  - Contém os dados das tabelas.

## Detalhes dos Dados

Os dados utilizados para o backup de dados referem-se ao arquivo `Dados_popular_db_campeonato_brasileiro_(Exemplo_1).sql`, que simula um campeonato completo com 38 rodadas. Esse arquivo inclui:

- **24 estádios**
- **20 times**
- **400 jogadores** (20 jogadores para cada time)
- **20 técnicos**
- **380 partidas**
- **15200 atuações**
- **1533 gols**
- **20 classificações**

## Como Utilizar

1. **Restaurar Estrutura do Banco de Dados**:
   - Execute o arquivo `BK_structure_db_campeonato_brasileiro.sql` para recriar a estrutura do banco de dados.

2. **Restaurar Dados do Banco de Dados**:
   - Execute o arquivo `BK_data_db_campeonato_brasileiro.sql` para inserir os dados nas tabelas do banco de dados.

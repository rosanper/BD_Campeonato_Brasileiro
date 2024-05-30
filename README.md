# BD_Campeonato_Brasileiro

Este repositório foi desenvolvido como trabalho final do curso de SQL da Coderhouse. O objetivo é apresentar um banco de dados tendo como tema o Campeonato Brasileiro de Futebol.

## Objetivos do Projeto

Para a elaboração do banco de dados, foram considerados os seguintes pontos:

- Apenas partidas ocorridas em um determinado ano.
- Apenas partidas ocorridas em uma única divisão.
- Cada partida pode terminar com um dos times como vencedor ou em empate.
- O time na primeira colocação é aquele com o maior número de vitórias. O critério de desempate é, primeiro, a quantidade de vitórias e, depois, a quantidade de gols.

**Nota:** Validações e regras de negócio não foram tratadas pelo banco e devem ser avaliadas antes da inserção dos dados.

Maiores explicações sobre o banco de dados, incluindo tabelas, functions, stored procedures, triggers, entre outros, podem ser vistas na documentação que está no arquivo `Documentacao_BD_Campeonato_Brasileiro.pdf`.

## Estrutura do Repositório

### Raiz
Na raiz do repositório estão todos os arquivos SQL responsáveis pela criação do banco de dados (tabelas, functions, stored procedures, triggers, etc.) e também a documentação do banco de dados.

### Pastas

- **dados_para_popular**: Esta pasta contém arquivos com dados fictícios para popular o banco de dados. Esses dados são essenciais para testar e validar o funcionamento do banco.

- **arquivos_testes**: Nesta pasta, você encontrará arquivos SQL com códigos para realizar testes no banco de dados. Esses testes ajudam a garantir que todas as operações e consultas estão funcionando corretamente.

- **backup_banco**: Esta pasta contém os arquivos de backup do banco de dados. É importante manter backups regulares para evitar a perda de dados e garantir a possibilidade de restauração em caso de falhas.

- **diagrama_entidade_relacionamento**: Esta pasta contém arquivos relacionados ao diagrama de entidade-relacionamento (ER) do banco de dados. O diagrama ER é uma representação visual da estrutura do banco de dados e das relações entre as tabelas.

## Como Utilizar

### Popular o Banco de Dados

1. Navegue até a pasta `dados_para_popular`.
2. Execute os scripts SQL ou importe os arquivos necessários para inserir os dados fictícios no banco de dados.

### Realizar Testes

1. Vá até a pasta `arquivos_testes`.
2. Execute os arquivos SQL para realizar os testes no banco de dados e verificar seu funcionamento.

### Fazer Backup

1. Acesse a pasta `backup_banco`.
2. Utilize os arquivos de backup para restaurar o banco de dados conforme necessário.

### Consultar o Diagrama ER

1. Abra a pasta `diagrama_entidade_relacionamento`.
2. Visualize os arquivos para entender a estrutura e as relações do banco de dados.

## Contribuição

Se você quiser contribuir com este projeto, siga os passos abaixo:

1. Faça um fork do repositório.
2. Crie uma nova branch (`git checkout -b feature/nova-funcionalidade`).
3. Faça as alterações necessárias e commit (`git commit -am 'Adiciona nova funcionalidade'`).
4. Envie para o repositório (`git push origin feature/nova-funcionalidade`).
5. Abra um Pull Request.


## Contato

Se você tiver alguma dúvida ou sugestão, sinta-se à vontade para entrar em contato.
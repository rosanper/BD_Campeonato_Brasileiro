USE campeonato_brasileiro;

SET AUTOCOMMIT = 0;

SELECT * FROM estadio;

START TRANSACTION;
DELETE FROM estadio WHERE id = 21;
DELETE FROM estadio WHERE id = 22;
DELETE FROM estadio WHERE id = 23;
DELETE FROM estadio WHERE id = 24;
ROLLBACK;
COMMIT;

SELECT * FROM estadio;


INSERT INTO clube (nome,cidade,uf,ano_fund,estadio_id) VALUES ('Vitória','Salvador','BA','1899-05-13',18);
INSERT INTO clube (nome,cidade,uf,ano_fund,estadio_id) VALUES ('ABC','NATAL','RN','1915-06-29',24);
INSERT INTO clube (nome,cidade,uf,ano_fund,estadio_id) VALUES ('Avaí','Florianopolis','SC','1923-09-01',22);
INSERT INTO clube (nome,cidade,uf,ano_fund,estadio_id) VALUES ('Paysandu','Belém','PA','1914-02-02',21);

SAVEPOINT lote1;

INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Carlos', 'Silva', '1990-05-12', 'Brasileiro', 'Goleiro', 1);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Marcos', 'Souza', '1988-07-23', 'Brasileiro', 'Zagueiro', 2);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Pedro', 'Ferreira', '1992-08-15', 'Português', 'Lateral', 3);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('João', 'Pereira', '1995-01-20', 'Brasileiro', 'Meio de Campo', 4);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Rafael', 'Oliveira', '1993-12-30', 'Brasileiro', 'Atacante', 5);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Bruno', 'Lima', '1991-03-10', 'Argentino', 'Zagueiro', 6);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Fernando', 'Santos', '1994-11-02', 'Brasileiro', 'Lateral', 7);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Lucas', 'Martins', '1990-09-18', 'Brasileiro', 'Meio de Campo', 8);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('André', 'Costa', '1987-04-05', 'Brasileiro', 'Atacante', 9);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Tiago', 'Araujo', '1996-02-22', 'Brasileiro', 'Goleiro', 10);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Felipe', 'Mendes', '1992-06-14', 'Brasileiro', 'Zagueiro', 11);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Gustavo', 'Ramos', '1993-10-19', 'Brasileiro', 'Lateral', 12);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Ricardo', 'Silva', '1989-12-25', 'Brasileiro', 'Meio de Campo', 13);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Alex', 'Carvalho', '1991-07-07', 'Brasileiro', 'Atacante', 14);
INSERT INTO jogador (nome, sobrenome, dt_nasc, nacionalidade, posicao, clube_id) VALUES ('Matheus', 'Santos', '1995-05-28', 'Brasileiro', 'Goleiro', 15);

SAVEPOINT lote2;

INSERT INTO tecnico (nome, sobrenome, dt_nasc, nacionalidade, clube_id) VALUES ('Luiz', 'Scolari', '1948-11-09', 'Brasileiro', 1);
INSERT INTO tecnico (nome, sobrenome, dt_nasc, nacionalidade, clube_id) VALUES ('Carlos', 'Parreira', '1943-02-27', 'Brasileiro', 2);
INSERT INTO tecnico (nome, sobrenome, dt_nasc, nacionalidade, clube_id) VALUES ('Dunga', 'Silva', '1963-10-31', 'Brasileiro', 3);
INSERT INTO tecnico (nome, sobrenome, dt_nasc, nacionalidade, clube_id) VALUES ('Tite', 'Bacchi', '1961-05-25', 'Brasileiro', 4);

SAVEPOINT lote3;

INSERT INTO estadio (nome, cidade, uf, capacidade) VALUES ('Estadio Monumental', 'Buenos Aires', 'AC', 70074);
INSERT INTO estadio (nome, cidade, uf, capacidade) VALUES ('La Bombonera', 'Buenos Aires', 'AC', 49000);

SELECT * FROM estadio;
SELECT * FROM tecnico;
SELECT * FROM jogador;
SELECT * FROM clube;

RELEASE SAVEPOINT lote3;

-- ROLLBACK TO lote3; -- Erro já que o Savepoint lote3 não existe mais
ROLLBACK TO lote2;
SELECT * FROM tecnico;

ROLLBACK TO lote1;
ROLLBACK;

COMMIT;

SELECT * FROM estadio;
SELECT * FROM tecnico;
SELECT * FROM jogador;
SELECT * FROM clube;

SET AUTOCOMMIT = 1;
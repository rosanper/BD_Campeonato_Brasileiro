USE mysql;

SELECT * FROM USER;

-- DROP USER administrador_cb@localhost;
-- DROP USER desenvolvedor_cb@localhost;
-- DROP USER usuario_interno_cb@localhost;
-- DROP USER usuario_externo_cb@localhost;

CREATE USER administrador_cb@localhost IDENTIFIED BY "adm";
CREATE USER desenvolvedor_cb@localhost IDENTIFIED BY "desenvolvedor";
CREATE USER usuario_interno_cb@localhost IDENTIFIED BY "usuarioInterno";
CREATE USER usuario_externo_cb@localhost IDENTIFIED BY "usuarioExterno";


-- Permições completas para o usuário administrador_cb

GRANT ALL ON campeonato_brasileiro.*                 TO administrador_cb@localhost;



-- Permições de SELECT, INSERT, UPDATE e EXECUTE para o usuário desenvolvedor_cb

GRANT SELECT,INSERT,UPDATE, EXECUTE ON campeonato_brasileiro.*           TO desenvolvedor_cb@localhost;


-- Permições de SELECT e EXECUTE para o usuário usuario_interno_cb

GRANT SELECT ON campeonato_brasileiro.atuacao           TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.classificacao     TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.clube             TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.estadio           TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.gols              TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.jogador           TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.partida           TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.tecnico           TO usuario_interno_cb@localhost;

GRANT SELECT ON campeonato_brasileiro.atuacao_vw                         TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.classificacao_posicao_time_vw      TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.jogador_vw                         TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.partida_dia_semana_vw              TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.partida_vw                         TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.artilharia_vw                      TO usuario_interno_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.publico_vw                         TO usuario_interno_cb@localhost;

-- Permições de SELECT para o usuário usuario_externo_cb

GRANT SELECT ON campeonato_brasileiro.partida_vw                         TO usuario_externo_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.atuacao_vw                         TO usuario_externo_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.jogador_vw                         TO usuario_externo_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.classificacao_posicao_time_vw      TO usuario_externo_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.partida_dia_semana_vw              TO usuario_externo_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.artilharia_vw                      TO usuario_externo_cb@localhost;
GRANT SELECT ON campeonato_brasileiro.publico_vw                         TO usuario_externo_cb@localhost;

SHOW GRANTS FOR administrador_cb@localhost;
SHOW GRANTS FOR desenvolvedor_cb@localhost;
SHOW GRANTS FOR usuario_interno_cb@localhost;
SHOW GRANTS FOR usuario_externo_cb@localhost;


SELECT * FROM USER;

-- REVOKE ALL ON *.* FROM administrador_cb@localhost;
-- REVOKE ALL ON *.* FROM desenvolvedor_cb@localhost;
-- REVOKE ALL ON *.* FROM usuario_interno_cb@localhost;
-- REVOKE ALL ON *.* FROM usuario_externo_cb@localhost;

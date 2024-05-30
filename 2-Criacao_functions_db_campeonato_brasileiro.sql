USE campeonato_brasileiro;

-- Funções tabela Clube

	-- Obter o nome do clube pelo id
DELIMITER $$
CREATE FUNCTION `obter_nome_clube`(clube_id INT) RETURNS VARCHAR(50) 
DETERMINISTIC
BEGIN
	RETURN (SELECT nome FROM clube c WHERE c.id = clube_id);
END$$
DELIMITER ;

-- Funções tabela Estadio

	-- Obter o nome do estádio pelo id
DELIMITER $$
CREATE FUNCTION `obter_nome_estadio`(estadio_id INT) RETURNS VARCHAR(50) 
DETERMINISTIC
BEGIN
	RETURN (SELECT nome FROM estadio e WHERE e.id = estadio_id);
END$$
DELIMITER ;

-- Funções tabela partida

	-- Obter a quantidade de vitótias de um time como mandante
DELIMITER $$
CREATE FUNCTION `obter_qnt_vitorias_como_mandante`(clube_id INT) RETURNS INT 
DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			COUNT(*) 
		FROM (
			SELECT 
				partida.*, 
                cv.nome AS clb_visitante, 
                cm.nome AS clb_mandante 
                FROM partida 
                INNER JOIN clube cm ON cm.id = partida.clb_mand_id 
                INNER JOIN clube cv ON cv.id = partida.clb_visit_id 
                WHERE clb_mand_id = clube_id OR clb_visit_id = clube_id) 
			AS tab_time 
            WHERE tab_time.clb_mand_id = clube_id AND tab_time.clb_mand_venceu = true);
END$$
DELIMITER ;

	-- Obter a quantidade de vitótias de um time como visitante
DELIMITER $$
CREATE FUNCTION `obter_qnt_vitorias_como_visitante`(clube_id INT) RETURNS INT 
DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			COUNT(*) 
		FROM (
			SELECT 
				partida.*, 
                cv.nome AS clb_visitante, 
                cm.nome AS clb_mandante 
			FROM partida 
            INNER JOIN clube cm ON cm.id = partida.clb_mand_id 
            INNER JOIN clube cv ON cv.id = partida.clb_visit_id 
            WHERE clb_mand_id = clube_id OR clb_visit_id = clube_id) 
		AS tab_time 
        WHERE tab_time.clb_visit_id = clube_id AND tab_time.clb_visit_venceu = true);
END$$
DELIMITER ;

	-- Obter a quantidade de derrotas de um time como mandante
DELIMITER $$
CREATE FUNCTION `obter_qnt_derrotas_como_mandante`(clube_id INT) RETURNS INT 
DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			COUNT(*) 
		FROM (
			SELECT 
				partida.*, 
                cv.nome AS clb_visitante, 
                cm.nome AS clb_mandante 
                FROM partida 
                INNER JOIN clube cm ON cm.id = partida.clb_mand_id 
                INNER JOIN clube cv ON cv.id = partida.clb_visit_id 
                WHERE clb_mand_id = clube_id OR clb_visit_id = clube_id) 
			AS tab_time 
            WHERE tab_time.clb_mand_id = clube_id AND tab_time.clb_visit_venceu = true);
END$$
DELIMITER ;

	-- Obter a quantidade de derrotas de um time como visitante
DELIMITER $$
CREATE FUNCTION `obter_qnt_derrotas_como_visitante`(clube_id INT) RETURNS INT 
DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			COUNT(*) 
		FROM (
			SELECT 
				partida.*, 
                cv.nome AS clb_visitante, 
                cm.nome AS clb_mandante 
			FROM partida 
            INNER JOIN clube cm ON cm.id = partida.clb_mand_id 
            INNER JOIN clube cv ON cv.id = partida.clb_visit_id 
            WHERE clb_mand_id = clube_id OR clb_visit_id = clube_id) 
		AS tab_time 
        WHERE tab_time.clb_visit_id = clube_id AND tab_time.clb_mand_venceu = true);
END$$
DELIMITER ;

	-- Obter a quantidade de gols marcados em uma determinada rodada
DELIMITER $$
CREATE FUNCTION `obter_gols_rodada`(n_rodada INT) RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (SELECT 
	( SELECT SUM(qnt_gols_man) FROM partida where rodada = n_rodada) 
	+ (SELECT SUM(qnt_gols_visit) FROM partida where rodada = n_rodada));
END$$	
DELIMITER ;

	-- Obter a quantidade de partidas que ocorreram em uma determinada rodada
DELIMITER $$
CREATE FUNCTION `obter_qnt_partidas_rodada`(n_rodada INT) RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (SELECT COUNT(*) FROM partida p WHERE p.rodada = n_rodada);
END$$	
DELIMITER ;

	-- Obter a média de gols em uma determinada rodada
DELIMITER $$
CREATE FUNCTION `obter_media_gols_partida_rodada`(n_rodada INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
	RETURN ((SELECT obter_gols_rodada(n_rodada)) / (SELECT obter_qnt_partidas_rodada(n_rodada)));
END$$	
DELIMITER ;

	-- Obter o total de gols nas partidas disputadas
DELIMITER $$
CREATE FUNCTION `obter_total_gols`() RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (SELECT 
	( SELECT SUM(qnt_gols_man) FROM partida) 
	+ (SELECT SUM(qnt_gols_visit) FROM partida));
END$$	
DELIMITER ;

	-- Obter média de gols por partida no campeonato
DELIMITER $$
CREATE FUNCTION `obter_media_gols_partida`() RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE qnt_partidas INT;
    SET qnt_partidas = (SELECT COUNT(*) FROM partida); 
	RETURN ((SELECT obter_total_gols()) / qnt_partidas);
END$$	
DELIMITER ;

	-- Obter a média de público por partida em uma determinada rodada
DELIMITER $$
CREATE FUNCTION `obter_media_publico_partida_rodada`(n_rodada INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE qnt_publico_rodada FLOAT;
    SET qnt_publico_rodada = (SELECT SUM(partida.qnt_puplico) FROM partida WHERE rodada= n_rodada);
	RETURN (qnt_publico_rodada / (SELECT obter_qnt_partidas_rodada(n_rodada)));
END$$	
DELIMITER ;


	-- Obter o total de público das partidas
DELIMITER $$
CREATE FUNCTION `obter_total_publico`() RETURNS FLOAT
DETERMINISTIC
BEGIN
	RETURN (SELECT SUM(partida.qnt_puplico) FROM partida);
END$$	
DELIMITER ;

	-- Obter a média de público por partida
DELIMITER $$
CREATE FUNCTION `obter_media_publico_partida`() RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE qnt_partidas INT;
    SET qnt_partidas = (SELECT COUNT(*) FROM partida); 
	RETURN ((SELECT obter_total_publico()) / qnt_partidas);
END$$	
DELIMITER ;

	-- Obter a média de público por estádio
DELIMITER $$
CREATE FUNCTION `obter_media_publico_estadio`(estadio_id INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN (SELECT AVG(partida.qnt_puplico) FROM partida WHERE partida.estadio_id = estadio_id);
END$$	
DELIMITER ;


-- Funções da tabela atuacao

	-- Obter a quantidade total de cartões amarelos
DELIMITER $$
CREATE FUNCTION `obter_qnt_cartoes_amarelos`() RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (SELECT SUM(atuacao.qnt_cart_amar) FROM atuacao);
END$$	
DELIMITER ;

	-- Obter a quantidade total de cartões vermelhos
DELIMITER $$
CREATE FUNCTION `obter_qnt_cartoes_vermelhos`() RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (SELECT SUM(atuacao.qnt_cart_verm) FROM atuacao);
END$$	
DELIMITER ;

	-- Obter a média de cartões amarelos por partida
DELIMITER $$
CREATE FUNCTION `obter_media_cartoes_amarelos_partida`() RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE qnt_cartoes INT;
	DECLARE qnt_partidas INT;
    SET qnt_partidas = (SELECT COUNT(DISTINCT partida_id) FROM atuacao);
    SET qnt_cartoes = (SELECT obter_qnt_cartoes_amarelos());
	RETURN (qnt_cartoes/qnt_partidas);
END$$	
DELIMITER ;


	-- Obter a média de cartões vermelhos por partidas
DELIMITER $$
CREATE FUNCTION `obter_media_cartoes_vermelhos_partida`() RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE qnt_cartoes INT;
	DECLARE qnt_partidas INT;
    SET qnt_partidas = (SELECT COUNT(DISTINCT partida_id) FROM atuacao);
    SET qnt_cartoes = (SELECT obter_qnt_cartoes_vermelhos());
	RETURN (qnt_cartoes/qnt_partidas);
END$$	
DELIMITER ;

-- Funções da tabela  gols

	-- Obter a quantidade de gols de um determinado tipo
DELIMITER $$
CREATE FUNCTION `obter_qnt_gols_tipo`(tipo VARCHAR(50)) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE resultado INT;
	IF(tipo = '') THEN
		SET resultado = (SELECT COUNT(id) FROM gols WHERE tipo_gol IS NULL);
    ELSEIF (tipo != '') THEN
		SET resultado = (SELECT COUNT(tipo_gol) FROM gols WHERE tipo_gol LIKE(tipo));
	END IF;
	RETURN resultado;
END$$	
DELIMITER ;

	-- Obter a quantidade de gols em um determinado tempo de jogo (PRIMEIRO ou SEGUNDO)
DELIMITER $$
CREATE FUNCTION `obter_qnt_gols_no_tempo`(tempo VARCHAR(10)) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE resultado INT;
	IF(UPPER(tempo) LIKE 'PRIMEIRO') THEN
		SET resultado = (SELECT COUNT(id) FROM gols WHERE min_gol <= 45);
    ELSEIF (UPPER(tempo) LIKE 'SEGUNDO') THEN
		SET resultado = (SELECT COUNT(id) FROM gols WHERE min_gol > 45);
	END IF;
	RETURN resultado;
END$$	
DELIMITER ;


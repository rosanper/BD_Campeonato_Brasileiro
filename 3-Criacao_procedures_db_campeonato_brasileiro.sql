USE campeonato_brasileiro;

DELIMITER //

-- partidas de um determinado time
CREATE PROCEDURE obter_tab_partida_time (IN id INTEGER)
BEGIN
	SELECT partida.*, cv.nome AS clb_visitante, cm.nome AS clb_mandante FROM partida INNER JOIN clube cm ON cm.id = partida.clb_mand_id INNER JOIN clube cv ON cv.id = partida.clb_visit_id WHERE clb_mand_id = id OR clb_visit_id = id;
END //

DELIMITER //

-- tabela partida ordenada por rodada
CREATE PROCEDURE ordenar_tab_partida (IN ordem VARCHAR(20))
BEGIN
	SET @select_txt = 'SELECT 
							p.id, 
							cm.nome AS clube_mandante,
							cv.nome AS clube_visitante,
							p.qnt_gols_man,
							p.qnt_gols_visit,
							p.clb_mand_venceu,
							p.clb_visit_venceu,
							p.empate,
							p.rodada,
							p.data,
							e.nome,
							p.qnt_puplico
						FROM partida p 
						INNER JOIN clube cm ON p.clb_mand_id = cm.id 
						INNER JOIN clube cv ON p.clb_visit_id = cv.id
						INNER JOIN estadio e ON p.estadio_id = e.id ';
	SET @ordernacao_txt = 'ORDER BY rodada';
					
    IF (ordem = '' OR UPPER(ordem) LIKE 'CRESCENTE') THEN
		SET @sql_txt = CONCAT(@select_txt, @ordernacao_txt);
	ELSEIF (UPPER(ordem) LIKE 'DECRESCENTE') THEN
		SET @sql_txt = CONCAT(@select_txt, @ordernacao_txt, ' DESC');
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERRO: não é possível ordenar dessa forma';
	END IF;
    
    PREPARE runSQL FROM @sql_txt;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END //

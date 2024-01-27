

insert into internacoes (id_enfermeiro, quarto, paciente, medico_responsavel)
values (1, 1, 5, 2),
(6, 3, 5, 2),
(4, 2, 8, 7);


update internacoes
set data_entrada = '2019-07-30'
where id = 3;

UPDATE internacoes
SET data_alta = data_entrada + INTERVAL 3 DAY
WHERE id = 3;


select * from internacoes;





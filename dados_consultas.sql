insert into consultas (data_hr_consultas, nome_medico, especialidade_medico, nome_paciente, valor_consulta, num_carteira, convenio)
values ('2023-11-30 18:00:00', 7, 7, 4, '400,00','2354641656', 5);

UPDATE consultas
set receita_id = '5'
where id = 8;

select * from consultas;

select consultas.nome_medico, medicos.*
from consultas
join medicos on consultas.nome_medico = medicos.id;
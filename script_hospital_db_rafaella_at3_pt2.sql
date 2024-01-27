/*Comando para alterar tabela medicos*/
alter table medicos add em_atividade bit;
alter table medicos modify column em_atividade bit default 1;
update medicos set em_atividade = 0 where id= 2  or id = 3;


/*Comando para atualizar alta*/
UPDATE internacoes
SET data_alta = data_entrada + INTERVAL 3 DAY
WHERE id = 3;


/*Comando para apagar o convenio do Paciente*/
update pacientes
set convenio = null
where id = 10;
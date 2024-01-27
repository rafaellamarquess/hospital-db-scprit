use hospital_senac01;
alter table medicos add em_atividade bit;
alter table medicos modify column em_atividade bit default 1;
update medicos set em_atividade=0 where idmedico =2  or idmedico=3;
UPDATE pacientes SET convenio = NULL WHERE idpacientes  = 10;



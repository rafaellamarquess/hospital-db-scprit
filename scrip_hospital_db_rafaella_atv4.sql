create database hospital_db;

create table consultas
(
id int not null auto_increment,
data_hr_consultas datetime,
nome_medico int,
especialidade_medico int,
nome_paciente int,
valor_consulta varchar(45),
num_carteira varchar(45),
convenio int,
primary key (id)
);

alter table consultas add column receita_id int;
alter table consultas add foreign key (receita_id) references receita (id);
alter table consultas add foreign key (nome_medico) references medicos (id);
alter table consultas add foreign key (nome_paciente) references pacientes (id);
alter table consultas add foreign key (convenio) references convenio (id);


create table convenio
(
id int not null auto_increment,
cnpj varchar(11) not null,
nome varchar(45) not null,
carencia varchar(45),
primary key (id)
);

create table medicos
(
id int not null auto_increment,
nome_medico varchar(45),
especialidade_medico varchar(45),
receita int,
primary key (id)
);

alter table medicos add foreign key (receita) references receita (id);


create table receita
(
id int not null auto_increment,
nome_medico int,
medicacao varchar(45),
quantidade_medicacao varchar(45),
instrucao_medicacao longtext,
primary key (id)
);

alter table receita add foreign key (nome_medico) references medicos (id);

create table pacientes
(
id int not null auto_increment,
nome varchar(45),
email varchar(45),
data_nascimento date,
endereco varchar(45),
telefone varchar(15),
cpf char(45),
rg char(45),
convenio int,
consultas int,
medico int,
primary key (id)
);

alter table pacientes add foreign key (convenio) references convenio (id);
alter table pacientes add foreign key (consultas) references consultas (id);
alter table pacientes add foreign key (medico) references medicos (id);

create table quartos
(
id int not null auto_increment,
tipo_quarto int not null,
num_quarto varchar(10) not null,
primary key (id)
);

create table tipo_quarto
(
id int not null auto_increment,
valor_diaria varchar(5),
descricao varchar(45),
primary key (id)
);

create table enfermeiro
(
id int not null auto_increment,
nome varchar(45),
cpf varchar(45),
cre varchar(45),
primary key (id)
);

create table internacoes
(
id int not null auto_increment,
id_enfermeiro int not null,
quarto int not null,
paciente int not null,
medico_responsavel int not null,
data_entrada date,
data_prev_alta date,
data_alta date,
descricao_procedimento longtext,
internacoescol varchar(45),
primary key (id)
);

alter table quartos add foreign key (tipo_quarto) references tipo_quarto (id);
alter table internacoes add foreign key (id_enfermeiro) references enfermeiro (id);
alter table internacoes add foreign key (quarto) references quartos (id);
alter table internacoes add foreign key (paciente) references pacientes (id);
alter table internacoes add foreign key (medico_responsavel) references medicos (id);

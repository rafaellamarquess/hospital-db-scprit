
INSERT INTO pacientes (nome) VALUES
('Mark Festas Santana'),
('Armindo Moreira Azeredo'),
('Mark Festas Santana'),
('Armindo Moreira Azeredo'),
('Helton Espinosa'),
('Fabrício Norões Xavier'),
('Giovanni Arouca Mata'),
('Silvana Fartaria Nazário');


update pacientes
set convenio = 3
where id = 11;

update pacientes
set convenio = null
where id = 10;

select * from pacientes;
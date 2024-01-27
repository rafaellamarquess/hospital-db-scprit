-- Consultas do ano de 2020 realizadas sem convênio
SELECT * FROM consultas
WHERE (data_hr_consultas) = 2020 AND convenio IS NULL;

-- Valor médio das consultas do ano de 2020 realizadas sem convênio
SELECT AVG(valor_consulta)
FROM consultas
WHERE (data_hr_consultas) = 2020 AND convenio IS NULL;
--------------------------------------------------------------------------

-- Consultas do ano de 2020 realizadas por convênio
SELECT * FROM consultas
WHERE (data_hr_consultas) = 2020 AND convenio IS NOT NULL;

-- Valor médio das consultas do ano de 2020 realizadas por convênio
SELECT AVG(valor_consulta)
FROM consultas
WHERE (data_hr_consultas) = 2020 AND convenio IS NOT NULL;

----------------------------------------------------------------------------
-- Internações com data de alta maior que a data prevista
SELECT * FROM internacoes
WHERE data_alta > data_prev_alta;
----------------------------------------------------------------------------

-- Receituário  da primeira consulta com receituário associado
SELECT * FROM consultas
LEFT JOIN receita ON consultas.id = receita.id
ORDER BY consultas.data_hr_consultas ;
----------------------------------------------------------------------------

-- Consulta de maior valor não realizada sob convênio
SELECT * FROM consultas
WHERE convenio IS NULL
ORDER BY valor_consulta DESC
LIMIT 1;
----------------------------------------------------------------------------

-- Consulta de menor valor não realizada sob convênio
SELECT * FROM Consultas
WHERE convenio IS NULL
ORDER BY valor_consulta ASC
LIMIT 1;
----------------------------------------------------------------------------

-- Internações com dados dos quartos e valor total
SELECT internacoes.*, quarto
FROM internacoes
JOIN quartos ON internacoes.quarto = quartos.num_quarto
WHERE data_alta > data_entrada;
----------------------------------------------------------------------------

-- Internações em quartos do tipo “apartamento”
SELECT data_entrada, descricao_procedimento, quarto FROM internacoes
JOIN quartos ON num_quarto = quartos.num_quarto
WHERE tipo_quarto = 'Quarto tipo Apartamento';
----------------------------------------------------------------------------

-- Consultas de pacientes menores de 18 anos que não são pediatria
SELECT nome_paciente, data_hr_consultas, especialidade_medico
FROM consultas
JOIN pacientes ON consultas.nome_paciente = pacientes.id
WHERE consultas.especialidade_medico != 'pediatria'
ORDER BY consultas.data_hr_consultas;
----------------------------------------------------------------------------

-- Internações realizadas por médicos de gastroenterologia em enfermaria
SELECT medicos.nome_medico, internacoes.data_entrada, internacoes.descricao_procedimento
FROM internacoes
JOIN medicos ON internacoes.medico_responsavel = medicos.id
WHERE medicos.especialidade_medico = 'gastroenterologia'
AND internacoes.quarto = 'Quarto tipo Enfermaria';
----------------------------------------------------------------------------

-- Nomes, números de registro no CRM e quantidade de consultas de médicos
SELECT medicos.nome_medico, COUNT(consultas.id) AS quantidade_consultas
FROM medicos
LEFT JOIN consultas ON medicos.id = consultas.nome_medico
GROUP BY medicos.id;
----------------------------------------------------------------------------

-- Nomes, números de registro no CRE, e números de internações de enfermeiros
SELECT enfermeiro.nome, enfermeiro.cre, COUNT(internacoes.id) AS quantidade_internacoes
FROM enfermeiro
JOIN internacoes ON enfermeiro.id = internacoes.id_enfermeiro
GROUP BY enfermeiro.id
HAVING COUNT(internacoes.id_enfermeiro) > 1;

-- Inclua suas próprias informações no departamento de tecnologia da empresa
INSERT INTO funcionarios(funcionario_id, primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) 
VALUES (207,'Thiago','Carlos','thiago.carlos@momento.org', '940028922','2023-08-12', 9, 4000.00,101,6);

-- A administração está sem funcionários. Inclua alguns colegas de turma nesse departamento. 
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (208,'Saulo','Oliveira','saulo.oliveira@momento.org', '945618279','2023-05-10', 3, 5000.00,101,1);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (209,'Vinicius','Soares','vinicius.Soares@momento.org', '956347896','2023-05-10', 3, 5000.00,101,1);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (210,'Vanessa','Maiz','vanessa.maiz@momento.org', '964571238','2023-05-10', 3, 5000.00,101,1);

-- Agora diga, quantos funcionários temos ao total na empresa?
-- Temos 80 funcionarios
SELECT COUNT(*) FROM funcionarios AS total_funcionarios;

-- Quantos funcionários temos no departamento de finanças?
-- Temos 10 funcionarios 
SELECT COUNT(*) FROM funcionarios WHERE departamento_id = 10;

-- Qual a média salarial do departamento de tecnologia?
-- A média é de R$ 4.500,00 reais
SELECT AVG(salario) AS media_salarial FROM funcionarios WHERE departamento_id = 6;

-- Quanto o departamento de Transportes gasta em salários?
-- Há um gasto de R$ 35.000,00 reais
SELECT SUM(salario) AS total_dp_transporte FROM funcionarios WHERE departamento_id = 5;

-- Um novo departamento foi criado. O departamento de inovações. Ele será locado no Brasil. Por favor, adicione-o no banco de dados.
INSERT INTO departamento (departamento_id,departamento_nome,posicao_id) VALUES (12,'Inovações', 5400);

-- Três novos funcionários foram contratados para o departamento de inovações.
INSERT INTO ocupacoes(ocupacao_id,ocupacao_nome,min_salario,max_salario) VALUES (20, 'Programador', 5000.00, 10000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_nome,min_salario,max_salario) VALUES (21, 'Gerente de Inovações', 6000.00, 15000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_nome,min_salario,max_salario) VALUES (22, 'Desenvolvedora', 5000.00, 12000.00);

INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (211,'William','Ferreira','william.ferreira@momento.org','2456-8756','2023-11-05',20,10000.00,105,12);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (212,'Fernanda','Lima','fernanda.lima@momento.org','2469-4568','2023-11-05',22,12000.00,105,12);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,data_contratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (213,'Sumaia','Azevedo','sumaia.azevedo@momento.org','2345-9874','2023-11-05',21,10000.00,105,12);

INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (34,' Inara','Ferreira','Cônjuge',211);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (35,' Maria','Antônia','Filho(a)',211);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (36,'Rodrigo','Lima','Cônjuge',212);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (37,'Tainã','Azevedo','Filho(a)',213);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (38,'Nathalia','Azevedo','Filho(a)',213);

-- Informe todas as regiões em que a empresa atua acompanhadas de seus países.
SELECT P.pais_name, R.regiao_id, R.regiao_nome
FROM paises P
INNER JOIN regiao R ON R.regiao_id = P.regiao_id;

-- Joe Sciarra é filho de quem?
-- Do Ismael 
SELECT F.funcionario_id, F.primeiro_nome AS Pai,  D.primeiro_nome AS Filho 
FROM dependentes D 
INNER JOIN funcionarios F on F.funcionario_id = D.funcionario_id
WHERE D.primeiro_nome like '%Joe%';

-- Jose Manuel possui filhos?
-- Sim, Christian Urman
SELECT * FROM dependentes where funcionario_id = 112;

-- Qual região possui mais países?
-- Europa
SELECT R.regiao_nome, COUNT(*) AS Total_Paises 
FROM regiao R 
INNER JOIN paises P ON P.regiao_id = R.regiao_id
GROUP BY R.regiao_nome
ORDER BY Total_Paises DESC
LIMIT 1;

-- Exiba o nome de cada funcionário acompanhado de seus dependentes.
SELECT F.primeiro_nome AS nome_funcionario, D.primeiro_nome AS nome_dependente
FROM funcionarios F 
INNER JOIN dependentes D ON D.funcionario_id = F.funcionario_id;

-- Karen Partners possui um(a) cônjuge?
-- Não
SELECT * FROM dependentes where funcionario_id = 146;
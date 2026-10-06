-- CREATE TABLE alunos (
--     id SERIAL PRIMARY KEY,
--     nome VARCHAR(100) NOT NULL
-- );

-- CREATE TABLE emprestimos(
--     id SERIAL PRIMARY KEY,
--     nome VARCHAR(50) NOT NULL,
--     id_alunos INT REFERENCES alunos(id)
-- );

-- INSERT INTO alunos(nome) VALUES
-- ('Murillo'),
-- ('Miguel'),
-- ('Nicollas'),
-- ('Victor'),
-- ('Gabriel'),
-- ('Lucas'),
-- ('Pedro'),
-- ('João'),
-- ('Rafael'),
-- ('Matheus'),
-- ('Gustavo'),
-- ('Henrique'),
-- ('Felipe'),
-- ('Bruno'),
-- ('Daniel');

-- INSERT INTO emprestimos (nome, id_alunos) VALUES
-- ('O Pequeno Príncipe', 1),
-- ('Harry Potter', 2),
-- ('Dom Casmurro', 3),
-- ('O Hobbit', 4),
-- ('Percy Jackson', 5),
-- ('Turma da Mônica', 6),
-- ('Diário de um Banana', 7),
-- ('As Crônicas de Nárnia', 8),
-- ('A Culpa é das Estrelas', 9),
-- ('O Senhor dos Anéis', 10);

-- SELECT * FROM alunos;

-- SELECT * FROM emprestimos;

-- SELECT alunos.nome, emprestimos.nome FROM alunos INNER JOIN emprestimos ON alunos.id = emprestimos.id_alunos;

-- SELECT alunos.nome, emprestimos.nome FROM alunos LEFT JOIN emprestimos ON alunos.id = emprestimos.id_alunos;

-- SELECT alunos.nome FROM alunos LEFT JOIN emprestimos ON alunos.id = emprestimos.id_alunos WHERE emprestimos.id ISNULL; 

-- INSERT INTO emprestimos (nome, id_alunos) VALUES ('Turma da Mônica', 50);
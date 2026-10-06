# Anotações de SQL – Alunos e Empréstimos

Hoje a gente brincou com um banco de dados bem simples: uma tabela de **alunos** e outra de **empréstimos** de livros.  
A ideia era ver como as duas tabelas se conectam e como a gente busca informações delas.

---

## 1. Criando as tabelas

Primeiro a gente criou a tabela dos alunos:

```sql
CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
```

- `id SERIAL PRIMARY KEY` → o número de cada aluno é gerado automaticamente
- `nome VARCHAR(100) NOT NULL` → o nome do aluno, obrigatório e com até 100 caracteres.

Depois veio a tabela dos empréstimos:

```sql
CREATE TABLE emprestimos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    id_alunos INT REFERENCES alunos(id)
);
```

Aqui tem uma coisa importante:  
`id_alunos INT REFERENCES alunos(id)`  

Isso cria uma **chave estrangeira**. Ou seja, o empréstimo “aponta” para um aluno que realmente existe na tabela `alunos`.  
É como se o livro tivesse um “dono” registrado.

---

## 2. Inserindo os alunos

Colocamos 15 alunos:

```sql
INSERT INTO alunos(nome) VALUES
('Murillo'),
('Miguel'),
('Nicollas'),
('Victor'),
('Gabriel'),
('Lucas'),
('Pedro'),
('João'),
('Rafael'),
('Matheus'),
('Gustavo'),
('Henrique'),
('Felipe'),
('Bruno'),
('Daniel');
```

Agora a tabela `alunos` tem 15 pessoas, cada uma com um `id` diferente (1 até 15).

---

## 3. Inserindo os empréstimos

Depois registramos 10 empréstimos, cada um ligado a um aluno:

```sql
INSERT INTO emprestimos (nome, id_alunos) VALUES
('O Pequeno Príncipe', 1),
('Harry Potter', 2),
('Dom Casmurro', 3),
('O Hobbit', 4),
('Percy Jackson', 5),
('Turma da Mônica', 6),
('Diário de um Banana', 7),
('As Crônicas de Nárnia', 8),
('A Culpa é das Estrelas', 9),
('O Senhor dos Anéis', 10);
```

Repare que o `id_alunos` vai de 1 a 10.  
Os alunos 11, 12, 13, 14 e 15 ainda **não pegaram nenhum livro**.

---

## 4. Consultando tudo

Primeiro a gente só olhou o conteúdo das tabelas:

```sql
SELECT * FROM alunos;
SELECT * FROM emprestimos;
```

`SELECT *` significa “me mostra todas as colunas e todas as linhas”.

---

## 5. Juntando as tabelas (JOINs)

### INNER JOIN – só quem tem empréstimo

```sql
SELECT alunos.nome, emprestimos.nome 
FROM alunos 
INNER JOIN emprestimos ON alunos.id = emprestimos.id_alunos;
```

Esse comando mostra **só os alunos que realmente pegaram livro**.  
Os que estão sem empréstimo somem do resultado.

### LEFT JOIN – todos os alunos, mesmo sem livro

```sql
SELECT alunos.nome, emprestimos.nome 
FROM alunos 
LEFT JOIN emprestimos ON alunos.id = emprestimos.id_alunos;
```

Aqui aparecem **todos os alunos**.  
Quem não tem empréstimo fica com o nome do livro como `NULL` (vazio).

### Achando quem não pegou livro

```sql
SELECT alunos.nome 
FROM alunos 
LEFT JOIN emprestimos ON alunos.id = emprestimos.id_alunos 
WHERE emprestimos.id IS NULL;
```

Essa consulta usa o `LEFT JOIN` e depois filtra só as linhas em que o empréstimo é `NULL`.  
Resultado: os alunos que ainda não pegaram nenhum livro.

---

## 6. Tentando inserir um empréstimo inválido

No final a gente tentou isso:

```sql
INSERT INTO emprestimos (nome, id_alunos) VALUES ('Turma da Mônica', 50);
```

O aluno de `id = 50` **não existe**.  
Como a tabela tem a chave estrangeira (`REFERENCES alunos(id)`), o banco **não deixa** gravar esse empréstimo.  
É uma proteção pra não ficar com dados “soltos”.

---

## Resumo rápido do que a gente viu

| Comando              | O que faz                                      |
|----------------------|------------------------------------------------|
|`CREATE TABLE`|Cria uma tabela|
|`INSERT INTO`|Coloca dados na tabela|
|`SELECT *`|Mostra tudo|
|`INNER JOIN`|Junta tabelas e mostra só quem tem correspondência|
|`LEFT JOIN`|Junta tabelas e mantém todos do lado esquerdo|
|`WHERE ... IS NULL`|Filtra as linhas que ficaram sem valor|
|`Chave estrangeira`|Impede que você coloque um id que não existe|

---

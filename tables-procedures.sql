CREATE DATABASE universidade;
USE universidade;

-- Criando a tabela Cursos
CREATE TABLE Cursos (
  curso_id 			INT auto_increment primary key unique,
  nome 				VARCHAR(150),
  quantidade_alunos INT
);

-- Criando a tabela Professores
CREATE TABLE Professores (
  id_professores 	INT auto_increment primary key unique,
  nome 				VARCHAR(150) NOT NULL,
  salario 			DECIMAL(10,2),
  data_nascimento 	DATE,
  telefone 			VARCHAR(20)
);

-- Criando a tabela Alunos
CREATE TABLE Alunos (
  id_alunos 			INT auto_increment primary key unique,
  nome 					VARCHAR(150) NOT NULL,
  sobrenome				VARCHAR(100),
  cpf 					VARCHAR(50),
  email 				VARCHAR(150),
  telefone				VARCHAR(20)
);

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (nome, sobrenome, cpf, email, telefone)
VALUES ('Immanuel', 'Kant', '123.456.789-01', '', '(28) 99224-6426'),
('Alan', 'Turing', '123.456.789-90', '', '(99) 96970-4870'),
('George', 'Boole', '987.654.321-10', '', '(96) 96777-6831'),
('Lynn', 'Margulis', '963.345.246-60', '', '(62) 99545-6646'),
('Nicola', 'Tesla', '567.890.123-45', '', '(31) 99755-4238'),
('Ada', 'Lovelace', '789.012.345-67', '', '(34) 98043-4504'),
('Claude', 'Shannon', '234.567.890-12', '', '(44) 98517-7707');

-- Inserindo dados na tabela Professores (quero chamar os cursos lecionados pelos professores para disciplina_lecionada)
-- com cada professor atribuído a um curso da tabela de cursos
INSERT INTO Professores (nome, salario, data_nascimento, telefone)
VALUES	('Charles Darwin', 5000.00, '1965-03-15', '(15) 99663-2147'),
	('Marie Curie', 4800.00, '1978-07-20', '(11) 9987-4123'),
	('George Boole', 5200.00, '1982-05-10', '(18) 9979-5912'),
	('Carl Sagan', 4800.00, '1978-07-20', '(31) 1234-5678'),
	('Mickael Scott', 5200.00, '1982-05-10', '(41) 6543-2109'),
	('Tim Berners-Lee', 5000.00, '1965-03-15', '(55) 98765-4321'),
	('Richard Feynman', 4800.00, '1978-07-20', '(27) 99468-5260');

-- Inserindo dados na tabela Cursos
INSERT INTO Cursos (nome, quantidade_alunos)
VALUES	('Filosofia Moderna', 20),
	('Introdução a Computação', 15),
	('Banco de Dados', 18),
	('Lógica de Programação', 25),
	('Estatística', 20),
	('Sistemas Operacionais', 18),
	('Redes de Computadores', 22);

select * from Cursos;
select * from Professores;
select * from Alunos;


-- Stored Procedure para Inserir um Novo Curso
DELIMITER $$

CREATE PROCEDURE Inserir_Curso(
    IN nome_curso VARCHAR(150),
    IN quantidade_alunos INT
)
BEGIN
    INSERT INTO Cursos (nome, quantidade_alunos) VALUES (nome_curso, quantidade_alunos);
END$$

CREATE PROCEDURE Selecionar_Cursos()
BEGIN
    SELECT * FROM Cursos;
END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE Gerador_Email(
    IN AlunoID INT
)
BEGIN
    DECLARE nome_aluno VARCHAR(90);
    DECLARE sobrenome_aluno VARCHAR(90);
    DECLARE aluno_email VARCHAR(60);
    
    SELECT nome, sobrenome INTO nome_aluno, sobrenome_aluno FROM Alunos WHERE id_alunos = AlunoID;
    
    SET aluno_email = CONCAT(nome_aluno, '.', sobrenome_aluno, '@dominio.com');
    
    UPDATE Alunos SET email = aluno_email WHERE id_alunos = AlunoID;
END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE Nome_Completo ()
BEGIN
    SELECT * FROM Alunos;
END$$

DELIMITER ;

CALL Inserir_Curso('Matematica Basica', 5);
CALL Selecionar_Cursos();
CALL Gerador_Email(5);
CALL Nome_Completo();

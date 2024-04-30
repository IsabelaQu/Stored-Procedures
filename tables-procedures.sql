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
  cpf 					VARCHAR(50),
  email 				VARCHAR(150),
  telefone				VARCHAR(20)
);


-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (nome, cpf, email, telefone)
VALUES ('Immanuel Kant', '123.456.789-01', '', '(28) 99224-6426'),
('Alan Turing', '123.456.789-90', '', '(99) 96970-4870'),
('George Boole', '987.654.321-10', '', '(96) 96777-6831'),
('Lynn Margulis', '963.345.246-60', '', '(62) 99545-6646'),
('Nicola Tesla', '567.890.123-45', '', '(31) 99755-4238'),
('Ada Lovelace', '789.012.345-67', '', '(34) 98043-4504'),
('Claude Shannon', '234.567.890-12', '', '(44) 98517-7707');

-- Inserindo dados na tabela Professores (quero chamar os cursos lecionados pelos professores para disciplina_lecionada)
-- com cada professor atribuído a um curso da tabela de cursos
INSERT INTO Professores (nome, salario, data_nascimento, telefone)
values	('Charles Darwin', 5000.00, '1965-03-15', '(15) 99663-2147'),
		('Marie Curie', 4800.00, '1978-07-20', '(11) 9987-4123'),
		('George Boole', 5200.00, '1982-05-10', '(18) 9979-5912'),
		('Carl Sagan', 4800.00, '1978-07-20', '(31) 1234-5678'),
		('Mickael Scott', 5200.00, '1982-05-10', '(41) 6543-2109'),
		('Tim Berners-Lee', 5000.00, '1965-03-15', '(55) 98765-4321'),
		('Richard Feynman', 4800.00, '1978-07-20', '(27) 99468-5260');

-- Inserindo dados na tabela Cursos
INSERT INTO Cursos (nome, quantidade_alunos)
VALUES
	('Filosofia Moderna', 20),
	('Introdução a Computação', 15),
	('Banco de Dados', 18),
	('Lógica de Programação', 25),
	('Estatística', 20),
	('Sistemas Operacionais', 18),
	('Redes de Computadores', 22);

-- Stored Procedure para Inserir um Novo Curso
DELIMITER $$
CREATE PROCEDURE Inserir_Curso(
    IN nome_curso VARCHAR(150),
    IN quantidade_alunos INT
)
BEGIN
    INSERT INTO Cursos (nome, quantidade_alunos) VALUES (nome_curso, quantidade_alunos);
END$$

-- Stored Procedure para Selecionar Todos os Cursos
CREATE PROCEDURE Seleciona_Cursos()
BEGIN
    SELECT * FROM Cursos;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE gerar_email(
	in AlunoID int
)
begin 
	declare nome_aluno varchar(90);
    declare sobrenome_aluno varchar(90);
    declare aluno_email varchar(60);
    
    select nome, sobrenome into nome_aluno, sobrenome_aluno from aluno where aluno_id = alunoID;
    
    set	aluno_email = concat(nome_aluno, '.', sobrenome_aluno, '@dominio.com');
    
    update aluno set email = aluno_email where aluno_id = alunoID;
end$$

DELIMITER ;

DELIMITER $$

create procedure aluno_fim ()
begin
	select * from aluno;
    end $$
    
 DELIMITER ;    
 
select * from Cursos;
select * from Professores;
select * from Alunos;

 call inserir_curso('Matematica Basica', 5);
 call seleccionar_curso();
 call gerar_email(4);
 call aluno_fim();

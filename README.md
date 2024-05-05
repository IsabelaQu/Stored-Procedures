# Exercicio: Universidade (STORED PROCEDURES) 📒🖋️

> Crie um banco de dados para armazenar alunos, cursos e professores de uma universidade;
>
> Faça a modelagem do banco e identifique as entidades, seus atributos e relacionamentos;
> 
> Crie o modelo físico do banco de dados (script SQL);
> 
> Utilize Stored Procedures para automatizar a inserção e seleção dos cursos;
> 
> O aluno possui um email que deve ter seu endereço gerado automaticamente no seguinte formato:
> nome.sobrenome@dominio.com
> 
> Como fica o email se duas pessoas tiverem o mesmo nome e sobrenome?

## Descrição da Atividade 📓
O exercicio pede implementação de um banco de dados para uma universidade. Ele inclui a criação de tabelas para alunos, cursos e professores, além de procedimentos armazenados para inserção de cursos, seleção de cursos e geração automática de e-mails para os alunos. As stored procedures são usadas para automatizar essas tarefas específicas, proporcionando maior eficiência e organização ao banco de dados da universidade. Além disso, o DELIMITER é utilizado para definir um novo delimitador ($$) antes da criação das stored procedures, garantindo uma sintaxe correta e evitando conflitos com o delimitador padrão (;).

## Modelo Lógico 📈
![image](https://github.com/IsabelaQu/Stored-Procedures/assets/124175141/d2f5eb7e-02ab-4106-81e2-2974a4158b6d)


## Inserção e seleção dos Cursos
![image](https://github.com/IsabelaQu/Stored-Procedures/assets/124175141/70373a81-176c-4e43-b99a-ae8f4ebf0af8)

## Gerador de Email dos Alunos (Nome e Sobrenome)
![image](https://github.com/IsabelaQu/Stored-Procedures/assets/124175141/83e1f92b-24bb-4191-a68c-e3e0e65e29cd)


## Pré-requisitos
Sql Online 
|---|

<br/>

> [!IMPORTANT]
> Isabela Queiroz Ferreira RA: 236858

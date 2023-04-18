CREATE SCHEMA ESCOLAIF; 

USE ESCOLAIF;

CREATE TABLE CAMPUS(

      id_campus int NOT NULL auto_increment primary key,
      nome_campus varchar(45) NOT NULL,
      tipo_campus varchar(45) NOT NULL
);

CREATE TABLE CURSO(

  id_curso int NOT NULL auto_increment primary key,
  nome_curso varchar(45) NOT NULL,
  id_campus int NOT NULL,
  constraint fK_idcampus_curso foreign key(id_campus)
  references CAMPUS(id_campus)

);

 CREATE TABLE DISCIPLINA(
    
    id_disciplina int NOT NULL auto_increment primary key,
    nome_disciplina varchar(45) NOT NULL,
    carga_disciplina varchar(45) NOT NULL,
    id_professor int NOT NULL,
    constraint fk_idprofessor_disciplina foreign key(id_professor)
    references PROFESSOR(id_professor)
    
);

CREATE TABLE PROFESSOR(

    id_professor int NOT NULL auto_increment primary key,
    nome_professor varchar(45) NOT NULL,
    cpf_professor varchar(45) NOT NULL,
    rg_professor varchar(45) NOT NULL,
    id_endereco int NOT NULL,
    constraint fk_idendereco_professor foreign key(id_endereco)
    references ENDERECO(id_endereco)
    
);

CREATE TABLE ENDERECO(

    id_endereco int NOT NULL auto_increment primary key,
    rua_endereco varchar(45) NOT NULL,
    bairro_endereco varchar(45) NOT NULL,
	cidade_endereco varchar(45) NOT NULL,
	uf_endereco varchar(45) NOT NULL,
    numero_endereco int NOT NULL
);

CREATE TABLE ALUNO(

    id_aluno int NOT NULL auto_increment primary key,
    nome_aluno varchar(45) NOT NULL,
    cpf_aluno varchar(45) NOT NULL,
    rg_aluno varchar(45) NOT NULL,
	 id_endereco int NOT NULL,
    constraint fk_idendereco_aluno foreign key(id_endereco)
    references ENDERECO(id_endereco)
    
);

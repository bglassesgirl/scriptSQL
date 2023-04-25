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
CREATE INDEX IDX_ID_ENDERECO ON ENDERECO(ID_ENDERECO);
 
CREATE TABLE ALUNO(

    id_aluno int NOT NULL auto_increment primary key,
    nome_aluno varchar(45) NOT NULL,
    cpf_aluno varchar(45) NOT NULL,
    rg_aluno varchar(45) NOT NULL,
	 id_endereco int NOT NULL,
    constraint fk_idendereco_aluno foreign key(id_endereco)
    references ENDERECO(id_endereco)
    
);

 CREATE INDEX IDX_ID_ALUNO ON ALUNO(ID_ALUNO);
 
USE ESCOLAIF;

CREATE TABLE TELEFONE(
    id_telefone int NOT NULL auto_increment primary key,
    numeroTelefone varchar(45) NOT NULL,
	id_professor int,
    id_aluno int,
    constraint fk_idprofessor_telefone foreign key(id_professor)
    references PROFESSOR(id_professor),
	constraint fk_idaluno_telefone foreign key(id_aluno)
    references ALUNO(id_aluno)
);

CREATE TABLE DISCIPLINA_HAS_CURSO(
   
     id_disciplina int NOT NULL, 
	 id_curso int NOT NULL, 
     constraint fk_disciplina_disciplina_has_curso foreign key(id_disciplina)
     references DISCIPLINA(id_disciplina),
	 constraint fk_idcurso_disciplina_has_curso foreign key(id_curso)
     references CURSO(id_curso),
	 primary key(id_disciplina, id_curso)
);

CREATE TABLE NOTAS(
	 notaAluno double NOT NULL,
     id_aluno int NOT NULL,
     id_disciplina int NOT NULL,
	 constraint fk_aluno_notas foreign key(id_aluno)
     references ALUNO(id_aluno),
	 constraint fk_disciplina_notas foreign key(id_disciplina)
     references DISCIPLINA(id_disciplina),
     primary key(id_aluno, id_disciplina)
     
);

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

   USE ESCOLAIF;
   
   insert into campus(NOME_CAMPUS, TIPO_CAMPUS) values ("Paulo Afonso", "Principal");
   insert into campus(NOME_CAMPUS, TIPO_CAMPUS) values ("Água Branca", "Principal");
   insert into campus(NOME_CAMPUS, TIPO_CAMPUS) values ("Petrolâncida", "Principal");
   insert into campus(NOME_CAMPUS, TIPO_CAMPUS) values ("Maceió", "Principal");
    
   select * from campus;
   
   delete from campus where id_campus = 1; 
   
   insert into curso(NOME_CURSO, ID_CAMPUS) values ("Informática", 2);
   insert into curso(NOME_CURSO, ID_CAMPUS) values ("Eletromecanica", 2);
   insert into curso(NOME_CURSO, ID_CAMPUS) values ("Biocombustiveis", 2);
    
   select * from curso;
   
   insert into endereco(RUA_ENDERECO, BAIRRO_ENDERECO, CIDADE_ENDERECO, UF_ENDERECO,  NUMERO_ENDERECO) values ("Sao Bento", "centro", "água branca", "al", 2);
   insert into endereco(RUA_ENDERECO, BAIRRO_ENDERECO, CIDADE_ENDERECO, UF_ENDERECO,  NUMERO_ENDERECO) values ("Serra do Sitio", "centro", "água branca", "al", 3);
   insert into endereco(RUA_ENDERECO, BAIRRO_ENDERECO, CIDADE_ENDERECO, UF_ENDERECO,  NUMERO_ENDERECO) values ("Balneario", "centro", "Paulo Afonso", "al", 3);
   insert into endereco(RUA_ENDERECO, BAIRRO_ENDERECO, CIDADE_ENDERECO, UF_ENDERECO,  NUMERO_ENDERECO) values ("rua do ifba", "chesf", "Paulo Afonso", "al", 4);
   
   select * from endereco;
   
   insert into professor(NOME_PROFESSOR, CPF_PROFESSOR, RG_PROFESSOR, ID_ENDERECO) values ("Igor", "1922919219","382328", 4);
   insert into professor(NOME_PROFESSOR, CPF_PROFESSOR, RG_PROFESSOR, ID_ENDERECO) values ("Rita", "2922919219","482328", 4);
   insert into professor(NOME_PROFESSOR, CPF_PROFESSOR, RG_PROFESSOR, ID_ENDERECO) values ("Marina", "3922919219","582328", 4);
   
   select * from professor;
   
   insert into aluno(NOME_ALUNO, CPF_ALUNO, RG_ALUNO, ID_ENDERECO) values ("Luana", "9922919219","3232", 2);
   insert into aluno(NOME_ALUNO, CPF_ALUNO, RG_ALUNO, ID_ENDERECO) values ("Julia", "8922919219","4232", 2);
   insert into aluno(NOME_ALUNO, CPF_ALUNO, RG_ALUNO, ID_ENDERECO) values ("Beatriz", "7922919219","5232", 2);
   
   select * from aluno;
    
    CREATE TABLE TELEFONE(
    id_telefone int NOT NULL auto_increment primary key,
    numero_telefone varchar(45) NOT NULL,
	id_professor int,
    id_aluno int,
    constraint fk_idprofessor_telefone foreign key(id_professor)
    references PROFESSOR(id_professor),
	constraint fk_idaluno_telefone foreign key(id_aluno)
    references ALUNO(id_aluno)
   );
   
   
   insert into telefone(NUMERO_TELEFONE, ID_PROFESSOR, ID_ALUNO) values ("82828282", 1, 2);
   insert into telefone(NUMERO_TELEFONE, ID_PROFESSOR, ID_ALUNO) values ("82828282", 3, 2);
   insert into telefone(NUMERO_TELEFONE, ID_PROFESSOR, ID_ALUNO) values ("712828282", 2, 1);
   
   select * from telefone;

     insert disciplina(NOME_DISCIPLINA, CARGA_DISCIPLINA, ID_PROFESSOR) values ("Banco de dados", "80h", 1);
   insert disciplina(NOME_DISCIPLINA, CARGA_DISCIPLINA, ID_PROFESSOR) values ("Estrutura de dados", "80h", 1);
   insert disciplina(NOME_DISCIPLINA, CARGA_DISCIPLINA, ID_PROFESSOR) values ("Sistemas Operacionais", "80h", 1);
   
   select * from disciplina;
   
   CREATE TABLE NOTAS(
	 nota_aluno double NOT NULL,
     id_aluno int NOT NULL,
     id_disciplina int NOT NULL,
	 constraint fk_aluno_notas foreign key(id_aluno)
     references ALUNO(id_aluno),
	 constraint fk_disciplina_notas foreign key(id_disciplina)
     references DISCIPLINA(id_disciplina),
     primary key(id_aluno, id_disciplina)
);
   insert notas(NOTA_ALUNO, ID_ALUNO, ID_DISCIPLINA) values ("10", 1, 1);
    
    INSERT INTO campus (NOME_CAMPUS,TIPO_CAMPUS)
VALUES
  ("Floresta Salvador","Principal"),
  ("Floresta Salvador","Principal"),
  ("Afonso Floresta","NúcleoAvançado"),
  ("Floresta Salvador","Principal"),
  ("Afonso Floresta","NúcleoAvançado");

    select * from campus;
   
   USE ESCOLAIF;
   
   UPDATE campus SET tipo_campus ='Principal' WHERE id_campus = '7';
   
   select * from campus;


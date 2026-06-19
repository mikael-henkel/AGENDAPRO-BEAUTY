drop database IF exists Agenda;
create database Agenda;
use Agenda;
DROP TABLE IF EXISTS AREAS;
create table AREAS(
    id INT AUTO_INCREMENT PRIMARY KEY,
	nome varchar(200),
    descricao varchar(300)
);
DROP TABLE IF EXISTS  SERVICOS;
create table SERVICOS(
id INT AUTO_INCREMENT PRIMARY KEY,
area_id int, FOREIGN KEY (area_id) REFERENCES AREAS(id),
nome varchar(200),
duracao_min int,
preco decimal
);
DROP TABLE IF EXISTS USUARIOS;
create table USUARIOS(
id INT AUTO_INCREMENT PRIMARY KEY,
nome varchar(200),
email varchar(200),
senha_hash varchar(200),
perfil varchar(200),
criado_em timestamp DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE IF EXISTS STATUS_AGENDAMENTO;
create table STATUS_AGENDAMENTO(
id INT AUTO_INCREMENT PRIMARY KEY,
nome varchar(200),
descricao varchar(300)
);
DROP TABLE IF EXISTS PROFISSIONAIS;
create table PROFISSIONAIS(
id INT AUTO_INCREMENT PRIMARY KEY,
nome varchar(200),
especialidade varchar(200),
telefone varchar(200),
ativo boolean default true
);
DROP TABLE IF EXISTS  AGENDAMENTOS;
create table AGENDAMENTOS(
id INT AUTO_INCREMENT PRIMARY KEY,
usuarios_id int,foreign key (usuarios_id) REFERENCES USUARIOS(id),
profissional_id int, foreign key (profissional_id) REFERENCES  PROFISSIONAIS(id),
servico_id int, foreign key (servico_id) REFERENCES  SERVICOS(id),
status_id int, foreign key (status_id) REFERENCES  STATUS_AGENDAMENTO(id),
data_hora_inicio datetime,
data_hora_fim datetime,
criado_em timestamp DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE IF EXISTS HORARIOS_TRABALHO;
create table HORARIOS_TRABALHO(
  id INT AUTO_INCREMENT PRIMARY KEY,
  profissional_id int, foreign key (profissional_id) references PROFISSIONAIS(id),
  dia_semana int,
  hora_inicio time,
  hora_fim time
);
DROP TABLE IF EXISTS HORARIOS_BLOQUEADOS;
create table HORARIOS_BLOQUEADOS(
	id INT AUTO_INCREMENT PRIMARY KEY,
    profissional_id int, foreign key (profissional_id) references PROFISSIONAIS(id),
    inicio datetime,
    fim datetime,
    motivo varchar(200)
);


use maridoAluguel;

DROP TABLE usuario;
DROP table pesqSatisfacao;
drop table tipoServico;
drop table servico;
drop table contaBancaria;
drop table login;



/*Criação das tabelas */




CREATE TABLE usuario(
	idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeUsuario VARCHAR(50) NOT NULL,
    userName VARCHAR(15) NOT NULL,
    cpfcnpj VARCHAR(15) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    telefone VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(8) NOT NULL,
    dtnascimento DATE DEFAULT NULL,
    idTipoPessoa INT NOT NULL,
    UNIQUE KEY(username)
);

CREATE TABLE tipoPessoa(
	idTipoPessoa INT NOT NULL PRIMARY KEY,
	nomeTipoPessoa VARCHAR(30) NOT NULL
);

CREATE TABLE servico(
	idServico INT NOT NULL auto_increment PRIMARY KEY,
	dataInicio DATE NOT NULL,
	dataTermino DATE  NOT NULL,
	statusServico VARCHAR(50) NOT NULL,
	orcamento DECIMAL(10,2) NOT NULL,
	idTipoServico INT NOT NULL,
	idUsuario INT NOT NULL
);

CREATE TABLE tipoServico(
	idTipoServico INT NOT NULL PRIMARY KEY,
	nomeServ VARCHAR(50) NOT NULL
);


CREATE TABLE pesqSatisfacao(
	idServico INT NOT NULL,
	idUsuario INT NOT NULL,
    tipoPessoa INT NOT NULL,
	comentario VARCHAR(50),
	nota DECIMAL (2,2) NOT NULL
);

CREATE TABLE contaBancaria(
	idConta INT NOT NULL auto_increment PRIMARY KEY,
	idUsuario INT NOT NULL,
	agencia VARCHAR(50) NOT NULL,
    conta VARCHAR(50) NOT NULL,
	banco VARCHAR(50) NOT NULL
);

 CREATE TABLE cartaoCredito(
	idCartao INT NOT NULL auto_increment PRIMARY KEY,
	idUsuario INT NOT NULL,
	numeroCartao VARCHAR(50) NOT NULL,
	nomeTitular varchar(50) NOT NULL,
	dataVencimento DATE NOT NULL
	

);

CREATE TABLE orcamento(
	idOrcamento INT NOT NULL auto_increment PRIMARY KEY,
	idServico INT NOT NULL,
	valorMaterial DECIMAL(10,2),
	valorMaoDeObra DECIMAL(10,2) NOT NULL
);



CREATE TABLE login(
	username VARCHAR(15) NOT NULL,
	senha VARCHAR(8) NOT NULL,
	idTipoPessoa INT NOT NULL
);

CREATE TABLE teste(
	nome VARCHAR(50) NOT NULL,
    numero INT NOT NULL
);

/*Chaves estrangeiras*/

ALTER TABLE usuario ADD FOREIGN KEY (idTipoPessoa) references tipoPessoa (idTipoPessoa);
ALTER TABLE servico ADD FOREIGN KEY (idUsuario) references usuario (idUsuario);
ALTER TABLE pesqSatisfacao ADD FOREIGN KEY (idUsuario) references usuario (idUsuario);
ALTER TABLE contaBancaria ADD FOREIGN KEY (idUsuario) references usuario (idUsuario);
ALTER TABLE login ADD FOREIGN KEY (userName) references usuario (userName);
ALTER TABLE servico ADD FOREIGN KEY (idTipoServico) references tipoServico (idTipoServico);
ALTER TABLE pesqSatisfacao ADD FOREIGN KEY (idServico) references servico (idServico);
ALTER TABLE orcamento ADD FOREIGN KEY (idServico) references servico (idServico);
ALTER TABLE login ADD FOREIGN KEY (idTipoPessoa) references tipoPessoa (idTipoPessoa);


/* INSERTS */


INSERT INTO tipoServico values(1,'Hidráulica');
INSERT INTO tipoServico values(2,'Elétrica');
INSERT INTO tipoServico values(3,'Alvenaria');
INSERT INTO tipoServico values(4,'Outros');

INSERT INTO tipoPessoa values(1,'Contratado');
INSERT INTO tipoPessoa values(2,'Contratante');
INSERT INTO tipoPessoa values(3,'Administrador');

INSERT INTO usuario values (null,'Larissa Navarro','lanavarro','40825805813','Rua Raimundo Brandao Cela, 250 - Parque Boturussu','2576344','lanavarro_@hotmail.com','12345678','1997-05-11',1);




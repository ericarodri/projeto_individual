

CREATE DATABASE friends_site;

USE friends_site;

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(45),
email varchar(45),
senha varchar(45)
);

SELECT * FROM usuario;

 INSERT INTO usuario VALUES
 (null, 'rafaela', 'rafaela@outlook.com', 'rafa123');

CREATE TABLE Quiz(
idQuiz INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(45),
quantidade_questoes varchar(9)
);

CREATE TABLE tentativa(
idTentativa INT AUTO_INCREMENT,
fkQuiz INT,
fkUsuario INT, 
constraint fkQuiz foreign key (fkQuiz) references Quiz(idQuiz),
constraint fkUsuario foreign key (fkUsuario) references Usuario(idUsuario),
constraint pkComposta primary key (idTentativa, fkQuiz, fkUsuario),
acertos varchar(9),
classificacao varchar(10), constraint chkClassifica CHECK (classificacao IN ('alta', 'media','baixa')),
horario datetime default current_timestamp
);


-- INSERT INTO Quiz VALUES
-- (null, '7', 'media', default, 1);
 
CREATE TABLE personagem(
idpersonagem INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(45)
);

 INSERT INTO personagem VALUES
 (null, 'rachel'),
 (null, 'monica'),
 (null, 'ross'),
 (null, 'chandler'),
 (null, 'joey'),
 (null, 'phoebe');

CREATE TABLE voto(
idVoto INT AUTO_INCREMENT,
fkUser INT,
fkPersonagem INT,
constraint fkUser foreign key (fkUser) references Usuario(idUsuario),
constraint fkPersonagem foreign key (fkPersonagem) references personagem(idpersonagem),
constraint pkComposta primary key (idVoto, fkUser, fkPersonagem), 
horario datetime default current_timestamp
);

select personagem.nome, count(voto.idVoto) from personagem join voto on fkPersonagem = idpersonagem group by personagem.nome;
SELECT * FROM personagem;
 INSERT INTO voto VALUES
 (null, 1, 4, default),
 (null, 1, 4, default),
 (null, 1, 3, default),
 (null, 1, 2, default);
 INSERT INTO voto VALUES 
 (null, 1, 5, default);
 INSERT INTO voto VALUES
 (null, 2, 3, default);
truncate voto;
-- SELECT * FROM usuario JOIN quiz ON idUser = fkUser;

-- SELECT * FROM usuario JOIN voto ON idUser = fkUsuario
-- JOIN personagem ON idpersonagem = fkPersonagem;

 
 SELECT * FROM usuario;
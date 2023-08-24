CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_personagens(
	id bigint auto_increment,
    nome varchar(255) not null,
    vida bigint not null,
    ataque bigint not null,
    defesa bigint not null,
    primary key(id)
);

CREATE TABLE tb_classes(
	id bigint auto_increment,
    nome varchar(255) not null,
    funcao varchar(255) not null,
    primary key(id)
);

ALTER TABLE tb_personagens ADD classe_id bigint;

INSERT INTO tb_classes(nome,funcao) values("Ataque","Duelista");
INSERT INTO tb_classes(nome,funcao) values("Defesa","Sentinela");
INSERT INTO tb_classes(nome,funcao) values("Suporte","Suporte");
INSERT INTO tb_classes(nome,funcao) values("Iniciador","Iniciador");
INSERT INTO tb_classes(nome,funcao) values("Controlador","Controlador");

SELECT * FROM tb_classes;

ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes FOREIGN KEY(classe_id) REFERENCES tb_classes(id);

SELECT * FROM tb_personagens;

INSERT INTO tb_personagens(nome,vida,ataque,defesa,classe_id) VALUES("Phoenix ",100,3000,1000,1);
INSERT INTO tb_personagens(nome,vida,ataque,defesa,classe_id) VALUES("Cypher ",100,1000,3000,2);
INSERT INTO tb_personagens(nome,vida,ataque,defesa,classe_id) VALUES("Breach",100,1500,1500,3);
INSERT INTO tb_personagens(nome,vida,ataque,defesa,classe_id) VALUES("Skye ",100,2000,1700,4);
INSERT INTO tb_personagens(nome,vida,ataque,defesa,classe_id) VALUES("Omen",100,3000,2000,5);
INSERT INTO tb_personagens(nome,vida,ataque,defesa,classe_id) VALUES("Jett",100,4000,2000,1);
INSERT INTO tb_personagens(nome,vida,ataque,defesa,classe_id) VALUES("Killjoy ",100,5000,1000,2);
INSERT INTO tb_personagens(nome,vida,ataque,defesa,classe_id) VALUES("Sage ",100,2500,3000,3);

SELECT * FROM tb_personagens WHERE ataque>2000;

SELECT * FROM tb_personagens WHERE defesa>=1000 AND defesa<=2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

SELECT * FROM tb_personagens INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classe_id; 

SELECT * FROM tb_personagens INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classe_id WHERE funcao="Duelista";
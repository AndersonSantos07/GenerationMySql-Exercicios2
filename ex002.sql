CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_pizzas(
	id bigint auto_increment,
    nome varchar(255) not null,
    sabor varchar(255) not null,
    tamanho varchar(255) not null,
    preco decimal not null,
    primary key(id)
);

CREATE TABLE tb_categorias(
	id bigint auto_increment,
    tipo varchar(255) not null,
    massa varchar(255) not null,
    primary key(id)
);

ALTER TABLE tb_pizzas ADD categorias_id bigint;

INSERT INTO tb_categorias(tipo,massa) values("Salgada","fina");
INSERT INTO tb_categorias(tipo,massa) values("Doce","espessa");
INSERT INTO tb_categorias(tipo,massa) values("Salgada","integral");
INSERT INTO tb_categorias(tipo,massa) values("Doce","sem glútem");
INSERT INTO tb_categorias(tipo,massa) values("Salgada","padrão");

SELECT * FROM tb_categorias;

ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categorias FOREIGN KEY(categorias_id) REFERENCES tb_categorias(id);

SELECT * FROM tb_pizzas;

INSERT INTO tb_pizzas(nome,sabor,tamanho,preco,categorias_id) VALUES("FORD KA","Mussarela","Grande",30.00,1);
INSERT INTO tb_pizzas(nome,sabor,tamanho,preco,categorias_id) VALUES("RANGE ROVER","Calabresa","Grande",30.00,3);
INSERT INTO tb_pizzas(nome,sabor,tamanho,preco,categorias_id) VALUES("CITROEN C4","Margherita","Grande",35.00,1);
INSERT INTO tb_pizzas(nome,sabor,tamanho,preco,categorias_id) VALUES("CORSA","Pepperoni","Grande",33.00,1);
INSERT INTO tb_pizzas(nome,sabor,tamanho,preco,categorias_id) VALUES("FERRARI","Quatro Queijos","Grande",40.00,1);
INSERT INTO tb_pizzas(nome,sabor,tamanho,preco,categorias_id) VALUES("FIESTA","Franco com Catupiry","Grande",38.00,1);
INSERT INTO tb_pizzas(nome,sabor,tamanho,preco,categorias_id) VALUES("LAMBO","Portuguesa","Grande",42.00,1);
INSERT INTO tb_pizzas(nome,sabor,tamanho,preco,categorias_id) VALUES("ASTRA","Vegetariana","Grande",65.00,3);

SELECT * FROM tb_pizzas WHERE preco>45.00;

SELECT * FROM tb_pizzas WHERE preco>=50.00 AND preco<=100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE "%M%";

SELECT * FROM tb_pizzas INNER JOIN tb_categorias ON tb_categorias.id = tb_pizzas.categorias_id; 

SELECT * FROM tb_pizzas INNER JOIN tb_categorias ON tb_categorias.id = tb_pizzas.categorias_id WHERE tamanho="Grande";
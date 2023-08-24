CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_produtos(
	id bigint auto_increment,
    nome varchar(255) not null,
    tipo varchar(255) not null,
    quantidade decimal not null,
    preco decimal not null,
    fk_produtos_categorias_id bigint,
    primary key(id),
    FOREIGN KEY(fk_produtos_categorias_id) REFERENCES tb_categorias(id)
);

CREATE TABLE tb_categorias(
	id bigint auto_increment,
    categoria varchar(255) not null,
    registradoAnvisa boolean not null,
    primary key(id)
);



INSERT INTO tb_categorias (categoria, registradoAnvisa) VALUES
('Analgésico', true),
('Antibiótico', true),
('Anti-inflamatório', true),
('Antisséptico', true),
('Anti-histamínico', true);

INSERT INTO tb_produtos (nome, tipo, quantidade, preco, fk_produtos_categorias_id) VALUES
('Paracetamol 500mg', 'Comprimido', 50, 10.99, 1),
('Amoxicilina 250mg', 'Cápsula', 30, 15.50, 2),
('Ibuprofeno 200mg', 'Comprimido', 40, 8.75, 3),
('Mertiolate Solução', 'Líquido', 20, 12.00, 4),
('Cetirizina 10mg', 'Comprimido', 25, 9.99, 5),
('Dipirona 500mg', 'Comprimido', 60, 7.25, 1),
('Betametasona Creme', 'Creme', 15, 18.50, 3),
('Loratadina 10mg', 'Comprimido', 40, 6.50, 5);


SELECT * FROM tb_categorias;
SELECT * FROM tb_produtos;


SELECT * FROM tb_produtos WHERE preco>50.00;

SELECT * FROM tb_produtos WHERE preco>=5.00 AND preco<=60.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * FROM tb_produtos INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.fk_produtos_categorias_id; 

SELECT * FROM tb_produtos INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.fk_produtos_categorias_id WHERE tb_categorias.categoria = "Analgésico";
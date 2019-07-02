INSERT INTO bd.cliente VALUES('Joao','001','(00)0000-0000','rua A numero 0');
INSERT INTO bd.cliente VALUES('Pedro','002','(11)1111-1111','rua B numero 4');
INSERT INTO bd.cliente VALUES('Jose','003','(22)2222-2222','rua C numero 100');
INSERT INTO bd.cliente VALUES('Debora','004','(33)3333-3333','rua D numero 44');
INSERT INTO bd.cliente VALUES('Julia','005','(44)4444-4444','rua E numero 5');
INSERT INTO bd.cliente VALUES('Paula','006','(55)5555-5555','rua F numero 10');

INSERT INTO bd.funcionarios VALUES('Gustavo','003','(11)1111-1111','rua C numero 0', 0);
INSERT INTO bd.funcionarios VALUES('Ricardo','004','(11)1111-1111','rua E numero 9', 1);
INSERT INTO bd.funcionarios VALUES('Romulo','006','(11)1111-1111','rua F numero 5', 1);
INSERT INTO bd.funcionarios VALUES('Claudio','007','(11)1111-1111','rua G numero 7', 1);
INSERT INTO bd.funcionarios VALUES('Henrique','008','(11)1111-1111','rua H numero 4', 1);
INSERT INTO bd.funcionarios VALUES('Gabriela','009','(11)1111-1111','rua I numero 9', 0);

INSERT INTO bd.produto VALUES('pao','11/11/2019','001');
INSERT INTO bd.produto VALUES('leite','10/11/2019','002');
INSERT INTO bd.produto VALUES('Bolo','10/08/2019','003');
INSERT INTO bd.produto VALUES('Carne','22/07/2019','004');

INSERT INTO bd.estoque VALUES('001',50,'001');
INSERT INTO bd.estoque VALUES('002',35,'002');
INSERT INTO bd.estoque VALUES('003',13,'003');
INSERT INTO bd.estoque VALUES('004',7,'004');

INSERT INTO bd.deposito VALUES('001','001');
INSERT INTO bd.deposito VALUES('002','002');
INSERT INTO bd.deposito VALUES('003','003');
INSERT INTO bd.deposito VALUES('004','004');

INSERT INTO bd.fornecedores VALUES('Padaria mel', '00.000.000/0000-00','00 0000-0000', 'Estrada A, s/n');
INSERT INTO bd.fornecedores VALUES('Acogue do Boi', '10.000.000/0000-00','00 0000-0000', 'Estrada B, s/n');

INSERT INTO bd.gerente VALUES('004');
INSERT INTO bd.gerente VALUES('009');

INSERT INTO bd.vendedor VALUES('003');
INSERT INTO bd.vendedor VALUES('006');
INSERT INTO bd.vendedor VALUES('007');
INSERT INTO bd.vendedor VALUES('008');

INSERT INTO bd.itemfornecido VALUES('001',.05, 1, '4','001','00.000.000/0000-00');
INSERT INTO bd.itemfornecido VALUES('002',15.0, 10, '3','003','10.000.000/0000-00');

INSERT into bd.venda VALUES('002',15.0,'2019-01-03 10:00:00', '001','003', '004');
INSERT into bd.venda VALUES('001',15.0,'2019-01-03 10:00:00', '001','003', '003');

INSERT into bd.itempedido VALUES('001',5.0,3,'001','001');
INSERT into bd.itempedido VALUES('002',4.0,8,'004','001');

INSERT INTO bd.setor VALUES('Padaria', '004', 0)

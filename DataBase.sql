--produtos--
CREATE TABLE produtos(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome TEXT NOT NULL,
  preco REAL NOT NULL,
  descricao TEXT NOT NULL,
  estoque INTEGER NOT NULL
);

--categorias--
CREATE TABLE categorias(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome TEXT NOT NULL
);
--categoriasProdutos--
CREATE TABLE categoriasProdutos(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  idCategoria INTEGER NOT NULL,
  idProduto INTEGER NOT NULL,
  FOREIGN KEY (idCategoria) REFERENCES categorias(id),
  FOREIGN KEY (idProduto) REFERENCES produtos(id)
);

--imagens--
CREATE TABLE imagens(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  imagemURL TEXT NOT NULL,
  idProduto INTEGER NOT NULL,
  FOREIGN KEY (idProduto) REFERENCES produtos(id)
);

--avaliacoes--
CREATE TABLE avaliacoes(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  idProduto INTEGER NOT NULL,
  idCliente INTEGER NOT NULL,
  avaliacao TEXT NOT NULL,
  nota INTEGER NOT NULL,
  data_avaliacao TEXT NOT NULL,
  FOREIGN KEY (idProduto) REFERENCES produtos(id),
  FOREIGN KEY (idCliente) REFERENCES clientes(id)
);

--clientes--
CREATE TABLE clientes(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome TEXT NOT NULL,
  email TEXT NOT NULL,
  endereco TEXT NOT NULL,
  numero TEXT NOT NULL,
  bairro TEXT NOT NULL,
  cep INTEGER NOT NULL,
  complemento TEXT NOT NULL,
  idCidade INTEGER NOT NULL,
  FOREIGN KEY (idCidade) REFERENCES cidades(id)
);

--pedidos--
CREATE TABLE pedidos(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  idCliente INTEGER NOT NULL,
  dataPedido TEXT NOT NULL,
  statusPedido TEXT NOT NULL,
  FOREIGN KEY (idCliente) REFERENCES clientes(id)
);

--pedidos_produtos--
CREATE TABLE pedidos_produtos(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  idProduto INTEGER NOT NULL,
  quantidade INTEGER NOT NULL,
  idPedido INTEGER NOT NULL,
  FOREIGN KEY (idProduto) REFERENCES produtos(id), 
  FOREIGN KEY (idPedido) REFERENCES pedidos(id)
);

--estados--
CREATE TABLE estados(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome TEXT NOT NULL,
  sigla VARCHAR(2) NOT NULL 
);

--cidades--
CREATE TABLE cidades(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome TEXT NOT NULL,
  idEstado INTEGER NOT NULL,
  FOREIGN KEY (idEstado) REFERENCES estados(id)
);

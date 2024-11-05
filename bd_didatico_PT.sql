CREATE TABLE categorias (
    categoria_id smallint NOT NULL,
    nome_categoria character varying(150) NOT NULL,
    descricao text,
    imagem bytea
);


CREATE TABLE cliente_tipo_cliente (
    cliente_id character varying(5) NOT NULL,
    tipo_cliente_id character varying(5) NOT NULL
);


CREATE TABLE tipos_clientes (
    tipo_cliente_id character varying(5) NOT NULL,
    descricao_cliente text
);


CREATE TABLE clientes (
    cliente_id character varying(5) NOT NULL,
    nome_empresa character varying(40) NOT NULL,
    nome_contato character varying(160),
    cargo_contato character varying(160),
    endereco character varying(60),
    cidade character varying(150),
    regiao character varying(150),
    codigo_postal character varying(10),
    pais character varying(150),
    telefone character varying(24),
    fax character varying(24)
);



CREATE TABLE funcionarios (
    funcionario_id smallint NOT NULL,
    sobrenome character varying(20) NOT NULL,
    primeiro_nome character varying(10) NOT NULL,
    cargo character varying(160),
    saudacao character varying(25),
    data_nascimento date,
    data_admissao date,
    endereco character varying(60),
    cidade character varying(150),
    regiao character varying(150),
    codigo_postal character varying(10),
    pais character varying(150),
    telefone_residencial character varying(24),
    ramal character varying(4),
    foto bytea,
    notas text,
    chefe_id smallint,
    caminho_foto character varying(255)
);



CREATE TABLE territorios_funcionarios (
    funcionario_id smallint NOT NULL,
    territorio_id character varying(20) NOT NULL
);


CREATE TABLE detalhes_pedido (
    pedido_id smallint NOT NULL,
    produto_id smallint NOT NULL,
    preco_unitario real NOT NULL,
    quantidade smallint NOT NULL,
    desconto real NOT NULL
);



CREATE TABLE pedidos (
    pedido_id smallint NOT NULL,
    cliente_id character varying(5),
    funcionario_id smallint,
    data_pedido date,
    data_necessidade date,
    data_envio date,
    transportadora_id smallint,
    frete real,
    nome_destinatario character varying(40),
    endereco_destinatario character varying(60),
    cidade_destinatario character varying(150),
    regiao_destinatario character varying(150),
    codigo_postal_destinatario character varying(10),
    pais_destinatario character varying(150)
);

-- Nome: produtos; Tipo: TABELA; Esquema: public; Proprietário: -; Tablespace: 

CREATE TABLE produtos (
    produto_id smallint NOT NULL,
    nome_produto character varying(40) NOT NULL,
    fornecedor_id smallint,
    categoria_id smallint,
    quantidade_por_unidade character varying(20),
    preco_unitario real,
    unidades_em_estoque smallint,
    unidades_encomendadas smallint,
    nivel_reposicao smallint,
    descontinuado integer NOT NULL
);

-- Nome: regioes; Tipo: TABELA; Esquema: public; Proprietário: -; Tablespace: 

CREATE TABLE regioes (
    regiao_id smallint NOT NULL,
    descricao_regiao character varying(60) NOT NULL
);

-- Nome: transportadoras; Tipo: TABELA; Esquema: public; Proprietário: -; Tablespace: 

CREATE TABLE transportadoras (
    transportadora_id smallint NOT NULL,
    nome_empresa character varying(40) NOT NULL,
    telefone character varying(24)
);

-- Nome: fornecedores; Tipo: TABELA; Esquema: public; Proprietário: -; Tablespace: 

CREATE TABLE fornecedores (
    fornecedor_id smallint NOT NULL,
    nome_empresa character varying(40) NOT NULL,
    nome_contato character varying(160),
    cargo_contato character varying(160),
    endereco character varying(60),
    cidade character varying(150),
    regiao character varying(150),
    codigo_postal character varying(10),
    pais character varying(150),
    telefone character varying(24),
    fax character varying(24),
    homepage text
);

-- Nome: territorios; Tipo: TABELA; Esquema: public; Proprietário: -; Tablespace: 

CREATE TABLE territorios (
    territorio_id character varying(20) NOT NULL,
    descricao_territorio character varying(60) NOT NULL,
    regiao_id smallint NOT NULL
);

-- Nome: estados_eua; Tipo: TABELA; Esquema: public; Proprietário: -; Tablespace: 

CREATE TABLE estados_eua (
    estado_id smallint NOT NULL,
    nome_estado character varying(100),
    sigla_estado character varying(2),
    regiao_estado character varying(50)
);

-- Dados para Nome: categorias; Tipo: DADOS DA TABELA; Esquema: public; Proprietário: -

-- Dados para a tabela categorias
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (1, 'Bebidas', 'Refrigerantes, cafés, chás, cervejas e destilados', '\x');
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (2, 'Condimentos', 'Molhos doces e salgados, conservas, pastas e temperos', '\x');
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (3, 'Doces', 'Sobremesas, doces e pães doces', '\x');
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (4, 'Laticínios', 'Queijos', '\x');
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (5, 'Grãos/Cereais', 'Pães, biscoitos, massas e cereais', '\x');
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (6, 'Carnes/Aves', 'Carnes processadas', '\x');
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (7, 'Hortifruti', 'Frutas secas e soja', '\x');
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (8, 'Frutos do Mar', 'Algas e peixes', '\x');
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (9, 'Padaria', 'Pães, bolos e doces', '\x');
INSERT INTO categorias (categoria_id, nome_categoria, descricao, imagem) VALUES (10, 'Especiarias', 'Ervas, temperos e especiarias diversas', '\x');


-- Dados para tabela cliente_tipo_cliente
INSERT INTO cliente_tipo_cliente VALUES ('C001', 'TC01');
INSERT INTO cliente_tipo_cliente VALUES ('C002', 'TC02');
INSERT INTO cliente_tipo_cliente VALUES ('C003', 'TC01');
INSERT INTO cliente_tipo_cliente VALUES ('C004', 'TC03');
INSERT INTO cliente_tipo_cliente VALUES ('C005', 'TC02');
INSERT INTO cliente_tipo_cliente VALUES ('C006', 'TC01');
INSERT INTO cliente_tipo_cliente VALUES ('C007', 'TC04');
INSERT INTO cliente_tipo_cliente VALUES ('C008', 'TC03');
INSERT INTO cliente_tipo_cliente VALUES ('C009', 'TC02');
INSERT INTO cliente_tipo_cliente VALUES ('C010', 'TC04');

-- Dados para tabela tipos_clientes
INSERT INTO tipos_clientes VALUES ('TC01', 'Cliente Preferencial');
INSERT INTO tipos_clientes VALUES ('TC02', 'Cliente Regular');
INSERT INTO tipos_clientes VALUES ('TC03', 'Cliente Novo');
INSERT INTO tipos_clientes VALUES ('TC04', 'Cliente Ocasionais');
INSERT INTO tipos_clientes VALUES ('TC05', 'Cliente VIP');
INSERT INTO tipos_clientes VALUES ('TC06', 'Cliente Premium');
INSERT INTO tipos_clientes VALUES ('TC07', 'Cliente Executivo');
INSERT INTO tipos_clientes VALUES ('TC08', 'Cliente Estudante');
INSERT INTO tipos_clientes VALUES ('TC09', 'Cliente Corporativo');
INSERT INTO tipos_clientes VALUES ('TC10', 'Cliente de Alta Demanda');

-- Dados para tabela clientes
INSERT INTO clientes VALUES ('C001', 'Empresa Alpha', 'Carlos Souza', 'Diretor', 'Rua A', 'São Paulo', 'SP', '01000-000', 'Brasil', '(11) 1111-1111', '(11) 1111-1112');
INSERT INTO clientes VALUES ('C002', 'Empresa Beta', 'Ana Costa', 'Gerente', 'Rua B', 'Rio de Janeiro', 'RJ', '20000-000', 'Brasil', '(21) 2222-2222', '(21) 2222-2223');
INSERT INTO clientes VALUES ('C003', 'Empresa Gamma', 'José Silva', 'Supervisor', 'Rua C', 'Belo Horizonte', 'MG', '30000-000', 'Brasil', '(31) 3333-3333', '(31) 3333-3334');
INSERT INTO clientes VALUES ('C004', 'Empresa Delta', 'Mariana Oliveira', 'Coordenadora', 'Rua D', 'Curitiba', 'PR', '40000-000', 'Brasil', '(41) 4444-4444', '(41) 4444-4445');
INSERT INTO clientes VALUES ('C005', 'Empresa Épsilon', 'Ricardo Dias', 'Analista', 'Rua E', 'Salvador', 'BA', '50000-000', 'Brasil', '(71) 5555-5555', '(71) 5555-5556');
INSERT INTO clientes VALUES ('C006', 'Empresa Zeta', 'Julia Pereira', 'Consultora', 'Rua F', 'Fortaleza', 'CE', '60000-000', 'Brasil', '(85) 6666-6666', '(85) 6666-6667');
INSERT INTO clientes VALUES ('C007', 'Empresa Eta', 'Luciano Lima', 'Assistente', 'Rua G', 'Porto Alegre', 'RS', '70000-000', 'Brasil', '(51) 7777-7777', '(51) 7777-7778');
INSERT INTO clientes VALUES ('C008', 'Empresa Theta', 'Paula Santos', 'Engenheira', 'Rua H', 'Brasília', 'DF', '80000-000', 'Brasil', '(61) 8888-8888', '(61) 8888-8889');
INSERT INTO clientes VALUES ('C009', 'Empresa Iota', 'Gabriel Martins', 'Técnico', 'Rua I', 'Manaus', 'AM', '90000-000', 'Brasil', '(92) 9999-9999', '(92) 9999-9998');
INSERT INTO clientes VALUES ('C010', 'Empresa Kappa', 'Fernanda Souza', 'Estagiária', 'Rua J', 'Recife', 'PE', '10000-000', 'Brasil', '(81) 1010-1010', '(81) 1010-1011');

-- Dados para tabela funcionarios
INSERT INTO funcionarios VALUES (1, 'Silva', 'João', 'Gerente', 'Sr.', '1980-01-01', '2005-02-01', 'Rua X', 'São Paulo', 'SP', '01000-000', 'Brasil', '(11) 9876-5432', '1234', '\x', 'Funcionário exemplar', NULL, '/imagens/joao.png');
INSERT INTO funcionarios VALUES (2, 'Pereira', 'Maria', 'Diretora', 'Sra.', '1975-03-05', '2002-07-11', 'Rua Y', 'Rio de Janeiro', 'RJ', '20000-000', 'Brasil', '(21) 8765-4321', '2345', '\x', 'Muito experiente', NULL, '/imagens/maria.png');
INSERT INTO funcionarios VALUES (3, 'Costa', 'José', 'Coordenador', 'Sr.', '1985-08-15', '2010-09-20', 'Rua Z', 'Belo Horizonte', 'MG', '30000-000', 'Brasil', '(31) 7654-3210', '3456', '\x', 'Ótimo desempenho', NULL, '/imagens/jose.png');
INSERT INTO funcionarios VALUES (4, 'Santos', 'Ana', 'Analista', 'Sra.', '1990-06-10', '2015-10-12', 'Rua W', 'Curitiba', 'PR', '40000-000', 'Brasil', '(41) 6543-2109', '4567', '\x', 'Especialista em análise', NULL, '/imagens/ana.png');
INSERT INTO funcionarios VALUES (5, 'Oliveira', 'Carlos', 'Consultor', 'Sr.', '1982-02-17', '2007-04-25', 'Rua V', 'Salvador', 'BA', '50000-000', 'Brasil', '(71) 5432-1098', '5678', '\x', 'Consultor experiente', NULL, '/imagens/carlos.png');
INSERT INTO funcionarios VALUES (6, 'Melo', 'Júlia', 'Engenheira', 'Sra.', '1992-11-30', '2013-03-03', 'Rua U', 'Fortaleza', 'CE', '60000-000', 'Brasil', '(85) 4321-0987', '6789', '\x', 'Especialista em projetos', NULL, '/imagens/julia.png');
INSERT INTO funcionarios VALUES (7, 'Lima', 'Ricardo', 'Supervisor', 'Sr.', '1987-05-22', '2012-06-15', 'Rua T', 'Porto Alegre', 'RS', '70000-000', 'Brasil', '(51) 3210-9876', '7890', '\x', 'Supervisiona operações', NULL, '/imagens/ricardo.png');
INSERT INTO funcionarios VALUES (8, 'Alves', 'Fernanda', 'Estagiária', 'Sra.', '1995-09-09', '2021-01-04', 'Rua S', 'Brasília', 'DF', '80000-000', 'Brasil', '(61) 2109-8765', '8901', '\x', 'Auxilia equipe', NULL, '/imagens/fernanda.png');
INSERT INTO funcionarios VALUES (9, 'Araujo', 'Gabriel', 'Técnico', 'Sr.', '1989-12-12', '2018-08-07', 'Rua R', 'Manaus', 'AM', '90000-000', 'Brasil', '(92) 1098-7654', '9012', '\x', 'Habilidades técnicas', NULL, '/imagens/gabriel.png');
INSERT INTO funcionarios VALUES (10, 'Nascimento', 'Paula', 'Assistente', 'Sra.', '1998-07-18', '2020-11-15', 'Rua Q', 'Recife', 'PE', '10000-000', 'Brasil', '(81) 0987-6543', '0123', '\x', 'Assistente eficiente', NULL, '/imagens/paula.png');

-- Dados para tabela territorios_funcionarios
INSERT INTO territorios_funcionarios VALUES (1, 'T01');
INSERT INTO territorios_funcionarios VALUES (2, 'T02');
INSERT INTO territorios_funcionarios VALUES (3, 'T03');
INSERT INTO territorios_funcionarios VALUES (4, 'T04');
INSERT INTO territorios_funcionarios VALUES (5, 'T05');
INSERT INTO territorios_funcionarios VALUES (6, 'T06');
INSERT INTO territorios_funcionarios VALUES (7, 'T07');
INSERT INTO territorios_funcionarios VALUES (8, 'T08');
INSERT INTO territorios_funcionarios VALUES (9, 'T09');
INSERT INTO territorios_funcionarios VALUES (10, 'T10');

-- Dados para tabela detalhes_pedido
INSERT INTO detalhes_pedido VALUES (1, 1, 10.0, 5, 0.1);
INSERT INTO detalhes_pedido VALUES (1, 2, 20.0, 3, 0.15);
INSERT INTO detalhes_pedido VALUES (2, 3, 15.0, 7, 0.05);
INSERT INTO detalhes_pedido VALUES (2, 4, 25.0, 2, 0.2);
INSERT INTO detalhes_pedido VALUES (3, 5, 30.0, 6, 0.1);
INSERT INTO detalhes_pedido VALUES (3, 6, 12.0, 4, 0.05);
INSERT INTO detalhes_pedido VALUES (4, 7, 18.0, 5, 0.1);
INSERT INTO detalhes_pedido VALUES (4, 8, 22.0, 8, 0.15);
INSERT INTO detalhes_pedido VALUES (5, 9, 14.0, 3, 0.2);
INSERT INTO detalhes_pedido VALUES (5, 10, 26.0, 2, 0.05);

-- Dados para a tabela pedidos
INSERT INTO pedidos VALUES (1, 'C001', 1, '2023-01-01', '2023-01-10', '2023-01-05', 1, 50.0, 'Carlos Souza', 'Rua A, 100', 'São Paulo', 'SP', '01000-000', 'Brasil');
INSERT INTO pedidos VALUES (2, 'C002', 2, '2023-01-02', '2023-01-12', '2023-01-06', 2, 60.0, 'Ana Costa', 'Rua B, 200', 'Rio de Janeiro', 'RJ', '20000-000', 'Brasil');
INSERT INTO pedidos VALUES (3, 'C003', 3, '2023-01-03', '2023-01-13', '2023-01-07', 3, 70.0, 'José Silva', 'Rua C, 300', 'Belo Horizonte', 'MG', '30000-000', 'Brasil');
INSERT INTO pedidos VALUES (4, 'C004', 4, '2023-01-04', '2023-01-14', '2023-01-08', 1, 80.0, 'Mariana Oliveira', 'Rua D, 400', 'Curitiba', 'PR', '40000-000', 'Brasil');
INSERT INTO pedidos VALUES (5, 'C005', 5, '2023-01-05', '2023-01-15', '2023-01-09', 2, 90.0, 'Ricardo Dias', 'Rua E, 500', 'Salvador', 'BA', '50000-000', 'Brasil');
INSERT INTO pedidos VALUES (6, 'C006', 6, '2023-01-06', '2023-01-16', '2023-01-10', 3, 100.0, 'Julia Pereira', 'Rua F, 600', 'Fortaleza', 'CE', '60000-000', 'Brasil');
INSERT INTO pedidos VALUES (7, 'C007', 7, '2023-01-07', '2023-01-17', '2023-01-11', 1, 110.0, 'Luciano Lima', 'Rua G, 700', 'Porto Alegre', 'RS', '70000-000', 'Brasil');
INSERT INTO pedidos VALUES (8, 'C008', 8, '2023-01-08', '2023-01-18', '2023-01-12', 2, 120.0, 'Paula Santos', 'Rua H, 800', 'Brasília', 'DF', '80000-000', 'Brasil');
INSERT INTO pedidos VALUES (9, 'C009', 9, '2023-01-09', '2023-01-19', '2023-01-13', 3, 130.0, 'Gabriel Martins', 'Rua I, 900', 'Manaus', 'AM', '90000-000', 'Brasil');
INSERT INTO pedidos VALUES (10, 'C010', 10, '2023-01-10', '2023-01-20', '2023-01-14', 1, 140.0, 'Fernanda Souza', 'Rua J, 1000', 'Recife', 'PE', '10000-000', 'Brasil');

-- Dados para a tabela produtos
INSERT INTO produtos VALUES (1, 'Produto A', 1, 1, '10 caixas', 20.0, 100, 10, 5, 0);
INSERT INTO produtos VALUES (2, 'Produto B', 2, 2, '20 pacotes', 15.0, 50, 20, 10, 0);
INSERT INTO produtos VALUES (3, 'Produto C', 3, 3, '15 unidades', 25.0, 200, 15, 8, 0);
INSERT INTO produtos VALUES (4, 'Produto D', 4, 4, '30 frascos', 30.0, 120, 5, 3, 1);
INSERT INTO produtos VALUES (5, 'Produto E', 5, 5, '5 litros', 50.0, 80, 25, 12, 0);
INSERT INTO produtos VALUES (6, 'Produto F', 6, 6, '2 garrafas', 45.0, 60, 30, 15, 0);
INSERT INTO produtos VALUES (7, 'Produto G', 7, 7, '7 quilos', 35.0, 70, 5, 4, 1);
INSERT INTO produtos VALUES (8, 'Produto H', 8, 8, '40 pacotes', 60.0, 90, 40, 20, 0);
INSERT INTO produtos VALUES (9, 'Produto I', 9, 9, '12 frascos', 40.0, 110, 20, 10, 1);
INSERT INTO produtos VALUES (10, 'Produto J', 10, 10, '50 pacotes', 55.0, 130, 15, 7, 0);

INSERT INTO produtos VALUES (11, 'Produto K', 8, 8, '40 pacotes', 60.123, 90, 40, 20, 0);
INSERT INTO produtos VALUES (12, 'Produto L', 9, 9, '12 frascos', 40.45, 110, 20, 10, 1);

-- Dados para a tabela regioes
INSERT INTO regioes VALUES (1, 'Nordeste');
INSERT INTO regioes VALUES (2, 'Sudeste');
INSERT INTO regioes VALUES (3, 'Centro-Oeste');
INSERT INTO regioes VALUES (4, 'Sul');
INSERT INTO regioes VALUES (5, 'Norte');
INSERT INTO regioes VALUES (6, 'Região Metropolitana de São Paulo');
INSERT INTO regioes VALUES (7, 'Região Metropolitana do Rio de Janeiro');
INSERT INTO regioes VALUES (8, 'Região Metropolitana de Belo Horizonte');
INSERT INTO regioes VALUES (9, 'Região Metropolitana de Salvador');
INSERT INTO regioes VALUES (10, 'Região Metropolitana de Brasília');

-- Dados para a tabela transportadoras
INSERT INTO transportadoras VALUES (1, 'Transportadora Alpha', '(11) 1111-1111');
INSERT INTO transportadoras VALUES (2, 'Transportadora Beta', '(21) 2222-2222');
INSERT INTO transportadoras VALUES (3, 'Transportadora Gamma', '(31) 3333-3333');
INSERT INTO transportadoras VALUES (4, 'Transportadora Delta', '(41) 4444-4444');
INSERT INTO transportadoras VALUES (5, 'Transportadora Épsilon', '(71) 5555-5555');
INSERT INTO transportadoras VALUES (6, 'Transportadora Zeta', '(85) 6666-6666');
INSERT INTO transportadoras VALUES (7, 'Transportadora Eta', '(51) 7777-7777');
INSERT INTO transportadoras VALUES (8, 'Transportadora Theta', '(61) 8888-8888');
INSERT INTO transportadoras VALUES (9, 'Transportadora Iota', '(92) 9999-9999');
INSERT INTO transportadoras VALUES (10, 'Transportadora Kappa', '(81) 1010-1010');

-- Dados para a tabela fornecedores
INSERT INTO fornecedores VALUES (1, 'Fornecedor A', 'João Silva', 'Gerente', 'Rua A', 'São Paulo', 'SP', '01000-000', 'Brasil', '(11) 9876-5432', '(11) 9876-5431', 'https://www.fornecedora.com');
INSERT INTO fornecedores VALUES (2, 'Fornecedor B', 'Maria Costa', 'Diretora', 'Rua B', 'Rio de Janeiro', 'RJ', '20000-000', 'Brasil', '(21) 8765-4321', '(21) 8765-4320', 'https://www.fornecedorb.com');
INSERT INTO fornecedores VALUES (3, 'Fornecedor C', 'Carlos Pereira', 'Supervisor', 'Rua C', 'Belo Horizonte', 'MG', '30000-000', 'Brasil', '(31) 7654-3210', '(31) 7654-3209', 'https://www.fornecedorc.com');
INSERT INTO fornecedores VALUES (4, 'Fornecedor D', 'Ana Santos', 'Analista', 'Rua D', 'Curitiba', 'PR', '40000-000', 'Brasil', '(41) 6543-2109', '(41) 6543-2108', 'https://www.fornecedord.com');
INSERT INTO fornecedores VALUES (5, 'Fornecedor E', 'Ricardo Oliveira', 'Consultor', 'Rua E', 'Salvador', 'BA', '50000-000', 'Brasil', '(71) 5432-1098', '(71) 5432-1097', 'https://www.fornecedore.com');
INSERT INTO fornecedores VALUES (6, 'Fornecedor F', 'Julia Melo', 'Engenheira', 'Rua F', 'Fortaleza', 'CE', '60000-000', 'Brasil', '(85) 4321-0987', '(85) 4321-0986', 'https://www.fornecedorf.com');
INSERT INTO fornecedores VALUES (7, 'Fornecedor G', 'Gabriel Lima', 'Supervisor', 'Rua G', 'Porto Alegre', 'RS', '70000-000', 'Brasil', '(51) 3210-9876', '(51) 3210-9875', 'https://www.fornecedorg.com');
INSERT INTO fornecedores VALUES (8, 'Fornecedor H', 'Paula Silva', 'Consultora', 'Rua H', 'Brasília', 'DF', '80000-000', 'Brasil', '(61) 2109-8765', '(61) 2109-8764', 'https://www.fornecedorh.com');
INSERT INTO fornecedores VALUES (9, 'Fornecedor I', 'Fernanda Souza', 'Gerente', 'Rua I', 'Manaus', 'AM', '90000-000', 'Brasil', '(92) 1098-7654', '(92) 1098-7653', 'https://www.fornecedori.com');
INSERT INTO fornecedores VALUES (10, 'Fornecedor J', 'André Mendes', 'Diretor', 'Rua J', 'Recife', 'PE', '10000-000', 'Brasil', '(81) 0987-6543', '(81) 0987-6542', 'https://www.fornecedorj.com');

-- Dados para a tabela territorios
-- Inserções para a tabela territorios
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T01', 'Território Norte', 1);
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T02', 'Território Sul', 1);
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T03', 'Território Leste', 2);
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T04', 'Território Oeste', 2);
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T05', 'Território Central', 3);
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T06', 'Território Nordeste', 3);
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T07', 'Território Sudeste', 4);
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T08', 'Território Noroeste', 4);
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T09', 'Território Sudoeste', 5);
INSERT INTO territorios (territorio_id, descricao_territorio, regiao_id) VALUES ('T10', 'Território Extremo Sul', 5);


-- Dados para a tabela estados_eua
INSERT INTO estados_eua VALUES (1, 'California', 'CA', 'West');
INSERT INTO estados_eua VALUES (2, 'Texas', 'TX', 'South');
INSERT INTO estados_eua VALUES (3, 'New York', 'NY', 'Northeast');
INSERT INTO estados_eua VALUES (4, 'Florida', 'FL', 'South');
INSERT INTO estados_eua VALUES (5, 'Illinois', 'IL', 'Midwest');
INSERT INTO estados_eua VALUES (6, 'Pennsylvania', 'PA', 'Northeast');
INSERT INTO estados_eua VALUES (7, 'Ohio', 'OH', 'Midwest');
INSERT INTO estados_eua VALUES (8, 'Georgia', 'GA', 'South');
INSERT INTO estados_eua VALUES (9, 'North Carolina', 'NC', 'South');
INSERT INTO estados_eua VALUES (10, 'Michigan', 'MI', 'Midwest');



ALTER TABLE ONLY categorias
    ADD CONSTRAINT pk_categorias PRIMARY KEY (categoria_id);

--
-- Nome: pk_cliente_tipo_cliente; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY cliente_tipo_cliente
    ADD CONSTRAINT pk_cliente_tipo_cliente PRIMARY KEY (cliente_id, tipo_cliente_id);

--
-- Nome: pk_tipos_clientes; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY tipos_clientes
    ADD CONSTRAINT pk_tipos_clientes PRIMARY KEY (tipo_cliente_id);

--
-- Nome: pk_clientes; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT pk_clientes PRIMARY KEY (cliente_id);

--
-- Nome: pk_funcionarios; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY funcionarios
    ADD CONSTRAINT pk_funcionarios PRIMARY KEY (funcionario_id);

--
-- Nome: pk_territorios_funcionarios; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY territorios_funcionarios
    ADD CONSTRAINT pk_territorios_funcionarios PRIMARY KEY (funcionario_id, territorio_id);

--
-- Nome: pk_detalhes_pedido; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY detalhes_pedido
    ADD CONSTRAINT pk_detalhes_pedido PRIMARY KEY (pedido_id, produto_id);

--
-- Nome: pk_pedidos; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id);

--
-- Nome: pk_produtos; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT pk_produtos PRIMARY KEY (produto_id);

--
-- Nome: pk_regioes; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY regioes
    ADD CONSTRAINT pk_regioes PRIMARY KEY (regiao_id);

--
-- Nome: pk_transportadoras; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY transportadoras
    ADD CONSTRAINT pk_transportadoras PRIMARY KEY (transportadora_id);

--
-- Nome: pk_fornecedores; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY fornecedores
    ADD CONSTRAINT pk_fornecedores PRIMARY KEY (fornecedor_id);

--
-- Nome: pk_territorios; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY territorios
    ADD CONSTRAINT pk_territorios PRIMARY KEY (territorio_id);

--
-- Nome: pk_estados_eua; Tipo: CONSTRAINT; Esquema: public; Proprietário: -; Tablespace: 
--

ALTER TABLE ONLY estados_eua
    ADD CONSTRAINT pk_estados_eua PRIMARY KEY (estado_id);

--
-- Nome: fk_pedidos_clientes; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT fk_pedidos_clientes FOREIGN KEY (cliente_id) REFERENCES clientes;

--
-- Nome: fk_pedidos_funcionarios; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT fk_pedidos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios;

--
-- Nome: fk_pedidos_transportadoras; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT fk_pedidos_transportadoras FOREIGN KEY (transportadora_id) REFERENCES transportadoras;

--
-- Nome: fk_detalhes_pedido_produtos; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY detalhes_pedido
    ADD CONSTRAINT fk_detalhes_pedido_produtos FOREIGN KEY (produto_id) REFERENCES produtos;

--
-- Nome: fk_detalhes_pedido_pedidos; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY detalhes_pedido
    ADD CONSTRAINT fk_detalhes_pedido_pedidos FOREIGN KEY (pedido_id) REFERENCES pedidos;

--
-- Nome: fk_produtos_categorias; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT fk_produtos_categorias FOREIGN KEY (categoria_id) REFERENCES categorias;

--
-- Nome: fk_produtos_fornecedores; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT fk_produtos_fornecedores FOREIGN KEY (fornecedor_id) REFERENCES fornecedores;

--
-- Nome: fk_territorios_regioes; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY territorios
    ADD CONSTRAINT fk_territorios_regioes FOREIGN KEY (regiao_id) REFERENCES regioes;

--
-- Nome: fk_territorios_funcionarios_territorios; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY territorios_funcionarios
    ADD CONSTRAINT fk_territorios_funcionarios_territorios FOREIGN KEY (territorio_id) REFERENCES territorios;

--
-- Nome: fk_territorios_funcionarios_funcionarios; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY territorios_funcionarios
    ADD CONSTRAINT fk_territorios_funcionarios_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios;

--
-- Nome: fk_cliente_tipo_cliente_tipos_clientes; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY cliente_tipo_cliente
    ADD CONSTRAINT fk_cliente_tipo_cliente_tipos_clientes FOREIGN KEY (tipo_cliente_id) REFERENCES tipos_clientes;

--
-- Nome: fk_cliente_tipo_cliente_clientes; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY cliente_tipo_cliente
    ADD CONSTRAINT fk_cliente_tipo_cliente_clientes FOREIGN KEY (cliente_id) REFERENCES clientes;

--
-- Nome: fk_funcionarios_funcionarios; Tipo: Constraint; Esquema: -; Proprietário: - 
--

ALTER TABLE ONLY funcionarios
    ADD CONSTRAINT fk_funcionarios_funcionarios FOREIGN KEY (chefe_id) REFERENCES funcionarios;

-- 
-- Exportação do banco de dados PostgreSQL concluída 
--
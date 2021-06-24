final createTable = '''
  CREATE TABLE products(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    gtin VARCHAR(25) NOT NULL,
    description VARCHAR(200) NOT NULL,
    price DECIMAL(10,2),
    brand_name VARCHAR(200),
    gpc_code VARCHAR(200),
    gpc_description VARCHAR(200),
    ncm_code VARCHAR(100),
    ncm_description VARCHAR(100),
    ncm_full_description VARCHAR(1500),
    thumbnail VARCHAR(200),
    in_stock INT NOT NULL,
    active INT DEFAULT 1,
    deleted INT DEFAULT 0,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP
  )
''';

final inserts = '''
  INSERT INTO products (gtin, description, price, brand_name, gpc_code, gpc_description, ncm_code, ncm_description, ncm_full_description, thumbnail, in_stock) VALUES
  ('7891910000197', 'AÇÚCAR REFINADO UNIÃO 1KG', 2.99, 'UNIÃO', '10000043', 'Açúcar / Substitutos do Açúcar (Não perecível)', '17019900', 'Outros', 'Açúcares e produtos de confeitaria - Açúcares de cana ou de beterraba e sacarose quimicamente pura, no estado sólido - Outros: - Outros', 'https://cdn-cosmos.bluesoft.com.br/products/7891910000197', 10),
  ('7891360623090', 'CANETA MARCA TEXTO FABER CASTANHA.AMARELO', 3.2, 'FABER CASTELL', '10001235', 'Canetas (Papelaria)', '96082000', 'Canetas e marcadores, com ponta de feltro ou com outras pontas porosas', 'Obras diversas - Canetas esferográficas; canetas e marcadores, com ponta de feltro ou com outras pontas porosas; canetas-tinteiro (canetas de tinta permanente*) e outras canetas; estiletes para duplicadores; lapiseiras; canetas porta-penas, porta-lápis e artigos semelhantes; suas partes (incluindo as tampas e prendedores), exceto os artigos da posição 96.09. - Canetas e marcadores, com ponta de feltro ou com outras pontas porosas', 'https://cdn-cosmos.bluesoft.com.br/products/7891360623090', 5),
  ('7897027201229', 'PASTA CATÁLOGO COM VISOR PRETA ACP 245MM X 335MM X 20MM 50 ENVELOPES', 20.94, 'ACP', '', '', '42021210', 'De plástico', 'Obras de couro; artigos de correeiro ou de seleiro; artigos de viagem, bolsas e artefatos semelhantes; obras de tripa - Baús (arcas) para viagem, malas e maletas, incluindo as maletas de toucador e as maletasepastasdedocumentoseparaestudantes,osestojosparaóculos, binóculos, câmeras fotográficas e de filmar, instrumentos musicais, armas e artigos semelhantes; sacos de viagem, sacos isolantes para gêneros alimentícios e bebidas, bolsas de toucador, mochilas, bolsas, sacolas (sacos para compras), carteiras, porta- moedas, porta-cartões, cigarreiras, tabaqueiras, estojos para ferramentas, bolsas e sacos para artigos de esporte, estojos para frascos ou para joias, caixas para pó-de- arroz,estojosparaourivesariaeartigossemelhantes,decouronaturalou reconstituído, de folhas de plástico, de matérias têxteis, de fibra vulcanizada ou de cartão, ou recobertos, no todo ou na maior parte, dessas mesmas matérias ou de papel. - Baús (arcas) para viagem, malas e maletas, incluindo as maletas de toucador e as maletas e pastas de documentos e para estudantes, e artigos semelhantes: - Com a superfície exterior de plástico ou de matérias têxteis - De plástico', 'https://cdn-cosmos.bluesoft.com.br/products/7897027201229', 3)
''';

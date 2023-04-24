CREATE TABLE mc_bairro (
    cd_bairro       NUMBER(8) NOT NULL,
    cd_cidade       NUMBER(8) NOT NULL,
    nm_bairro       VARCHAR2(45),
    nm_zona_bairro  VARCHAR2(20)
);

COMMENT ON COLUMN mc_bairro.cd_bairro IS
    'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_bairro.cd_cidade IS
    'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_bairro.nm_bairro IS
    'Esta coluna ira receber o nome do Bairro. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_bairro.nm_zona_bairro IS
    'Esta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.';

ALTER TABLE mc_bairro ADD CONSTRAINT pk_mc_bairro PRIMARY KEY ( cd_bairro );

CREATE TABLE mc_categoria_prod (
    cd_categoria  NUMBER NOT NULL,
    tp_categoria  CHAR(1) NOT NULL,
    ds_categoria  VARCHAR2(500) NOT NULL,
    dt_inicio     DATE,
    dt_termino    DATE,
    st_categoria  CHAR(1) NOT NULL
);

COMMENT ON COLUMN mc_categoria_prod.cd_categoria IS
    'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..';

COMMENT ON COLUMN mc_categoria_prod.tp_categoria IS
    'Nessa  coluna  será  armazenada o tipo de categoria que poderá  ser (V)ídeo ou (P)rodudto. Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_categoria_prod.ds_categoria IS
    'Essa coluna irá armazenar descrição da categoria de produtos da Melhorees Compras. Cada categoria tem uma  descrição única e serve para organizar os produtos em categorias simliares, melhorando a tomada de decisão.';

COMMENT ON COLUMN mc_categoria_prod.dt_inicio IS
    'Essa coluna irá receber  a data de início da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  obrigatório.';

COMMENT ON COLUMN mc_categoria_prod.dt_termino IS
    'Essa coluna irá receber  a data de encerramento  da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  opcional. Conteúdo obrigatório significa que a categoria foi encerrada a partir da data término. Já o conteúdo opcional indica que a categoria está ativa e operante.';

COMMENT ON COLUMN mc_categoria_prod.st_categoria IS
    'Essa coluna irá armazenar o stauts da categoria da Melhores Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

ALTER TABLE mc_categoria_prod ADD CONSTRAINT pk_mc_categoria PRIMARY KEY ( cd_categoria );

ALTER TABLE MC_CATEGORIA_PROD ADD CONSTRAINT CK_MC_CATEGORIA_PROD_ST_CATEG CHECK ( ST_CATEGORIA IN ('A','I'));

ALTER TABLE MC_CATEGORIA_PROD ADD CONSTRAINT CK_MC_CATEGORIA_PROD_TP_CATEG CHECK ( TP_CATEGORIA IN ('P','V'));

CREATE TABLE mc_cidade (
    cd_cidade  NUMBER(8) NOT NULL,
    sg_estado  CHAR(2) NOT NULL,
    nm_cidade  VARCHAR2(60) NOT NULL,
    cd_ibge    NUMBER(8),
    nr_ddd     NUMBER(3)
);

COMMENT ON COLUMN mc_cidade.cd_cidade IS
    'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_cidade.sg_estado IS
    'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_cidade.nm_cidade IS
    'Esta coluna ira receber o nome da Cidade. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_cidade.cd_ibge IS
    'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.';

COMMENT ON COLUMN mc_cidade.nr_ddd IS
    'Esta coluna irá receber o número do DDD da cidade para ser utilizado no contato telefônico. Seu conteudo é opcional.';

ALTER TABLE mc_cidade ADD CONSTRAINT pk_mc_cidade PRIMARY KEY ( cd_cidade );

CREATE TABLE mc_cli_fisica (
    nr_cliente         NUMBER(10) NOT NULL,
    dt_nascimento      DATE NOT NULL,
    fl_sexo_biologico  CHAR(1) NOT NULL,
    ds_genero          VARCHAR2(100),
    nr_cpf             VARCHAR2(14) NOT NULL
);

COMMENT ON COLUMN mc_cli_fisica.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ';

COMMENT ON COLUMN mc_cli_fisica.dt_nascimento IS
    'Essa coluna irá armazenar a data de nascimento do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ';

COMMENT ON COLUMN mc_cli_fisica.fl_sexo_biologico IS
    'Essa coluna irá armazenar o sexo biológico do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.. ';

COMMENT ON COLUMN mc_cli_fisica.ds_genero IS
    'Genero do sexo do Cliente. Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_cli_fisica.nr_cpf IS
    'Essa coluna irá armazenar o número do CPF do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ';

ALTER TABLE mc_cli_fisica ADD CONSTRAINT pk_mc_cli_fisica PRIMARY KEY ( nr_cliente );

CREATE TABLE mc_cli_juridica (
    nr_cliente    NUMBER(10) NOT NULL,
    dt_fundacao   DATE,
    nr_cnpj       VARCHAR2(20),
    nr_inscr_est  VARCHAR2(15)
);

COMMENT ON COLUMN mc_cli_juridica.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ';

COMMENT ON COLUMN mc_cli_juridica.dt_fundacao IS
    'Essa coluna irá armazenar data  de fundação do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_cli_juridica.nr_cnpj IS
    'Essa coluna irá armazenar o  numero do CNPJ do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_cli_juridica.nr_inscr_est IS
    'Essa coluna irá armazenar o  numero da Inscrição Estadual  do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser opcional';

ALTER TABLE mc_cli_juridica ADD CONSTRAINT pk_mc_cli_juridica PRIMARY KEY ( nr_cliente );

CREATE TABLE mc_cliente (
    nr_cliente       NUMBER(10) NOT NULL,
    nm_cliente       VARCHAR2(160) NOT NULL,
    qt_estrelas      NUMBER(1),
    vl_medio_compra  NUMBER(10, 2),
    st_cliente       CHAR(1),
    ds_email         VARCHAR2(100),
    nr_telefone      VARCHAR2(20),
    nm_login         VARCHAR2(50) NOT NULL,
    ds_senha         VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN mc_cliente.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da chamada de sequence  SQ_MC_CLIENTE, a qual terá sempre o número disponivel para uso.';

COMMENT ON COLUMN mc_cliente.nm_cliente IS
    'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_cliente.qt_estrelas IS
    'Essa coluna irá armazenar a quantiade de estrelas do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e ser possível de estar entre 1 e 5 estrelas.';

COMMENT ON COLUMN mc_cliente.vl_medio_compra IS
    'Essa coluna irá armazenar o valor  médio de gastos f eito pelo cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e deve ser calculado diariamente.';

COMMENT ON COLUMN mc_cliente.st_cliente IS
    'Essa coluna irá armazenar o stauts do cliente da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN mc_cliente.ds_email IS
    'Essa coluna irá armazenar o email  do cliente da Melhorees Compras. No minimo é esperado um email contendo o caractere (@) em seu conteúdo.';

COMMENT ON COLUMN mc_cliente.nr_telefone IS
    'Essa coluna irá armazenar o número do cliente da Melhorees Compras. A mascara de armazenamento deve ser: (<nr_ddd>) 99999-9999 e  deve ser utilizada pré definida.';

COMMENT ON COLUMN mc_cliente.nm_login IS
    'Essa coluna irá armazenar o login de cada cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e  único para cada cliente.';

COMMENT ON COLUMN mc_cliente.ds_senha IS
    'Essa coluna irá armazenar a senha de cada cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

ALTER TABLE mc_cliente ADD CONSTRAINT pk_mc_cliente PRIMARY KEY ( nr_cliente );

ALTER TABLE mc_cliente ADD CONSTRAINT uk_mc_cliente_nome_cliente UNIQUE ( nm_cliente );

ALTER TABLE MC_CLIENTE ADD CONSTRAINT CK_MC_CLIENTE_ST_CLIENTE CHECK ( ST_CLIENTE IN ('A','I'));

CREATE TABLE mc_depto (
    cd_depto  NUMBER(3) NOT NULL,
    nm_depto  VARCHAR2(100) NOT NULL,
    st_depto  CHAR(1) NOT NULL
);

COMMENT ON COLUMN mc_depto.cd_depto IS
    'Esta coluna irá receber o codigo do departamento  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_depto.nm_depto IS
    'Esta coluna irá receber o nome do  departamento  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_depto.st_depto IS
    'Esta coluna irá receber o status do  departamento  e seu conteúdo é obrigatório. Os valores possíveis são: (A)tivo e (I)nativo.';

ALTER TABLE mc_depto ADD CONSTRAINT pk_mc_depto PRIMARY KEY ( cd_depto );

ALTER TABLE MC_DEPTO ADD CONSTRAINT CK_MC_DEPTO_ST_DEPTO CHECK ( ST_DEPTO IN ('A','I'));

CREATE TABLE mc_end_cli (
    nr_cliente          NUMBER(10) NOT NULL,
    cd_logradouro_cli   NUMBER(10) NOT NULL,
    nr_end              NUMBER(8) NOT NULL,
    ds_complemento_end  VARCHAR2(80),
    dt_inicio           DATE,
    dt_termino          DATE,
    st_end              CHAR(1)
);

COMMENT ON COLUMN mc_end_cli.nr_cliente IS
    'Esta coluna irá receber o número do cliente e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_end_cli.cd_logradouro_cli IS
    'Esta coluna irá receber o código do logradouro  do cliente e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_end_cli.nr_end IS
    'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.';

COMMENT ON COLUMN mc_end_cli.ds_complemento_end IS
    'Esta coluna irá receber o complemento do endereço do cliente e seu conteúdo pode ser opcional.';

COMMENT ON COLUMN mc_end_cli.dt_inicio IS
    'Data de início do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_cli.dt_termino IS
    'Data de término do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_cli.st_end IS
    'Status do endereço. (A)itvo ou (I)nativo.';

ALTER TABLE mc_end_cli ADD CONSTRAINT pk_mc_end_cli PRIMARY KEY ( nr_cliente,
                                                                  cd_logradouro_cli );
																  
ALTER TABLE MC_END_CLI ADD CONSTRAINT CK_MC_END_CLI_ST_END CHECK ( ST_END IN ('A','I'));
																  
CREATE TABLE mc_end_func (
    cd_funcionario      NUMBER(10) NOT NULL,
    cd_logradouro       NUMBER(10) NOT NULL,
    nr_end              NUMBER(8) NOT NULL,
    ds_complemento_end  VARCHAR2(80),
    dt_inicio           DATE NOT NULL,
    dt_termino          DATE,
    st_end              CHAR(1) NOT NULL
);

COMMENT ON COLUMN mc_end_func.nr_end IS
    'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.';

COMMENT ON COLUMN mc_end_func.dt_inicio IS
    'Data de início do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_func.dt_termino IS
    'Data de término do endereço associado ao cliente.';

ALTER TABLE mc_end_func ADD CONSTRAINT pk_mc_end_func_pk PRIMARY KEY ( cd_funcionario,
                                                                       cd_logradouro );

CREATE TABLE mc_estado (
    sg_estado  CHAR(2) NOT NULL,
    nm_estado  VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN mc_estado.sg_estado IS
    'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_estado.nm_estado IS
    'Esta coluna irá receber o nome do estado';

ALTER TABLE mc_estado ADD CONSTRAINT pk_mc_estado PRIMARY KEY ( sg_estado );

CREATE TABLE mc_funcionario (
    cd_funcionario     NUMBER(10) NOT NULL,
    cd_depto           NUMBER(3) NOT NULL,
    cd_gerente         NUMBER(10),
    nm_funcionario     VARCHAR2(160),
    dt_nascimento      DATE NOT NULL,
    fl_sexo_biologico  CHAR(1),
    ds_genero          VARCHAR2(100),
    ds_cargo           VARCHAR2(80) NOT NULL,
    vl_salario         NUMBER(10, 2),
    ds_email           VARCHAR2(80),
    st_func            CHAR(1),
    dt_cadastramento   DATE,
    dt_desligamento    DATE
);

COMMENT ON COLUMN mc_funcionario.cd_funcionario IS
    'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.cd_depto IS
    'Esta coluna irá receber o codigo do departamento onde o funcionario trabalha  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.cd_gerente IS
    'Esta coluna irá receber o codigo do gestor do funcionario trabalha  e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.nm_funcionario IS
    'Esta coluna irá receber o nome do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.dt_nascimento IS
    'Esta coluna irá receber a data de nascimento  do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.fl_sexo_biologico IS
    'Esta coluna irá receber o sexo biológico do funcionário e seu conteúdo é obrigatório.Os valores permitidos aqui seriam: (F)eminino; (M)asculino ou (Hermafrodita)';

COMMENT ON COLUMN mc_funcionario.ds_genero IS
    'Esta coluna irá receber o genero atribuido ao funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.ds_cargo IS
    'Esta coluna irá receber o cargo do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.vl_salario IS
    'Esta coluna irá receber o valor do salário do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.ds_email IS
    'Esta coluna irá receber o email do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.st_func IS
    'Essa coluna irá armazenar o stauts do funcionário da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN mc_funcionario.dt_cadastramento IS
    'Data de cadastramento do Funcionario';

COMMENT ON COLUMN mc_funcionario.dt_desligamento IS
    'Data de desligamento  do Funcionario. Seu conteúdo é opcional.';

ALTER TABLE mc_funcionario ADD CONSTRAINT pk_mc_funcionario PRIMARY KEY ( cd_funcionario );

ALTER TABLE MC_FUNCIONARIO ADD CONSTRAINT CK_MC_FUNCIONARIO_ST_FUNC CHECK ( ST_FUNC IN ('A','I'));

CREATE TABLE mc_logradouro (
    cd_logradouro  NUMBER(10) NOT NULL,
    cd_bairro      NUMBER(8) NOT NULL,
    nm_logradouro  VARCHAR2(160) NOT NULL,
    nr_cep         NUMBER(8)
);

COMMENT ON COLUMN mc_logradouro.cd_logradouro IS
    'Esta coluna irá receber o código do logradouro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_logradouro.cd_bairro IS
    'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_logradouro.nm_logradouro IS
    'Esta coluna irá receber o nome do logradouro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_logradouro.nr_cep IS
    'Esta coluna irá receber o numero do CEP do Logradouro e seu conteúdo é obrigatório.';

ALTER TABLE mc_logradouro ADD CONSTRAINT pk_mc_logradouro PRIMARY KEY ( cd_logradouro );

CREATE TABLE mc_produto (
    cd_produto         NUMBER(10) NOT NULL,
    cd_categoria       NUMBER NOT NULL,
    nr_cd_barras_prod  VARCHAR2(50),
    ds_produto         VARCHAR2(80) NOT NULL,
    vl_unitario        NUMBER(8, 2) NOT NULL,
    tp_embalagem       VARCHAR2(15),
    st_produto         CHAR(1),
    vl_perc_lucro      NUMBER(8, 2),
    ds_completa_prod   VARCHAR2(4000) NOT NULL
);

COMMENT ON COLUMN mc_produto.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.';

COMMENT ON COLUMN mc_produto.cd_categoria IS
    'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..';

COMMENT ON COLUMN mc_produto.nr_cd_barras_prod IS
    'Essa coluna irá armazenar o número do codigo de barras  do produto. Seu conteúdo deve ser opcional.';

COMMENT ON COLUMN mc_produto.ds_produto IS
    'Essa coluna irá armazenar a descrição principal do produto. Seu conteúdo deve ser  obrigatorio.';

COMMENT ON COLUMN mc_produto.vl_unitario IS
    'Essa coluna irá armazenar o valor unitário do produto. Seu conteúdo deve ser > 0 ';

COMMENT ON COLUMN mc_produto.tp_embalagem IS
    'Essa coluna irá armazenar o tipo de embalagem do produto. Seu conteúdo pode ser opcional.';

COMMENT ON COLUMN mc_produto.st_produto IS
    'Essa coluna irá armazenar o stauts do produto da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN mc_produto.vl_perc_lucro IS
    'Essa coluna irá armazenar o percentual  do lucro médio para cada produto. Seu conteúdo deve ser opcional.';

COMMENT ON COLUMN mc_produto.ds_completa_prod IS
    'Essa coluna irá armazenar a descrição completa do produto. Seu conteúdo deve ser  obrigatorio.';

ALTER TABLE mc_produto ADD CONSTRAINT pk_mc_produto PRIMARY KEY ( cd_produto );

ALTER TABLE MC_PRODUTO ADD CONSTRAINT CK_MC_PRODUTO_ST_PRODUTO CHECK ( ST_PRODUTO IN ('A','I'));

CREATE TABLE mc_sgv_produto_video (
    cd_produto          NUMBER(10) NOT NULL,
    nr_sequencia        NUMBER(3) NOT NULL,
    cd_categoria        NUMBER NOT NULL,
    vd_produto          BLOB,
    tp_video_prod       VARCHAR2(10),
    ds_path_video_prod  VARCHAR2(500),
    st_video_prod       CHAR(1)
);

COMMENT ON COLUMN mc_sgv_produto_video.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.';

COMMENT ON COLUMN mc_sgv_produto_video.nr_sequencia IS
    'Essa coluna irá armazenar a sequencia do vídeo a partir do codigo do produto. Sempre o primeiro vídeo de determinado  produto deve iniciar com o número 1. Seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_sgv_produto_video.cd_categoria IS
    'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..';

COMMENT ON COLUMN mc_sgv_produto_video.vd_produto IS
    'Essa coluna irá armazenar oo vídeo do produto no formato que melhor lhe  convier.  Para utilizar essa coluna tenha acesso a documentação oficial da Oracle. Seu conteúdo é opcional.';

COMMENT ON COLUMN mc_sgv_produto_video.tp_video_prod IS
    'Essa coluna irá armazenar o tipo do  vídeo do produto. Seu conteúdo é opcional.';

COMMENT ON COLUMN mc_sgv_produto_video.ds_path_video_prod IS
    'Essa coluna irá armazenar o caminho de acesso (link) contendo o  vídeo do produto. Seu conteúdo é opcional.';

COMMENT ON COLUMN mc_sgv_produto_video.st_video_prod IS
    'Essa coluna irá armazenar o stauts do vídeo do produto da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

ALTER TABLE mc_sgv_produto_video ADD CONSTRAINT pk_mc_produto_imagem PRIMARY KEY ( nr_sequencia,
                                                                                   cd_produto );

ALTER TABLE MC_SGV_PRODUTO_VIDEO ADD CONSTRAINT CK_MC_SGV_PRODUTO_VIDEO_ST_VIDEO CHECK ( ST_VIDEO_PROD IN ('A','I'));

CREATE TABLE mc_sgv_sac (
    nr_sac                    NUMBER NOT NULL,
    nr_cliente                NUMBER(10) NOT NULL,
    cd_produto                NUMBER(10) NOT NULL,
    cd_funcionario            NUMBER(10),
    ds_detalhada_sac          CLOB,
    dt_abertura_sac           DATE,
    hr_abertura_sac           NUMBER(2),
    dt_atendimento            DATE,
    hr_atendimento_sac        NUMBER(2),
    nr_tempo_total_sac        NUMBER(10),
    ds_detalhada_retorno_sac  CLOB,
    tp_sac                    CHAR(1) NOT NULL,
    st_sac                    CHAR(1),
    nr_indice_satisfacao      NUMBER(2)
);

COMMENT ON COLUMN mc_sgv_sac.nr_sac IS
    'Essa coluna irá armazenar a chave primária da tabela de SAC de vídeo  da Melhorees Compras. A cada SAC cadastrado pelo cliente será acionada a Sequence  SQ_MC_SGV_SAC que se encarregará de gerar o próximo número único do chamado SAC feito pelo Cliente.';

COMMENT ON COLUMN mc_sgv_sac.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ';

COMMENT ON COLUMN mc_sgv_sac.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.';

COMMENT ON COLUMN mc_sgv_sac.cd_funcionario IS
    'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_sgv_sac.ds_detalhada_sac IS
    'Essa coluna  irá  receber a descrição completa do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.';

COMMENT ON COLUMN mc_sgv_sac.dt_abertura_sac IS
    'Essa coluna  irá  receber a data e horário do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.';

COMMENT ON COLUMN mc_sgv_sac.hr_abertura_sac IS
    'Essa coluna  irá  receber a hora do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.';

COMMENT ON COLUMN mc_sgv_sac.dt_atendimento IS
    'Essa coluna  irá  receber a data e horário do atendmiento SAC feita pelo funcionário da Melhores Compras. Seu conteudo deve ser opcional..';

COMMENT ON COLUMN mc_sgv_sac.hr_atendimento_sac IS
    'Essa coluna  irá  receber a hora do SAC do atendimento  feito  pelo funcionario da Melhores Compras. Seu conteudo deve ser opcional.';

COMMENT ON COLUMN mc_sgv_sac.nr_tempo_total_sac IS
    'Essa coluna  irá  receber o tempo total em horas  (HH24) computado desde a abertura até a conclusão dele. A unidade de medida é horas, ou seja, em quantas horas o chamado foi concluído desde a sua abertura.';

COMMENT ON COLUMN mc_sgv_sac.ds_detalhada_retorno_sac IS
    'Essa coluna  irá  receber a descrição detalhada do retorno feito pelo funcionário a partir da solicitação do cliente. Seu conteúdo deve ser opcional e preenchido pelo funcionário.';

COMMENT ON COLUMN mc_sgv_sac.tp_sac IS
    'Essa coluna  irá  receber o TIPO  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (S)ugestão; (D)úvida ou  (E)logio.';

COMMENT ON COLUMN mc_sgv_sac.st_sac IS
    'Essa coluna  irá  receber o STATUS  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (E)m Atendimento; (C)ancelado; (F)echado ou (X)Fechado com Insatisfação do cliente.';

COMMENT ON COLUMN mc_sgv_sac.nr_indice_satisfacao IS
    'Essa coluna  irá  receber o índice de satisfação, , computado como um valor simples de 1 a 10, onde 1 refere-se ao cliente menos satisfeito e 10 o cliente mais satisfeito. Esse índice de satisfação é opcional e informado pelo cliente ao final do atendimento.';

ALTER TABLE mc_sgv_sac ADD CONSTRAINT pk_mc_sgv_sac PRIMARY KEY ( nr_sac );

ALTER TABLE mc_sgv_sac ADD CONSTRAINT CK_mc_sgv_sac_tp_sac CHECK ( tp_sac IN ('D','E','S'));

CREATE TABLE mc_sgv_visualizacao_video (
    cd_visualizacao_video  NUMBER(10) NOT NULL,
    nr_cliente             NUMBER(10),
    cd_produto             NUMBER(10) NOT NULL,
    dt_visualizacao        DATE NOT NULL,
    nr_hora_visualizacao   NUMBER(2) NOT NULL,
    nr_minuto_video        NUMBER(2),
    nr_segundo_video       NUMBER(2)
);

COMMENT ON COLUMN mc_sgv_visualizacao_video.cd_visualizacao_video IS
    'Essa coluna irá armazenar a chave primária da tabela de visualização do vídeo, onde a cada click que o usuario logado ou anônimo realizar, será anotado o acesso realizado.';

COMMENT ON COLUMN mc_sgv_visualizacao_video.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da chamada de sequence  SQ_MC_CLIENTE, a qual terá sempre o número disponivel para uso.';

COMMENT ON COLUMN mc_sgv_visualizacao_video.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.';

COMMENT ON COLUMN mc_sgv_visualizacao_video.dt_visualizacao IS
    'Essa  coluna  irá  receber a data da visualização feita pelo  usuário no formato dd/mm/yyyy. Essa coluna é obrigatória.';

COMMENT ON COLUMN mc_sgv_visualizacao_video.nr_hora_visualizacao IS
    'Essa  coluna  irá  receber o horário no formato HH24 da visualização feita pelo  usuário. Essa coluna é obrigatória.';

COMMENT ON COLUMN mc_sgv_visualizacao_video.nr_minuto_video IS
    'Essa  coluna  irá  receber o horário do minuto do vídeo quando foi feita a visualização pelo  usuário. Essa coluna é obrigatória e os valores possíveis estão entre 00 e 59, representando os minutos.';

COMMENT ON COLUMN mc_sgv_visualizacao_video.nr_segundo_video IS
    'Essa  coluna  irá  receber o horário dos segundos do vídeo quando foi feita a visualização pelo  usuário. Essa coluna é obrigatória e os valores possíveis estão entre 00 e 59, representando os minutos.';

ALTER TABLE mc_sgv_visualizacao_video ADD CONSTRAINT pk_mc_sgv_visualizacao_video PRIMARY KEY ( cd_visualizacao_video );

ALTER TABLE mc_bairro
    ADD CONSTRAINT fk_mc_bairro_cidade FOREIGN KEY ( cd_cidade )
        REFERENCES mc_cidade ( cd_cidade );

ALTER TABLE mc_sgv_produto_video
    ADD CONSTRAINT fk_mc_categoria_video FOREIGN KEY ( cd_categoria )
        REFERENCES mc_categoria_prod ( cd_categoria );

ALTER TABLE mc_cidade
    ADD CONSTRAINT fk_mc_cidade_estado FOREIGN KEY ( sg_estado )
        REFERENCES mc_estado ( sg_estado );

ALTER TABLE mc_end_cli
    ADD CONSTRAINT fk_mc_cliente_end FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_cli_fisica
    ADD CONSTRAINT fk_mc_cliente_fisica FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_cli_juridica
    ADD CONSTRAINT fk_mc_cliente_juridica FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT fk_mc_cliente_sgv_sac FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_sgv_visualizacao_video
    ADD CONSTRAINT fk_mc_cliente_visualiz_video FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_funcionario
    ADD CONSTRAINT fk_mc_depto_func FOREIGN KEY ( cd_depto )
        REFERENCES mc_depto ( cd_depto );

ALTER TABLE mc_end_func
    ADD CONSTRAINT fk_mc_end_func FOREIGN KEY ( cd_funcionario )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_end_func
    ADD CONSTRAINT fk_mc_end_func_logradouro FOREIGN KEY ( cd_logradouro )
        REFERENCES mc_logradouro ( cd_logradouro );

ALTER TABLE mc_funcionario
    ADD CONSTRAINT fk_mc_func_superior FOREIGN KEY ( cd_gerente )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT fk_mc_funcionario_sgv_sac FOREIGN KEY ( cd_funcionario )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_logradouro
    ADD CONSTRAINT fk_mc_logradouro_bairro FOREIGN KEY ( cd_bairro )
        REFERENCES mc_bairro ( cd_bairro );

ALTER TABLE mc_end_cli
    ADD CONSTRAINT fk_mc_logradouro_end FOREIGN KEY ( cd_logradouro_cli )
        REFERENCES mc_logradouro ( cd_logradouro );

ALTER TABLE mc_sgv_produto_video
    ADD CONSTRAINT fk_mc_produto_imagem FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT fk_mc_produto_sgv_sac FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_sgv_visualizacao_video
    ADD CONSTRAINT fk_mc_produto_visualizacao FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_produto
    ADD CONSTRAINT fk_mc_sub_categoria_prod FOREIGN KEY ( cd_categoria )
        REFERENCES mc_categoria_prod ( cd_categoria );

CREATE OR REPLACE TRIGGER arc_fk_arco_cli__mc_cli_fisica BEFORE
    INSERT OR UPDATE OF nr_cliente ON mc_cli_fisica
    FOR EACH ROW
DECLARE
    d NUMBER(10);
BEGIN
    SELECT
        a.nr_cliente
    INTO d
    FROM
        mc_cliente a
    WHERE
        a.nr_cliente = :new.nr_cliente;

    IF ( d IS NULL OR d <> :new.nr_cliente ) THEN
        raise_application_error(-20223, 'FK FK_MC_CLIENTE_FISICA in Table MC_CLI_FISICA violates Arc constraint on Table MC_CLIENTE - discriminator column NR_CLIENTE doesn''t have value NR_CLIENTE');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fk_arco_cl_mc_cli_juridica BEFORE
    INSERT OR UPDATE OF nr_cliente ON mc_cli_juridica
    FOR EACH ROW
DECLARE
    d NUMBER(10);
BEGIN
    SELECT
        a.nr_cliente
    INTO d
    FROM
        mc_cliente a
    WHERE
        a.nr_cliente = :new.nr_cliente;

    IF ( d IS NULL OR d <> :new.nr_cliente ) THEN
        raise_application_error(-20223, 'FK FK_MC_CLIENTE_JURIDICA in Table MC_CLI_JURIDICA violates Arc constraint on Table MC_CLIENTE - discriminator column NR_CLIENTE doesn''t have value NR_CLIENTE');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

------------------------------------------------------------

-- Os scripts abaixo criam a estrutura de sequence para uso na fase 2 do PBL
--
ALTER TABLE MC_CLIENTE 
ADD CONSTRAINT UK_MC_CLIENTE_MM_LOGIN UNIQUE (NM_LOGIN);

CREATE SEQUENCE SQ_MC_DEPTO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_FUNCIONARIO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_CIDADE
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_BAIRRO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_LOGRADOURO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_CLIENTE
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_CATEGORIA
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_PRODUTO
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_SGV_VISUAL_PROD
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

CREATE SEQUENCE SQ_MC_SGV_SAC
START WITH 1 
INCREMENT BY 1 
MAXVALUE 9999999999 
NOCACHE 
NOCYCLE;

------------------------------------------------------------

-- Os scripts abaixo são as respostas para as letras do primeiro desafio da fase (comandos DML), tópico 1.2

-- Resposta do Comando SQL item A)

INSERT INTO MC_DEPTO(CD_DEPTO, NM_DEPTO, ST_DEPTO) VALUES (SQ_MC_DEPTO.NEXTVAL, 'DIRETORIA', 'A');
INSERT INTO MC_DEPTO(CD_DEPTO, NM_DEPTO, ST_DEPTO) VALUES (SQ_MC_DEPTO.NEXTVAL, 'PLANEJAMENTO ESTRATEGICO', 'A');
INSERT INTO MC_DEPTO(CD_DEPTO, NM_DEPTO, ST_DEPTO) VALUES (SQ_MC_DEPTO.NEXTVAL, 'COMERCIAL', 'A');
INSERT INTO MC_DEPTO(CD_DEPTO, NM_DEPTO, ST_DEPTO) VALUES (SQ_MC_DEPTO.NEXTVAL, 'CONTABILIDADE', 'A');
INSERT INTO MC_DEPTO(CD_DEPTO, NM_DEPTO, ST_DEPTO) VALUES (SQ_MC_DEPTO.NEXTVAL, 'SAC (SERVIÇO DE ATENDIMENTO AO CLIENTE)', 'A');
INSERT INTO MC_DEPTO(CD_DEPTO, NM_DEPTO, ST_DEPTO) VALUES (SQ_MC_DEPTO.NEXTVAL, 'RECURSOS HUMANOS (RH)', 'A');
INSERT INTO MC_DEPTO(CD_DEPTO, NM_DEPTO, ST_DEPTO) VALUES (SQ_MC_DEPTO.NEXTVAL, 'LOGISTICA', 'A');
INSERT INTO MC_DEPTO(CD_DEPTO, NM_DEPTO, ST_DEPTO) VALUES (SQ_MC_DEPTO.NEXTVAL, 'FINANCEIRO', 'A');
INSERT INTO MC_DEPTO(CD_DEPTO, NM_DEPTO, ST_DEPTO) VALUES (SQ_MC_DEPTO.NEXTVAL, 'ESTOQUE', 'A');

-- Resposta do Comando SQL item B)

-- Comercial
-- Nessa parte, não adicionamos o CD_GERENTE (autorrelacionamento, 1:1)

INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (1, 3, 'Ana Luísa', TO_DATE('01/01/1980', 'DD/MM/YYYY'), 'M', 'Masculino', 'Vendedor', 2000.00, 'func1@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (2, 3, 'Rafaela Alves', TO_DATE('01/01/1981', 'DD/MM/YYYY'), 'F', 'Feminino', 'Vendedora', 2000.00, 'func2@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (3, 3, 'Diego Santos', TO_DATE('01/01/1982', 'DD/MM/YYYY'), 'M', 'Masculino', 'Gerente de Vendas', 4000.00, 'func3@empresa.com', 'A', SYSDATE, NULL);

-- Contabilidade
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, CD_GERENTE, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (4, 4, 5, 'João Pedro', TO_DATE('01/01/1983', 'DD/MM/YYYY'), 'F', 'Feminino', 'Assistente Contábil', 2500.00, 'func4@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, CD_GERENTE, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (28, 4, 5, 'Jéssica Silva', TO_DATE('01/01/1984', 'DD/MM/YYYY'), 'M', 'Masculino', 'Contador', 4500.00, 'func5@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, CD_GERENTE, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (6, 4, 5, 'Gabriela Oliveira', TO_DATE('01/01/1985', 'DD/MM/YYYY'), 'F', 'Feminino', 'Analista Financeiro', 3000.00, 'func6@empresa.com', 'A', SYSDATE, NULL);

-- Estoque
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (7, 9, 'André Felipe', TO_DATE('01/01/1986', 'DD/MM/YYYY'), 'M', 'Masculino', 'Almoxarife', 2200.00, 'func7@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (8, 9, 'Juliana Costa', TO_DATE('01/01/1987', 'DD/MM/YYYY'), 'F', 'Feminino', 'Assistente de Logística', 2500.00, 'func8@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (9, 9, 'Marina Ferreira', TO_DATE('01/01/1988', 'DD/MM/YYYY'), 'M', 'Masculino', 'Gerente de Logística', 4000.00, 'func9@empresa.com', 'A', SYSDATE, NULL);

-- Financeiro
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (10, 8, 'Lucas Mendes', TO_DATE('01/01/1986', 'DD/MM/YYYY'), 'M', 'Masculino', 'Analista Financeiro', 3000.00, 'func10@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (11, 8, 'Bruna Rodrigues', TO_DATE('01/01/1987', 'DD/MM/YYYY'), 'F', 'Feminino', 'Assistente de Contas a Pagar', 2500.00, 'func11@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (12, 8, 'Eduardo Gomes', TO_DATE('01/01/1988', 'DD/MM/YYYY'), 'M', 'Masculino', 'Gerente Financeiro', 5000.00, 'func12@empresa.com', 'A', SYSDATE, NULL);

-- Logística
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (13, 7, 'Isabela Santos', TO_DATE('01/01/1989', 'DD/MM/YYYY'), 'F', 'Feminino', 'Analista de Logística', 3200.00, 'func13@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (14, 7, 'Tiago Oliveira', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'M', 'Masculino', 'Supervisor de Logística', 4500.00, 'func14@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (15, 7, 'Aline Pereira', TO_DATE('01/01/1991', 'DD/MM/YYYY'), 'M', 'Masculino', 'Gerente de Logística', 6500.00, 'func15@empresa.com', 'A', SYSDATE, NULL);

-- Recursos Humanos
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (16, 6, 'Mariana Carvalho', TO_DATE('01/01/1992', 'DD/MM/YYYY'), 'F', 'Feminino', 'Analista de Recursos Humanos', 3200.00, 'func16@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (17, 6, 'Daniel Costa', TO_DATE('01/01/1993', 'DD/MM/YYYY'), 'M', 'Masculino', 'Assistente de Recursos Humanos', 2500.00, 'func17@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (18, 6, 'Letícia Ribeiro', TO_DATE('01/01/1994', 'DD/MM/YYYY'), 'F', 'Feminino', 'Gerente de Recursos Humanos', 7500.00, 'func18@empresa.com', 'A', SYSDATE, NULL);

-- SAC (Serviço de Atendimento ao Cliente)
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (19, 5, 'Henrique Sousa', TO_DATE('01/01/1995', 'DD/MM/YYYY'), 'M', 'Masculino', 'Analista de Atendimento ao Cliente', 2800.00, 'func19@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (20, 5, 'Fernanda Souza', TO_DATE('01/01/1996', 'DD/MM/YYYY'), 'F', 'Feminino', 'Assistente de Atendimento ao Cliente', 2200.00, 'func20@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (21, 5, 'Gustavo Castro', TO_DATE('01/01/1997', 'DD/MM/YYYY'), 'M', 'Masculino', 'Gerente de Atendimento ao Cliente', 8000.00, 'func21@empresa.com', 'A', SYSDATE, NULL);

-- Planejamento Estrategico
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (22, 2, 'Bruno Silva', TO_DATE('01/01/1998', 'DD/MM/YYYY'), 'F', 'Feminino', 'Analista de Planejamento Estratégico', 3000.00, 'func22@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (23, 2, 'Carolina Santos', TO_DATE('01/01/1999', 'DD/MM/YYYY'), 'M', 'Masculino', 'Assistente de Planejamento Estratégico', 2500.00, 'func23@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (24, 2, 'Mateus Rodrigues', TO_DATE('01/01/2000', 'DD/MM/YYYY'), 'F', 'Feminino', 'Gerente de Planejamento Estratégico', 8000.00, 'func24@empresa.com', 'A', SYSDATE, NULL);

-- Diretoria
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (25, 1, 'Larissa Almeida', TO_DATE('01/01/1995', 'DD/MM/YYYY'), 'M', 'Masculino', 'Diretor', 15000.00, 'func25@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (26, 1, 'Pedro Henrique', TO_DATE('01/01/1985', 'DD/MM/YYYY'), 'F', 'Feminino', 'Assistente de Diretoria', 4500.00, 'func26@empresa.com', 'A', SYSDATE, NULL);
INSERT INTO MC_FUNCIONARIO (CD_FUNCIONARIO, CD_DEPTO, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO) VALUES (27, 1, 'Thaís Miranda', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'M', 'Masculino', 'Assessor de Diretoria', 6500.00, 'func27@empresa.com', 'A', SYSDATE, NULL);

-- Resposta do Comando SQL item C

INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('AC', 'Acre');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('AL', 'Alagoas');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('AP', 'Amapá');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('AM', 'Amazonas');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('BA', 'Bahia');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('CE', 'Ceará');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('DF', 'Distrito Federal');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('ES', 'Espírito Santo');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('GO', 'Goiás');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('MA', 'Maranhão');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('MT', 'Mato Grosso');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('MS', 'Mato Grosso do Sul');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('MG', 'Minas Gerais');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('PA', 'Pará');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('PB', 'Paraíba');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('PR', 'Paraná');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('PE', 'Pernambuco');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('PI', 'Piauí');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('RN', 'Rio Grande do Norte');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('RS', 'Rio Grande do Sul');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('RO', 'Rondônia');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('RR', 'Roraima');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('SC', 'Santa Catarina');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('SP', 'São Paulo');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('SE', 'Sergipe');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO) VALUES ('TO', 'Tocantins');

INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('1', 'SP', 'Barueri');
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('2', 'SP', 'Osasco');
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('3', 'RJ', 'Niterói');
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('4', 'RJ', 'Angra dos Reis');
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('5', 'TO', 'Gurupi');
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('6', 'TO', 'Palmas');
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('7', 'SC', 'Blumenau');
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('8', 'SC', 'Florianópolis');
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('9', 'MG', 'Belo Horizonte');
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE) VALUES ('10', 'MG', 'Uberlândia');

INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('1', '1', 'Tupanci');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('2', '2', 'Jaguaribe');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('3', '3', 'Santa Rosa');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('4', '4', 'Bananal');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('5', '5', 'Trevo da Praia');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('6', '6', 'Morada do Sol');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('7', '7', 'Água Verde');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('8', '8', 'Campeche');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('9', '9', 'Pampulha');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO) VALUES ('10', '10', 'Laranjeiras')

INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('1', '1', 'Rua Werner Goldberg');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('2', '1', 'Rua Urano');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('3', '2', 'Rua Capistrano de Abreu');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('4', '2', 'Avenida Flora');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('5', '3', 'Largo do Marrão');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('6', '3', 'Morro Africano');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('7', '4', 'Rua do Bananal');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('8', '4', 'Água Santa');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('9', '5', 'Rua 5-A');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('10', '5', 'Rua 7');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('11', '6', 'Rua S-001');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('12', '6', 'Rua S-003');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('13', '7', 'Praça Antenor Carvalho');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('14', '7', 'Praça Hermelino Borges de Jesus');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('15', '8', 'Avenida Campeche');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('16', '8', 'Avenida dos Imigrantes Açorianos');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('17', '9', 'Avenida Antônio Carlos');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('18', '9', 'Avenida Presidente Carlos Luz');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('19', '10', 'Alameda Jandira Maria Rocha');
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO) VALUES ('20', '10', 'Avenida Continental');

-- Resposta do Comando SQL item D)

INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('1', '1', '11', TO_DATE('01/01/2000', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('2', '2', '22', TO_DATE('01/01/2001', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('3', '3', '33', TO_DATE('01/01/2002', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('4', '4', '44', TO_DATE('01/01/2003', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('5', '5', '55', TO_DATE('01/01/2004', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('6', '6', '66', TO_DATE('01/01/2005', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('7', '7', '77', TO_DATE('01/01/2006', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('8', '8', '88', TO_DATE('01/01/2007', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('9', '9', '99', TO_DATE('01/01/2008', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('10', '10', '15', TO_DATE('01/01/2009', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('11', '11', '17', TO_DATE('01/01/2010', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('12', '12', '19', TO_DATE('01/01/2011', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('13', '13', '33', TO_DATE('01/01/2012', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('14', '14', '34', TO_DATE('01/01/2013', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('15', '15', '35', TO_DATE('01/01/2014', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('16', '16', '136', TO_DATE('01/01/2015', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('17', '17', '112', TO_DATE('01/01/2016', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('18', '18', '118', TO_DATE('01/01/2017', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('19', '19', '135', TO_DATE('01/01/2018', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('20', '20', '137', TO_DATE('01/01/2019', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('21', '11', '201', TO_DATE('01/01/2020', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('22', '12', '71', TO_DATE('01/01/2021', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('23', '13', '172', TO_DATE('01/01/2022', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('24', '14', '170', TO_DATE('01/01/1999', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('25', '15', '150', TO_DATE('01/01/1998', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('26', '16', '301', TO_DATE('01/01/1997', 'DD/MM/YYYY'), 'A');
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DT_INICIO, ST_END) VALUES ('27', '17', '300', TO_DATE('01/01/1996', 'DD/MM/YYYY'), 'A');

-- Resposta do Comando SQL item E)

 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('1', 'Ana', 'aninha', 'azul99');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('2', 'João', 'joaozinho', '1234abc');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('3', 'Maria', 'mariah', 'casa567');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('4', 'Pedro', 'pedroca', 'vermelho42');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('5', 'Gustavo', 'gusta', '777carro');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('6', 'Tiago', 'tiagao', 'bola2022');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('7', 'Leonardo', 'leo', 'guitarra99');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('8', 'Francisco', 'chicomilgrau', '4321xyz');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('9', 'Julia', 'julia2020', '123senha');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('10', 'Clara', 'clarasol', 'morango88');
 
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('1', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'F', '046.542.758-99');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('2', TO_DATE('01/01/1991', 'DD/MM/YYYY'), 'M', '290.327.417-22');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('3', TO_DATE('01/01/1992', 'DD/MM/YYYY'), 'F', '783.921.065-30');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('4', TO_DATE('01/01/1994', 'DD/MM/YYYY'), 'M', '442.618.834-61');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('5', TO_DATE('01/01/1995', 'DD/MM/YYYY'), 'M', '950.824.179-15');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('6', TO_DATE('01/01/1985', 'DD/MM/YYYY'), 'M', '508.310.763-53');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('7', TO_DATE('01/01/1970', 'DD/MM/YYYY'), 'M', '624.412.039-89');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('8', TO_DATE('01/01/1987', 'DD/MM/YYYY'), 'M', '176.023.458-77');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('9', TO_DATE('01/01/1989', 'DD/MM/YYYY'), 'F', '381.941.306-04');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, NR_CPF) VALUES ('10', TO_DATE('01/01/1980', 'DD/MM/YYYY'), 'F', '822.747.549-12');

 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('11', 'Skyline Corp.', 'Skye', 'Poodle2022');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('12', 'Streamline Enterprises', 'Streamy', 'Labradoodle123');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('13', 'Sunburst Co.', 'Sunny', 'Boxer@456');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('14', 'Apex Solutions', 'Apexy', 'Corgi#789');
 INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('15', 'Rocksteady Inc.', 'Rocky', 'Beagle$2023');
 
 INSERT INTO MC_CLI_JURIDICA (NR_CLIENTE, NR_CNPJ) VALUES ('11', '36.231.603/0001-70');
 INSERT INTO MC_CLI_JURIDICA (NR_CLIENTE, NR_CNPJ) VALUES ('12', '89.164.739/0001-46');
 INSERT INTO MC_CLI_JURIDICA (NR_CLIENTE, NR_CNPJ) VALUES ('13', '19.719.561/0001-88');
 INSERT INTO MC_CLI_JURIDICA (NR_CLIENTE, NR_CNPJ) VALUES ('14', '81.695.732/0001-05');
 INSERT INTO MC_CLI_JURIDICA (NR_CLIENTE, NR_CNPJ) VALUES ('15', '56.138.194/0001-09');

 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('1', '1', '18');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('2', '2', '73');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('3', '3', '99');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('4', '4', '42');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('5', '5', '57');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('6', '6', '88');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('7', '7', '94');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('8', '8', '32');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('9', '9', '17');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('10', '10', '24');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('11', '11', '23');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('12', '12', '29');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('13', '13', '50');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('14', '14', '60');
 INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END) VALUES ('15', '15', '80');
 
 -- Resposta do Comando SQL item F)
 
 --INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, NM_LOGIN, DS_SENHA) VALUES ('16', 'Zé', 'aninha', 'laranja50');
 -- Resposta da perguinta da questão F: não é possível cadastrar um novo cliente utilizando um login já cadastrado no banco de dados. Isso acontece pois existe uma CONSTRAINT UNIQUE configurada no campo de NM_LOGIN. Isso faz com que este campo da tabela nunca seja preenchido de forma repetida, com informações já existentes

-- Resposta do Comando SQL item G)

INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('1', 'P', 'Artesanato', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('2', 'P', 'Áudio', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('3', 'P', 'Brinquedos', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('4', 'P', 'Celular e Smartphone', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('5', 'P', 'Colchões', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('6', 'P', 'Esporte e Lazer', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('7', 'P', 'Ferramentas', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('8', 'P', 'Games', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('9', 'P', 'Informática', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('10', 'P', 'Livros', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('11', 'P', 'Pet Shop', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('12', 'P', 'TV', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('13', 'P', 'Utilidades Domésticas', 'A');

-- Resposta do Comando SQL item H)
-- observação: essa questão menciona "entre outros". Por isso, cadastrei duas categorias de vídeo a mais para essa tabela

INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('14', 'V', 'Instalação do produto', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('15', 'V', 'Uso no cotidiano', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('16', 'V', 'Comercial com personalidade', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('17', 'V', 'Instruções de como utilizar', 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('18', 'V', 'Comercial rápido, para divulgação em redes sociais', 'A');

-- Resposta do Comando SQL item I)

INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('1', '1', 'Caixas decorativas em MDF', '50.00', 'Caixa decorada em MDF com acabamento em verniz, ótimo para guardar pequenos objetos ou para presentear');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('2', '1', 'Fios de lã para tricô e crochê', '30.00', 'Fio de lã macio e resistente, ideal para tricô ou crochê de roupas e acessórios');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('3', '2', 'Caixas de som Bluetooth', '200.00', 'Caixa de som portátil com conexão Bluetooth e bateria recarregável, perfeita para ouvir músicas em qualquer lugar');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('4', '2', 'Fones de ouvido sem fio', '150.00', 'Fone de ouvido sem fio com design ergonômico e bateria de longa duração, para uma experiência sonora confortável e prática');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('5', '3', 'Bonecas', '80.00', 'Boneca articulada com cabelos e roupas personalizáveis, para crianças de todas as idades');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('6', '3', 'Carrinhos de controle remoto', '120.00', 'Carrinho de controle remoto com tração nas quatro rodas e controle de direção, para corridas emocionantes');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('7', '4', 'Capas protetoras', '60.00', 'Capa protetora para celular, feita de material resistente e com acabamento emborrachado, para evitar arranhões e quedas');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('8', '4', 'Carregadores portáteis', '100.00', 'Carregador portátil com capacidade de 10000mAh, compatível com vários modelos de smartphones');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('9', '5', 'Colchão de molas', '400.00', 'Colchão de molas ensacadas com pillow top e espuma de alta densidade, para um sono confortável e relaxante');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('10', '5', 'Colchão de espuma', '1000.00', 'Colchão de espuma com tecnologia de memória, que se molda ao corpo, para um sono mais revigorante');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('11', '6', 'Bicicletas', '500.00', 'Bicicleta de alumínio com suspensão dianteira e câmbio Shimano, para pedaladas em diferentes terrenos');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('12', '6', 'Patins', '150.00', 'Patins com rodas de PU e sistema de ajuste fácil, para patinar com segurança e estilo');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('13', '7', 'Conjunto de chaves de fenda', '100.00', 'Conjunto de chaves de fenda com diferentes tamanhos e pontas, para uso em projetos de reparo ou manutenção');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('14', '8', 'Consoles de videogame', '4000.00', 'Console de videogame com capacidade de jogar online e gráficos de alta definição, para uma experiência de jogo imersiva');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('15', '9', 'Impressoras', '800.00', 'Impressora jato de tinta com impressão colorida e scanner integrado, para cópias e digitalizações de documentos');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('16', '10', 'Biografias', '50.00', ' Livro de biografia de uma personalidade famosa, contando sua trajetória pessoal e profissional');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('17', '11', 'Shampoo para cães', '60.00', 'Limpa profundamente e deixa o pelo do seu cão macio e brilhante, com uma fragrância agradável que dura por dias');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('18', '12', 'Televisão 4K', '3000.00', 'Televisão com alta definição na imagem, modelo UHD');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('19', '13', 'Jogo de panelas antiaderente', '200.00', 'Conjunto completo de panelas com revestimento antiaderente, permitindo uma cozinha mais saudável e fácil de limpar. Design elegante e durável');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD) VALUES ('20', '10', 'Autoajuda', '100.00', 'Livros de autoajuda, para pessoas que precisam de ajuda em determinado assunto');

UPDATE MC_PRODUTO SET ST_PRODUTO = 'A';

-- Resposta do Comando SQL item J)
-- observação: O professor Nemec confirmou que podemos adicionar um link do vídeo diretamente no campo DS_PATH_VIDEO_PROD. Não é necessário utilizar o campo VD_PRODUTO, em formato BLOB

INSERT INTO MC_SGV_PRODUTO_VIDEO (CD_PRODUTO, NR_SEQUENCIA, CD_CATEGORIA, DS_PATH_VIDEO_PROD) VALUES ('14', '1', '8', 'https://www.youtube.com/watch?v=yLCzHPdUeng');
INSERT INTO MC_SGV_PRODUTO_VIDEO (CD_PRODUTO, NR_SEQUENCIA, CD_CATEGORIA, DS_PATH_VIDEO_PROD) VALUES ('18', '1', '12', 'https://www.youtube.com/watch?v=Yo4FKdoxuig');
INSERT INTO MC_SGV_PRODUTO_VIDEO (CD_PRODUTO, NR_SEQUENCIA, CD_CATEGORIA, DS_PATH_VIDEO_PROD) VALUES ('18', '2', '12', 'https://www.youtube.com/watch?v=3WNqU_68Rrw');

-- Resposta do Comando SQL item K)

INSERT INTO MC_SGV_VISUALIZACAO_VIDEO (CD_VISUALIZACAO_VIDEO, NR_CLIENTE, CD_PRODUTO, DT_VISUALIZACAO, NR_HORA_VISUALIZACAO, NR_MINUTO_VIDEO, NR_SEGUNDO_VIDEO) VALUES (1, 7, 18, TO_DATE ('21/04/2023', 'DD/MM/YYYY'), 8, 25, 57);
INSERT INTO MC_SGV_VISUALIZACAO_VIDEO (CD_VISUALIZACAO_VIDEO, NR_CLIENTE, CD_PRODUTO, DT_VISUALIZACAO, NR_HORA_VISUALIZACAO, NR_MINUTO_VIDEO, NR_SEGUNDO_VIDEO) VALUES (2, 8, 18, TO_DATE ('20/04/2023', 'DD/MM/YYYY'), 5, 24, 50);
INSERT INTO MC_SGV_VISUALIZACAO_VIDEO (CD_VISUALIZACAO_VIDEO, NR_CLIENTE, CD_PRODUTO, DT_VISUALIZACAO, NR_HORA_VISUALIZACAO, NR_MINUTO_VIDEO, NR_SEGUNDO_VIDEO) VALUES (3, 10, 18, TO_DATE ('18/04/2023', 'DD/MM/YYYY'), 12, 22, 57);
INSERT INTO MC_SGV_VISUALIZACAO_VIDEO (CD_VISUALIZACAO_VIDEO, NR_CLIENTE, CD_PRODUTO, DT_VISUALIZACAO, NR_HORA_VISUALIZACAO, NR_MINUTO_VIDEO, NR_SEGUNDO_VIDEO) VALUES (4, 1, 18, TO_DATE ('15/04/2023', 'DD/MM/YYYY'), 10, 19, 47);
INSERT INTO MC_SGV_VISUALIZACAO_VIDEO (CD_VISUALIZACAO_VIDEO, NR_CLIENTE, CD_PRODUTO, DT_VISUALIZACAO, NR_HORA_VISUALIZACAO, NR_MINUTO_VIDEO, NR_SEGUNDO_VIDEO) VALUES (5, 15, 18, TO_DATE ('17/04/2023', 'DD/MM/YYYY'), 11, 10, 40);

-- Resposta do Comando SQL item L)
--COMMIT;

-- Resposta do Comando SQL item M)

INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, ST_CATEGORIA) VALUES ('19', 'P', 'Cama, mesa e banho', 'I');

-- Resposta do Comando SQL item N)

INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, DS_PRODUTO, VL_UNITARIO, DS_COMPLETA_PROD, ST_PRODUTO) VALUES ('21', '19', 'Travesseiro nasa', '100.00', 'O travesseiro NASA é o companheiro de sono perfeito para quem busca conforto e suporte excepcionais. Feito de espuma viscoelástica de alta densidade, ele se adapta ao contorno da cabeça e do pescoço, aliviando a pressão em áreas sensíveis. Ideal para quem sofre de dores no pescoço ou nas costas, ronca ou tem problemas de sono devido à má postura', 'I');

-- Resposta do Comando SQL item O)

UPDATE MC_FUNCIONARIO SET VL_SALARIO = VL_SALARIO*1.12 WHERE CD_FUNCIONARIO = 1;
UPDATE MC_FUNCIONARIO SET DS_CARGO = 'Supervisor de vendas' WHERE CD_FUNCIONARIO = 1;

-- Resposta do Comando SQL item P)

UPDATE MC_CATEGORIA_PROD SET DS_CATEGORIA = 'Livros e Revistas' WHERE CD_CATEGORIA = 10;

-- Resposta do Comando SQL item Q)

UPDATE MC_DEPTO SET NM_DEPTO = 'VENDAS' WHERE NM_DEPTO = 'COMERCIAL';

-- Resposta do Comando SQL item R)

UPDATE MC_CLI_FISICA SET DT_NASCIMENTO = TO_DATE('18/05/2002', 'DD/MM/YYYY') WHERE NR_CPF = '046.542.758-99';

-- Resposta do Comando SQL item S)

UPDATE MC_CATEGORIA_PROD SET DS_CATEGORIA = 'Vendas com personalidade' WHERE DS_CATEGORIA = 'Comercial com personalidade';

-- Resposta do Comando SQL item T)

UPDATE MC_FUNCIONARIO SET ST_FUNC = 'I' WHERE CD_FUNCIONARIO = 25;
UPDATE MC_FUNCIONARIO SET DT_DESLIGAMENTO = SYSDATE WHERE CD_FUNCIONARIO = 25;

-- Resposta do Comando SQL item U)

INSERT INTO MC_SGV_SAC (NR_SAC, NR_CLIENTE, CD_PRODUTO, CD_FUNCIONARIO, TP_SAC, DT_ABERTURA_SAC, HR_ABERTURA_SAC, DS_DETALHADA_SAC, ST_SAC) VALUES (1, 8, 11, 19,'S', TO_DATE('21/04/2023', 'DD/MM/YYYY'), 12, 'Olá, boa tarde. Comprei o produto e tenho uma sugestão para vocês. Seria interessante adicionar um sistema de suspensão para uma condução mais suave em terrenos acidentados', 'E');
UPDATE MC_SGV_SAC SET DT_ATENDIMENTO = SYSDATE, HR_ATENDIMENTO_SAC = 14, NR_TEMPO_TOTAL_SAC = 26, DS_DETALHADA_RETORNO_SAC = 'Obrigado por enviar a sua sugestão. Encaminhamos para a equipe responsável, e iremos avaliar a implantação.', NR_INDICE_SATISFACAO = 10 WHERE NR_SAC = 1

-- Resposta do Comando SQL item V)
-- observação: realizamos a alteração nessa coluna no dia 22/04/2023

SELECT * FROM MC_END_CLI  WHERE NR_END = 18
UPDATE MC_END_CLI SET ST_END = 'A';

UPDATE MC_END_CLI SET ST_END = 'I', DT_TERMINO = TO_DATE('21/04/2023', 'DD/MM/YYYY') WHERE NR_END = 18;

-- Resposta do Comando SQL item W)
-- observação: realizamos a alteração nessa coluna no dia 22/04/2023

SELECT * FROM MC_END_FUNC WHERE NR_END = 88
UPDATE MC_END_FUNC SET ST_END = 'I', DT_TERMINO = TO_DATE('21/04/2023', 'DD/MM/YYYY') WHERE NR_END = 88;

-- Resposta do Comando SQL item X)

--DELETE FROM MC_ESTADO WHERE SG_ESTADO = 'SC'
 -- Resposta da perguinta da questão X: não é possível deletar um estado que tenha uma cidade cadastrada, devido à violação da chave estrangeira (FK_MC_CIDADE_ESTADO) do relacionamento entre as tabelas

-- Resposta do Comando SQL item Y)

--SELECT * FROM MC_PRODUTO WHERE CD_PRODUTO = 7
--UPDATE MC_PRODUTO SET ST_PRODUTO = 'X' WHERE CD_PRODUTO = 7;
 -- Resposta da perguinta da questão Y: não é possível atualizar o status do produto, devido à violação da CHECK CONSTRAINT (CK_MC_PRODUTO_ST_PRODUTO), pois este campo só aceita os valores 'I' e 'A'.

-- Resposta do Comando SQL item Z)
--COMMIT;

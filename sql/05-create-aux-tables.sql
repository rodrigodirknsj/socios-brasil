DROP TABLE qualificacao_responsavel_socio IF EXISTS;

CREATE TABLE qualificacao_responsavel_socio
(
    id smallint NOT NULL,
    texto character varying(200),
    CONSTRAINT qualificacao_responsavel_socio_pkey PRIMARY KEY (id)
);

INSERT INTO qualificacao_responsavel_socio (id, texto) VALUES
(1, 'Acionista'),
(2, 'Acionista Controlador'),
(3, 'Acionista Diretor'),
(4, 'Acionista Presidente'),
(5, 'Administrador'),
(6, 'Administradora de consórcio de Empresas ou Grupo de Empresas'),
(7, 'Comissário'),
(8, 'Conselheiro de Administração'),
(9, 'Curador'),
(10, 'Diretor'),
(11, 'Interventor'),
(12, 'Inventariante'),
(13, 'Liquidante'),
(14, 'Mãe'),
(15, 'Pai'),
(16, 'Presidente'),
(17, 'Procurador'),
(18, 'Secretário'),
(19, 'Síndico (Condomínio)'),
(20, 'Sociedade Consorciada'),
(21, 'Sociedade Filiada'),
(22, 'Sócio'),
(23, 'Sócio Capitalista'),
(24, 'Sócio Comanditado'),
(25, 'Sócio Comanditário'),
(26, 'Sócio de Indústria'),
(27, 'Sócio Residente ou Domiciliado no Exterior'),
(28, 'Sócio-Gerente'),
(29, 'Sócio ou Acionista Incapaz ou Relativamente Incapaz (exceto menor)'),
(30, 'Sócio ou Acionista Menor (Assistido/Representado)'),
(31, 'Sócio Ostensivo'),
(32, 'Tabelião'),
(33, 'Tesoureiro'),
(34, 'Titular de Empresa Individual Imobiliária'),
(35, 'Tutor'),
(36, 'Gerente-Delegado'),
(37, 'Sócio Pessoa Jurídica Domiciliado no Exterior'),
(38, 'Sócio Pessoa Física Residente ou Domiciliado no Exterior'),
(39, 'Diplomata'),
(40, 'Cônsul'),
(41, 'Representante de Organização Internacional'),
(42, 'Oficial de Registro'),
(43, 'Responsável'),
(44, 'Sócio Participante'),
(45, 'Sócio Investidor'),
(46, 'Ministro de Estado das Relações Exteriores'),
(47, 'Sócio Pessoa Física Residente no Brasil'),
(48, 'Sócio Pessoa Jurídica Domiciliado no Brasil'),
(49, 'Sócio-Administrador'),
(50, 'Empresário'),
(51, 'Candidato a Cargo Político Eletivo'),
(52, 'Sócio com Capital'),
(53, 'Sócio sem Capital'),
(54, 'Fundador'),
(55, 'Sócio Comanditado Residente no Exterior'),
(56, 'Sócio Comanditário Pessoa Física Residente no Exterior'),
(57, 'Sócio Comanditário Pessoa Jurídica Domiciliado no Exterior'),
(58, 'Sócio Comanditário Incapaz'),
(59, 'Produtor Rural'),
(60, 'Cônsul Honorário'),
(61, 'Responsável Indigena'),
(62, 'Representante das Instituições Extraterritoriais'),
(63, 'Cotas em Tesouraria'),
(64, 'Administrador Judicial'),
(65, 'Titular Pessoa Física Residente ou Domiciliado no Brasil'),
(66, 'Titular Pessoa Física Residente ou Domiciliado no Exterior'),
(67, 'Titular Pessoa Física Incapaz ou Relativamente Incapaz (exceto menor)'),
(68, 'Titular Pessoa Física Menor (Assistido/Representado)'),
(69, 'Beneficiário Final'),
(70, 'Administrador Residente ou Domiciliado no Exterior'),
(71, 'Conselheiro de Administração Residente ou Domiciliado no Exterior'),
(72, 'Diretor Residente ou Domiciliado no Exterior'),
(73, 'Presidente Residente ou Domiciliado no Exterior'),
(74, 'Sócio-Administrador Residente ou Domiciliado no Exterior'),
(75, 'Fundador Residente ou Domiciliado no Exterior'),
(76, 'Protetor'),
(77, 'Vice-Presidente'),
(78, 'Titular Pessoa Jurídica Domiciliada no Brasil'),
(79, 'Titular Pessoa Jurídica Domiciliada no Exterior');

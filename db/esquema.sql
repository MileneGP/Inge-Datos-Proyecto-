CREATE TABLE tipo_documento (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,--ID
    nombre VARCHAR(15) NOT NULL --nombre
)
CREATE TABLE moneda (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,--ID
    nombre VARCHAR(25) NOT NULL --nombre
)
CREATE TABLE distrito (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,--ID
    nombre VARCHAR(30) NOT NULL --nombre
)CREATE TABLE carrito (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,--ID
    sub_total INTEGER --nombre
)CREATE TABLE categoria (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    imagen_url VARCHAR(70) NOT NULL
)CREATE TABLE cliente (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    numero_doc INTEGER NOT NULL,
    direccion INTEGER NOT NULL,
    distrito_id INTEGER,
    tipo_documento_id INTEGER,

    FOREIGN KEY(distrito_id) REFERENCES distrito(id) ON DELETE CASCADE,
    FOREIGN KEY(tipo_documento_id) REFERENCES tipo_documento(id) ON DELETE CASCADE
)CREATE TABLE usuario (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    contrasena VARCHAR(20) NOT NULL ,

    cliente_id INTEGER,

    FOREIGN KEY(cliente_id) REFERENCES cliente(id) ON DELETE CASCADE
)CREATE TABLE pedido (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    fecha_llegada date ,
    direccion INTEGER,
    distrito_id INTEGER,

    FOREIGN KEY(distrito_id) REFERENCES distrito(id) ON DELETE CASCADE
)CREATE TABLE boleta (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    num_boleta INTEGER,
    imagen VARCHAR(70) NOT NULL ,
    direccion VARCHAR(75) NOT NULL ,
    celular INTEGER,
    igv INTEGER,
    importe_total INTEGER,
    observacion VARCHAR(150) NOT NULL ,
    fecha_emision DATE,
    cliente_id INTEGER,
    moneda_id INTEGER,
    pedido_id INTEGER,

    FOREIGN KEY(cliente_id) REFERENCES cliente(id) ON DELETE CASCADE
    FOREIGN KEY(moneda_id) REFERENCES moneda(id) ON DELETE CASCADE

    FOREIGN KEY(pedido_id) REFERENCES pedido(id) ON DELETE CASCADE
)
CREATE TABLE sub_categoria (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    categoria_id INTEGER,

    FOREIGN KEY(categoria_id) REFERENCES categoria(id) ON DELETE CASCADE
)
CREATE TABLE producto (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    imagen_portada VARCHAR(70) NOT NULL ,
    boleta_id INTEGER,
    sub_categoria_id INTEGER,

    FOREIGN KEY(boleta_id) REFERENCES boleta(id) ON DELETE CASCADE,
    FOREIGN KEY(sub_categoria_id) REFERENCES sub_categoria(id) ON DELETE CASCADE

)
CREATE TABLE imagen_producto (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    imagen_url VARCHAR(35) NOT NULL ,
    producto_id INTEGER,

    FOREIGN KEY(producto_id) REFERENCES producto(id) ON DELETE CASCADE
)
CREATE TABLE bolsa_compra (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    empaquetado VARCHAR(20) NOT NULL ,
    pedido_id INTEGER,
    FOREIGN KEY(pedido_id) REFERENCES pedido(id) ON DELETE CASCADE

)
CREATE TABLE carrito_producto (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    producto_id INTEGER,
    FOREIGN KEY(producto_id) REFERENCES producto(id) ON DELETE CASCADE,
    carrito_id INTEGER,
    FOREIGN KEY(carrito_id) REFERENCES carrito(id) ON DELETE CASCADE
) 
CREATE TABLE producto_pedido (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    producto_id INTEGER,
    FOREIGN KEY(producto_id) REFERENCES producto(id) ON DELETE CASCADE,
    pedido_id INTEGER,
    FOREIGN KEY(pedido_id) REFERENCES pedido(id) ON DELETE CASCADE
)     

CREATE TABLE producto_bolsa_compra (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    producto_id INTEGER,
    FOREIGN KEY(producto_id) REFERENCES producto(id) ON DELETE CASCADE,
    bolsa_compra_id INTEGER,
    FOREIGN KEY(bolsa_compra_id) REFERENCES bolsa_compra(id) ON DELETE CASCADE
)   

INSERT INTO medio_pagos (id, nombre, imagen_url) VALUES (1, 'Yape', 'img/yape.png');
INSERT INTO medio_pagos (id, nombre, imagen_url) VALUES (2, 'Plin', 'img/plin.png');
INSERT INTO medio_pagos (id, nombre, imagen_url) VALUES (3, 'Efectivo', 'img/efectivo.png');
INSERT INTO medio_pagos (id, nombre, imagen_url) VALUES (4, 'Débito Interbank', 'img/interbank.png');
INSERT INTO medio_pagos (id, nombre, imagen_url) VALUES (5, 'Crédito Interbank', 'img/interbank.png');

INSERT INTO niveles (id, nombre) VALUES (1, 'Principiante');
INSERT INTO niveles (id, nombre) VALUES (2, 'Intermedio');
INSERT INTO niveles (id, nombre) VALUES (3, 'Avanzado');
INSERT INTO niveles (id, nombre) VALUES (4, 'Body Builder');
INSERT INTO niveles (id, nombre) VALUES (5, 'Power Lifter');


INSERT INTO objetivos (id, nombre) VALUES (1, 'Bajar la barriga');
INSERT INTO objetivos (id, nombre) VALUES (2, 'Aumentar masa muscular');
INSERT INTO objetivos (id, nombre) VALUES (3, 'Rehabilitación');

INSERT INTO cuerpo_partes (id, nombre) VALUES (1, 'ABDOMEN');
INSERT INTO cuerpo_partes (id, nombre) VALUES (2, 'PIERNAS');
INSERT INTO cuerpo_partes (id, nombre) VALUES (3, 'PANTORRILLA');
INSERT INTO cuerpo_partes (id, nombre) VALUES (4, 'PECTORAL');
INSERT INTO cuerpo_partes (id, nombre) VALUES (5, 'ESPALDA');
INSERT INTO cuerpo_partes (id, nombre) VALUES (6, 'HOMBROS');
INSERT INTO cuerpo_partes (id, nombre) VALUES (7, 'BICEPS');
INSERT INTO cuerpo_partes (id, nombre) VALUES (8, 'TRICEPS');

INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20180038, 'ALCALA ISUIZA', 'ANGEL ADRIAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20202370, 'ARROYO LEON', 'DIEGO ENRIQUE');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20171869, 'BARDALES CHIHUANHUAYLLA', 'JORGE LUIS');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20192566, 'CARRION SAAVEDRA', 'DAVID RODRIGO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20202712, 'CARTOLIN YANQUE', 'MARIO ALEXANDER');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20184660, 'CUYA SANCHEZ', 'ANGEL OSCAR');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20200711, 'DUARTE ROMERO', 'ADRIAN'); 
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20194065, 'ESPINOZA ARROYO', 'JESUS MIGUEL');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20192303, 'GIL VELARDE', 'RAFAEL ALFONSO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20190857, 'GOMEZ LOPEZ', 'ALEJANDRO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20182686, 'GUILLEN CHARA', 'LUIS ANGELO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20142881, 'IZAGUIRRE CASTRO', 'ANDONI TOMAS');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20192985, 'LINARES ALZAMORA', 'RODRIGO GABRIEL');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20201166, 'LIVIAS VIGIL', 'AARON WAGNER LINCOLN'); 
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20202407, 'MENESES GUTIERREZ', 'HECTOR JOSE');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (30230242, 'MESTANZA CABRERA', 'AXEL SMITH');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20191291, 'MIGLIORI RUIZ', 'RENATO MARCELO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20191301, 'MIÑAN PANDURO', 'EDUARDO PATRICK');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20191412, 'OBLITAS MANTILLA', 'JOHAN ANDRES');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20152154, 'OROPEZA MEDRANO', 'BRAYAN JEANPIERE');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20191937, 'SOLIMANO PRINA', 'LEONARDO NAZIR');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20203668, 'SOTELO GOMEZ', 'FRANCO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20203703, 'TINCO BELLIDO', 'JEAN PIERRE');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20192003, 'TORRES BALMACEDA', 'SEBASTIAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20193553, 'TRUJILLO DELGADO', 'JANNIRE ASHLEY');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20162609, 'VARGAS AROSTEGUI', 'ERIK RICARDO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20172768, 'VELARDE HUAMAN', 'HECTOR EUSEBIO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20183460, 'ZAPATA ALBUJAR', 'PAOLO GIULIANO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20220227, 'AVILA DIAZ', 'GENESSI YAMILE');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224518, 'BARRETO IBRAHIM', 'REAID YUSEF');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224619, 'CASTAÑEDA MATEO', 'SHERLOCK CRISTOPHER');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20193934, 'CASTILLO SOLORZANO', 'JOAQUIN ALEJANDRO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20220600, 'CHAVEZ ESPINOZA', 'ANGELA FIORELLA');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20220604, 'CHAVEZ ORIHUELA', 'DANTE STHEFANO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224677, 'CONDOR VILCHEZ', 'DIANA'); 
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20220746, 'CUEVAS SERRATO', 'JORGE ADRIAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20220854, 'DIOSES SOLIS', 'RICARDO CESAR');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20220874, 'EGOAVIL CALDERON', 'FRANCO'); 
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224732, 'ELERA RIOS', 'ALEXIS FABIAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224782, 'GAMARRA ALMEYDA', 'CARLOS SEBASTIAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20221118, 'GONZALES IBARCENA', 'VALENTINA DAYANA');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224806, 'GUERRA ADRIANO', 'JOSE DARIO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224808, 'GUERRERO ANGASPILCO', 'FRANKLIN OWEN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224815, 'GUTIERREZ CADILLO', 'LUIS FRANCISCO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20221218, 'HERRERA NOEL', 'MAURICIO ALEJANDRO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20221290, 'ITURRIAGA VASQUEZ', 'FABRIZIO MIGUEL');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20221387, 'LINARES MATOS', 'MAURICIO ALONSO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20233916, 'LUNA MORAN', 'FRANCO ANTONIO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20221487, 'MAMANI MAGALLANES', 'MATIAS FERNANDO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20231730, 'MAQUEIRA BARCELLI', 'MELISSA');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20221543, 'MATSUMOTO ONAGA', 'LUCAS'); 
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224973, 'MERA INCIO', 'ALVARO DIEGO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20225019, 'NAKANDAKARI PACHERRE', 'KENYI JOSE');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20225024, 'NERI CAIPO', 'ELTON FABRIZIO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20221914, 'PAZ MARTINEZ', 'ALONSO SEBASTIAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20215189, 'PORTALES NUÑEZ', 'NILCER RENZO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20225158, 'QUISPE MAMANI', 'HANS ANTHONY');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20233847, 'RAMIREZ GUEVARA', 'AARON JARED');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20215241, 'RAMOS VELAZCO', 'HUMBERTO NEMESIO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20225176, 'REGUERA GARCIA', 'LUIS RUDY');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20225178, 'RENGIFO CALDERON', 'OSCAR MARTIN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20222306, 'SALAZAR ANGULO', 'GONZALO NICOLAS');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20222331, 'SALDARRIAGA MENDOZA', 'SEBASTIAN STEFANO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20225487, 'TANIGUCHI VENTURA', 'KATSUO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20222522, 'TIBURCIO MEJORADA', 'CLAUDIA JIMENA');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224131, 'TTITO ROFFINELLA', 'LEONARDO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20192057, 'VALIENTE APONTE', 'SEBASTIAN JULIO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20224203, 'YANCE VALENZUELA', 'ANTHONY');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20210076, 'ALFARO ECHEGARAY', 'JOAQUIN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20213214, 'ALFARO SANCHEZ', 'LUCIA ALEJANDRA');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20210120, 'ANGELES MUÑOZ', 'DAVID ANDRES');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20210457, 'CAMARA MORA', 'FANTINO ELIAS EMILIANO'); 
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20213383, 'CASTILLO PEÑA', 'ANGELES NICOLE');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20213418, 'CHAVEZ PRIETO', 'ALEKSEY SKRIABIN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20210670, 'CHURAMPI GUERRERO', 'ANDRES ANTHONY');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20213435, 'COCA DAVILA', 'KENNETT YAEL');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20213505, 'DIAZ VALLEJOS', 'WALTER ANDRÉS');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20210896, 'DUFFOO ANAMARIA', 'JOSE RODRIGO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20210981, 'FERNANDEZ CERNA', 'AARON BRYAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20210983, 'FERNANDEZ FALCON', 'ITALO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20211104, 'GARCIA VILCHEZ', 'CESAR ANDRES');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20213013, 'GONZALES NUÑEZ', 'LEANDRO PAOLO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20203082, 'JAUREGUI MENDOZA', 'LEONARDO GUSTAVO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20211454, 'LEON VILELA', 'PATRICK ALONSO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20211590, 'MAMANI VALVERDE', 'YERSON DANIEL');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20201271, 'MARROQUIN CUADRADO', 'AURISTELA ANGELA');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20211628, 'MARTINEZ RUEDA', 'LUIS MARIO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20211672, 'MEJIA APARCANA', 'ALESSANDER');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20213835, 'MEJORADA GALLARDO', 'ADRIANA SOFIA');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20194322, 'MEZA JACINTO', 'DIEGO ENRIQUE');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20203252, 'MONTES MAMANI', 'ANGELO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20211769, 'MORALES ACERO', 'DIEGO RAUL');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20201426, 'MORON LOAYZA', 'CESAR HERNAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20211918, 'ONAJA ADANIYA', 'KOHJI');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20211960, 'OVIEDO SOTO', 'GERSON ADEMIR');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20213996, 'PERALES SAN', 'MIGUEL DANTE JAASIEL'); 
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20214035, 'PUMAYUCRA CHAUCA', 'LUIS ANGEL');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20203475, 'RAMIREZ DE LA CUBA', 'CAROLINA ALEXANDRA'); 
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20184344, 'RAMIREZ MILLA', 'MAURICIO JESUS');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20214398, 'RAMIREZ PEREZ', 'ERNESTO ALDAIR');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20204876, 'RODRIGUEZ HUAMANLAZO', 'RENZO IVAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20201824, 'RODRIGUEZ SAENZ', 'ANGELO FABIAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20191931, 'SISNIEGAS SANCHEZ', 'ISAAC GABRIEL');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20212604, 'SOTERO HUAROTO', 'HIDEKI SEBASTIAN');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20214404, 'TAYPE ROJAS', 'DANIEL ALONSO');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20212700, 'TORRES RIVERA', 'ROLANDO JESUS');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20202143, 'VALDERRAMA URBAY', 'ERICK DMITRI');
INSERT INTO cliente (codigo, apellidos, nombre) VALUES (20212903, 'VILLALVA GOMEZ', 'DIANA SOFIA');

ALTER TABLE ejercicios
  ADD video_url VARCHAR(100) NOT NULL;
  
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(1, 'ELEVACIONES DE PIERNAS ACOSTADAS', 'ejercicios/abdomen01.png', 'https://www.youtube.com/watch?v=u51ytLWD15g', 1);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(2, 'SILLA ROMANA', 'ejercicios/abdomen02.png', 'https://www.youtube.com/watch?v=u51ytLWD15g', 1);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(3, 'CAMINADORA', 'ejercicios/abdomen03.png', 'https://www.youtube.com/watch?v=u51ytLWD15g', 1);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(4, 'PRESS DECLINADO EN BANCO', 'ejercicios/abdomen04.png', 'https://www.youtube.com/watch?v=u51ytLWD15g', 1);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(5, 'FLEXIONES DE PIERNAS EN BANCO SENTADO', 'ejercicios/abdomen05.png', 'https://www.youtube.com/watch?v=u51ytLWD15g', 1);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(6, 'ABDOMINALES EN MÁQUINA', 'ejercicios/abdomen06.png', 'https://www.youtube.com/watch?v=u51ytLWD15g', 1);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(7, 'ABDOMINALES INVERTIDOS EN BANCO', 'ejercicios/abdomen07.png', 'https://www.youtube.com/watch?v=u51ytLWD15g', 1);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(8, 'SENTADILLA', 'ejercicios/piernas01.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(9, 'MÁQUINA HACK', 'ejercicios/piernas02.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(10, 'PRESS DE PIERNA', 'ejercicios/piernas03.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(11, 'SENTADILLA FRONTAL', 'ejercicios/piernas04.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(12, 'EXTENSIÓN DE PIERNAS', 'ejercicios/piernas05.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(13, 'ADUCTORES EN MÁQUINA', 'ejercicios/piernas06.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(14, 'MÁQUINA SMITH', 'ejercicios/piernas07.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(15, 'FLEXIONES DE PIERNAS', 'ejercicios/piernas08.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(16, 'ESTOCADAS LATERALES CON MANCUERNAS', 'ejercicios/piernas09.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(17, 'LUNGES CON MANCUERNAS', 'ejercicios/piernas10.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(18, 'PESO MUERTO', 'ejercicios/piernas11.png', 'https://www.youtube.com/watch?v=KrpKmehR--A', 2);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(19, 'JALÓN CON POLEA', 'ejercicios/espalda01.png', 'https://www.youtube.com/watch?v=D7z3g0Eg9BY', 5);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(20, 'PULLOVER DE BANCA SENTADO', 'ejercicios/espalda02.png', 'https://www.youtube.com/watch?v=D7z3g0Eg9BY', 5);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(21, 'REMO SENTADO', 'ejercicios/espalda03.png', 'https://www.youtube.com/watch?v=D7z3g0Eg9BY', 5);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(22, 'PESO MUERTO', 'ejercicios/espalda04.png', 'https://www.youtube.com/watch?v=D7z3g0Eg9BY', 5);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(23, 'DOMINADAS', 'ejercicios/espalda05.png', 'https://www.youtube.com/watch?v=D7z3g0Eg9BY', 5);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(24, 'HIPEREXTENSIÓN', 'ejercicios/espalda06.png', 'https://www.youtube.com/watch?v=D7z3g0Eg9BY', 5);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(25, 'COPA SENTADO', 'ejercicios/espalda07.png', 'https://www.youtube.com/watch?v=D7z3g0Eg9BY', 5);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(26, 'ENCOGIMIENTO DE HOMBROS', 'ejercicios/espalda08.png', 'https://www.youtube.com/watch?v=D7z3g0Eg9BY', 5);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(27, 'CURL CON BARRA', 'ejercicios/biceps01.png', 'https://www.youtube.com/watch?v=ZIm_qrJSOds', 7);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(28, 'SCOOT SENTADO', 'ejercicios/biceps02.png', 'https://www.youtube.com/watch?v=ZIm_qrJSOds', 7);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(29, 'SCOOT POR LADO', 'ejercicios/biceps03.png', 'https://www.youtube.com/watch?v=ZIm_qrJSOds', 7);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(30, 'CURL ALTERNADO INCLINADO', 'ejercicios/biceps04.png', 'https://www.youtube.com/watch?v=ZIm_qrJSOds', 7);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(31, 'SCOOT CON MÁQUINA', 'ejercicios/biceps05.png', 'https://www.youtube.com/watch?v=ZIm_qrJSOds', 7);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(32, 'CURL POLEA CON UN BRAZO', 'ejercicios/biceps06.png', 'https://www.youtube.com/watch?v=ZIm_qrJSOds', 7);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(33, 'CURL ARTILLO', 'ejercicios/biceps07.png', 'https://www.youtube.com/watch?v=ZIm_qrJSOds', 7);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(34, 'PANTORRILLA EN MÁQUINA SMITH', 'ejercicios/pantoriilla01.png', 'https://www.youtube.com/watch?v=F16IZhxfP3w', 3);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(35, 'PANTORRILLA PARADO LIBRE', 'ejercicios/pantoriilla02.png', 'https://www.youtube.com/watch?v=F16IZhxfP3w', 3);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(36, 'PANTORRILLA PRENSA', 'ejercicios/pantoriilla03.png', 'https://www.youtube.com/watch?v=F16IZhxfP3w', 3);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(37, 'PANTORRILLA CON MANCUERNAS', 'ejercicios/pantoriilla04.png', 'https://www.youtube.com/watch?v=F16IZhxfP3w', 3);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(38, 'PANTORRILLA SENTADO', 'ejercicios/pantoriilla05.png', 'https://www.youtube.com/watch?v=F16IZhxfP3w', 3);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(39, 'PRESS DE BANCA', 'ejercicios/pectoral01.png', 'https://www.youtube.com/watch?v=VRMLeECpyYc', 4);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(40, 'PRESS DE BANCA DECLINADA', 'ejercicios/pectoral02.png', 'https://www.youtube.com/watch?v=VRMLeECpyYc', 4);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(41, 'PRESS DE BANCA CON MANCUERNAS INCLINADAS', 'ejercicios/pectoral03.png', 'https://www.youtube.com/watch?v=VRMLeECpyYc', 4);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(42, 'PRESS DE BANCA CON MANCUERNAS', 'ejercicios/pectoral04.png', 'https://www.youtube.com/watch?v=VRMLeECpyYc', 4);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(43, 'APERTURAS LATERALES EN BANCO', 'ejercicios/pectoral05.png', 'https://www.youtube.com/watch?v=VRMLeECpyYc', 4);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(44, 'CRUCE CON CABLES', 'ejercicios/pectoral06.png', 'https://www.youtube.com/watch?v=VRMLeECpyYc', 4);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(45, 'MÁQUINA PRESS SENTADO', 'ejercicios/pectoral07.png', 'https://www.youtube.com/watch?v=VRMLeECpyYc', 4);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(46, 'DECK PRESS', 'ejercicios/pectoral08.png', 'https://www.youtube.com/watch?v=VRMLeECpyYc', 4);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(47, 'PLANCHAS', 'ejercicios/pectoral09.png', 'https://www.youtube.com/watch?v=VRMLeECpyYc', 4);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(48, 'PRESS FRONTAL', 'ejercicios/hombros01.png', 'https://www.youtube.com/watch?v=QcyC8hXLQ40', 6);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(49, 'PRESS TRAS LA NUCA CON MÁQUINA', 'ejercicios/hombros02.png', 'https://www.youtube.com/watch?v=QcyC8hXLQ40', 6);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(50, 'PRESS MILITAR', 'ejercicios/hombros03.png', 'https://www.youtube.com/watch?v=QcyC8hXLQ40', 6);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(51, 'PRESS MILITAR CON MANCUERNA', 'ejercicios/hombros04.png', 'https://www.youtube.com/watch?v=QcyC8hXLQ40', 6);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(52, 'FACE PULL', 'ejercicios/hombros05.png', 'https://www.youtube.com/watch?v=QcyC8hXLQ40', 6);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(53, 'BARRAS EN MÁQUINA', 'ejercicios/hombros06.png', 'https://www.youtube.com/watch?v=QcyC8hXLQ40', 6);
INSERT INTO ejercicios (id, nombre, imagen_url, video_url, cuerpo_parte_id) VALUES(54, 'ELVACIÓN LATERAL ALTERNA', 'ejercicios/hombros07.png', 'https://www.youtube.com/watch?v=QcyC8hXLQ40', 6);

ALTER TABLE membresias ADD numero_transaccion INTEGER;

INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (1,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 1);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (2,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 2);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (3,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 3);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (4,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 4);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (5,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 5);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (6,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 6);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (7,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 7);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (8,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 8);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (9,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 9);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (10,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 10);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (11,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 11);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (12,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 12);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (13,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 13);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (14,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 14);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (15,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 15);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (16,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 16);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (17,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 17);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (18,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 18);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (19,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 19);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (20,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 20);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (21,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 21);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (22,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 22);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (23,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 23);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (24,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 24);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (25,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 25);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (26,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 26);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (27,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 27);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (28,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 28);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (29,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 29);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (30,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 30);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (31,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 31);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (32,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 32);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (33,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 33);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (34,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 34);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (35,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 35);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (36,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 36);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (37,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 37);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (38,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 38);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (39,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 39);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (40,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 40);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (41,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 41);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (42,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 42);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (43,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 43);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (44,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 44);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (45,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 45);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (46,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 46);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (47,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 47);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (48,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 48);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (49,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 49);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (50,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 50);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (51,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 51);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (52,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 52);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (53,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 53);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (54,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 54);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (55,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 55);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (56,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 56);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (57,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 57);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (58,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 58);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (59,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 59);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (60,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 60);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (61,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 61);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (62,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 62);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (63,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 63);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (64,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 64);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (65,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 65);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (66,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 66);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (67,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 67);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (68,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 68);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (69,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 69);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (70,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 70);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (71,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 71);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (72,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 72);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (73,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 73);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (74,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 74);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (75,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 75);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (76,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 76);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (77,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 77);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (78,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 78);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (79,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 79);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (80,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 80);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (81,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 81);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (82,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 82);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (83,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 83);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (84,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 84);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (85,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 85);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (86,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 86);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (87,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 87);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (88,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 88);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (89,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 89);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (90,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 90);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (91,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 91);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (92,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 92);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (93,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 93);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (94,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 94);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (95,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 95);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (96,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 96);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (97,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 97);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (98,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 98);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (99,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 99);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (100,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 100);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (101,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 101);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (102,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 102);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (103,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 103);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (104,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 104);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (105,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 105);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (106,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 106);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (107,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 107);
INSERT INTO membresias (id, inicio, fin, pago, miembro_id) VALUES (108,	'2023:10:17 00:00', '2023:11:17 00:00',	100, 108);

INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (17, 32072, 1, 1);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (13, 22135, 3, 1);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (70, 79304, 5, 1);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (40, 46168, 1, 2);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (25, 71037, 2, 2);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (35, 58101, 5, 2);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (30, 22161, 1, 3);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (5, 49460, 2, 3);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (65, 79211, 5, 3);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (20, 63346, 3, 4);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (14, 65918, 1, 4);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (66, 15298, 2, 4);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (35, 52107, 4, 5);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (18, 18009, 3, 5);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (47, 12142, 5, 5);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (84, 72190, 1, 6);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (16, 79686, 4, 6);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (77, 50827, 4, 7);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 27787, 1, 7);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (19, 51363, 2, 7);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (19, 10461, 1, 8);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (19, 92921, 3, 8);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (62, 75991, 2, 8);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (43, 49244, 2, 9);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (25, 29656, 1, 9);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (32, 20145, 3, 9);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (42, 95077, 2, 10);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (36, 82683, 2, 10);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (22, 86596, 5, 10);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (32, 99278, 3, 11);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (23, 34179, 4, 11);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (45, 14018, 2, 11);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (97, 48983, 1, 12);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (3, 42279, 5, 12);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (19, 43720, 3, 13);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (3, 57963, 5, 13);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (78, 48704, 1, 13);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (10, 85509, 2, 14);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 23360, 2, 14);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (86, 23651, 3, 14);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (41, 90416, 5, 15);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (10, 90385, 1, 15);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (49, 82222, 5, 15);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (41, 84141, 2, 16);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (25, 74637, 2, 16);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (34, 45288, 1, 16);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (38, 24051, 5, 17);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (12, 58299, 4, 17);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (50, 36558, 2, 17);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (36, 51612, 2, 18);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (33, 60958, 5, 18);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (31, 41543, 3, 18);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (9, 36853, 3, 19);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 10665, 2, 19);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (87, 38136, 1, 19);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (27, 79734, 4, 20);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 61062, 2, 20);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (69, 72520, 1, 20);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (97, 66203, 1, 21);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (3, 41517, 3, 21);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (9, 44740, 3, 22);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (9, 47021, 1, 22);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (82, 35093, 5, 22);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (91, 90249, 2, 23);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (9, 22446, 5, 23);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (54, 37061, 2, 24);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (46, 33179, 3, 24);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (10, 84381, 5, 25);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (7, 12461, 4, 25);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (83, 72640, 3, 25);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (28, 95678, 5, 26);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (17, 28259, 3, 26);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (55, 35910, 4, 26);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (29, 15924, 3, 27);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (28, 24352, 5, 27);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (43, 92815, 4, 27);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (61, 64406, 4, 28);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (39, 84643, 5, 28);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (32, 59552, 3, 29);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (9, 37363, 3, 29);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (59, 92094, 2, 29);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (85, 20279, 3, 30);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (15, 90062, 4, 30);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (10, 77006, 5, 31);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (5, 48473, 5, 31);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (85, 45873, 5, 31);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (53, 92228, 3, 32);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (47, 70177, 5, 32);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 49851, 1, 33);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 46761, 3, 33);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (95, 69649, 1, 33);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (46, 82307, 5, 34);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (12, 26270, 4, 34);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (42, 34081, 3, 34);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (37, 71904, 5, 35);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (21, 58275, 4, 35);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (42, 50402, 2, 35);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (63, 28783, 1, 36);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (20, 90499, 5, 36);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (17, 18625, 4, 36);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (59, 85233, 1, 37);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (34, 68726, 5, 37);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (7, 88869, 3, 37);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (33, 25021, 1, 38);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (29, 95326, 2, 38);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (38, 81482, 2, 38);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (46, 72452, 5, 39);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (26, 61695, 3, 39);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (28, 59049, 1, 39);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (48, 81886, 2, 40);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (18, 72516, 4, 40);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (34, 59910, 3, 40);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (25, 16243, 4, 41);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (20, 76141, 2, 41);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (55, 73372, 4, 41);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (74, 16115, 1, 42);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (26, 96470, 3, 42);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (85, 14372, 5, 43);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (15, 46293, 5, 43);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (24, 62924, 2, 44);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (24, 55342, 1, 44);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (52, 67544, 1, 44);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (14, 99680, 4, 45);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (2, 19758, 4, 45);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (84, 13344, 5, 45);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (33, 63871, 3, 46);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (19, 55691, 5, 46);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (48, 75426, 4, 46);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (32, 52228, 1, 47);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 29903, 4, 47);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (67, 62435, 5, 47);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (97, 74688, 5, 48);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (2, 26262, 1, 48);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 30047, 5, 48);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (64, 57209, 4, 49);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (5, 98515, 1, 49);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (31, 12908, 1, 49);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (90, 19356, 1, 50);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (10, 60562, 5, 50);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (40, 29953, 4, 51);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (25, 96379, 2, 51);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (35, 99433, 2, 51);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 75851, 3, 52);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 95492, 5, 52);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (98, 52495, 2, 52);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (32, 76570, 5, 53);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (27, 71273, 2, 53);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (41, 37767, 1, 53);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (76, 79831, 3, 54);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (7, 90451, 4, 54);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (17, 91216, 4, 54);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (89, 39556, 5, 55);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (11, 28832, 5, 55);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (35, 69872, 1, 56);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (16, 63202, 5, 56);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (49, 37873, 3, 56);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (98, 68724, 4, 57);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (2, 98269, 5, 57);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (61, 99049, 3, 58);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (36, 58890, 5, 58);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (3, 22667, 1, 58);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (10, 91801, 4, 59);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (9, 35627, 4, 59);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (81, 90599, 4, 59);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (10, 52661, 3, 60);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (10, 19174, 3, 60);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (80, 29836, 4, 60);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (14, 82686, 1, 61);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (11, 17299, 2, 61);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (75, 23076, 1, 61);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (9, 75333, 4, 62);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (6, 77592, 1, 62);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (85, 39371, 1, 62);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (36, 72185, 5, 63);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (17, 32791, 5, 63);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (47, 34985, 4, 63);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (75, 80564, 5, 64);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (25, 28826, 2, 64);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (61, 71340, 2, 65);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (27, 87777, 2, 65);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (12, 58464, 1, 65);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (72, 38693, 3, 66);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (7, 83251, 3, 66);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (21, 52994, 1, 66);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (11, 57440, 2, 67);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (7, 91277, 2, 67);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (82, 45182, 1, 67);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (45, 41135, 3, 68);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 55067, 4, 68);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (51, 31357, 3, 68);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (27, 55689, 2, 69);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (25, 67367, 2, 69);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (48, 41836, 4, 69);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (45, 92006, 1, 70);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (12, 47483, 5, 70);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (43, 85014, 4, 70);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (30, 27240, 5, 71);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (15, 61270, 5, 71);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (55, 36925, 1, 71);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (85, 72615, 1, 72);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (15, 70075, 5, 72);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (11, 47373, 4, 73);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (9, 30685, 2, 73);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (80, 97570, 1, 73);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (62, 17062, 4, 74);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (23, 28192, 3, 74);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (15, 43625, 2, 74);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (52, 45884, 3, 75);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 28304, 5, 75);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (44, 85471, 2, 75);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (61, 21583, 4, 76);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (38, 26633, 1, 76);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 70332, 4, 76);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (94, 24575, 5, 77);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (6, 85017, 4, 77);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (94, 51085, 3, 78);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (6, 63089, 2, 78);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (62, 15019, 2, 79);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (12, 66411, 3, 79);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (26, 53552, 2, 79);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (25, 44857, 3, 80);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (11, 39986, 1, 80);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (64, 17063, 5, 80);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (65, 29039, 3, 81);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (35, 55359, 1, 81);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (71, 47953, 3, 82);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (16, 99405, 5, 82);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (13, 62924, 5, 82);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (42, 75730, 2, 83);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (31, 42290, 3, 83);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (27, 53669, 1, 83);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (51, 26696, 4, 84);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (45, 91012, 2, 84);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 77940, 5, 84);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (17, 55220, 4, 85);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 95804, 2, 85);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (82, 60943, 3, 85);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (88, 60874, 1, 86);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (12, 19012, 3, 86);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (19, 93895, 2, 87);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (15, 81972, 4, 87);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (66, 99822, 1, 87);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (39, 98803, 3, 88);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (7, 51954, 2, 88);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (54, 90042, 2, 88);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (89, 62090, 2, 89);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (5, 30620, 2, 89);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (6, 74808, 2, 89);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (97, 21838, 3, 90);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (3, 53190, 5, 90);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (64, 31728, 5, 91);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (36, 93555, 3, 91);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (96, 17940, 5, 92);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 81418, 3, 92);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (5, 11309, 1, 93);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (2, 29545, 3, 93);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (93, 72746, 5, 93);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (19, 95579, 3, 94);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (14, 55304, 4, 94);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (67, 32149, 2, 94);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (57, 89735, 1, 95);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (33, 89908, 4, 95);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (10, 79578, 4, 95);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (67, 15990, 3, 96);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (28, 46102, 3, 96);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (5, 71207, 4, 96);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (100, 11323, 5, 97);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (0, 48925, 2, 97);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (15, 85442, 2, 98);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (12, 99582, 3, 98);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (73, 69090, 5, 98);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (45, 90076, 4, 99);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (34, 62405, 2, 99);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (21, 26300, 5, 99);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (21, 98568, 3, 100);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (13, 91913, 2, 100);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (66, 72763, 2, 100);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (77, 37060, 4, 101);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (23, 33205, 4, 101);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (84, 28975, 5, 102);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (16, 38004, 2, 102);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 12644, 1, 103);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 92587, 1, 103);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (98, 42142, 4, 103);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (28, 38352, 2, 104);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (26, 74166, 2, 104);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (46, 97402, 5, 104);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (22, 20170, 4, 105);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (7, 86190, 4, 105);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (71, 56047, 1, 105);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (13, 36777, 3, 106);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (4, 37510, 5, 106);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (83, 18635, 5, 106);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (70, 58560, 5, 107);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (30, 65714, 1, 107);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (22, 40977, 2, 108);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (1, 29941, 4, 108);
INSERT INTO medio_pagos_membresias (monto, numero_transaccion, medio_pago_id, membresia_id) VALUES (77, 86358, 1, 108);

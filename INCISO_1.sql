--TABLA 1
CREATE TABLE PROFESION
(
    cod_prof INTEGER NOT NULL CONSTRAINT pk_PROFESION PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL CONSTRAINT unq_PROFESION_nombre UNIQUE
);

--TABLA 2-
CREATE TABLE PAIS
(
    cod_pais INTEGER NOT NULL CONSTRAINT pk_PAIS PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL CONSTRAINT unq_PAIS_nombre UNIQUE
);

--TABLA 3-
CREATE TABLE PUESTO
(
    cod_puesto INTEGER NOT NULL CONSTRAINT pk_PUESTO PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL CONSTRAINT unq_PUESTO_nombre UNIQUE
);

--TABLA 4-
CREATE TABLE DEPARTAMENTO
(
    cod_depto INTEGER NOT NULL CONSTRAINT pk_DEPARTAMENTO PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL CONSTRAINT unq_DEPARTAMENTO_nombre UNIQUE
);

--TABLA 5-
CREATE TABLE MIEMBRO
(
    cod_miembro INTEGER NOT NULL CONSTRAINT pk_MIEMBRO PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    edad INTEGER NOT NULL,
    telefono INTEGER NULL,
    residencia VARCHAR(100) NULL,
    PAIS_cod_pais INTEGER NOT NULL,
    PROFESION_cod_prof INTEGER NOT NULL,
    
    CONSTRAINT fk_PAIS_cod_pais FOREIGN KEY (PAIS_cod_pais) REFERENCES PAIS (cod_pais)
    ON DELETE CASCADE,
    CONSTRAINT fk_PROFESION_cod_prof FOREIGN KEY (PROFESION_cod_prof) REFERENCES PROFESION (cod_prof)
    ON DELETE CASCADE
);

--TABLA 6-
CREATE TABLE PUESTO_MIEMBRO
(
    MIEMBRO_cod_miembro INTEGER NOT NULL,
    PUESTO_cod_puesto INTEGER NOT NULL,
    DEPARTAMENTO_cod_depto INTEGER NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    
    CONSTRAINT pk_PUESTO_MIEMBRO PRIMARY KEY (MIEMBRO_cod_miembro,PUESTO_cod_puesto,DEPARTAMENTO_cod_depto),

    CONSTRAINT fk_MIEMBRO_cod_miembro FOREIGN KEY (MIEMBRO_cod_miembro) REFERENCES MIEMBRO (cod_miembro)
    ON DELETE CASCADE,
    CONSTRAINT fk_PUESTO_cod_puesto FOREIGN KEY (PUESTO_cod_puesto) REFERENCES PUESTO (cod_puesto)
    ON DELETE CASCADE,
    CONSTRAINT fk_DEPARTAMENTO_cod_depto FOREIGN KEY (DEPARTAMENTO_cod_depto) REFERENCES DEPARTAMENTO (cod_depto)
    ON DELETE CASCADE
);

--TABLA 7-
CREATE TABLE TIPO_MEDALLA
(
    cod_tipo INTEGER NOT NULL CONSTRAINT pk_TIPO_MEDALLA PRIMARY KEY,
    medalla VARCHAR(20) NOT NULL CONSTRAINT unq_TIPO_MEDALLA_medalla UNIQUE
);

--TABLA 8-
CREATE TABLE MEDALLERO
(
    PAIS_cod_pais INTEGER NOT NULL,
    cantidad_medallas INTEGER NOT NULL,
    TIPO_MEDALLA_cod_tipo INTEGER NOT NULL,
    
    CONSTRAINT pk_MEDALLERO PRIMARY KEY (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo),

    CONSTRAINT fk_PAIS_cod_pais FOREIGN KEY (PAIS_cod_pais) REFERENCES PAIS (cod_pais)
    ON DELETE CASCADE,
    CONSTRAINT fk_TIPO_MEDALLA_cod_tipo FOREIGN KEY (TIPO_MEDALLA_cod_tipo) REFERENCES TIPO_MEDALLA (cod_tipo)
    ON DELETE CASCADE
);

--TABLA 9-
CREATE TABLE DISCIPLINA
(
    cod_disciplina INTEGER NOT NULL CONSTRAINT pk_DISCIPLINA PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NULL
);

--TABLA 10-
CREATE TABLE ATLETA
(
    cod_atleta INTEGER NOT NULL CONSTRAINT pk_ATLETA PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INTEGER NOT NULL,
    participaciones VARCHAR(100) NOT NULL,
    DISCIPLINA_cod_disciplina INTEGER NOT NULL,
    PAIS_cod_pais INTEGER NOT NULL,
    
    CONSTRAINT fk_DISCIPLINA_cod_disciplina FOREIGN KEY (DISCIPLINA_cod_disciplina) REFERENCES DISCIPLINA (cod_disciplina)
    ON DELETE CASCADE,
    CONSTRAINT fk_PAIS_cod_pais FOREIGN KEY (PAIS_cod_pais) REFERENCES PAIS (cod_pais)
    ON DELETE CASCADE

);

--TABLA 11-
CREATE TABLE CATEGORIA
(
    cod_categoria INTEGER NOT NULL CONSTRAINT pk_CATEGORIA PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL
);

--TABLA 12-
CREATE TABLE TIPO_PARTICIPACION
(
    cod_participacion INTEGER NOT NULL CONSTRAINT pk_TIPO_PARTICIPACION PRIMARY KEY,
    tipo_participacion VARCHAR(100) NOT NULL
);

--TABLA 13-
CREATE TABLE EVENTO
(
    cod_evento INTEGER NOT NULL CONSTRAINT pk_EVENTO PRIMARY KEY,
    fecha DATE NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    hora DATE NOT NULL,
    DISCIPLINA_cod_disciplina INTEGER NOT NULL,
    TIPO_PARTICIPACION_cod_participacion INTEGER NOT NULL,
    CATEGORIA_cod_categoria INTEGER NOT NULL,

    CONSTRAINT fk_DISCIPLINA_cod_disciplina FOREIGN KEY (DISCIPLINA_cod_disciplina) REFERENCES DISCIPLINA (cod_disciplina)
    ON DELETE CASCADE,
    CONSTRAINT fk_TIPO_PARTICIPACION_cod_participacion FOREIGN KEY (TIPO_PARTICIPACION_cod_participacion) REFERENCES TIPO_PARTICIPACION (cod_participacion)
    ON DELETE CASCADE,
    CONSTRAINT fk_CATEGORIA_cod_categoria FOREIGN KEY (CATEGORIA_cod_categoria) REFERENCES CATEGORIA (cod_categoria)
    ON DELETE CASCADE
);

--TABLA 14-
CREATE TABLE EVENTO_ATLETA
(
    ATLETA_cod_atleta INTEGER NOT NULL,
    EVENTO_cod_evento INTEGER NOT NULL,
    
    CONSTRAINT pk_EVENTO_ATLETA PRIMARY KEY (ATLETA_cod_atleta,EVENTO_cod_evento),

    CONSTRAINT fk_ATLETA_cod_atleta FOREIGN KEY (ATLETA_cod_atleta) REFERENCES ATLETA (cod_atleta)
    ON DELETE CASCADE,
    CONSTRAINT fk_EVENTO_cod_evento FOREIGN KEY (EVENTO_cod_evento) REFERENCES EVENTO (cod_evento)
    ON DELETE CASCADE
);

--TABLA 15-
CREATE TABLE TELEVISORA
(
    cod_televisora INTEGER NOT NULL CONSTRAINT pk_TELEVISORA PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

--TABLA 16-
CREATE TABLE COSTO_EVENTO
(
    EVENTO_cod_evento INTEGER NOT NULL,
    TELEVISORA_cod_televisora INTEGER NOT NULL,
    Tarifa INTEGER NOT NULL,
    
    CONSTRAINT pk_COSTO_EVENTO PRIMARY KEY (EVENTO_cod_evento,TELEVISORA_cod_televisora),
    
    CONSTRAINT fk_EVENTO_cod_evento FOREIGN KEY (EVENTO_cod_evento) REFERENCES EVENTO (cod_evento)
    ON DELETE CASCADE,
    CONSTRAINT fk_TELEVISORA_cod_televisora FOREIGN KEY (TELEVISORA_cod_televisora) REFERENCES TELEVISORA (cod_televisora)
    ON DELETE CASCADE
);




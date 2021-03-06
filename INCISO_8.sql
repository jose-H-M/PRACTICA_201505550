--ATLETAS PUEDEN REGISTRARSE EN VARIAS DISCIPLINAS (MASTER DETALLE)
---A) ELIMINAR LLAVE FORAEA DE cod_disciplina de ATLETA
ALTER TABLE ATLETA 
DROP CONSTRAINT fk_DISCIPLINA_cod_disciplina;

---B) CRAR TABLA 18 CON EL NOMBRE DISCIPLINA_ATLETA
CREATE TABLE DISCIPLINA_ATLETA
(
    cod_atleta INTEGER NOT NULL,
    cod_disciplina INTEGER NOT NULL,

    CONSTRAINT pk_DISCIPLINA_ATLETA PRIMARY KEY (cod_atleta,cod_disciplina),

    CONSTRAINT fk_DISCIPLINA_ATLETA_cod_atleta FOREIGN KEY (cod_atleta) REFERENCES ATLETA (cod_atleta),
    CONSTRAINT fk_DISCIPLINA_ATLETA_cod_disciplina FOREIGN KEY (cod_disciplina) REFERENCES DISCIPLINA (cod_disciplina)
);





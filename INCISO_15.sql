--CREAR CONSTREINT CON RESTRICCIÒN PARA RANGO DE FECHA


ALTER TABLE ATLETA 
ADD CONSTRAINT ck_ATLETA_edad 
CHECK (edad<25);


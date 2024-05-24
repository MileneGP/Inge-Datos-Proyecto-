CREATE TABLE cliente (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    numero_doc INTEGER NOT NULL,
    direccion INTEGER NOT NULL,
    distrito_id INTEGER,
    tipo_documento_id INTEGER,
    
    FOREIGN KEY(distrito_id) REFERENCES distrito(id) ON DELETE CASCADE,
    FOREIGN KEY(tipo_documento_id) REFERENCES tipo_documento(id) ON DELETE CASCADE
)

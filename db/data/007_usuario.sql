CREATE TABLE usuario (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    contrasena VARCHAR(20) NOT NULL ,
    
    cliente_id INTEGER,
    
    FOREIGN KEY(cliente_id) REFERENCES cliente(id) ON DELETE CASCADE
)

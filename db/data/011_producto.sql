CREATE TABLE producto (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    imagen_portada VARCHAR(70) NOT NULL ,
    
    sub_categoria_id INTEGER,


    FOREIGN KEY(sub_categoria_id) REFERENCES sub_categoria(id) ON DELETE CASCADE
)

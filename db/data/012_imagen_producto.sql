CREATE TABLE imagen_producto (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    imagen_url VARCHAR(35) NOT NULL ,
    producto_id INTEGER,

    FOREIGN KEY(producto_id) REFERENCES producto(id) ON DELETE CASCADE
)

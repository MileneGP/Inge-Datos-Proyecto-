CREATE TABLE producto_bolsa_compra (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    producto_id INTEGER,
    FOREIGN KEY(producto_id) REFERENCES producto(id) ON DELETE CASCADE,
    bolsa_compra_id INTEGER,
    FOREIGN KEY(bolsa_compra_id) REFERENCES bolsa_compra(id) ON DELETE CASCADE
)   

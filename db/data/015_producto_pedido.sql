CREATE TABLE producto_pedido (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    producto_id INTEGER,
    FOREIGN KEY(producto_id) REFERENCES producto(id) ON DELETE CASCADE,
    pedido_id INTEGER,
    FOREIGN KEY(pedido_id) REFERENCES pedido(id) ON DELETE CASCADE
)   

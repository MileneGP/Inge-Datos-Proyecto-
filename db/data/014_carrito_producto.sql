CREATE TABLE carrito_producto (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    producto_id INTEGER,
    FOREIGN KEY(producto_id) REFERENCES producto(id) ON DELETE CASCADE,
    carrito_id INTEGER,
    FOREIGN KEY(carrito_id) REFERENCES carrito(id) ON DELETE CASCADE
)   

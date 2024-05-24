CREATE TABLE bolsa_compra (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    empaquetado VARCHAR(20) NOT NULL ,
    pedido_id INTEGER,
    FOREIGN KEY(pedido_id) REFERENCES pedido(id) ON DELETE CASCADE
    
)

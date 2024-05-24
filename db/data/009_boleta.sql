CREATE TABLE boleta (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    num_boleta INTEGER,
    imagen VARCHAR(70) NOT NULL ,
    direccion VARCHAR(75) NOT NULL ,
    celular INTEGER,
    igv INTEGER,
    importe_total INTEGER,
    observacion VARCHAR(150) NOT NULL ,
    fecha_emision DATE,
    cliente_id INTEGER,
    moneda_id INTEGER,
    pedido_id INTEGER,

    FOREIGN KEY(cliente_id) REFERENCES cliente(id) ON DELETE CASCADE
    FOREIGN KEY(moneda_id) REFERENCES moneda(id) ON DELETE CASCADE
    FOREIGN KEY(pedido_id) REFERENCES pedido(id) ON DELETE CASCADE
)

CREATE TABLE pedido (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    fecha_llegada date ,
    direccion INTEGER,
    distrito_id INTEGER,
    
    FOREIGN KEY(distrito_id) REFERENCES distrito(id) ON DELETE CASCADE
)

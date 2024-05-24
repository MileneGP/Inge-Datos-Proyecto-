CREATE TABLE sub_categoria (

    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(25) NOT NULL ,
    categoria_id INTEGER,

    FOREIGN KEY(categoria_id) REFERENCES categoria(id) ON DELETE CASCADE
)

// importaciones
const path = require("path");
const express = require("express");
const bodyParser = require("body-parser");
const db = require("./configs/database");
// configurar servidor
const app = express(); 
app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));
// importar y montar rutas
const rutacategoria = require("./routes/categoria");
const rutadistrito = require("./routes/distrito");
const rutamoneda = require("./routes/moneda");
const rutasubcategoria = require("./routes/subcategoria");
const rutasproducto = require("./routes/producto");
const rutasboleta = require("./routes/boleta");
//const rutasclientes = require("./routes/cliente");

app.use("/", rutacategoria); 
app.use("/", rutadistrito);
app.use("/", rutamoneda);
app.use("/", rutasubcategoria);
app.use("/", rutasproducto);
app.use("/", rutasboleta);

//endpoints
app.get("/", (req, res) => {
  var locals = {
    title: "Bienvenidos a Panadería Samoa", 
    imagen: "/img/logo.jpg",
      contenido: "¡Descubre nuestra deliciosa selección de panes artesanales!",
      productos: [
        {
          nombre: "Baguette",
          imagen: "/img/baguette.jpg",
          descripcion: "El pan preferido para compartir en familia.",
          precio: "$2.99"
        },
        {
          nombre: "Pan de centeno",
          imagen: "/img/pan_de_centeno.jpg",
          descripcion: "El pan perfecto para los amantes del sabor intenso del centeno.",
          precio: "$3.49"
        },
        {
          nombre: "Pan de masa madre",
          imagen: "/img/pan_de_masa_madre.jpg",
          descripcion: "Nuestro clásico pan de masa madre, horneado a la perfección.",
          precio: "$4.99"
        }
      ]
    };
  res.render("home", locals);
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor Express escuchando en el puerto ${PORT}`);
});

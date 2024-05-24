const express = require("express");
const db = require("../configs/database");
const router = express.Router();

router.get("/producto", async (req, res) => {
  // recepcionar parámetros
  const mensaje = req.query.mensaje;
  // recepción de datos
  const subcategoria_id = req.query.id;
  // conexión a db
  /*
  const query = "SELECT * FROM producto WHERE id=:id;";
  const replacements = {
    id: id,
  };
  */
  const query = "SELECT * FROM producto WHERE (sub_categoria_id) = :id;";
  const replacements = {
    id: subcategoria_id,
  };
  const product = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  console.log(product);
  // renderizar vista
  var locals = {
    title: "Lista de Categoria",
    products: product,
    mensaje: mensaje,
  };
  res.render("producto/index", locals);
});




//_--------------agregar-----------
router.get("/producto/agregar", async (req, res) => {
  // renderizar vista
  var locals = {
    title: "Producto - Agregar",
  };
  res.render("producto/agregar", locals);
});

router.post("/producto/crear", async (req, res) => {
  // recepción de datos
  const nombre = req.body.nombre;
  const imagen_portada = req.body.imagen_portada;
  const query =
    "INSERT INTO producto (nombre, imagen_url, video_url, cuerpo_parte_id) VALUES (:nombre, :imagen_url, :video_url, :cuerpo_parte_id);";
  const replacements = {
    nombre: nombre,
    imagen_url: imagen_url,
    video_url: video_url,
    cuerpo_parte_id: cuerpo_parte_id,
  };
  console.log(req.body);
  const rpta = await db.query(query, {
    replacements,
    type: db.QueryTypes.INSERT,
  });
  // redireccionar listado
  res.redirect(`/boleta?mensaje=Registro agregado con el id ${rpta[0]}`);
});


//-----------------eliminar--------------
router.get("/producto/eliminar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "DELETE FROM producto WHERE id=:id;";
  const replacements = {
    id: id,
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.DELETE,
  });
  // redireccionar listado
  res.redirect("/categoria?mensaje=Registro eliminado");
});





//-----------------modificar--------------
router.get("/producto/modificar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "SELECT * FROM producto WHERE id=:id;";
  const replacements = {
    id: id
  };
  const rs = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  // renderizar vista
  var locals = {
    title: "Producto - Modificar",
    producto: rs[0],
  };
  res.render("producto/modificar", locals);
});

router.post("/producto/editar", async (req, res) => {
  // recepción de datos
  const id = req.body.id;
  const nombre = req.body.nombre;
  const imagen_portada = req.body.imagen_portada;
  // conexión a db
  const query = "UPDATE producto SET nombre = :nombre, imagen_portada = :imagen_portada WHERE id = :id;";
  const replacements = {
    id: id,
    nombre: nombre,
    imagen_portada: imagen_portada
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.UPDATE,
  });
  // redireccionar listado
  res.redirect(`/categoria?mensaje=Producto modificado`);
  });


module.exports = router;

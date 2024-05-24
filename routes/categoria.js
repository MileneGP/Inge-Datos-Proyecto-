const express = require("express");
const db = require("../configs/database");
const router = express.Router();

router.get("/categoria", async (req, res) => {
  // recepcionar parámetros
  const mensaje = req.query.mensaje;
  // conexión a db
  const query = "SELECT * FROM categoria";
  const replacements = {};
  const category = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  console.log(category);
  // renderizar vista
  var locals = {
    title: "Lista de Categoria",
    category: category,
    mensaje: mensaje,
  };
  res.render("categoria/index", locals);
});

router.get("/categoria/modificar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "SELECT * FROM categoria WHERE id=:id;";
  const replacements = {
    id: id,
  };
  const rs = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  // renderizar vista
  var locals = {
    title: "Categoria - Modificar",
    categoria: rs[0],
  };
  res.render("categoria/modificar", locals);
});

router.post("/categoria/editar", async (req, res) => {
  // recepción de datos
  const id = req.body.id;
  const nombre = req.body.nombre;
  // conexión a db
  const query = "UPDATE categoria SET nombre = :nombre WHERE id = :id;";
  const replacements = {
    id: id,
    nombre: nombre,
    //imagen_url: imagen_url
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.UPDATE,
  });
  // redireccionar listado
  res.redirect(`/categoria?mensaje=Registro modificado con el id ${id}`);
});

module.exports = router;

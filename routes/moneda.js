const express = require("express");
const db = require("../configs/database");
const router = express.Router();

router.get("/moneda", async (req, res) => {
  // recepcionar parámetros
  const mensaje = req.query.mensaje;
  // conexión a db
  const query = "SELECT * FROM moneda";
  const replacements = {};
  const money = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  console.log(money);
  // renderizar vista
  var locals = {
    title: "Lista de Monedas",
    money: money,
    mensaje: mensaje,
  };
  res.render("moneda/index", locals);
});



router.get("/moneda/agregar", async (req, res) => {
  // renderizar vista
  var locals = {
    title: "Moneda - Agregar",
  };
  res.render("moneda/agregar", locals);
});



router.post("/moneda/crear", async (req, res) => {
  // recepción de datos
  const id = req.body.id;
  const nombre = req.body.nombre;
  // conexión a db
  const query = "INSERT INTO moneda (nombre) VALUES (:nombre);";
  const replacements = {
    nombre: nombre,
  };
  
  console.log(req.body);
  const rpta = await db.query(query, {
    replacements,
    type: db.QueryTypes.INSERT,
  });
  // redireccionar listado
  res.redirect(`/moneda?mensaje=Registro agregado con el id ${rpta[0]}`);
});


router.get("/moneda/eliminar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "DELETE FROM moneda WHERE id=:id;";
  const replacements = {
    id: id,
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.DELETE,
  });
  // redireccionar listado
  res.redirect("/moneda?mensaje=Registro eliminado");
});

router.get("/moneda/modificar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "SELECT * FROM moneda WHERE id=:id;";
  const replacements = {
    id: id,
  };
  const rs = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  // renderizar vista
  var locals = {
    title: "Moneda - Modificar",
    moneda: rs[0],
  };
  res.render("moneda/modificar", locals);
});

router.post("/moneda/editar", async (req, res) => {
  // recepción de datos
  const id = req.body.id;
  const nombre = req.body.nombre;
  // conexión a db
  const query = "UPDATE moneda SET nombre = :nombre WHERE id = :id;";
  const replacements = {
    id: id,
    nombre: nombre,
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.UPDATE,
  });
  // redireccionar listado
  res.redirect(`/moneda?mensaje=Registro modificado con el id ${id}`);
});

module.exports = router;

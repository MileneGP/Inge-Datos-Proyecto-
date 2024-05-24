const express = require("express");
const db = require("../configs/database");
const router = express.Router();

router.get("/distrito", async (req, res) => {
  // recepcionar parámetros
  const mensaje = req.query.mensaje;
  // conexión a db
  const query = "SELECT * FROM distrito";
  const replacements = {};
  const district = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  console.log(district);
  // renderizar vista
  var locals = {
    title: "Lista de distrito",
    district: district,
    mensaje: mensaje,
  };
  res.render("distrito/index", locals);
});



router.get("/distrito/agregar", async (req, res) => {
  // renderizar vista
  var locals = {
    title: "distrito - Agregar",
    
  };
  res.render("distrito/agregar", locals);
});



router.post("/distrito/crear", async (req, res) => {
  // recepción de datos
  const id = req.body.id;
  const nombre = req.body.nombre;
  // conexión a db
  const query = "INSERT INTO distrito (nombre) VALUES (:nombre);";
  const replacements = {
    nombre: nombre,
  };
  console.log(req.body);
  const rpta = await db.query(query, {
    replacements,
    type: db.QueryTypes.INSERT,
  });
  // redireccionar listado
  res.redirect(`/distrito?mensaje=Registro agregado con el id ${rpta[0]}`);
});

router.get("/distrito/eliminar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "DELETE FROM distrito WHERE id=:id;";
  const replacements = {
    id: id,
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.DELETE,
  });
  // redireccionar listado
  res.redirect("/distrito?mensaje=Registro eliminado");
});

router.get("/distrito/modificar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "SELECT * FROM distrito WHERE id=:id;";
  const replacements = {
    id: id,
  };
  const rs = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  // renderizar vista
  var locals = {
    title: "distrito - Modificar",
    distrito: rs[0],
  };
  res.render("distrito/modificar", locals);
});

router.post("/distrito/editar", async (req, res) => {
  // recepción de datos
  const id = req.body.id;
  const nombre = req.body.nombre;
  // conexión a db
  const query = "UPDATE distrito SET nombre = :nombre WHERE id = :id;";
  const replacements = {
    id: id,
    nombre: nombre,
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.UPDATE,
  });
  // redireccionar listado
  res.redirect(`/distrito?mensaje=Registro modificado con el id ${id}`);
});

module.exports = router;









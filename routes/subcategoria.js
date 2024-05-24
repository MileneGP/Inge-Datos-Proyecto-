const express = require("express");
const db = require("../configs/database");
const router = express.Router();

router.get("/subcategoria", async (req, res) => {
  // recepcionar parámetros
  const mensaje = req.query.mensaje;
  // recepción de datos
  const categoria_id = req.query.id;
  // conexión a db
  /*
  const query = "SELECT * FROM subcategoria WHERE id=:id;";
  const replacements = {
    id: id,
  };
  */
  const query = "SELECT * FROM sub_categoria WHERE (categoria_id) = :id;";
  const replacements = {
    id: categoria_id,
  };
  const subcategory = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  console.log(subcategory);
  // renderizar vista
  var locals = {
    title: "Lista de Subcategoria",
    subcategories: subcategory,
    mensaje: mensaje,
  };
  res.render("subcategoria/index", locals);
});


router.get("/subcategoria/agregar", async (req, res) => {
  // renderizar vista
  var locals = {
    title: "Subcategoria - Agregar",
  };
  res.render("subcategoria/agregar", locals);
});

router.post("/subcategoria/crear", async (req, res) => {
  // recepción de datos
  console.log(req.body);
  const rpta = await db.query(query, {
    replacements,
    type: db.QueryTypes.INSERT,
  });
  // redireccionar listado
  res.redirect(`/subcategoria?categoria_id=<%= categoria_id %mensaje=Registro agregado con el id ${rpta[0]}`);
});


router.get("/subcategoria/eliminar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "DELETE FROM sub_categoria WHERE id=:id;";
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







router.get("/subcategoria/modificar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  //const categoria_id = req.query.categoria_id;
  // conexión a db
  const query = "SELECT * FROM sub_categoria WHERE id=:id;";
  const replacements = {
    id: id,
  };
  const rs = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  // renderizar vista
  var locals = {
    title: "Subcategoria - Modificar",
    subcategoria: rs[0],
    //categoria_id:categoria_id,
  };
  res.render("subcategoria/modificar", locals);
});


router.post("/subcategoria/editar", async (req, res) => {
  // recepción de datos
  //const categoria_id = req.body.categoria_id;
  const id = req.body.id;
  const nombre = req.body.nombre;
  // conexión a db
  const query = "UPDATE sub_categoria SET nombre = :nombre WHERE id = :id;";
  const replacements = {
    id: id,
    nombre: nombre,
    //categoria_id:categoria_id
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.UPDATE,
  });
  // redireccionar listado

  //res.redirect(`/subcategoria?id=<%= id %mensaje=Registro modificado con el id ${id}`);
  
  res.redirect(`/categoria?mensaje=Registro modificado con el id ${id}`);
});
//subcategoria?id=<%= id %mensaje=R
module.exports = router;

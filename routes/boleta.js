const express = require("express");
const db = require("../configs/database");
const router = express.Router();


// listado boleta------------------------
router.get("/boleta", async (req, res) => {
  // recepcionar parámetros
  const mensaje = req.query.mensaje;
  // conexión a db
  const query = "SELECT * FROM boleta";
  const replacements = {};
  const receipt = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  console.log(receipt);
  // renderizar vista
  var locals = {
    title: "Lista de Boleta",
    receipt: receipt,
    mensaje: mensaje,
  };
  res.render("boleta/index", locals);
});


//Listado Asociativa boleta_producto----------------
router.get("/boleta/productos", async (req, res) => {
  // recepcionar parámetros
  const boleta_id = req.query.boleta_id;
  // conexión a db
  
  const query = `SELECT P.id, P.nombre, cantidad,P.imagen_portada FROM boleta_producto BP 
  INNER JOIN producto P ON BP.producto_id = P.id WHERE BP.boleta_id = :boleta_id;`;
  
  const replacements = {
    boleta_id: boleta_id,
    
  };
  const boletaproducto = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  var locals = {
    title: "Lista de Productos",
    boletaproducto: boletaproducto,
    mensaje: "",
    boleta_id: boleta_id,
   
  };
  res.render("boleta/detalle", locals);
});


//----AGREGAR REGISTRO BOLET

router.get("/boleta/agregar", async (req, res) => {
  // renderizar vista
  var locals = {
    title: "Boleta - Agregar",
  };
  res.render("boleta/agregar", locals);
});

router.post("/boleta/crear", async (req, res) => {
  // recepción de datos
  const num_boleta = req.body.num_boleta;
  const direccion = req.body.direccion;
  const celular = req.body.celular;
  const igv = req.body.igv;
  const importe_total = req.body.importe_total;
  const observacion = req.body.observacion;
  const fecha_emision = req.body.fecha_emision;
  console.log(req.body);


  // conexión a db
  const query =
    "INSERT INTO boleta(num_boleta, direccion,celular,igv,importe_total,observacion,fecha_emision) VALUES(:num_boleta,:direccion,:celular,:igv,:importe_total,:observacion,:fecha_emision);";
  const replacements = {
    num_boleta:num_boleta,
    direccion: direccion,
    celular: celular,
    igv:igv,
    importe_total:importe_total,
    observacion:observacion,
    fecha_emision:fecha_emision,
  };
  
  const rpta = await db.query(query, {
    replacements,
    type: db.QueryTypes.INSERT,
  });
  // redireccionar listado
  res.redirect(`/boleta?mensaje=Registro agregado con el id ${rpta[0]}`);
});








//---------------------detalle agregar-----
router.get("/boleta/detalle_agregar", async (req, res) => {
  const boleta_id = req.query.boleta_id;
  const query = "SELECT * FROM producto";
  const replacements = {};
  
  const Producto = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  // renderizar vista
  var locals = {
    title: "producto a Boleta - Agregar",
    producto: Producto,
    boleta_id: boleta_id,
  };
  res.render("boleta/detalle_agregar", locals);
});

router.post("/detalle/crear", async (req, res) => {
  // recepción de datos
  const cantidad = req.body.cantidad;
  const boleta_id = req.body.boleta_id;
  const producto_id = req.body.producto_id;
  console.log(req.body);

  // conexión a db
  const query =
    "INSERT INTO boleta_producto(cantidad, boleta_id,producto_id) VALUES(:cantidad,:boleta_id,:producto_id);";
  const replacements = {
    cantidad:cantidad,
    boleta_id: boleta_id,
    producto_id: producto_id,
  };
  const rpta = await db.query(query, {
    replacements,
    type: db.QueryTypes.INSERT,
  });

  // redireccionar listado
  res.redirect(`/boleta?mensaje=Registro agregado con el id ${rpta[0]}`);
});

router.get("/boleta/eliminar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "DELETE FROM boleta WHERE id=:id;";
  const replacements = {
    id: id,
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.DELETE,
  });
  // redireccionar listado
  res.redirect("/boleta?mensaje=Registro eliminado");
});


//-----------------detalle eliminar
router.get("/boleta/detalle_eliminar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "DELETE FROM boleta_producto WHERE producto_id=:id;";
  const replacements = {
    id: id,
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.DELETE,
  });
  // redireccionar listado
  res.redirect("/boleta?mensaje=Registro eliminado");
});



//------------detalle modificar----------

router.get("/boleta/detalle_modificar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "SELECT * FROM boleta_producto WHERE producto_id=:id;";
  const replacements = {
    id: id,
  };
  const rs = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });
  // renderizar vista
  var locals = {
    title: "Cantidad - Modificar",
    boletadetalle: rs[0],
  };
  res.render("boleta/detalle_modificar", locals);
});

router.post("/detalle/editar", async (req, res) => {
  
  // recepción de datos
  const id = req.body.id;
  const cantidad = req.body.cantidad;
  // conexión a db
  const query = "UPDATE boleta_producto SET cantidad = :cantidad WHERE id=:id;";
  const replacements = {
    id: id,
    cantidad: cantidad,
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.UPDATE,
  });
  // redireccionar listado
  res.redirect(`/boleta?mensaje=Registro modificado con el id ${id}`);
});






















//----------------MODFICAR--------------
router.get("/boleta/modificar", async (req, res) => {
  // recepción de datos
  const id = req.query.id;
  // conexión a db
  const query = "SELECT * FROM boleta WHERE id=:id;";
  const replacements = {
    id: id,
  };
  const rs = await db.query(query, {
    replacements,
    type: db.QueryTypes.SELECT,
  });

  // renderizar vista
  var locals = {
    title: "Boleta - Modificar",
    boleta: rs[0],
  };
  res.render("boleta/modificar", locals);
});

router.post("/boleta/editar", async (req, res) => {
  // recepción de datos
  const id = req.body.id;
  const num_boleta = req.body.num_boleta;
  const direccion = req.body.direccion;
  const celular = req.body.celular;
  const observacion = req.body.observacion;
  console.log(req.body);

  // conexión a db
  const query = "UPDATE boleta SET num_boleta = :num_boleta, direccion=:direccion,celular=:celular,observacion=:observacion WHERE id = :id;";
  const replacements = {
    id:id,
    num_boleta: num_boleta,
    direccion: direccion,
    celular:celular,
    observacion:observacion,
    
  };
  await db.query(query, {
    replacements,
    type: db.QueryTypes.UPDATE,
  });
  // redireccionar listado
  res.redirect(`/boleta?mensaje=Registro modificado con el id ${id}`);
});

module.exports = router;

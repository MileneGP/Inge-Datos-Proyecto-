const { Sequelize } = require("sequelize");

const connection = new Sequelize({
  dialect: "sqlite",
  storage: "db/app.db",
});

module.exports = connection;
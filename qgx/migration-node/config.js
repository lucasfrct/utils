require('dotenv').config()
const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(`mysql://${process.env.USERDATABASE}:${process.env.PASSWORDDATABASE}@localhost:3306`);

module.exports = sequelize;

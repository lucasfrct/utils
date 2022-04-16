const sequelize = require('../config');

const GetTables = async(database = "")=>{
  const standard = []
  await sequelize.query(`USE ${database}`);

  const tables = await sequelize.query(`SHOW TABLES`);
  if(tables.length == 2) {
    
    const list = tables[0].filter((table)=> {
      const { Tables_in_qgx_baas: name } = table;
      return !standard.includes(name) ? name : false
    }).map((t)=> {
      const { Tables_in_qgx_baas: name } = t;
      return name
    })

    return list;
  }

  return []
}

module.exports = GetTables

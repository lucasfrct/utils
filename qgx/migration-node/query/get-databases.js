const sequelize = require('../config');

const GetDatabases = async()=>{
  const standard = ["information_schema", "performance_schema", "sys", "mysql"]
  const db = await sequelize.query("SHOW DATABASES");
  if(db.length == 2) {

    const list = db[0].filter((d)=> {
      const { Database: name } = d;
      return !standard.includes(name) ? name : false
    }).map((l)=> {
      const { Database: name } = l;
      return name
    })

    return list;
  }

  return []
}

module.exports = GetDatabases

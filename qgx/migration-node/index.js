const GetDatabases = require('./query/get-databases');
const GetTables = require('./query/get-tables');

async function main() {

  const databasees = await GetDatabases();
  const tables = await GetTables('qgx_baas');

  console.log("DEBUG: ", tables);

}

main();


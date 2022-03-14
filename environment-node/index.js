require('dotenv/config');
require('module-alias/register');

const express = require('express');

const pino = require('pino')
const pretty = require('pino-pretty')

const stream = pretty({colorize: true, level: 'debug'})
const logger = pino(stream)

const app = express();

app.get("/healthz", (req, res) => {
    res.send("OK");
});

app.listen(process.env.PORT,()=>{
  logger.info(`port: ${process.env.PORT}`);
  logger.info(`author: ${process.env.AUTHOR}`);
  logger.info(`hostname: ${process.env.HOSTNAME}`);
  logger.info(`NODE_ENV: ${process.env.NODE_ENV}`);
});
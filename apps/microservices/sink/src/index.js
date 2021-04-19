const express = require("express");
const pino = require("pino");
const expressPino = require("express-pino-logger");
const bodyParser = require("body-parser");
const app = express();
const port = 80;

const log = pino({ level: process.env.LOG_LEVEL || "info", redact: ["password", "newPassword", "req.headers.authorization"], censor: ["**secret**"] });

const expressLogger = expressPino({ logger: log });
app.use(expressLogger);
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.disable("x-powered-by");

app.get("/:param", (req, res) => {
  console.log("wibble");  
  log.info(`Received /${req.params.param} from source`);
  res.send(`param: ${req.params.param}`);
});

app.post("/:param", (req, res) => {
  log.info(`Received /${req.body.param} as posted from source`);
  res.sendStatus(200);
});

app.listen(port, () => {
  log.info(`Sink listening at http://localhost:${port}`);
});

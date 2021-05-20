"use strict";

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

app.get("", (req, res) => {
  res.send("<html><body><h1>Version 1</h1></body></html>");
});

app.listen(port, () => {
  log.info(`Source listening at http://localhost:${port}`);
});

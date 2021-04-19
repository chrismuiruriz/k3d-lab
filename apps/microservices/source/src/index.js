"use strict";

const express = require("express");
const pino = require("pino");
const expressPino = require("express-pino-logger");
const bodyParser = require("body-parser");
const fetch = require("node-fetch");
const app = express();
const port = 80;

const log = pino({ level: process.env.LOG_LEVEL || "info", redact: ["password", "newPassword", "req.headers.authorization"], censor: ["**secret**"] });

const expressLogger = expressPino({ logger: log });
app.use(expressLogger);
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.disable("x-powered-by");

app.get("/:param", (req, res) => {
  log.info(`Received /${req.params.param} from user`);
  res.send(JSON.stringify({ param: req.params.param }));
});

app.post("/:param", async (req, res) => {
  console.log(process.env.SINK_HOST);
  let url = `http://${process.env.SINK_HOST}`;
  log.info(url);
  await fetch(`http://${process.env.SINK_HOST}`, {
    method: "POST",
    body: {
      param: req.params.param
    }
  });

  res.send(JSON.stringify({ param: req.params.param }));
});

app.listen(port, () => {
  log.info(`Source listening at http://localhost:${port}`);
});

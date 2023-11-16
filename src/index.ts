import { PrismaClient } from "@prisma/client";
export const prisma = new PrismaClient();

import express from "express";
import {
  createMultipleLogEntries, createMultipleLogsOneByOne,
  createMultipleTgBot,
  deleteAllLogEntriesHandler, deleteAllTgBotHandler, getAllLogs, getAllTgBot,
  updateLogs
} from "./controller";
import * as process from "process";
import connectDB from "./connectMongoDB";

const app = express();
app.use(express.json());
const port = 3000;

try {
  void connectDB();
}
catch (e) {
  console.log(e);
  process.exit(1);
}

app.get("/logs", getAllLogs); //completed
app.get("/tgBot", getAllTgBot); //completed

app.post("/serverLogs/insertMany", createMultipleLogEntries); //completed
app.post("/serverLogs/oneByOne", createMultipleLogsOneByOne); //completed
app.post('/tgBot', createMultipleTgBot);

app.delete('/logs', deleteAllLogEntriesHandler);
app.delete('/tgBot', deleteAllTgBotHandler);

app.put('/logs', updateLogs);

prisma.$connect().then(() => {
  console.log('Connected to SQL Database');
  app.listen(port, () => {
    console.log(`Listening to port ${port}`);
  });
});
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
import express, { Request, Response } from "express";

const app = express();
app.use(express.json());
const port = 3000;

app.get("/", async (req: Request, res: Response) => {
  res.json({ message: "Congratulations, you're now connected to the api!" });
});

prisma.$connect().then(() => {
  console.log('Connected to SQL Database');
  app.listen(port, () => {
    console.log(`Listening to port ${port}`);
  });
});
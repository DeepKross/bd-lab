import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
import express, { Request, Response } from "express";
import { faker } from "@faker-js/faker";

const app = express();
app.use(express.json());
const port = 3000;

const users = Array.from({ length: 10 }).map(() => {
  return { name: faker.internet.userName(), email: faker.internet.email() };
});

app.get("/", async (req: Request, res: Response) => {
  res.json({ message: "Congratulations, you're now connected to the api!" });
});

app.listen(port, () => console.log(`Served on port ${port}`));

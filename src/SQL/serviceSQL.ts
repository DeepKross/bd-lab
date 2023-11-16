import {prisma} from "../index";

export async function countServerLogsSQL() {
    return prisma.serverLogs.count();
}

export async function countTgBotSQL() {
    return prisma.tGBot.count();
}

export async function getAllLogsServiceSQL() {
    return prisma.serverLogs.findMany({});
}

export async function getAllTgBotServiceSQL() {
    return prisma.tGBot.findMany({});
}

export async function createLogEntryWithCreateManySQL(array: any) {
    return prisma.serverLogs.createMany({
        data: array, // Ensure the array is passed as the value of the 'data' key
        skipDuplicates: true // Optional: skips the insertion of duplicate records
    });
}

export async function createLogEntryOneByOneSQL(log: string, source: string) {
    return prisma.serverLogs.create({
       data: {
              log: log,
              source: source,
              logLevel: 'log-level1',
              createdAt: new Date()
       }
    });
}

//create a function that creates 1000 log entries for Reviews table
export async function createTgBot(chatId: string, message: string, userId: number) {
    return prisma.tGBot.create({
        data: {
            chatId: chatId,
            message: message,
            userId: userId,
            command: 'command1',
            createdAt: new Date()
        }
    });
}

export async function deleteAllLogEntriesSQL() {
    return prisma.serverLogs.deleteMany({});
}

export async function deleteAllTgBotSQL() {
    return prisma.tGBot.deleteMany({});
}

export async function updateLogsService() {
    return prisma.serverLogs.updateMany({
        where: {
            logLevel: 'log-level1'
        },
        data: {
            logLevel: 'log-level2'
        }
    });
}
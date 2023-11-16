import {
    createTgBot,
    updateLogsService,
    createLogEntryOneByOneSQL,
    createLogEntryWithCreateManySQL,
    getAllLogsServiceSQL,
    getAllTgBotServiceSQL, deleteAllLogEntriesSQL, deleteAllTgBotSQL, countServerLogsSQL, countTgBotSQL
} from "./SQL/serviceSQL";
import {
    countLogsServiceNOSQL, countTgBotNOSQL,
    createLogEntryOneByOneNOSQL,
    createLogEntryWithInsertManyNOSQL, deleteAllLogEntriesNOSQL, deleteAllTgBotNOSQL,
    getAllLogsServiceNOSQL, getAllTgBotServiceNOSQL
} from "./NoSQL/serviceNoSQL";

export async function getAllLogs(req: any, res: any) {
    try {
        const {isSQL} = req.query;
        let count;
        isSQL === 'true' ? count = await countServerLogsSQL() : count = await countLogsServiceNOSQL();
        const startTime = performance.now(); // Запуск таймера

        isSQL === 'true' ? await getAllLogsServiceSQL() : await getAllLogsServiceNOSQL();

        const endTime = performance.now(); // Зупинка таймера
        console.log(`Отримання всіх ${count} запитів: ${endTime - startTime} мілісекунд`);

        res.status(200).json({
            status: 'Done',
            type: isSQL === 'true' ? 'SQL' : 'NoSQL',
            message: `${count} logs entries received`,
            time: `${endTime - startTime} мілісекунд`,
            table: 'ServerLogs'
        });

    } catch (e) {
        console.log(e);
        res.status(500).json({error: 'An error occurred'});
    }
}

export async function getAllTgBot(req: any, res: any) {
    try {
        const {isSQL} = req.query;
        let count;
        isSQL === 'true' ? count = await countTgBotSQL() : count = await countTgBotNOSQL();

        const startTime = performance.now(); // Запуск таймера

        isSQL === 'true' ? await getAllTgBotServiceSQL() : await getAllTgBotServiceNOSQL();

        const endTime = performance.now(); // Зупинка таймера
        console.log(`Отримання всіх ${count} запитів: ${endTime - startTime} мілісекунд`);

        res.status(200).json({
            status: 'Done',
            type: isSQL === 'true' ? 'SQL' : 'NoSQL',
            message: `${count} logs entries received`,
            time: `${endTime - startTime} мілісекунд`,
            table: 'TgBot'
        });

    } catch (e) {
        console.log(e);
        res.status(500).json({error: 'An error occurred'});
    }
}

export async function createMultipleLogEntries(req: any, res: any) {
    try {
        const {isSQL} = req.query;
        let array = [];
        for (let i = 0; i < 1000; i++) {
            array.push({
                logLevel: 'log-level1',
                log: `Log message ${i}`,
                source: `Source ${i}`,
                createdAt: new Date()
            });
        }
        const startTime = performance.now(); // Запуск таймера

        isSQL === 'true' ? await createLogEntryWithCreateManySQL(array) : await createLogEntryWithInsertManyNOSQL(array);

        const endTime = performance.now(); // Зупинка таймера
        console.log(`Виконання 1000 запитів зайняло ${endTime - startTime} мілісекунд`);

        res.status(201).json({
            status: 'Done',
            type: isSQL ? 'SQL' : 'NoSQL',
            message: '1000 log entries created with InsertMany',
            time: `${endTime - startTime} мілісекунд`,
            table: 'ServerLogs'
        });

    } catch (e) {
        console.log(e);
        res.status(500).json({error: 'An error occurred'});
    }
}

export async function createMultipleLogsOneByOne(req: any, res: any) {
    try {
        const {isSQL} = req.query;
        const startTime = performance.now(); // Запуск таймера

        for (let i = 0; i < 1000; i++) {
            isSQL === 'true' ? await createLogEntryOneByOneSQL(`Log message ${i}`, `Source ${i}`)
                : await createLogEntryOneByOneNOSQL(`Log message ${i}`, `Source ${i}`);
        }

        const endTime = performance.now(); // Зупинка таймера
        console.log(`Виконання 1000 запитів зайняло ${endTime - startTime} мілісекунд`);

        res.status(201).json({
            status: 'Done',
            message: '1000 log entries created',
            time: `${endTime - startTime} мілісекунд`,
            table: 'ServerLogs'
        });

    } catch (e) {
        console.log(e);
        res.status(500).json({error: 'An error occurred'});
    }
}

export async function createMultipleTgBot(req: any, res: any) {
    try {
        const startTime = performance.now(); // Запуск таймера

        for (let i = 0; i < 1000; i++) {
            await createTgBot(`chatId: ${i}`, `This is a very long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long message ${i}`, i);
        }

        const endTime = performance.now(); // Зупинка таймера
        console.log(`Виконання 1000 запитів з дуже великим string зайняло ${endTime - startTime} мілісекунд`);

        res.status(201).json({
            status: 'Done',
            message: '1000 log entries created with a long string',
            time: `${endTime - startTime} мілісекунд`,
            table: 'TgBot'
        });
    } catch (e) {
        console.log(e);
        res.status(500).json({error: 'An error occurred'});
    }
}

export async function deleteAllLogEntriesHandler(req: any, res: any) {
    try {
        const {isSQL} = req.query;
        let count;
        isSQL === 'true' ? count = await countServerLogsSQL() : count = await countLogsServiceNOSQL();
        const startTime = performance.now(); // Запуск таймера

        isSQL === 'true' ? await deleteAllLogEntriesSQL() : await deleteAllLogEntriesNOSQL();

        const endTime = performance.now(); // Зупинка таймера

        console.log(`Видалення всіх ${count} запитів зайняло ${endTime - startTime} мілісекунд`);
        res.status(200).json({
            status: 'Deleted',
            type: isSQL === 'true' ? 'SQL' : 'NoSQL',
            message: `${count} log entries deleted`,
            time: `${endTime - startTime} мілісекунд`,
            table: 'ServerLogs'
        });
    } catch (e) {
        console.log(e);
        res.status(500).json({error: 'An error occurred'});
    }
}

export async function deleteAllTgBotHandler(req: any, res: any) {
    try {
        const {isSQL} = req.query;
        let count;
        isSQL === 'true' ? count = await countTgBotSQL() : count = await countTgBotNOSQL();
        const startTime = performance.now(); // Запуск таймера

        isSQL === 'true' ? await deleteAllTgBotSQL() : await deleteAllTgBotNOSQL();

        const endTime = performance.now(); // Зупинка таймера

        console.log(`Видалення всіх ${count} запитів зайняло ${endTime - startTime} мілісекунд`);
        res.status(200).json({
            status: 'Done',
            type: isSQL === 'true' ? 'SQL' : 'NoSQL',
            message: `${count} log entries deleted`,
            time: `${endTime - startTime} мілісекунд`,
            table: 'TgBot'
        });
    } catch (e) {
        console.log(e);
        res.status(500).json({error: 'An error occurred'});
    }
}

export async function updateLogs(req: any, res: any) {
    try {
        const {isSQL} = req.query;
        let count;
        isSQL === 'true' ? count = await countServerLogsSQL() : count = await countLogsServiceNOSQL();
        const startTime = performance.now(); // Запуск таймера

        await updateLogsService();

        const endTime = performance.now(); // Зупинка таймера
        console.log(`Оновлення всіх запитів зайняло ${endTime - startTime} мілісекунд`);

        res.status(200).json({
            status: 'Done',
            type: isSQL === 'true' ? 'SQL' : 'NoSQL',
            message: `${count} log entries updated`,
            time: `${endTime - startTime} мілісекунд`,
            table: 'ServerLogs'
        });
    } catch (e) {
        console.log(e);
        res.status(500).json({error: 'An error occurred'});
    }
}


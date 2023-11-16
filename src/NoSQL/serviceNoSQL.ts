import {ServerLogs} from "../mongoose-schemas/ServerLogsSchema";
import {TGBot} from "../mongoose-schemas/TGBotSchema";

export async function countLogsServiceNOSQL() {
    return ServerLogs.countDocuments();
}

export async function countTgBotNOSQL() {
    return TGBot.countDocuments();
}

export async function getAllLogsServiceNOSQL() {
    return ServerLogs.find({});
}

// Get all TGBot entries
export async function getAllTgBotServiceNOSQL() {
    return TGBot.find({});
}

// Create a new log entry
export async function createLogEntryWithInsertManyNOSQL(array: any) {
    return ServerLogs.insertMany(array);
}

export async function createLogEntryOneByOneNOSQL(log: string, source: string) {
    return ServerLogs.create({
        log: log,
        source: source,
        logLevel: 'log-level1',
        createdAt: new Date()
    });
}

// // Create 1000 Reviews log entries
// export async function createMultipleReviewsNOSQL() {
//     const reviewsData = [];
//
//     for (let i = 0; i < 1000; i++) {
//         reviewsData.push({
//             reviewersName: `Reviewer ${i}`,
//             restaurantId: /* Some valid ObjectId */,
//             rating: 5,
//             reviewText: `Review text ${i}`,
//             reviewDate: new Date(),
//             createdAt: new Date()
//         });
//     }
//
//     return Reviews.insertMany(reviewsData);
// }
//
// // Create a new TGBot entry
// export async function createTgBotNOSQL(chatId, message, userId) {
//     return TGBot.create({
//         chatId: chatId,
//         message: message,
//         userId: userId,
//         command: 'command1',
//         createdAt: new Date()
//     });
// }
//
// Delete all log entries
export async function deleteAllLogEntriesNOSQL() {
    return ServerLogs.deleteMany({});
}

// Delete all TGBot entries
export async function deleteAllTgBotNOSQL() {
    return TGBot.deleteMany({});
}

// Update all log entries
export async function updateLogsServiceNOSQL() {
    return ServerLogs.updateMany({ logLevel: 'log-level1' }, { logLevel: 'log-level2' });
}

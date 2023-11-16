import mongoose from 'mongoose';

const serverLogsSchema = new mongoose.Schema({
    log: {
        type: String,
        required: true,
        maxlength: 255
    },
    source: {
        type: String,
        required: true,
        maxlength: 255
    },
    logLevel: {
        type: String,
        required: true,
        maxlength: 20
    },
    createdAt: {
        type: Date,
        default: Date.now
    }
});

export const ServerLogs = mongoose.model('ServerLogs', serverLogsSchema);

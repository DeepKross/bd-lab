import mongoose from "mongoose";

const tgBotSchema = new mongoose.Schema({
    chatId: {
        type: String,
        required: true,
        maxlength: 255
    },
    userId: {
        type: Number,
        required: true
    },
    message: {
        type: String,
        required: true,
        maxlength: 500
    },
    command: {
        type: String,
        required: true,
        maxlength: 255
    },
    createdAt: {
        type: Date,
        default: Date.now
    }
});

export const TGBot = mongoose.model('TGBot', tgBotSchema);

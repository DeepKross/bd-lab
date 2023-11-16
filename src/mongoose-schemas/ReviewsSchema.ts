import mongoose from 'mongoose';

const reviewsSchema = new mongoose.Schema({
    reviewersName: {
        type: String,
        required: true,
        maxlength: 32
    },
    restaurantId: {
        type: Number, // Assuming restaurantId refers to an ObjectId of a restaurant document
        required: true,
    },
    rating: {
        type: Number,
        required: true
    },
    reviewText: String,
    reviewDate: {
        type: Date,
        required: true
    },
    createdAt: {
        type: Date,
        default: Date.now
    }
});

const Reviews = mongoose.model('Reviews', reviewsSchema);

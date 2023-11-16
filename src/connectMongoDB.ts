import mongoose from 'mongoose';
const uri = process.env.MONGO_URI;

const connectDB = async () => {
    try {
        await mongoose.connect(uri as string);
        console.log('MongoDB connection established successfully');
    } catch (err) {
        console.error('Error in DB connection: ' + err);
        process.exit(1); // Exit the process with failure
    }
};

export default connectDB;
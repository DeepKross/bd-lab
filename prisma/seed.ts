import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

// Sample data for seeding
const restaurantTypes = [
  { name: 'Fast Food' },
  { name: 'Fine Dining' },
  // ... Add more types as needed
];

const restaurants = [
  {
    name: 'McDonalds',
    description: 'Fast food restaurant',
    picture: 'mcdonalds.jpg',
    address: '123 Fast Food St.',
    phone: '123-456-7890',
    typeId: 1, // Referring to 'Fast Food'
  },
  {
    name: 'Fancy Place',
    description: 'Elegant dishes and fine dining',
    picture: 'fancyplace.jpg',
    address: '456 Elegant St.',
    phone: '987-654-3210',
    typeId: 2, // Referring to 'Fine Dining'
  },
  // ... Add more restaurants as needed
];

// ... Add more sample data for other models

const seedDatabase = async () => {
  try {
    for (const type of restaurantTypes) {
      await prisma.restaurantTypes.create({
        data: type,
      });
    }

    for (const restaurant of restaurants) {
      await prisma.restaurants.create({
        data: {
          ...restaurant,
          typeId: restaurant.typeId, // Connecting to RestaurantTypes
        },
      });
    }

    // ... Continue seeding for other models like Dishes, Orders, Personnel, etc.

  } catch (e) {
    console.error(e);
    process.exit(1);
  } finally {
    await prisma.$disconnect();
  }
};

void seedDatabase();

-- CreateTable
CREATE TABLE `Restaurants` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(191) NULL,
    `picture` VARCHAR(14) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(20) NULL,
    `typeId` INTEGER NOT NULL,
    `personnelId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tables` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(20) NOT NULL,
    `seats` INTEGER NULL,
    `restaurantId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reservations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `restaurantId` INTEGER NOT NULL,
    `customerName` VARCHAR(32) NOT NULL,
    `tableId` INTEGER NOT NULL,
    `reservationDate` DATETIME(3) NOT NULL,
    `partySize` INTEGER NOT NULL,
    `specialRequests` VARCHAR(191) NULL,
    `status` VARCHAR(20) NOT NULL,
    `personnelWhoUpdated` INTEGER NULL,
    `updatedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reviews` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `reviewersName` VARCHAR(32) NOT NULL,
    `restaurantId` INTEGER NOT NULL,
    `rating` INTEGER NOT NULL,
    `reviewText` VARCHAR(191) NULL,
    `reviewDate` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Orders` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(20) NOT NULL,
    `tableId` INTEGER NOT NULL,
    `personnelWhoUpdated` INTEGER NULL,
    `updatedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderItems` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dishId` INTEGER NOT NULL,
    `orderId` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL DEFAULT 1,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Transactions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `paymantAmount` INTEGER NOT NULL,
    `paymentDate` DATETIME(3) NOT NULL,
    `orderId` INTEGER NOT NULL,
    `type` VARCHAR(20) NOT NULL,
    `updatedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Dishes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `restaurantId` INTEGER NULL,
    `picture` VARCHAR(14) NOT NULL,
    `typeId` INTEGER NOT NULL,
    `spicy` BOOLEAN NOT NULL DEFAULT false,
    `vegetarian` BOOLEAN NOT NULL DEFAULT false,
    `pescatarian` BOOLEAN NOT NULL DEFAULT false,
    `portionWeight` INTEGER NOT NULL,
    `price` DOUBLE NOT NULL,
    `status` VARCHAR(20) NOT NULL,
    `adminIdWhoUpdated` INTEGER NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Dishes_Ingredients` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dishId` INTEGER NOT NULL,
    `ingredientId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ingredients` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `allergyId` INTEGER NULL,
    `type` VARCHAR(100) NOT NULL,
    `description` VARCHAR(191) NULL,
    `source` VARCHAR(100) NOT NULL,
    `isOrganic` BOOLEAN NOT NULL DEFAULT false,
    `isGlutenFree` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Allergy` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(191) NULL,
    `severity` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Personnel` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(23) NOT NULL,
    `password` VARCHAR(30) NOT NULL,
    `role` VARCHAR(20) NOT NULL,
    `gender` VARCHAR(20) NULL,
    `phone` VARCHAR(20) NULL,
    `email` VARCHAR(50) NULL,
    `address` VARCHAR(255) NULL,
    `picture` VARCHAR(13) NOT NULL,
    `adminWhoUpdated` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `restaurantId` INTEGER NULL,
    `restaurantsId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tokens` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `expire` VARCHAR(55) NOT NULL,
    `refreshToken` VARCHAR(255) NOT NULL,
    `role` VARCHAR(20) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `tokenId` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Events` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `restaurantId` INTEGER NOT NULL,
    `eventName` VARCHAR(100) NOT NULL,
    `eventDate` DATETIME(3) NOT NULL,
    `description` VARCHAR(191) NULL,
    `status` VARCHAR(20) NOT NULL,
    `updatedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RestaurantTypes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DishTypes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Restaurants` ADD CONSTRAINT `Restaurants_typeId_fkey` FOREIGN KEY (`typeId`) REFERENCES `RestaurantTypes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tables` ADD CONSTRAINT `Tables_restaurantId_fkey` FOREIGN KEY (`restaurantId`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reservations` ADD CONSTRAINT `Reservations_restaurantId_fkey` FOREIGN KEY (`restaurantId`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reservations` ADD CONSTRAINT `Reservations_tableId_fkey` FOREIGN KEY (`tableId`) REFERENCES `Tables`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reservations` ADD CONSTRAINT `Reservations_personnelWhoUpdated_fkey` FOREIGN KEY (`personnelWhoUpdated`) REFERENCES `Personnel`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reviews` ADD CONSTRAINT `Reviews_restaurantId_fkey` FOREIGN KEY (`restaurantId`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_tableId_fkey` FOREIGN KEY (`tableId`) REFERENCES `Tables`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_personnelWhoUpdated_fkey` FOREIGN KEY (`personnelWhoUpdated`) REFERENCES `Personnel`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderItems` ADD CONSTRAINT `OrderItems_dishId_fkey` FOREIGN KEY (`dishId`) REFERENCES `Dishes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderItems` ADD CONSTRAINT `OrderItems_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transactions` ADD CONSTRAINT `Transactions_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Dishes` ADD CONSTRAINT `Dishes_typeId_fkey` FOREIGN KEY (`typeId`) REFERENCES `DishTypes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Dishes` ADD CONSTRAINT `Dishes_restaurantId_fkey` FOREIGN KEY (`restaurantId`) REFERENCES `Restaurants`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Dishes` ADD CONSTRAINT `Dishes_adminIdWhoUpdated_fkey` FOREIGN KEY (`adminIdWhoUpdated`) REFERENCES `Personnel`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Dishes_Ingredients` ADD CONSTRAINT `Dishes_Ingredients_dishId_fkey` FOREIGN KEY (`dishId`) REFERENCES `Dishes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Dishes_Ingredients` ADD CONSTRAINT `Dishes_Ingredients_ingredientId_fkey` FOREIGN KEY (`ingredientId`) REFERENCES `Ingredients`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ingredients` ADD CONSTRAINT `Ingredients_allergyId_fkey` FOREIGN KEY (`allergyId`) REFERENCES `Allergy`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Personnel` ADD CONSTRAINT `Personnel_restaurantId_fkey` FOREIGN KEY (`restaurantId`) REFERENCES `Restaurants`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Personnel` ADD CONSTRAINT `Personnel_adminWhoUpdated_fkey` FOREIGN KEY (`adminWhoUpdated`) REFERENCES `Personnel`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tokens` ADD CONSTRAINT `Tokens_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Personnel`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Events` ADD CONSTRAINT `Events_restaurantId_fkey` FOREIGN KEY (`restaurantId`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

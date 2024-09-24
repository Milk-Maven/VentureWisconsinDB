/*
  Warnings:

  - You are about to drop the column `authId` on the `User` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "role" TEXT NOT NULL DEFAULT 'USER',
    "groupsGroupName" TEXT,
    "pendingAccountChange" BOOLEAN NOT NULL DEFAULT false,
    "jwt" TEXT,
    "authStrategy" TEXT NOT NULL
);
INSERT INTO "new_User" ("authStrategy", "createdAt", "email", "firstName", "groupsGroupName", "id", "lastName", "pendingAccountChange", "role") SELECT "authStrategy", "createdAt", "email", "firstName", "groupsGroupName", "id", "lastName", "pendingAccountChange", "role" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
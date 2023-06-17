-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "user" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spells" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "typeSpell" TEXT NOT NULL,
    "level" TEXT NOT NULL,
    "typeAction" TEXT NOT NULL,
    "range" TEXT NOT NULL,
    "conjuration" TEXT NOT NULL,
    "time" INTEGER,
    "material" TEXT,
    "description" TEXT,

    CONSTRAINT "spells_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "equipment" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" DECIMAL(65,30),
    "ca" INTEGER,
    "stealth" TEXT,
    "damage" TEXT,
    "type" TEXT,
    "properties" TEXT,

    CONSTRAINT "equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "races" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "abilityScore" TEXT,
    "Proficiency" TEXT,

    CONSTRAINT "races_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subRaces" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "abilityScore" TEXT,
    "Proficiency" TEXT,
    "raceId" TEXT NOT NULL,

    CONSTRAINT "subRaces_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "classes" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "hitPoint" TEXT NOT NULL,
    "armor" TEXT NOT NULL,
    "weapons" TEXT NOT NULL,
    "tools" TEXT NOT NULL,
    "savingThrows" TEXT NOT NULL,

    CONSTRAINT "classes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "characters" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "experience" INTEGER,
    "age" INTEGER,
    "height" INTEGER,
    "weight" INTEGER,
    "skin" TEXT,
    "eye" TEXT,
    "hair" TEXT,
    "appearance" TEXT,
    "backstory" TEXT,
    "background" TEXT,
    "alignment" TEXT,
    "ideals" TEXT,
    "links" TEXT,
    "weaknesses" TEXT,
    "Gold" INTEGER,
    "userId" TEXT NOT NULL,
    "raceId" TEXT NOT NULL,
    "classId" TEXT NOT NULL,

    CONSTRAINT "characters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "charSpells" (
    "charId" TEXT NOT NULL,
    "spellId" TEXT NOT NULL,

    CONSTRAINT "charSpells_pkey" PRIMARY KEY ("charId","spellId")
);

-- CreateTable
CREATE TABLE "charEquip" (
    "charId" TEXT NOT NULL,
    "equipId" TEXT NOT NULL,

    CONSTRAINT "charEquip_pkey" PRIMARY KEY ("charId","equipId")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "subRaces" ADD CONSTRAINT "subRaces_raceId_fkey" FOREIGN KEY ("raceId") REFERENCES "races"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "characters" ADD CONSTRAINT "characters_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "characters" ADD CONSTRAINT "characters_raceId_fkey" FOREIGN KEY ("raceId") REFERENCES "races"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "characters" ADD CONSTRAINT "characters_classId_fkey" FOREIGN KEY ("classId") REFERENCES "classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "charSpells" ADD CONSTRAINT "charSpells_charId_fkey" FOREIGN KEY ("charId") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "charSpells" ADD CONSTRAINT "charSpells_spellId_fkey" FOREIGN KEY ("spellId") REFERENCES "spells"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "charEquip" ADD CONSTRAINT "charEquip_charId_fkey" FOREIGN KEY ("charId") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "charEquip" ADD CONSTRAINT "charEquip_equipId_fkey" FOREIGN KEY ("equipId") REFERENCES "equipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

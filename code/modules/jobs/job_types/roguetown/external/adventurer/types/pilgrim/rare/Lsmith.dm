//dwarf master smith

/datum/advclass/masterblacksmith
	name = "Master Blacksmith"
	tutorial = "A master blacksmith, able to forge steel like dough, and gold like clay. \
	create masterful weapons and armor, be a legend among those who interest in your mighty forge."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/masterblacksmith

	maximum_possible_slots = 1
	pickprob = 5

	category_tags = list(CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/masterblacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/hammer
	beltl = /obj/item/rogueweapon/tongs
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	mouth = /obj/item/rogueweapon/huntingknife

	gloves = /obj/item/clothing/gloves/roguetown/leather
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	pants = /obj/item/clothing/under/roguetown/trou
	cloak = /obj/item/clothing/cloak/apron/blacksmith

	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
						/obj/item/flint = 1,
						/obj/item/rogueore/coal=2,
						/obj/item/rogueore/iron=2,
						/obj/item/rogueore/silver=1,
						/obj/item/flashlight/flare/torch = 1,
						)
	ADD_TRAIT(H, TRAIT_TRAINED_SMITH, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/smelting, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("strength", 2)
	H.change_stat("speed", -1)
	H.change_stat("fortune", 3)
	if(H.pronouns == HE_HIM)
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		shoes = /obj/item/clothing/shoes/roguetown/shortboots

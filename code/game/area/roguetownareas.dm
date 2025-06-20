GLOBAL_LIST_EMPTY(chosen_music)

GLOBAL_LIST_INIT(roguetown_areas_typecache, typecacheof(/area/rogue/indoors/town,/area/rogue/outdoors/town,/area/rogue/under/town)) //hey

/area/rogue
	name = "roguetown"
	icon_state = "rogue"
	has_gravity = STANDARD_GRAVITY
	ambientsounds = null
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE
//	var/previous_ambient = ""
	var/town_area = FALSE
	var/keep_area = FALSE
	var/warden_area = FALSE
	var/ceiling_protected = FALSE //Prevents tunneling into these from above

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.town_area == TRUE) && HAS_TRAIT(guy, TRAIT_GUARDSMAN) && guy.z == 3 && !guy.has_status_effect(/datum/status_effect/buff/guardbuffone)) //man at arms
		guy.apply_status_effect(/datum/status_effect/buff/guardbuffone)
		if(HAS_TRAIT(guy, TRAIT_KNIGHTSMAN) && guy.has_status_effect(/datum/status_effect/buff/knightbuff))
			guy.remove_status_effect(/datum/status_effect/buff/knightbuff)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.warden_area == TRUE) && HAS_TRAIT(guy, TRAIT_WOODSMAN) && !guy.has_status_effect(/datum/status_effect/buff/wardenbuff)) // Warden
		guy.apply_status_effect(/datum/status_effect/buff/wardenbuff)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.keep_area == TRUE) && HAS_TRAIT(guy, TRAIT_KNIGHTSMAN) && !guy.has_status_effect(/datum/status_effect/buff/knightbuff)) //royal guard
		guy.apply_status_effect(/datum/status_effect/buff/knightbuff)
		if(HAS_TRAIT(guy, TRAIT_GUARDSMAN) && guy.has_status_effect(/datum/status_effect/buff/guardbuffone))
			guy.remove_status_effect(/datum/status_effect/buff/guardbuffone)


/area/rogue/indoors
	name = "indoors rt"
	icon_state = "indoors"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 2
	plane = INDOOR_PLANE
	converted_type = /area/rogue/outdoors
	brief_descriptor = "a place where the very walls surround a quiet end"
	general_location = "Somewhere muffling it's sound!"

/area/rogue/indoors/banditcamp
	name = "bandit camp indoors"
	droning_sound = 'sound/music/area/banditcamp.ogg'
	droning_sound_dusk = 'sound/music/area/banditcamp.ogg'
	droning_sound_night = 'sound/music/area/banditcamp.ogg'
	brief_descriptor = "where through brief windowed glance - there's glimpse of palisade"
	general_location = "Somewhere far from town!"

/area/rogue/indoors/cave
	name = "latejoin cave"
	icon_state = "cave"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	soundenv = 8
	brief_descriptor = "where the rocks tower above"
	general_location = "Somewhere below!"

/area/rogue/indoors/cave/late/can_craft_here()
	return FALSE


///// OUTDOORS AREAS //////

/area/rogue/outdoors
	name = "outdoors roguetown"
	icon_state = "outdoors"
	outdoors = TRUE
	ambientrain = RAIN_OUT
//	ambientsounds = list('sound/ambience/wamb.ogg')
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/indoors/shelter
	soundenv = 16
	brief_descriptor = "in the fields of Sunmarch"
	general_location = "Somewhere in the wilds!"


/area/rogue/outdoors/banditcamp
	name = "bandit camp outdoors"
	droning_sound = 'sound/music/area/banditcamp.ogg'
	droning_sound_dusk = 'sound/music/area/banditcamp.ogg'
	droning_sound_night = 'sound/music/area/banditcamp.ogg'
	brief_descriptor = "in a camp, wicked and wild."

/area/rogue/indoors/shelter
	icon_state = "shelter"
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	brief_descriptor = "in a makeshift shelter from the world around"
	general_location = "Somewhere barely muffling it's call!"

/area/rogue/outdoors/mountains
	name = "mountains"
	icon_state = "mountains"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	warden_area = TRUE
	soundenv = 17
	converted_type = /area/rogue/indoors/shelter/mountains
	brief_descriptor = "in a makeshift shelter from the world around"
	general_location = "Up in the mountains!"

/area/rogue/indoors/shelter/mountains
	icon_state = "mountains"
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	brief_descriptor = "in a makeshift shelter, above the clouds"
	general_location = "Muffled, yet above us!" // ඞ

/area/rogue/outdoors/mountains/deception
	name = "deception"
	icon_state = "deception"
	first_time_text = "THE CANYON OF DECEPTION"
	brief_descriptor = "surrounded by rock, all but above"
	general_location = "Somewhere below me, yet clear as day!"

/area/rogue/outdoors/mountains/decap
	name = "mt decapitation"
	icon_state = "decap"
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush/hell = 20)
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "MOUNT DECAPITATION"
	ambush_times = list("night","dawn","dusk","day")
	converted_type = /area/rogue/indoors/shelter/mountains/decap
	brief_descriptor = "in a land of magma and arid air"
	general_location = "High above, in the mountaintops!"

/area/rogue/indoors/shelter/mountains/decap
	icon_state = "decap"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	brief_descriptor = "in a lowly structure in a land that wishes to ravage it"
	general_location = "Muffled, yet high above!"


/area/rogue/outdoors/mountains/decap/stepbelow
	name = "mt decapitation inner"
	icon_state = "decap"
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush/hell = 20)
	droning_sound = 'sound/music/area/decap_deeper.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "TARICHEA, VALLEY OF LOSS"
	ambush_times = list("night","dawn","dusk","day")
	converted_type = /area/rogue/indoors/shelter/mountains/decap
	brief_descriptor = "the base of a treacherous mountain"
	general_location = "From the base of the mountains!"

/area/rogue/outdoors/rtfield
	name = "solar basin"
	icon_state = "rtfield"
	soundenv = 19
	first_time_text = "SOLAR BASIN"
	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_dusk = 'sound/music/area/fieldsdusk.ogg'
	droning_sound_night = 'sound/music/area/fieldsnight.ogg'
	converted_type = /area/rogue/indoors/shelter/rtfield
	brief_descriptor = "where the forests and ocean converge"
	general_location = "From the fields outside of town!"

/area/rogue/indoors/shelter/rtfield
	icon_state = "rtfield"
	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_dusk = 'sound/music/area/fieldsdusk.ogg'
	droning_sound_night = 'sound/music/area/fieldsnight.ogg'
	brief_descriptor = "where walls keep out the wilds of the basin"
	general_location = "Muffled, yet from the fields!"


/area/rogue/outdoors/woods
	name = "wilderness"
	icon_state = "woods"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/fieldsdusk.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	soundenv = 15
	warden_area = TRUE
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 40,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush = 30)
	first_time_text = "THE SOLAR GROVE"
	converted_type = /area/rogue/indoors/shelter/woods
	brief_descriptor = "where trees line all view, and all thought"
	general_location = "From the Solar Grove!"

/area/rogue/indoors/shelter/woods
	icon_state = "woods"
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	brief_descriptor = "where shelter is plentiful, yet built regardless"
	general_location = "Muffled, but unmistakably the Solar Grove!"


/area/rogue/outdoors/river
	name = "river"
	icon_state = "river"
	warden_area = TRUE
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	converted_type = /area/rogue/indoors/shelter/woods
	brief_descriptor = "a brief glimpse of Cinella's realm in the Underking's grave"

/area/rogue/outdoors/bog
	name = "bog"
	icon_state = "bog"
	warden_area = TRUE
	ambientsounds = AMB_BOGDAY
	ambientnight = AMB_BOGNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass,
				/turf/open/water)
	//Minotaurs too strong for the lazy amount of places this area covers
	ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc/ambush = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 60,
				/mob/living/simple_animal/hostile/retaliate/rogue/trollbog = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 40,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 30)
	first_time_text = "THE TERRORBOG"
	converted_type = /area/rogue/indoors/shelter/bog
	brief_descriptor = "a terrible place of wilt and willow"
	general_location = span_danger("It's from the terrorbog.") // You are in danger.

/area/rogue/indoors/shelter/bog
	icon_state = "bog"
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	brief_descriptor = "where brief shelter can be found from the bog's nightmare"
	general_location = span_danger("It's from the terrorbog, yet's... muffled.")

/area/rogue/outdoors/beach
	name = "coast"
	icon_state = "beach"
	warden_area = TRUE
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/under/lake
	brief_descriptor = "the edge of Cinella's realm"
	general_location = "From the coast!"

/area/rogue/outdoors/beach/forest
	name = "coastforest"
	icon_state = "beach"
	icon_state = "woods"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 15
	ambush_times = list("night","dusk")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 30,
				/mob/living/carbon/human/species/human/northern/searaider/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 40)
	first_time_text = "THE SOLAR COAST"
	converted_type = /area/rogue/indoors/shelter/woods
	brief_descriptor = "the edge of Cinella's realm verse the bounty of nature"

//// UNDER AREAS (no indoor rain sound usually)

// these don't get a rain sound because they're underground
/area/rogue/under
	name = "basement"
	icon_state = "under"
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 8
	plane = INDOOR_PLANE
	converted_type = /area/rogue/outdoors/exposed
	brief_descriptor = "walls and ceiling abound, yet no window's to be found"
	general_location = "From somewhere below!"

/area/rogue/outdoors/exposed
	icon_state = "exposed"
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/area/rogue/under/cave
	name = "cave"
	warden_area = TRUE
	icon_state = "cave"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 20,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 5)
	converted_type = /area/rogue/outdoors/caves
	brief_descriptor = "where rock and murk intermingle"

/area/rogue/outdoors/caves
	icon_state = "caves"
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	brief_descriptor = "where rock and murk intermingle"
	general_location = "From somewhere below!"

/area/rogue/under/cavewet
	name = "cavewet"
	icon_state = "cavewet"
	warden_area = TRUE
	first_time_text = "The Undersea"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/sea = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/troll = 15)
	converted_type = /area/rogue/outdoors/caves
	brief_descriptor = "a sea, entrenched in the Underking's former realm"

/area/rogue/under/underdark
	name = "The Underdark"
	icon_state = "cavewet"
	warden_area = FALSE
	first_time_text = "The Underdark"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/underdark.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 20,
				/mob/living/carbon/human/species/elf/dark/drowraider/ambush = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 25,
				/mob/living/carbon/human/species/goblin/npc/ambush/moon = 30,
				/mob/living/simple_animal/hostile/retaliate/rogue/troll = 15)
	converted_type = /area/rogue/outdoors/caves
	brief_descriptor = "where dusk elves once stood as monuments"

/area/rogue/under/cavewet/bogcaves
	first_time_text = "The Undergrove"
	brief_descriptor = "beneath the bog's nightmare"
	general_location = span_danger("From below the bog.")

/area/rogue/under/cavewet/bogcaves/sunkencity
	first_time_text = "MELTED UNDERCITY"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/underdark.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	brief_descriptor = "where men roamed so long ago"

/area/rogue/under/cave/spider
	icon_state = "spider"
	first_time_text = "ARAIGNÉE"
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 100)
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/spidercave
	brief_descriptor = "where web and rock weave together"

/area/rogue/outdoors/spidercave
	icon_state = "spidercave"
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	brief_descriptor = /area/rogue/under/cave/spider::brief_descriptor
	general_location = "From somewhere below!"

/area/rogue/under/cavelava
	name = "cavelava"
	icon_state = "cavelava"
	first_time_text = "MOUNT DECAPITATION"
	ambientsounds = AMB_CAVELAVA
	ambientnight = AMB_CAVELAVA
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 10,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 20,
				/mob/living/carbon/human/species/goblin/npc/hell = 25,
				/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 15)
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/decap
	brief_descriptor = "a place arid in the former brother sun's embrace"
	general_location = "From the mountains!"

/area/rogue/outdoors/exposed/decap
	icon_state = "decap"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	brief_descriptor = "a place arid in the former brother sun's embrace"
	general_location = "From the mountains!"

/area/rogue/under/lake
	name = "underground lake"
	icon_state = "lake"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_GEN
	brief_descriptor = "a respite in rock, murky as it is."
	general_location = "From below!"

/area/rogue/under/cave/dungeon/dungeon1
	name = "smalldungeon1"
	icon_state = "spider"
	droning_sound = 'sound/music/area/dungeon.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/under/cave/dungeon/licharena
	name = "licharena"
	icon_state = "under"
	first_time_text = "LICH'S DOMAIN"
	droning_sound = 'sound/music/area/dragonden.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "where a wicked beast dwelled"

/area/rogue/under/cave/dungeon/dragonden
	name = "dragonnest"
	icon_state = "under"
	first_time_text = "DEN OF DRAGONS"
	droning_sound = 'sound/music/area/dragonden.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "where a wicked beast dwelled"

/area/rogue/under/cave/dungeon/goblinfort
	name = "goblinfort"
	icon_state = "spidercave"
	first_time_text = "GOBLIN FORTRESS"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "where wicked beasts dwell"

/area/rogue/under/cave/dungeon/cursed_labyrinth
	name = "hauntedlabyrinth"
	icon_state = "spidercave"
	first_time_text = "CURSED LABYRINTH"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "a maze eternal"

/area/rogue/under/cave/dungeon/abandoned_manor
	name = "skelemansion"
	icon_state = "spidercave"
	first_time_text = "ABANDONED MANOR"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "where the bones walk earth"

/area/rogue/outdoors/dungeon1
	name = "smalldungeonoutdoors"
	icon_state = "spidercave"
	droning_sound = 'sound/music/area/dungeon.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/cave/dungeon/winding_halls
	name = "mazedungeon"
	icon_state = "under"
	first_time_text = "THE WINDING HALLS"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	ceiling_protected = TRUE
	brief_descriptor = "a wretched place far below"

/area/rogue/under/cave/dungeon/old_ruin
	name = "orcdungeon"
	icon_state = "under"
	first_time_text = "OLD RUIN"
	droning_sound = 'sound/music/area/dungeon.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	ceiling_protected = TRUE
	brief_descriptor = "where marauders lurk"

/area/rogue/under/cave/dungeon/vulnafir
	name = "Vulnafir"
	icon_state = "duke"
	first_time_text = "VULNAFIR"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "in old sunmarch, cast beneath the mountains of scordris"

/area/rogue/under/cave/dungeon/fort_dusk
	name = "The Forsaken Bastille"
	icon_state = "duke"
	first_time_text = "THE FORSAKEN BASTILLE"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "in old sunmarch, where only the 'gulls remain to cry out"

/area/rogue/under/cave/dungeon/old_university_garden
	name = "Entombed Garden"
	icon_state = "caves"
	first_time_text = "ENTOMBED GARDEN"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/grassred)
	ambush_mobs = list(
				/mob/living/carbon/human/species/elf/dark/ziraguard/ambush = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 20)
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "in old sunmarch, admist the gnarled trees that adorned an academy."

/area/rogue/under/cave/dungeon/old_university
	name = "Scholar's Folly"
	icon_state = "under"
	first_time_text = "SCHOLAR'S FOLLY"
	droning_sound = 'sound/music/area/dungeon.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/grassred)
	ambush_mobs = list(
				/mob/living/carbon/human/species/elf/dark/ziraguard/ambush = 60,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 40)
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "in old sunmarch, in the endless halls of academia lost"

/area/rogue/under/cave/dungeon/toybox_dungeon
	name = "Giuseppe's Toybox"
	icon_state = "manor"
	first_time_text = "GIUSEPPE'S TOYBOX"
	droning_sound = 'sound/music/area/dungeon_toybox.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	converted_type = /area/rogue/outdoors/dungeon1
	brief_descriptor = "in old sunmarch, among mechanical laughter and wind-up toy soldiers"

//////
/////
////     TOWN AREAS
////
///
//



/area/rogue/indoors/town
	name = "indoors"
	icon_state = "town"
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/outdoors/exposed/town
	town_area = TRUE
	brief_descriptor = "nestled within walls of walls inside Solaris Ridge."
	general_location = "Inside the town of Solaris Ridge!"


/area/rogue/outdoors/exposed/town
	icon_state = "town"
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	brief_descriptor = "nestled within the walls of Solaris Ridge."
	general_location = "Inside the town of Solaris Ridge!"

/area/rogue/outdoors/exposed/town/keep
	name = "Keep"
	icon_state = "manor"
	droning_sound = 'sound/music/area/manorgarri.ogg'
	keep_area = TRUE
	town_area = TRUE
	brief_descriptor = "nestled within the keep of Solaris Ridge."
	general_location = "Inside the keep!"

/area/rogue/indoors/town/manor
	name = "Manor"
	icon_state = "manor"
	droning_sound = list('sound/music/area/manor.ogg', 'sound/music/area/manor2.ogg')
	droning_sound_dusk = null
	droning_sound_night = list('sound/music/area/manor.ogg', 'sound/music/area/manor.ogg')
	converted_type = /area/rogue/outdoors/exposed/manorgarri
	first_time_text = "THE KEEP OF SOLARIS RIDGE"
	keep_area = TRUE
	brief_descriptor = "nestled within the keep of Solaris Ridge."
	general_location = "Inside the keep!"

/area/rogue/outdoors/exposed/manorgarri
	icon_state = "manorgarri"
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	keep_area = TRUE
	brief_descriptor = "nestled within the garrison of Solaris Ridge."
	general_location = "Inside the Garrison!"

/area/rogue/indoors/town/magician
	name = "Wizard's Tower"
	icon_state = "magician"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/magiciantower.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/magiciantower
	keep_area = TRUE
	brief_descriptor = "where the university sent dignitary to persuade the Marquis."
	general_location = "Inside the Dignitary's Quarter!"

/area/rogue/outdoors/exposed/magiciantower
	icon_state = "magiciantower"
	droning_sound = 'sound/music/area/magiciantower.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	keep_area = TRUE
	brief_descriptor = "where the university sent dignitary to persuade the Marquis."
	general_location = "Inside the Dignitary's Quarter!"

/area/rogue/indoors/town/shop
	name = "Shop"
	icon_state = "shop"
	droning_sound = 'sound/music/area/shop.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/shop

/area/rogue/outdoors/exposed/shop
	icon_state = "shop"
	droning_sound = 'sound/music/area/shop.ogg'

/area/rogue/indoors/town/physician
	name = "Deacon"
	icon_state = "physician"
	droning_sound = 'sound/music/area/shop.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	brief_descriptor = "where the chapel of lights sent dignitary to persuade the Marquis."
	general_location = "Inside the Dignitary's Quarter!"

/area/rogue/indoors/town/garrison
	name = "Garrison"
	icon_state = "garrison"
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/manorgarri
	keep_area = TRUE
	brief_descriptor = "where soldiers haunt and drinks are poured"
	general_location = "Inside the Garrison!"

/area/rogue/indoors/town/cell
	name = "dungeon cell"
	icon_state = "cell"
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/manorgarri
	keep_area = TRUE
	brief_descriptor = "where men rot and hope dwindles"
	general_location = "Inside the Garrison!"


/area/rogue/indoors/town/tavern
	name = "tavern"
	icon_state = "tavern"
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	droning_sound = 'sound/silence.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/tavern
	brief_descriptor = "where merriment sparks and bards play"

/area/rogue/outdoors/exposed/tavern
	icon_state = "tavern"
	droning_sound = 'sound/silence.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/church
	name = "church"
	icon_state = "church"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	droning_sound_dawn = 'sound/music/area/churchdawn.ogg'
	converted_type = /area/rogue/outdoors/exposed/church
	brief_descriptor = "hallowed ground of the nine"
	general_location = "Inside the Chapel of Lights!"

/area/rogue/outdoors/exposed/church
	icon_state = "church"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	droning_sound_dawn = 'sound/music/area/churchdawn.ogg'

/area/rogue/indoors/town/church/chapel
	icon_state = "chapel"
	first_time_text = "THE CHAPEL OF LIGHTS"

/area/rogue/indoors/town/church/basement
	icon_state = "church"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "CHAPEL UNDERCROFT"

/area/rogue/indoors/town/fire_chamber
	name = "incinerator"
	icon_state = "fire_chamber"

/area/rogue/indoors/town/fire_chamber/can_craft_here()
	return FALSE

/area/rogue/indoors/town/warehouse
	name = "dock warehouse import"
	icon_state = "warehouse"
	brief_descriptor = "where the steward imports goods"
	general_location = "Below town!"

/area/rogue/indoors/town/warehouse/can_craft_here()
	return FALSE

/area/rogue/indoors/town/vault
	name = "vault"
	icon_state = "vault"
	keep_area = TRUE
	brief_descriptor = "where the realm's riches lie so safe"
	general_location = span_danger("It's from the vault!") // RUN FORREST RUN

/area/rogue/indoors/town/vault/can_craft_here()
	return FALSE

/area/rogue/indoors/town/dwarfin
	name = "dwarven quarter"
	icon_state = "dwarfin"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Dwarven Quarter"
	converted_type = /area/rogue/outdoors/exposed/dwarf
	brief_descriptor = "where craftsmen toil and legends are prepared"

/area/rogue/outdoors/exposed/dwarf
	icon_state = "dwarf"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

///// outside

/area/rogue/outdoors/town
	name = "outdoors"
	icon_state = "town"
	soundenv = 16
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/indoors/shelter/town
	first_time_text = "THE CITY OF SOLARIS RIDGE"
	town_area = TRUE
	brief_descriptor = "inside the walls of Solaris Ridge"
	general_location = "From Solaris Ridge!"

/area/rogue/indoors/shelter/town
	icon_state = "town"
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	brief_descriptor = "inside walls of walls, honed on Solaris Ridge"
	general_location = "Muffled, yet from Solaris Ridge!"

/area/rogue/outdoors/town/roofs
	name = "roofs"
	icon_state = "roofs"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 17
	converted_type = /area/rogue/indoors/shelter/town/roofs

/area/rogue/outdoors/town/roofs/keep
	name = "Keep Rooftops"
	icon_state = "manor"
	keep_area = TRUE
	town_area = TRUE
	brief_descriptor = "the very rooftops of the keep"
	general_location = "From the keep!"

/area/rogue/indoors/shelter/town/roofs
	icon_state = "roofs"
	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/// under


/area/rogue/under/town
	name = "basement"
	icon_state = "town"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/under/town
	brief_descriptor = "beneath the bustle of the city"
	general_location = "From below Solaris Ridge!"

/area/rogue/outdoors/exposed/under/town
	icon_state = "town"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/town/sewer
	name = "sewer"
	icon_state = "sewer"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_RATS
	spookynight = SPOOKY_RATS
	droning_sound = 'sound/music/area/sewers.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambientrain = RAIN_SEWER
	soundenv = 21
	converted_type = /area/rogue/outdoors/exposed/under/sewer
	brief_descriptor = "where rat and murk mingle twice-over"

/area/rogue/outdoors/exposed/under/sewer
	icon_state = "sewer"
	droning_sound = 'sound/music/area/sewers.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/town/caverogue
	name = "miningcave (roguetown)"
	icon_state = "caverogue"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/under/caves

/area/rogue/outdoors/exposed/under/caves
	icon_state = "caves"
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/town/basement
	name = "basement"
	icon_state = "basement"
	ambientsounds = AMB_BASEMENT
	ambientnight = AMB_BASEMENT
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	soundenv = 5
	town_area = TRUE
	converted_type = /area/rogue/outdoors/exposed/under/basement

/area/rogue/under/town/basement/keep
	name = "keep basement"
	icon_state = "basement"
	keep_area = TRUE
	town_area = TRUE
	brief_descriptor = "beneath the bustle of the keep"
	general_location = "From below the Keep!"

/area/rogue/outdoors/exposed/under/basement
	icon_state = "basement"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

// underworld
/area/rogue/underworld
	name = "underworld"
	icon_state = "underworld"
	droning_sound = 'sound/music/area/underworlddrone.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Forest of Repentence"
	brief_descriptor = "a place out of time"
	general_location = "From... from. Nowhere."

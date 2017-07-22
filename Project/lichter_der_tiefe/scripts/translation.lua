--Daxar: English string translations (in separate file because much better)
local nameLine = ":\n \n"

local DATA_TEXTS = {

-- locations
port_name = "Port of Winumsund",
reef_enlightenment_name = "Reef of Enlightenment",
home_waters_name = "Home Waters",
nejl_home_name = "Nejl\'s Home",
nejl_home_undiscovered_name = "Home",
dangerous_currents_name = "Dangerous Currents",
eel_home_name = "Eel Home",
sphinx_palace_name = "Palace of the Sphinx",
shallows_name = "Shallows",
silence_cave_name = "Cave of Silence",
current_cave_name = "Cave of Currents",
enlighten_cave_name = "Cave of Enlightenment",

-- Songs
silence_song_name = "\nSong of Silence",
currents_song_name = "\nSong of Currents",
light_song_name = "\nSong of the Light",

-- 1_mejais_ghost
mejais_ghost_01 = "Mejais"..nameLine.."Emily, please, find Nejl.",
mejais_ghost_02 = "Mejais"..nameLine.."Swim to the South. There you will learn the Song of Silence.",
mejais_ghost_03 = "Mejais"..nameLine.."You must continue past the eel to where the jellyfish live.",
mejais_ghost_04 = "Mejais"..nameLine.."You must help the Sphinx in the Palace. Behind it lies the final jellyfish.",
mejais_ghost_05 = "Mejais"..nameLine.."You now know all the songs. Now teach Nejl the Song of the Light.",
mejais_ghost_06 = "Mejais"..nameLine.."Hurry up, otherwise the flowers will wilt!",
mejais_ghost_07 = "Mejais"..nameLine.."You have to decide. Do you want to go back to your world, or are you helping Nejl?",
mejais_ghost_08 = "Mejais"..nameLine.."The flowers have wilted. Help Nejl!",
mejais_ghost_09 = "Mejais"..nameLine.."Emily?",
mejais_ghost_10 = "Mejais"..nameLine.."What are you doing?",

-- a_lichterqualle
lichterqualle_sing_instr = "\nLook in the menu to see which notes to play for a song.\nThen, sing with the right mouse button.",
lichterqualle_a_01 = "Jellyfish"..nameLine.."As you wish, I\'ll teach you the \"Song of Silence.\".\nStay alert, lest it lull you yourself to sleep...",
lichterqualle_a_02 = "Nejl"..nameLine.."Great, you\'ve learned the next song. Try it here!",
lichterqualle_a_03 = "Nejl"..nameLine.."Great, you\'ve learned the first song. Try it here!",
lichterqualle_a_04 = "Jellyfish"..nameLine.."I have taught you everything I know.",

-- b_lichterqualle
lichterqualle_b_01 = "Jellyfish"..nameLine.."I will now teach you the \"Song of the Currents.\"\nMay you always find your way, no matter what pushes against you...",
lichterqualle_b_02 = "Jellyfish"..nameLine.."I cannot teach you any more.",

-- c_lichterqualle
lichterqualle_c_01 = "Jellyfish"..nameLine.."Now I'll teach you the \"Song of Determination\".\nUse it wisely...",
lichterqualle_c_02 = "Jellyfish"..nameLine.."That is all that I can teach you.",

-- node_0_dialog_mann
intro_01 = "Emily"..nameLine.."Are we here already? I\'m not sure I want to go through with this...",
intro_02 = "Emily"..nameLine.."Oh no!",
intro_03 = "Stranger"..nameLine.."Young lady, your amulet...",
intro_04 = "Stranger"..nameLine.."Red pearls are a rarity. May I ask where these came from?",
intro_05 = "Emily"..nameLine.."My father left it behind...\nI was just a baby when he left the family.",
intro_06 = "Stranger"..nameLine.."I\'m sorry to hear that, lass. Do you know why he left?",
intro_07 = "Emily"..nameLine.."I don\'t know. I haven\'t heard any word from him all my life, but last month I received this letter.",
intro_08 = "Stranger"..nameLine.."A man leaving his family behind must have had an important reason.\nI\'m sure you\'ll find out why in time.",
intro_09 = "Emily"..nameLine.."Maybe I shouldn\'t have come here.\nWhat am I even going to say to him?",
intro_10 = "Stranger"..nameLine.."I see a man over there by the docks; that might be him. Good luck!",

-- node_0_dialog_vater
father_diag_1 = "Emily"..nameLine.."Father, is that you?",
father_diag_2 = "Father"..nameLine.."Yes, Emily, my child!",
father_diag_3 = "Father"..nameLine.."Emily, I\'m sorry I had to leave you, I...",
father_diag_4 = "Emily"..nameLine.."It's all right, I know why you did it...",
father_diag_5 = "Emily"..nameLine.."You wanted to lead your own life.",
father_diag_6 = "Father"..nameLine.."But Emily...",
father_diag_7 = "Emily"..nameLine.."I understand that.",
father_diag_8 = "Emily"..nameLine.."I also lead my own life...",
father_diag_9 = "Emily"..nameLine.."...and I will continue to do so. Farewell.",
father_diag_10 = "Emily"..nameLine.."You had your reasons, right?",
father_diag_11 = "Emily"..nameLine.."I can understand that. I had to leave, and someone...",
father_diag_12 = "Father"..nameLine.."It\'s all right. I can tell that we have a lot to talk about.",

-- node_0_hafen
leavewater_ok_1 = "Stranger"..nameLine.."Lady, are you all right?",
leavewater_ok_2 = "Emily"..nameLine.."What happened?",
leavewater_ok_3 = "Stranger"..nameLine.."You fell into the water. Here, let me help you.",

-- node_0_wahl_normal/schwer
difficulty_normal = "\nDifficulty: Normal",
difficulty_high = "Difficulty: Advanced\n- You will deal less damage to enemies\n- You have less health",

-- node_1_banter_los
inwater_1 = "Emily"..nameLine.."What is this? How did I get here?",
inwater_2 = "Emily"..nameLine.."It feels so strangely familiar, but something is different.",
inwater_3 = "Emily"..nameLine.."I'm swimming and I'm under water, but I can breathe and talk!",
inwater_4 = "Emily"..nameLine.."I must have fallen off the dock. But what is this place?",
inwater_5 = "Emily"..nameLine.."I have to be able to get back up somehow!",

-- node_1_banter_schacht
reef_toodark_1 = "Emily"..nameLine.."No, I can\'t go up through here. I can\'t see anything that way.",

-- node_1_banter_mejais
mejais_banter_1 = "???"..nameLine.."...",
mejais_banter_2 = "???"..nameLine.."Who goes there?",
mejais_banter_3 = "Emily"..nameLine.."What? Where am I? Who are you? What\'s going on?",
mejais_banter_4 = "???"..nameLine.."My name is Mejais and you are in the Reef of Enlightenment. What are you doing here?",
mejais_banter_5 = "Emily"..nameLine.."I... I don\'t know. I guess I fell into the water. How can I get back?",
mejais_banter_6 = "Mejais"..nameLine.."I cannot lead you away from here directly, for I was attacked and killed shortly before your arrival.\nNow I am dead and I cannot leave this place.",
mejais_banter_7 = "Mejais"..nameLine.."I presume you came from the land above the surface of the water? Help me and I\'ll show you how to get back.",
mejais_banter_8 = "Emily"..nameLine.."Fine then. What do you want me to do?",
mejais_banter_9 = "Mejais"..nameLine.."Nejl, my son, is all alone. Since my death, he is the last of the Watchmen of the Light.",
mejais_banter_10 = "Emily"..nameLine.."Watchmen of the Light?",
mejais_banter_11 = "Mejais"..nameLine.."The Watchmen of the Light sing and bring light to the flowers of the deep.\nBecause of their singing, the flowers illuminate the dark.",
mejais_banter_12 = "Mejais"..nameLine.."But Cerajt is about to come to the reef.\nHe is a creature of darkness, and needs to be chased back to the shadows.",
mejais_banter_13 = "Emily"..nameLine.."How can I help?",
mejais_banter_14 = "Mejais"..nameLine.."Nejl has not yet fully learned the Song of the Light.\nHelp him find the three Jellyfish of Light - they each keep a verse to the song that he needs.",
mejais_banter_15 = "Mejais"..nameLine.."Once you have all the verses to the Song of the Light, teach it to Nejl.\nThen you can use the lights to get back home.",

-- node_1_mejais_lied_der_lichter
mejais_lied_1 = "Mejais"..nameLine.."Emily!",
mejais_lied_2 = "Emily"..nameLine.."Nejl and I have learned the Song of the Light.",
mejais_lied_3 = "Mejais"..nameLine.."Good! Now it should be possible to travel back up through the shaft and into your world.",
mejais_lied_4 = "Mejais"..nameLine.."Before you go, please do me one last favor.",
mejais_lied_5 = "Mejais"..nameLine.."Tell Nejl that I love him and will watch over him.",
mejais_lied_6 = "Emily"..nameLine.."Absolutely.",
mejais_lied_7 = "Mejais"..nameLine.."But hurry! The flowers have already begun to wilt.",
mejais_lied_8 = "Mejais"..nameLine.."If you take too long, they will no longer be able to light the way for you to escape!",
mejais_lied_9 = "Emily"..nameLine.."Then I won\'t waste any time!",

-- node_1_mejais_verwandlung
mejais_verwandlung_1 = "Mejais"..nameLine.."Emily?",
mejais_verwandlung_2 = "Emily"..nameLine.."The transformations... I cannot stop them.",
mejais_verwandlung_3 = "Mejais"..nameLine.."You were exposed to the power of the crystals for too long.",
mejais_verwandlung_4 = "Emily"..nameLine.."I\'m too afraid to stay! I could hurt Nejl!",
mejais_verwandlung_5 = "Mejais"..nameLine.."You have to return to your world.",
mejais_verwandlung_6 = "Emily"..nameLine.."Nejl could be in danger if I leave forever!",
mejais_verwandlung_7 = "Emily"..nameLine.."And the flowers have wilted. How can I leave?",
mejais_verwandlung_8 = "Mejais"..nameLine.."I can give you one last gift.",
mejais_verwandlung_9 = "Mejais"..nameLine.."I\'m leaving now to go to the afterlife. I give my last mortal strength to the flowers.",
mejais_verwandlung_10 = "Mejais"..nameLine.."It will be enough to revive them again for a short time. Hurry!",

-- node_1_nejl_follow_stop
nejl_follow_stop_1 = "Nejl"..nameLine.."I\'ll stay here. I don\'t feel safe going any farther.",

-- node_2_banter_quest
banter_quest_1 = "Emily"..nameLine.."Not to worry Nejl, we\'ll be fine. Let\'s go learn the last song...",

-- node_2_banter_strom
strong_current_1 = "Emily"..nameLine.."The current is too strong!",

-- node_2_healthcontainer
health_container_1 = "Emily"..nameLine.."I suddenly feel so much stronger!",

-- node_3_abschied
abschied_1 = "Nejl"..nameLine.."Emily, wait!",
abschied_2 = "Nejl"..nameLine.."Where are you going? Are you going back home?",
abschied_3 = "Emily"..nameLine.."I cannot stay with you. I have to go...",
abschied_4 = "Nejl"..nameLine.."But... but... you\'re leaving me all alone?",
abschied_5 = "Emily"..nameLine.."We\'ll meet again, I\'m sure of it.",
abschied_6 = "Nejl"..nameLine.."Yes, that\'s it! That\'s the song!",
abschied_7 = "Nejl"..nameLine.."What\'s next?",
abschied_8 = "Emily"..nameLine.."I\'m going home.",

-- node_3_banter_warm
banter_warm_1 = "Emily"..nameLine.."Nejl? Are you here?",

-- node_3_dialog_nejl
nejl_dialogue_1 = "Boy"..nameLine.."Who are you?",
nejl_dialogue_2 = "Emily"..nameLine.."I am Emily. Are you Nejl?",
nejl_dialogue_3 = "Boy"..nameLine.."Yes.",
nejl_dialogue_4 = "Nejl"..nameLine.."How do you know my name?",
nejl_dialogue_5 = "Emily"..nameLine.."I met your mother. She... She\'s dead.",
nejl_dialogue_6 = "Nejl"..nameLine.."...",
nejl_dialogue_7 = "Emily"..nameLine.."She sent me to help you learn the Song of the Light.",
nejl_dialogue_8 = "Nejl"..nameLine.."Really?",
nejl_dialogue_9 = "Nejl"..nameLine.."But why are you helping me?",
nejl_dialogue_10 = "Emily"..nameLine.."So I can return to my world again.",
nejl_dialogue_11 = "Nejl"..nameLine.."Your world?",
nejl_dialogue_12 = "Emily"..nameLine.."Above the water... it\'s hard to explain. Come on, let\'s look for the Jellyfish of Light.",
nejl_dialogue_13 = "Nejl"..nameLine.."Okay. I\'ll follow you.",

-- node_3_lied_der_lichter
lichter_lied_1 = "Nejl"..nameLine.."Now I remember the song that Mom used to sing!",
lichter_lied_2 = "Nejl"..nameLine.."We only need to combine the notes of the three songs.",
lichter_lied_3 = "Nejl"..nameLine.."Come on, you can do it. Make the flowers shine again!",

-- node_3_nach_cerajit
nach_cerajit_1 = "Emily"..nameLine.."Nejl? Are you okay?",
nach_cerajit_2 = "Nejl"..nameLine.."I\'m fine. What was that?",
nach_cerajit_3 = "Emily"..nameLine.."I don\'t know. I couldn\'t control the transformation!",
nach_cerajit_4 = "Nejl"..nameLine.."What are you going to do now?",
nach_cerajit_5 = "Emily"..nameLine.."I need to get out of here, otherwise you\'re going to be in danger.",
nach_cerajit_6 = "Nejl"..nameLine.."How? The flowers have wilted.",
nach_cerajit_7 = "Emily"..nameLine.."I\'ll find a way.",
nach_cerajit_8 = "Emily"..nameLine.."Here, take this - as a reminder.",
nach_cerajit_9 = "Emily"..nameLine.."Take care of yourself!",
nach_cerajit_10 = "Nejl"..nameLine.."Emily, what was that?",
nach_cerajit_11 = "Emily"..nameLine.."I no longer need the crystals to transform!",
nach_cerajit_12 = "Emily"..nameLine.."I have all the power in the world! Nothing can stop me now!",
nach_cerajit_13 = "Nejl"..nameLine.."You were exposed to the power of the crystals for too long!",
nach_cerajit_14 = "Emily"..nameLine.."What? This is the most power I\'ve ever had in my life. You don\'t even know how it feels to have this kind of power!",
nach_cerajit_15 = "Nejl"..nameLine.."You\'re scaring me. You\'ve... changed somehow. Don\'t come near me.",
nach_cerajit_16 = "Emily"..nameLine.."Where are you going? I can stay with you forever now!",
nach_cerajit_17 = "Emily"..nameLine.."I\'m never going home again!",
nach_cerajit_18 = "Emily"..nameLine.."I\'m never going to have to listen to my father\'s excuses for why he left!",
nach_cerajit_19 = "Emily"..nameLine.."Now I can do whatever I want! Nobody will ever say no to me again!",
nach_cerajit_20 = "Stranger"..nameLine.."Young lady? ... Young lady?!?! Help! Someone call a doctor! She\'s not breathing!",

-- node_4_banter_kampf
banter_kampf_1 = "Nejl"..nameLine.."Listen to me please, you\'re scaring me...",

-- node_4_banter_schleichen
banter_schleichen_1 = "Nejl"..nameLine.."Thank goodness you\'re here. Without your help I wouldn\'t have made it this far.",

-- node_4_banter_warnung
banter_warnung_1 = "Nejl"..nameLine.."The energy crystals... Going through them again ends their power.",

-- node_4_weg_schlect
weg_schlect_1 = "Nejl"..nameLine.."You\'re going that way? Wait up!",

-- node_5_aal_bereich
aal_bereich_1 = "Nejl"..nameLine.."Emily, be careful! That eel looks upset!",

-- node_5_banter_gang
banter_gang_1 = "Nejl"..nameLine.."It looks different down that way. I wonder where it leads.",

-- node_6_banter_hinweis
banter_currents_2 = "Nejl"..nameLine.."The currents here are too strong. I don\'t think we can get past...",

-- node_7_banter_hint
cerajt_stronger_1 = "Nejl"..nameLine.."Emily, look out! That\'s Cerajt! You\'re going to have to make yourself stronger if you want to get past him.",

-- node_7_banter_verwandlung
verwandlung_banter_1 = "Emily"..nameLine.."What happened? Why did I change form?",

-- node_a_hoehle_der_ruhe
silence_cave_1 = "Emily"..nameLine.."Nejl, wake up!",
silence_cave_2 = "Nejl"..nameLine.."Whoa, that song lulled me to sleep, sorry. It won\'t happen again, I promise!",

-- node_d_lied_der_lichter
sounds_good_man_1 = "Nejl"..nameLine.."That sounds nice.",

-- 3_nejl
nejl_blather_1 = "Nejl"..nameLine.."Now that we have learned all the songs, let\'s swim to my cave and sing the Song of the Light.",
nejl_blather_2 = "Emily"..nameLine.."Nejl? ... He fell asleep.",
nejl_blather_3 = "Nejl"..nameLine.."Wow ... That\'s a really soothing song!",
nejl_blather_4 = "Nejl"..nameLine.."Go ahead and swim in front. I\'ll follow you.",
nejl_blather_5 = "Nejl"..nameLine.."Come on, let\'s go learn the next song.",
nejl_blather_6 = "Nejl"..nameLine.."There\'s only one song left! Let\'s go!",
nejl_blather_7 = "Nejl"..nameLine.."We know all the songs. Let\'s go back to the cave.",
nejl_blather_8 = "Nejl"..nameLine.."Now the flowers can light up again.",
nejl_blather_9 = "Nejl"..nameLine.."I\'m scared.",
nejl_blather_10 = "Nejl"..nameLine.."Thank you for saving me!",

-- 3_rock
rock_diag_1 = "Emily"..nameLine.."Where is Nejl?",
rock_diag_2 = "Emily"..nameLine.."Oh no, Nejl!",
rock_diag_3 = "Emily"..nameLine.."If I swim down there now, I probably won\'t be able to make it back in time!",
rock_diag_4 = "Emily"..nameLine.."But I can\'t leave Nejl all alone!",
rock_diag_5 = "Emily"..nameLine.."What am I going to do?",

-- 4_fisch
fish_diag_1 = "Nejl"..nameLine.."Stop, you're hurting them!",
fish_diag_2 = "Nejl"..nameLine.."Leave them alone!",
fish_diag_3 = "Nejl"..nameLine.."Why would you do that?",

-- 5_aal
eel_diag_1 = "Nejl"..nameLine.."No, Emily! There must be another way.",
eel_diag_2 = "Nejl"..nameLine.."Shuch a shame, really...",

-- 6_sphinx
sphinx_diag_1 = "Sphinx"..nameLine.."Thank you for bringing the stone to me. You may now pass.",
sphinx_diag_2 = "Sphinx"..nameLine.."Bring me the stone from the center of the labyrinth.\nThen I\'ll let you pass.",
sphinx_diag_3 = "Nejl"..nameLine.."What are those energy crystals doing here?\nWhatever they are, I don\'t think it\'s a good idea to harm anything in here...",
sphinx_diag_4 = "Sphinx"..nameLine.."So your true intentions are revealed! Die, fiend!",
sphinx_diag_5 = "Nejl"..nameLine.."Why? Why would you kill her? She didn\'t do anything wrong!",

-- 7_cerajt
cerajt_1 = "Nejl"..nameLine.."Emily! You saved me!"

}

rawset(_G, "DATA_TEXTS", DATA_TEXTS)
setmetatable(DATA_TEXTS, { __index = function(t, k) local s = "unk text: " ..tostring(k); errorLog(s); return s end })
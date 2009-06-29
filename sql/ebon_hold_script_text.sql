-- -1 609 000 EBON HOLD
DELETE FROM script_texts WHERE entry BETWEEN -1609037 AND -1609001;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- How To Win Friends And Influence Enemies
   (-1609001, 'I\'ll tear the secrets from your soul! Tell me about the "Crimson Dawn" and your life may be spared!',0,0,0,0,'player SAY_PERSUADE1'),
   (-1609002, 'Tell me what you know about "Crimson Dawn" or the beatings will continue!',0,0,0,0,'player SAY_PERSUADE2'),
   (-1609003, 'I\'m through being courteous with your kind, human! What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE3'),
   (-1609004, 'Is your life worth so little? Just tell me what I need to know about "Crimson Dawn" and I\'ll end your suffering quickly.',0,0,0,0,'player SAY_PERSUADE4'),
   (-1609005, 'I can keep this up for a very long time, Scarlet dog! Tell me about the "Crimson Dawn!"',0,0,0,0,'player SAY_PERSUADE5'),
   (-1609006, 'What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE6'),
   (-1609007, '"Crimson Dawn!" What is it! Speak!',0,0,0,0,'player SAY_PERSUADE7'),
   (-1609008, 'You\'ll be hanging in the gallows shortly, Scourge fiend!',0,0,0,0,'crusader SAY_CRUSADER1'),
   (-1609009, 'You\'ll have to kill me, monster! I will tell you NOTHING!',0,0,0,0,'crusader SAY_CRUSADER2'),
   (-1609010, 'You hit like a girl. Honestly. Is that the best you can do?',0,0,0,0,'crusader SAY_CRUSADER3'),
   (-1609011, 'ARGH! You burned my last good tabard!',0,0,0,0,'crusader SAY_CRUSADER4'),
   (-1609012, 'Argh... The pain... The pain is almost as unbearable as the lashings I received in grammar school when I was but a child.',0,0,0,0,'crusader SAY_CRUSADER5'),
   (-1609013, 'I used to work for Grand Inquisitor Isillien! Your idea of pain is a normal mid-afternoon for me!',0,0,0,0,'crusader SAY_CRUSADER6'),
   (-1609014, 'I\'ll tell you everything! STOP! PLEASE!',0,0,0,20,'break crusader SAY_PERSUADED1'),
   (-1609015, 'We... We have only been told that the "Crimson Dawn" is an awakening. You see, the Light speaks to the High General. It is the Light...',0,0,0,20,'break crusader SAY_PERSUADED2'),
   (-1609016, 'The Light that guides us. The movement was set in motion before you came... We... We do as we are told. It is what must be done.',0,0,0,20,'break crusader SAY_PERSUADED3'),
   (-1609017, 'I know very little else... The High General chooses who may go and who must stay behind. There\'s nothing else... You must believe me!',0,0,0,20,'break crusader SAY_PERSUADED4'),
   (-1609018, 'LIES! The pain you are about to endure will be talked about for years to come!',0,0,0,0,'break crusader SAY_PERSUADED5'),
   (-1609019, 'NO! PLEASE! There is one more thing that I forgot to mention... A courier comes soon... From Hearthglen. It...',0,0,0,20,'break crusader SAY_PERSUADED6'),
-- Ambush At The Overlook
   (-1609020, 'Hrm, what a strange tree. I must investigate.',0,0,0,0,'Scarlet Courier SAY_TREE1'),
   (-1609021, 'What''s this!? This isn''t a tree at all! Guards! Guards!',0,0,0,0,'Scarlet Courier SAY_TREE2'),
-- Bloody Breakout
   (-1609022, 'I\'ll need to get my runeblade and armor... Just need a little more time.',0,0,0,399,'Koltira Deathweaver SAY_BREAKOUT1'),
   (-1609023, 'I\'m still weak, but I think I can get an anti-magic barrier up. Stay inside it or you\'ll be destroyed by their spells.',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT2'),
   (-1609024, 'Maintaining this barrier will require all of my concentration. Kill them all!',0,0,0,16,'Koltira Deathweaver SAY_BREAKOUT3'),
   (-1609025, 'There are more coming. Defend yourself! Don\'t fall out of the anti-magic field! They\'ll tear you apart without its protection!',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT4'),
   (-1609026, 'I can\'t keep barrier up much longer... Where is that coward?',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT5'),
   (-1609027, 'The High Inquisitor comes! Be ready, death knight! Do not let him draw you out of the protective bounds of my anti-magic field! Kill him and take his head!',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT6'),
   (-1609028, 'Stay in the anti-magic field! Make them come to you!',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT7'),
   (-1609029, 'The death of the High Inquisitor of New Avalon will not go unnoticed. You need to get out of here at once! Go, before more of them show up. I\'ll be fine on my own.',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT8'),
   (-1609030, 'I\'ll draw their fire, you make your escape behind me.',0,0,0,0,'Koltira Deathweaver SAY_BREAKOUT9'),
   (-1609031, 'Your High Inquisitor is nothing more than a pile of meat, Crusaders! There are none beyond the grasp of the Scourge!',0,1,0,0,'Koltira Deathweaver SAY_BREAKOUT10'),
   (-1609032, 'The Crusade will purge your kind from this world!',0,1,0,0,'High Inquisitor Valroth start'),
   (-1609033, 'It seems that I\'ll need to deal with you myself. The High Inquisitor comes for you, Scourge!',0,1,0,0,'High Inquisitor Valroth aggro'),
   (-1609034, 'You have come seeking deliverance? I have come to deliver!',0,0,0,0,'High Inquisitor Valroth yell'),
   (-1609035, 'LIGHT PURGE YOU!',0,0,0,0,'High Inquisitor Valroth yell'),
   (-1609036, 'Coward!',0,0,0,0,'High Inquisitor Valroth yell'),
   (-1609037, 'High Inquisitor Valroth\'s remains fall to the ground.',0,2,0,0,'High Inquisitor Valroth death');

-- Koltira Deathweaver waypoint
DELETE FROM script_waypoint WHERE entry=28912;
INSERT INTO script_waypoint VALUES
   (28912, 0, 1653.518, -6038.374, 127.585, 1000, 'Jump off'),
   (28912, 1, 1653.978, -6034.614, 127.585, 5000, 'To Box'),
   (28912, 2, 1653.854, -6034.726, 127.585, 0, 'Equip'),
   (28912, 3, 1652.297, -6035.671, 127.585, 1000, 'Recover'),
   (28912, 4, 1639.762, -6046.343, 127.948, 0, 'Escape'),
   (28912, 5, 1640.963, -6028.119, 134.740, 0, ''),
   (28912, 6, 1625.805, -6029.197, 134.740, 0, ''),
   (28912, 7, 1626.845, -6015.085, 134.740, 0, ''),
   (28912, 8, 1649.150, -6016.975, 133.240, 0, ''),
   (28912, 9, 1653.063, -5974.844, 132.652, 5000, 'Mount'),
   (28912, 10, 1654.747, -5926.424, 121.191, 0, 'Disappear');

DELETE FROM script_texts WHERE entry BETWEEN -1609153 AND -1609101;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- A Special Surprise
   (-1609101, 'Come to finish the job, have you?',0,0,0,1,'A Special Surprise'),
   (-1609102, 'Come to finish the job, have ye?',0,0,0,1,'A Special Surprise'),
   (-1609103, 'Come ta finish da job, mon?',0,0,0,1,'A Special Surprise'),
   (-1609104, 'You\'ll look me in the eyes when...',0,0,0,25,'A Special Surprise'),
   (-1609105, 'Well this son o\' Ironforge would like...',0,0,0,25,'A Special Surprise'),
   (-1609106, 'Ironic, isn\'t it? To be killed...',0,0,0,25,'A Special Surprise'),
   (-1609107, 'If you\'d allow me just one...',0,0,0,25,'A Special Surprise'),
   (-1609108, 'I\'d like to stand for...',0,0,0,25,'A Special Surprise'),
   (-1609109, 'I want to die like an orc...',0,0,0,25,'A Special Surprise'),
   (-1609110, 'Dis troll gonna stand for da...',0,0,0,25,'A Special Surprise'),
   (-1609111, '$N?',0,0,0,1,'A Special Surprise'),
   (-1609112, '$N? Mon?',0,0,0,1,'A Special Surprise'),
   (-1609113, '$N, I\'d recognize that face anywhere... What... What have they done to you, $N?',0,0,0,1,'A Special Surprise'),
   (-1609114, '$N, I\'d recognize those face tentacles anywhere... What... What have they done to you, $N?',0,0,0,1,'A Special Surprise'),
   (-1609115, '$N, I\'d recognize that face anywhere... What... What have they done to ye, lad/lass?',0,0,0,1,'A Special Surprise'),
   (-1609116, '$N, I\'d recognize that decay anywhere... What... What have they done to you, $N?',0,0,0,1,'A Special Surprise'),
   (-1609117, '$N, I\'d recognize those horns anywhere... What have they done to you, $N?',0,0,0,1,'A Special Surprise'),
   (-1609118, '$N, I\'d recognize dem tusks anywhere... What... What have dey done ta you, mon?',0,0,0,1,'A Special Surprise'),
   (-1609119, 'You don\'t remember me, do you? Blasted Scourge... They\'ve tried to drain you of everything that made you a righteous force of reckoning. Every last ounce of good... Everything that made you a draenei!',0,0,0,1,'A Special Surprise'),
   (-1609120, 'Ye don\'t remember me, do ye? Blasted Scourge... They\'ve tried to drain ye o\' everything that made ye a righteous force o\' reckoning. Every last ounce o\' good... Everything that made you a son/daughter of Ironforge!',0,0,0,1,'A Special Surprise'),
   (-1609121, 'You don\'t remember me, do you? We were humans once - long, long ago - until Lordaeron fell to the Scourge. Your transformation to a Scourge zombie came shortly after my own. Not long after that, our minds were freed by the Dark Lady.',0,0,0,1,'A Special Surprise'),
   (-1609122, 'You don\'t remember me, do you? Blasted Scourge... They\'ve tried to drain you of everything that made you a pint-sized force of reckoning. Every last ounce of good... Everything that made you a gnome!',0,0,0,1,'A Special Surprise'),
   (-1609123, 'You don\'t remember me, do you? Blasted Scourge...They\'ve tried to drain of everything that made you a righteous force of reckoning. Every last ounce of good...Everything that made you a human!',0,0,0,1,'A Special Surprise'),
   (-1609124, 'You don\'t remember me? When you were a child your mother would leave you in my care while she served at the Temple of the Moon. I held you in my arms and fed you with honey and sheep\'s milk to calm you until she would return. You were my little angel. Blasted Scourge... What have they done to you, $N?',0,0,0,1,'A Special Surprise'),
   (-1609125, 'You don\'t recognize me, do you? Blasted Scourge... They\'ve tried to drain you of everything that made you a righteous force of reckoning. Every last ounce of good... Everything that made you an orc!',0,0,0,1,'A Special Surprise'),
   (-1609126, 'You don\'t remember me, do you? Blasted Scourge... They\'ve tried to drain you of everything that made you a righteous force of reckoning. Every last ounce of good... Everything that made you a tauren!',0,0,0,1,'A Special Surprise'),
   (-1609127, 'You don\'t remember me, mon? Damn da Scourge! Dey gone ta drain you of everytin dat made ya a mojo masta. Every last ounce of good... Everytin\' dat made ya a troll hero, mon!',0,0,0,1,'A Special Surprise'),
   (-1609128, 'A pact was made, brother! We vowed vengeance against the Lich King! For what he had done to us! We battled the Scourge as Forsaken, pushing them back into the plaguelands and freeing Tirisfal! You and I were champions of the Forsaken!',0,0,0,1,'A Special Surprise'),
   (-1609129, 'You must remember the splendor of life, brother/sister. You were a champion of the Kaldorei once! This isn\'t you!',0,0,0,1,'A Special Surprise'),
   (-1609130, 'Think, $N. Think back. Try and remember the majestic halls of Silvermoon City, where you were born. Remember the splendor of life, brother. You were a champion of the sin\'dorei once! This isn\'t you.',0,0,0,6,'A Special Surprise'),
   (-1609131, 'Think, $N. Think back. Try and remember the proud mountains of Argus, where you were born. Remember the splendor of life, <brother/sister>. You were a champion of the draenei once! This isn\'t you.',0,0,0,6,'A Special Surprise'),
   (-1609132, 'Think, $N. Think back. Try and remember the snow capped mountains o\' Dun Morogh! Ye were born there, lass. Remember the splendor o\' life, $N! Ye were a champion o\' the dwarves once! This isn\'t ye!',0,0,0,6,'A Special Surprise'),
   (-1609133, 'Think, $N. Think back. Try and remember Gnomeregan before those damned troggs! Remember the feel of an [arclight spanner] <brother/sister>. You were a champion of gnome-kind once! This isn\'t you.',0,0,0,6,'A Special Surprise'),
   (-1609134, 'Think, $N. Think back. Try and remember the hills and valleys of Elwynn, where you were born. Remember the splendor of life, <brother/sister>. You were a champion of the Alliance once! This isn\'t you.',0,0,0,6,'A Special Surprise'),
   (-1609135, 'Think, $N. Think back. Try and remember Durotar, brother! Remember the sacrifices our heroes made so that we could be free of the blood curse. Harken back to the Valley of Trials, where we were reborn into a world without demonic influence. We found the splendor of life, $N. Together! This isn\'t you. You were a champion of the Horde once!',0,0,0,6,'A Special Surprise'),
   (-1609136, 'Think, $N. Think back. Try and remember the rolling plains of Mulgore, where you were born. Remember the splendor of life, <brother/sister>. You were a champion of the tauren once! This isn\'t you.',0,0,0,6,'A Special Surprise'),
   (-1609137, 'TINK $N. Tink back, mon! We be Darkspear, mon! Bruddas and sistas! Remember when we fought the Zalazane and done took he head and freed da Echo Isles? MON! TINK! You was a champion of da Darkspear trolls!',0,0,0,6,'A Special Surprise'),
   (-1609138, 'Listen to me, $N. You must fight against the Lich King\'s control. He is a monster that wants to see this world - our world - in ruin. Don\'t let him use you to accomplish his goals. You were once a hero and you can be again. Fight, damn you! Fight his control!',0,0,0,5,'A Special Surprise'),
   (-1609139, 'Listen to me, $N Ye must fight against the Lich King\'s control. He\'s a monster that wants to see this world - our world - in ruin. Don\'t let him use ye to accomplish his goals. Ye were once a hero and ye can be again. Fight, damn ye! Fight his control!',0,0,0,5,'A Special Surprise'),
   (-1609140, 'Listen to me, $N. You must fight against the Lich King\'s control. He is a monster that wants to see this world - our world - in ruin. Don\'t let him use you to accomplish his goals AGAIN. You were once a hero and you can be again. Fight, damn you! Fight his control!',0,0,0,5,'A Special Surprise'),
   (-1609141, 'Listen ta me, brudda/sista. You must fight against da Lich King\'s control. He be a monstar dat want ta see dis world - our world - be ruined. Don\'t let he use you ta accomplish he goals. You be a hero once and you be a hero again! Fight it, mon! Fight he control!',0,0,0,5,'A Special Surprise'),
   (-1609142, 'What\'s going on in there? What\'s taking so long, $N?',0,6,0,0,'A Special Surprise - Knight Commander Plaguefist'),
   (-1609143, 'There... There\'s no more time for me. I\'m done for. Finish me off, $N. Do it or they\'ll kill us both. $N... Remember Silvermoon. This world is worth saving!',0,0,0,18,'A Special Surprise'),
   (-1609144, 'There... There\'s no more time for me. I\'m done for. Finish me off, $N. Do it or they\'ll kill us both. $N... Remember Argus. Don\'t let that happen to this world.',0,0,0,18,'A Special Surprise'),
   (-1609145, 'There... There\'s no more time for me. I\'m done for. Finish me off, $N. Do it or they\'ll kill us both $N... For KHAAAAAAAAZZZ MODAAAAAANNNNNN!!!',0,0,0,18,'A Special Surprise'),
   (-1609146, 'There... There\'s no more time for me. I\'m done for. Finish me off, $N. Do it or they\'ll kill us both. $N... Remember Tirisfal! This world is worth saving!',0,0,0,18,'A Special Surprise'),
   (-1609147, 'There... There\'s no more time for me. I\'m done for. Finish me off, $N. Do it or they\'ll kill us both. $N... Remember Gnomeregan! This world is worth saving.',0,0,0,18,'A Special Surprise'),
   (-1609148, 'There...There\'s no more time for me. I\'m done for. FInish me off, $N. Do it or they\'ll kill us both. $N...Remember Elwynn. This world is worth saving.',0,0,0,18,'A Special Surprise'),
   (-1609149, 'There... There\'s no more time for me. I\'m done for. Finish me off, $N. Do it or they\'ll kill us both. $N... Remember Teldrassil, our beloved home. This world is worth saving.',0,0,0,18,'A Special Surprise'),
   (-1609150, 'There... There\'s no more time for me. I\'m done for. Finish me off, $N. Do it or they\'ll kill us both. $N... For the Horde! This world is worth saving.',0,0,0,18,'A Special Surprise'),
   (-1609151, 'There... There\'s no more time for me. I\'m done for. Finish me off, $N. Do it or they\'ll kill us both. $N... Remember Mulgore. This world is worth saving.',0,0,0,18,'A Special Surprise'),
   (-1609152, 'Der... Der\'s no more time for me. I be done for. Finish me off $N. Do it or they\'ll kill us both. $N... Remember Sen\'jin Village, mon! Dis world be worth saving!',0,0,0,18,'A Special Surprise'),
   (-1609153, 'Do it, $N! Put me out of my misery!',0,0,0,1,'A Special Surprise');

DELETE FROM script_texts WHERE entry BETWEEN -1609286 AND -1609201;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- The Light of Dawn
-- pre text
   (-1609201, 'Soldiers of the Scourge, stand ready! You will soon be able to unleash your fury upon the Argent Dawn!',14677,1,0,0,'Highlord Darion Mograine'),
   (-1609202, 'The sky weeps at the devastation of sister earth! Soon, tears of blood will rain down upon us!',14678,1,0,0,'Highlord Darion Mograine'),
   (-1609203, 'Death knights of Acherus, the death march begins!',14681,1,0,0,'Highlord Darion Mograine'),
-- intro
   (-1609204, 'Soldiers of the Scourge, death knights of Acherus, minions of the darkness: hear the call of the Highlord!',14679,1,0,22,'Highlord Darion Mograine'),
   (-1609205, 'RISE!',14680,1,0,15,'Highlord Darion Mograine'),
   (-1609206, 'The skies turn red with the blood of the fallen! The Lich King watches over us, minions! Onward! Leave only ashes and misery in your destructive wake!',14682,1,0,25,'Highlord Darion Mograine'),
-- During the fight
   (-1609207, 'Scourge armies approach!',0,1,0,0,'Korfax, Champion of the Light'),
   (-1609208, 'Stand fast, brothers and sisters! The Light will prevail!',14487,1,0,0,'Lord Maxwell Tyrosus'),
   (-1609209, 'Kneel before the Highlord!',14683,0,0,0,'Highlord Darion Mograine'),
   (-1609210, 'You stand no chance!',14684,0,0,0,'Highlord Darion Mograine'),
   (-1609211, 'The Scourge will destroy this place!',14685,0,0,0,'Highlord Darion Mograine'),
   (-1609212, 'Your life is forfeit.',14686,0,0,0,'Highlord Darion Mograine'),
   (-1609213, 'Life is meaningless without suffering.',14687,0,0,0,'Highlord Darion Mograine'),
   (-1609214, 'How much longer will your forces hold out?',14688,0,0,0,'Highlord Darion Mograine'),
   (-1609215, 'The Argent Dawn is finished!"',14689,0,0,0,'Highlord Darion Mograine'),
   (-1609216, 'Spare no one!',14690,0,0,0,'Highlord Darion Mograine'),
   (-1609217, 'What is this?! My... I cannot strike...',14691,0,0,0,'Highlord Darion Mograine'),
   (-1609218, 'Obey me, blade!',14692,1,0,0,'Highlord Darion Mograine'),
   (-1609219, 'You will do as I command! I am in control here!',14693,0,0,0,'Highlord Darion Mograine'),
   (-1609220, 'I can not... the blade fights me.',14694,0,0,0,'Highlord Darion Mograine'),
   (-1609221, 'What is happening to me?',14695,0,0,0,'Highlord Darion Mograine'),
   (-1609222, 'Power...wanes...',14696,0,0,0,'Highlord Darion Mograine'),
   (-1609223, 'Ashbringer defies me...',14697,0,0,0,'Highlord Darion Mograine'),
   (-1609224, 'Minions, come to my aid!',14698,0,0,0,'Highlord Darion Mograine'),
-- After the fight
   (-1609225, 'You cannot win, Darion!',14584,1,0,0,'Highlord Tirion Fordring'),
   (-1609226, 'Bring them before the chapel!',14585,1,0,0,'Highlord Tirion Fordring'),
   (-1609227, 'Stand down, death knights. We have lost... The Light... This place... No hope...',14699,0,0,68,'Highlord Darion Mograine'),
   (-1609228, 'Have you learned nothing, boy? You have become all that your father fought against! Like that coward, Arthas, you allowed yourself to be consumed by the darkness...the hate... Feeding upon the misery of those you tortured and killed!',14586,0,0,378,'Highlord Tirion Fordring'),
   (-1609229, 'Your master knows what lies beneath the chapel. It is why he dares not show his face! He\'s sent you and your death knights to meet their doom, Darion.',14587,0,0,25,'Highlord Tirion Fordring'),
   (-1609230, 'What you are feeling right now is the anguish of a thousand lost souls! Souls that you and your master brought here! The Light will tear you apart, Darion!',14588,0,0,1,'Highlord Tirion Fordring'),
   (-1609231, 'Save your breath, old man. It might be the last you ever draw.',14700,0,0,25,'Highlord Darion Mograine'),
   (-1609232, 'My son! My dear, beautiful boy!',14493,0,0,0,'Highlord Alexandros Mograine'),
   (-1609233, 'Father!',14701,0,0,5,'Highlord Darion Mograine'),
   (-1609234, 'Argh...what...is...',14702,0,0,68,'Highlord Darion Mograine'),
   (-1609235, 'Father, you have returned!',14703,0,0,0,'Darion Mograine'),
   (-1609236, 'You have been gone a long time, father. I thought...',14704,0,0,0,'Darion Mograine'),
   (-1609237, 'Nothing could have kept me away from here, Darion. Not from my home and family.',14494,0,0,1,'Highlord Alexandros Mograine'),
   (-1609238, 'Father, I wish to join you in the war against the undead. I want to fight! I can sit idle no longer!',14705,0,0,6,'Darion Mograine'),
   (-1609239, 'Darion Mograine, you are barely of age to hold a sword, let alone battle the undead hordes of Lordaeron! I couldn\'t bear losing you. Even the thought...',14495,0,0,1,'Highlord Alexandros Mograine'),
   (-1609240, 'If I die, father, I would rather it be on my feet, standing in defiance against the undead legions! If I die, father, I die with you!',14706,0,0,6,'Darion Mograine'),
   (-1609241, 'My son, there will come a day when you will command the Ashbringer and, with it, mete justice across this land. I have no doubt that when that day finally comes, you will bring pride to our people and that Lordaeron will be a better place because of you. But, my son, that day is not today.',14496,0,0,1,'Highlord Alexandros Mograine'),
   (-1609242, 'Do not forget...',14497,0,0,6,'Highlord Alexandros Mograine'),
   (-1609243, 'Touching...',14803,1,0,0,'The Lich King'),
   (-1609244, 'You have\'ve betrayed me! You betrayed us all you monster! Face the might of Mograine!',14707,1,0,0,'Highlord Darion Mograine'),
   (-1609245, 'He\'s mine now...',14805,0,0,0,'The Lich King'),
   (-1609246, 'Pathetic...',14804,0,0,0,'The Lich King'),
   (-1609247, 'You\'re a damned monster, Arthas!',14589,0,0,25,'Highlord Tirion Fordring'),
   (-1609248, 'You were right, Fordring. I did send them in to die. Their lives are meaningless, but yours...',14806,0,0,1,'The Lich King'),
   (-1609249, 'How simple it was to draw the great Tirion Fordring out of hiding. You\'ve left yourself exposed, paladin. Nothing will save you...',14807,0,0,1,'The Lich King'),
   (-1609250, 'ATTACK!!!',14488,1,0,0,'Lord Maxwell Tyrosus'),
   (-1609251, 'APOCALYPSE!',14808,1,0,0,'The Lich King'),
   (-1609252, 'That day is not today...',14708,0,0,0,'Highlord Darion Mograine'),
   (-1609253, 'Tirion!',14709,1,0,0,'Highlord Darion Mograine'),
   (-1609254, 'ARTHAS!!!!',14591,1,0,0,'Highlord Tirion Fordring'),
   (-1609255, 'What is this?',14809,1,0,0,'The Lich King'),
   (-1609256, 'Your end.',14592,1,0,0,'Highlord Tirion Fordring'),
   (-1609257, 'Impossible...',14810,1,0,0,'The Lich King'),
   (-1609258, 'This... isn\'t... over...',14811,1,0,25,'The Lich King'),
   (-1609259, 'When next we meet it won\'t be on holy ground, paladin.',14812,1,0,1,'The Lich King'),
   (-1609260, 'Rise, Darion, and listen...',14593,0,0,0,'Highlord Tirion Fordring'),
   (-1609261, 'We have all been witness to a terrible tragedy. The blood of good men has been shed upon this soil! Honorable knights, slain defending their lives - our lives!',14594,0,0,0,'Highlord Tirion Fordring'),
   (-1609262, 'And while such things can never be forgotten, we must remain vigilant in our cause!',14595,0,0,0,'Highlord Tirion Fordring'),
   (-1609263, 'The Lich King must answer for what he has done and must not be allowed to cause further destruction to our world.',14596,0,0,0,'Highlord Tirion Fordring'),
   (-1609264, 'I make a promise to you now, brothers and sisters: The Lich King will be defeated! On this day, I call for a union.',14597,0,0,0,'Highlord Tirion Fordring'),
   (-1609265, 'The Argent Dawn and the Order of the Silver Hand will come together as one! We will succeed where so many before us have failed!',14598,0,0,0,'Highlord Tirion Fordring'),
   (-1609266, 'We will take the fight to Arthas and tear down the walls of Icecrown!',14599,0,0,15,'Highlord Tirion Fordring'),
   (-1609267, 'The Argent Crusade comes for you, Arthas!',14600,1,0,15,'Highlord Tirion Fordring'),
   (-1609268, 'So too do the Knights of the Ebon Blade... While our kind has no place in your world, we will fight to bring an end to the Lich King. This I vow!',14710,0,0,1,'Highlord Darion Mograine'),
-- Emotes
   (-1609269, 'Thousands of Scourge rise up at the Highlord\'s command.',0,2,0,0,''),
   (-1609270, 'The army marches towards Light\'s Hope Chapel.',0,2,0,0,''),
   (-1609271, 'After over a hundred Defenders of the Light fall, Highlord Tirion Fordring arrives.',0,2,0,0,''),
   (-1609272, 'flee',0,2,0,0,'Orbaz'),
   (-1609273, 'kneels in defeat before Tirion Fordring.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609274, 'arrives.',0,2,0,0,'Highlord Alexandros Mograine'),
   (-1609275, 'becomes a shade of his past, and walks up to his father.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609276, 'hugs his father.',0,2,0,0,'Darion Mograine'),
   (-1609277, 'disappears, and the Lich King appears.',0,2,0,0,'Alexandros'),
   (-1609278, 'becomes himself again...and is now angry.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609279, 'casts a spell on Tirion.',0,2,0,0,'The Lich King'),
   (-1609280, 'gasps for air.',0,2,0,0,'Highlord Tirion Fordring'),
   (-1609281, 'casts a powerful spell, killing the Defenders and knocking back the others.',0,2,0,0,'The Lich King'),
   (-1609282, 'throws the Corrupted Ashbringer to Tirion, who catches it. Tirion becomes awash with Light, and the Ashbringer is cleansed.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609283, 'collapses.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609284, 'charges towards the Lich King, Ashbringer in hand and strikes the Lich King.',0,2,0,0,'Highlord Tirion Fordring'),
   (-1609285, 'disappears. Tirion walks over to where Darion lay',0,2,0,0,'The Lich King'),
   (-1609286, 'Light washes over the chapel �X the Light of Dawn is uncovered.',0,2,0,0,'');


DELETE FROM script_waypoint WHERE entry=29173;
INSERT INTO script_waypoint VALUES
   (29173, 0, 2431.639, -5137.05, 83.843, 0, 'intro'),
   (29173, 1, 2319.242, -5266.486, 82.825, 0, 'summon & on hold'),
   (29173, 2, 2318.775, -5266.832, 82.783, 0, 'cast light of dawn'),
   (29173, 3, 2280.812, -5284.091, 82.608, 0, 'move to here and start'),
   (29173, 4, 2280.727, -5286.839, 82.930, 0, 'move forward to talk'),
   (29173, 5, 2280.812, -5284.091, 82.608, 0, 'when baba pop'),
   (29173, 6, 2281.461, -5263.014, 81.164, 0, 'charge to lich king'),
   (29173, 7, 2257.479, -5296.702, 82.165, 0, 'being kicked by Lich King'),
   (29173, 8, 2261.237, -5294.983, 82.167, 0, 'throw'),
   (29173, 9, 2259.34, -5294.379, 82.167, 0, 'event end');


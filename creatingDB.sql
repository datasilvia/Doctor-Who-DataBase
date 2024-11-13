Use Doctor_Who;

DROP TABLE IF EXISTS doctor_companion;
DROP TABLE IF EXISTS episode_enemy;
DROP TABLE IF EXISTS episode_companion;
DROP TABLE IF EXISTS episodes;
DROP TABLE IF EXISTS doctors; 
DROP TABLE IF EXISTS companions;

DROP TABLE IF EXISTS enemies;



CREATE TABLE doctors(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	actor VARCHAR(80),
	regeneration INT,
	first_appearance YEAR);

CREATE TABLE companions(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	actor VARCHAR(80),
	first_appearance YEAR);

CREATE TABLE doctor_companion (
    doctor_id INT,
    companion_id INT,
    PRIMARY KEY (doctor_id, companion_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id),
    FOREIGN KEY (companion_id) REFERENCES companions(id));

CREATE TABLE enemies(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	description VARCHAR(200),
	first_appearance YEAR);

CREATE TABLE episodes(
	id INT PRIMARY KEY,
	name VARCHAR(200),
	description VARCHAR(200),
    year YEAR,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id));

CREATE TABLE episode_enemy(
    episode_id INT,
    enemy_id INT,
    PRIMARY KEY (episode_id, enemy_id),
    FOREIGN KEY (episode_id) REFERENCES episodes(id),
    FOREIGN KEY (enemy_id) REFERENCES enemies(id));
    
CREATE TABLE episode_companion (
    episode_id INT,
    companion_id INT,
    PRIMARY KEY (episode_id, companion_id),
    FOREIGN KEY (episode_id) REFERENCES episodes(id),
    FOREIGN KEY (companion_id) REFERENCES companions(id)
);

    

INSERT INTO doctors (id, name, actor, regeneration, first_appearance) VALUES
(1, 'First Doctor', 'William Hartnell', 1, 1963),
(2, 'Second Doctor', 'Patrick Troughton', 2, 1966),
(3, 'Third Doctor', 'Jon Pertwee', 3, 1970),
(4, 'Fourth Doctor', 'Tom Baker', 4, 1974),
(5, 'Fifth Doctor', 'Peter Davison', 5, 1981),
(6, 'Sixth Doctor', 'Colin Baker', 6, 1984),
(7, 'Seventh Doctor', 'Sylvester McCoy', 7, 1987),
(8, 'Eighth Doctor', 'Paul McGann', 8, 1996),
(9, 'Ninth Doctor', 'Christopher Eccleston', 9, 2005),
(10, 'Tenth Doctor', 'David Tennant', 10, 2005),
(11, 'Eleventh Doctor', 'Matt Smith', 11, 2010),
(12, 'Twelfth Doctor', 'Peter Capaldi', 12, 2013),
(13, 'Thirteenth Doctor', 'Jodie Whittaker', 13, 2017),
(14, 'Fourteenth Doctor', 'David Tennant', 14, 2022),  
(15, 'Fifteenth Doctor', 'Ncuti Gatwa', 15, 2023);

INSERT INTO companions (id, name, actor, first_appearance) VALUES
(1, 'Sarah Jane Smith', 'Elisabeth Sladen', 1973),
(2, 'Rose Tyler', 'Billie Piper', 2005),
(3, 'Jack Harkness', 'John Barrowman', 2005),
(4, 'Donna Noble', 'Catherine Tate', 2006),
(5, 'Martha Jones', 'Freema Agyeman', 2007),
(6, 'River Song', 'Alex Kingston', 2008),
(7, 'Amy Pond', 'Karen Gillan', 2010),
(8, 'Rory Williams', 'Arthur Darvill', 2010),
(9, 'Clara Oswald', 'Jenna Coleman', 2012),
(10, 'Yasmin Khan', 'Mandip Gill', 2018),
(11, 'Graham O’Brien', 'Bradley Walsh', 2018),
(12, 'Dan Lewis', 'John Bishop', 2021);

INSERT INTO enemies (id, name, description, first_appearance) VALUES
(1, 'Daleks', 'Alien robots with a single purpose: exterminate all other life forms.', 1963),
(2, 'Cybermen', 'Humans who have been converted into emotionless robots.', 1966),
(3, 'The Great Intelligence', 'A mysterious entity that seeks to control minds and gather power.', 1967),
(4, 'Autons', 'Living plastic creatures controlled by the Nestene Consciousness.', 1970),
(5, 'Silurians', 'An ancient reptilian species that lived on Earth before humans.', 1970),
(6, 'The Master', 'The Doctor\'s arch-nemesis, a Time Lord with a desire for power.', 1971),
(7, 'Sea Devils', 'Aquatic cousins of the Silurians with a similarly ancient origin.', 1972),
(8, 'Sontarans', 'A clone warrior race bred for battle.', 1973),
(9, 'Omega', 'One of the founders of Time Lord society, now a powerful but vengeful entity.', 1973),
(10, 'Zygons', 'Shape-shifting aliens with a warlike nature.', 1975),
(11, 'Davros', 'Creator of the Daleks, a brilliant but twisted scientist.', 1975),
(12, 'Morbius', 'A rogue Time Lord whose consciousness survived his execution.', 1976),
(13, 'The Rani', 'A renegade Time Lord with a penchant for scientific experimentation.', 1985),
(14, 'Judoon', 'Rhinoceros-like space police who strictly follow orders.', 2007),
(15, 'Weeping Angels', 'Statues that only move when they are not being observed.', 2007),
(17, 'Krafayis', 'An invisible alien creature that haunts Vincent van Gogh.', 2010),
(16, 'The Silence', 'A species that causes people to forget about them when they look away.', 2011);

INSERT INTO episodes (id, name, description, year, doctor_id) VALUES
(1, 'The Silurians', 'The Third Doctor encounters the ancient Silurians on Earth.', 1970, 3),
(2, 'Terror of the Autons', 'The Master uses the Autons to try to conquer Earth.', 1971, 3),
(3, 'The Sea Devils', 'The Doctor and UNIT face the Sea Devils.', 1972, 3),
(4, 'Genesis of the Daleks', 'The Fourth Doctor confronts Davros, creator of the Daleks.', 1975, 4),
(5, 'The Five Doctors', 'The Doctor’s past selves are brought together to face the Master and other threats.', 1983, 5),
(6, 'Rose', 'The Doctor meets Rose Tyler and they face the Autons.', 2005, 9),
(7, 'Doomsday', 'A battle between the Daleks and Cybermen threatens the Earth.', 2006, 10),
(8, 'Blink', 'The Doctor and Sally Sparrow encounter the terrifying Weeping Angels.', 2007, 10),
(9, 'The Sontaran Stratagem', 'The Tenth Doctor faces the Sontarans and their plan to poison the Earth.', 2008, 10),
(10, 'The Eleventh Hour', 'The Eleventh Doctor regenerates and meets Amy Pond.', 2010, 11),
(11, 'Vincent and the Doctor', 'The Doctor and Amy travel to 1890s France to help Vincent van Gogh confront an alien menace.', 2010, 11),
(12, 'The Pandorica Opens', 'The Doctor faces many enemies as he is trapped in the Pandorica.', 2010, 11),
(13, 'The Day of the Doctor', 'A multi-Doctor adventure that saves Gallifrey.', 2013, 11),
(14, 'The Time of the Doctor', 'The Doctor faces the Daleks, Cybermen, and the Silence on Trenzalore.', 2013, 11),
(15, 'The Zygon Invasion', 'Zygons attempt to infiltrate Earth using their shape-shifting abilities.', 2015, 12),
(16, 'The Doctor Falls', 'The Twelfth Doctor battles the Cybermen and faces regeneration.', 2017, 12),
(17, 'The Haunting of Villa Diodati', 'The Doctor encounters a new Cyberman in 1816.', 2020, 13);

INSERT INTO doctor_companion (doctor_id, companion_id) VALUES
(3, 1),    -- Sarah Jane Smith with the Third Doctor
(9, 2),    -- Rose Tyler with the Ninth Doctor
(9, 3),    -- Jack Harkness with the Ninth Doctor
(10, 2),   -- Rose Tyler with the Tenth Doctor
(10, 3),   -- Jack Harkness with the Tenth Doctor
(10, 4),   -- Donna Noble with the Tenth Doctor
(10, 5),   -- Martha Jones with the Tenth Doctor
(11, 7),   -- Amy Pond with the Eleventh Doctor
(11, 8),   -- Rory Williams with the Eleventh Doctor
(11, 6),   -- River Song with the Eleventh Doctor
(12, 9),   -- Clara Oswald with the Twelfth Doctor
(13, 10),  -- Yasmin Khan with the Thirteenth Doctor
(13, 11),  -- Graham O’Brien with the Thirteenth Doctor
(13, 12);  -- Dan Lewis with the Thirteenth Doctor

INSERT INTO episode_enemy (episode_id, enemy_id) VALUES
(1, 5),    -- Silurians in "The Silurians"
(2, 4),    -- Autons in "Terror of the Autons"
(2, 6),    -- The Master in "Terror of the Autons"
(3, 7),    -- Sea Devils in "The Sea Devils"
(4, 1),    -- Daleks in "Genesis of the Daleks"
(4, 11),   -- Davros in "Genesis of the Daleks"
(5, 6),    -- The Master in "The Five Doctors"
(6, 4),    -- Autons in "Rose"
(7, 1),    -- Daleks in "Doomsday"
(7, 2),    -- Cybermen in "Doomsday"
(8, 15),   -- Weeping Angels in "Blink"
(9, 8),    -- Sontarans in "The Sontaran Stratagem"
(10, 10),  -- Zygons in "The Day of the Doctor"
(11, 17),  -- Krafayis in "Vincent and the Doctor"
(12, 1),   -- Daleks in "The Pandorica Opens"
(12, 10),  -- Zygons in "The Pandorica Opens"
(13, 1),   -- Daleks in "The Time of the Doctor"
(13, 2),   -- Cybermen in "The Time of the Doctor"
(13, 16),  -- The Silence in "The Time of the Doctor"
(14, 10),  -- Zygons in "The Zygon Invasion"
(15, 2),   -- Cybermen in "The Doctor Falls"
(16, 2);   -- Cybermen in "The Haunting of Villa Diodati"

INSERT INTO episode_companion (episode_id, companion_id) VALUES
(6, 2),    -- Rose Tyler in "Rose"
(7, 2),    -- Rose Tyler in "Doomsday"
(7, 3),    -- Jack Harkness in "Doomsday"
(8, 2),    -- Rose Tyler in "Blink" (not an actual appearance, but an Easter egg reference)
(9, 5),    -- Martha Jones in "The Sontaran Stratagem"
(10, 7),   -- Amy Pond in "The Eleventh Hour"
(11, 7),   -- Amy Pond in "Vincent and the Doctor"
(11, 8),   -- Rory Williams in "Vincent and the Doctor"
(12, 7),   -- Amy Pond in "The Pandorica Opens"
(12, 8),   -- Rory Williams in "The Pandorica Opens"
(13, 6),   -- River Song in "The Day of the Doctor"
(16, 9),   -- Clara Oswald in "The Doctor Falls"
(17, 10);  -- Yasmin Khan in "The Haunting of Villa Diodati"


































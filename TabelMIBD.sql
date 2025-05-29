DROP TABLE Kanal

CREATE TABLE Kanal(
	idKanal varchar(25) PRIMARY KEY,
	nama varchar(25),
	isGroup INT,
	pass INT,
	--gambar BLOB,
	link varchar(50),
	dscp varchar(100)
)
CREATE TABLE Pengguna(
	email varchar(30) PRIMARY KEY,
	idKanalPribadi varchar(25) FOREIGN KEY REFERENCES Kanal
)
CREATE TABLE Subscription(
	idKanal1 varchar(25) FOREIGN KEY REFERENCES Kanal,
	idKanal2 varchar(25) FOREIGN KEY REFERENCES Kanal
)
CREATE TABLE Posisi(
	accessGroup INT PRIMARY KEY,
	gelar varchar(15)
)
CREATE TABLE PosisiPenggunaGroup(
	email varchar(30) FOREIGN KEY REFERENCES Pengguna,
	idKanal varchar(25) FOREIGN KEY REFERENCES Kanal,
	accessGroup INT FOREIGN KEY REFERENCES Posisi,
	statusUndangan INT,
	PRIMARY KEY (email,idKanal)
)

CREATE TABLE Video (
    idVideo varchar(15) PRIMARY KEY,
    description varchar(500),
    judul varchar(30),
    waktu datetime,
	isPublished INT,
	uploader varchar(30) FOREIGN KEY REFERENCES Pengguna,
	location varchar(25) FOREIGN KEY REFERENCES Kanal
)
CREATE TABLE Caption (
    idPengunggah varchar(30) FOREIGN KEY REFERENCES Pengguna,
	idVideo varchar(15) FOREIGN KEY REFERENCES Video,
	subtitle varchar(50),
	timestamp INT
)
CREATE TABLE Tonton (
	idPenonton varchar(25) FOREIGN KEY REFERENCES Kanal,
	idVideo varchar(15) FOREIGN KEY REFERENCES Video,
	likes INT,
	duration INT,
	PRIMARY KEY (idPenonton, idVideo)
)
CREATE TABLE Thread(
	idVideo varchar(15) FOREIGN KEY REFERENCES Video,
	number INT,
	PRIMARY KEY (idVideo, number)
)
CREATE TABLE Komentar(
	idVideo varchar(15),
	threadNumber INT,
	FOREIGN KEY (idVideo, threadNumber) REFERENCES Thread,
	Waktu datetime,
	uploader varchar(25) FOREIGN KEY REFERENCES Kanal,
	message varchar(200),
	PRIMARY KEY (idVideo, threadNumber, Waktu, uploader)
)


-- Insert data into Kanal table
INSERT INTO Kanal (idKanal, nama, isGroup, pass, link, dscp) VALUES
('UC001', 'TechReviews', 0, NULL, 'techreviews', 'Latest technology reviews and unboxings'),
('UC002', 'CookingMaster', 0, NULL, 'cookingmaster', 'Delicious recipes from around the world'),
('UC003', 'GamingNation', 1, 1234, 'gamingnation', 'Group of professional gamers'),
('UC004', 'TravelVlogs', 0, NULL, 'travelvlogs', 'Beautiful travel destinations'),
('UC005', 'MusicLovers', 1, 5678, 'musiclovers', 'Community for music enthusiasts'),
('UC006', 'FitnessGuru', 0, NULL, 'fitnessguru', 'Workout routines and fitness tips'),
('UC007', 'JohnDoe', 0, NULL, 'johndoe', 'Personal channel of John Doe'),
('UC008', 'JaneSmith', 0, NULL, 'janesmith', 'Personal channel of Jane Smith'),
('UC009', 'MovieBuff', 1, 9012, 'moviebuff', 'Movie discussion group'),
('UC010', 'ScienceGeek', 0, NULL, 'sciencegeek', 'Science experiments and facts');

-- Insert data into Pengguna table
INSERT INTO Pengguna (email, idKanalPribadi) VALUES
('john.doe@email.com', 'UC007'),
('jane.smith@email.com', 'UC008'),
('alice.wonder@email.com', NULL),
('bob.marley@email.com', NULL),
('charlie.chaplin@email.com', NULL),
('diana.prince@email.com', NULL),
('edward.snow@email.com', NULL),
('fiona.green@email.com', NULL),
('george.washington@email.com', NULL),
('harry.potter@email.com', NULL);

-- Insert data into Subscription table
INSERT INTO Subscription (idKanal1, idKanal2) VALUES
('UC007', 'UC001'),
('UC007', 'UC002'),
('UC008', 'UC001'),
('UC008', 'UC004'),
('UC001', 'UC002'),
('UC002', 'UC001'),
('UC003', 'UC006'),
('UC004', 'UC010'),
('UC005', 'UC003'),
('UC006', 'UC002');

-- Insert data into Posisi table
INSERT INTO Posisi (accessGroup, gelar) VALUES
(1, 'Viewer'),
(2, 'Contributor'),
(3, 'Moderator'),
(4, 'Admin'),
(5, 'Owner');

-- Insert data into PosisiPenggunaGroup table
INSERT INTO PosisiPenggunaGroup (email, idKanal, accessGroup, statusUndangan) VALUES
('john.doe@email.com', 'UC003', 5, 1),
('jane.smith@email.com', 'UC003', 3, 1),
('alice.wonder@email.com', 'UC003', 2, 1),
('bob.marley@email.com', 'UC005', 5, 1),
('charlie.chaplin@email.com', 'UC005', 1, 1),
('diana.prince@email.com', 'UC009', 4, 1),
('edward.snow@email.com', 'UC009', 2, 1),
('fiona.green@email.com', 'UC009', 1, 0),
('george.washington@email.com', 'UC003', 1, 1),
('harry.potter@email.com', 'UC005', 1, 1);

-- Insert data into Video table
INSERT INTO Video (idVideo, description, judul, waktu, isPublished, uploader, location) VALUES
('VID001', 'Review of the latest smartphone', 'Smartphone X Review', '2023-01-15 14:30:00', 1, 'john.doe@email.com', 'UC001'),
('VID002', 'How to make perfect pasta', 'Pasta Recipe', '2023-01-20 10:15:00', 1, 'jane.smith@email.com', 'UC002'),
('VID003', 'Gameplay of new RPG', 'Epic RPG Gameplay', '2023-02-05 18:45:00', 1, 'alice.wonder@email.com', 'UC003'),
('VID004', 'Beautiful beaches in Bali', 'Bali Travel Guide', '2023-02-10 09:00:00', 1, 'jane.smith@email.com', 'UC004'),
('VID005', 'Cover of popular song', 'Song Cover 2023', '2023-02-15 16:20:00', 0, 'bob.marley@email.com', 'UC005'),
('VID006', 'Full body workout routine', 'Home Workout', '2023-03-01 07:30:00', 1, 'diana.prince@email.com', 'UC006'),
('VID007', 'My daily vlog', 'A Day in My Life', '2023-03-10 12:00:00', 1, 'john.doe@email.com', 'UC007'),
('VID008', 'Art and craft tutorial', 'DIY Craft Ideas', '2023-03-15 15:45:00', 1, 'jane.smith@email.com', 'UC008'),
('VID009', 'Movie review with spoilers', 'Blockbuster Review', '2023-04-01 20:00:00', 1, 'edward.snow@email.com', 'UC009'),
('VID010', 'Cool science experiments', 'Science Fun', '2023-04-05 11:10:00', 1, 'george.washington@email.com', 'UC010');

-- Insert data into Caption table
INSERT INTO Caption (idPengunggah, idVideo, subtitle, timestamp) VALUES
('john.doe@email.com', 'VID001', 'Introduction', 0),
('john.doe@email.com', 'VID001', 'Unboxing', 120),
('john.doe@email.com', 'VID001', 'Final thoughts', 540),
('jane.smith@email.com', 'VID002', 'Ingredients', 0),
('jane.smith@email.com', 'VID002', 'Preparation', 180),
('jane.smith@email.com', 'VID002', 'Cooking', 300),
('alice.wonder@email.com', 'VID003', 'Character creation', 0),
('alice.wonder@email.com', 'VID003', 'First quest', 240),
('bob.marley@email.com', 'VID005', 'Verse 1', 0),
('george.washington@email.com', 'VID010', 'Experiment setup', 0);

-- Insert data into Tonton table
INSERT INTO Tonton (idPenonton, idVideo, likes, duration) VALUES
('UC007', 'VID001', 1, 600),
('UC008', 'VID001', 1, 480),
('UC001', 'VID002', 1, 420),
('UC003', 'VID002', 0, 300),
('UC007', 'VID003', 1, 720),
('UC008', 'VID004', 1, 900),
('UC005', 'VID006', 1, 600),
('UC006', 'VID006', 1, 540),
('UC009', 'VID010', 1, 360),
('UC010', 'VID009', 0, 480);

-- Insert data into Thread table
INSERT INTO Thread (idVideo, number) VALUES
('VID001', 1),
('VID001', 2),
('VID002', 1),
('VID003', 1),
('VID004', 1),
('VID006', 1),
('VID007', 1),
('VID009', 1),
('VID009', 2),
('VID010', 1);

-- Insert data into Komentar table
INSERT INTO Komentar (idVideo, threadNumber, Waktu, uploader, message) VALUES
('VID001', 1, '2023-01-15 15:30:00', 'UC008', 'Great review!'),
('VID001', 1, '2023-01-15 16:45:00', 'UC007', 'Thanks!'),
('VID001', 2, '2023-01-16 09:20:00', 'UC003', 'How is the battery life?'),
('VID002', 1, '2023-01-20 11:30:00', 'UC001', 'Tried this recipe, turned out amazing!'),
('VID003', 1, '2023-02-06 08:15:00', 'UC005', 'What difficulty level are you playing on?'),
('VID004', 1, '2023-02-10 10:30:00', 'UC007', 'Beautiful locations!'),
('VID006', 1, '2023-03-02 07:45:00', 'UC002', 'This workout is intense!'),
('VID009', 1, '2023-04-01 21:30:00', 'UC010', 'I disagree with your review'),
('VID009', 2, '2023-04-02 08:00:00', 'UC004', 'Spoilers should be warned'),
('VID010', 1, '2023-04-05 12:30:00', 'UC009', 'Can kids do this experiment?');
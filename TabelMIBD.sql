CREATE TABLE Kanal(
	idKanal varchar(25) PRIMARY KEY,
	nama varchar(25),
	isGroup INT,
	pass INT,
	gambar varchar(50),
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
    idVideo varchar(50) PRIMARY KEY,
    dscp varchar(500),
    judul varchar(30),
    waktu datetime,
	isPublished INT,
	uploader varchar(30) FOREIGN KEY REFERENCES Pengguna,
	loc varchar(25) FOREIGN KEY REFERENCES Kanal
)

CREATE TABLE Caption (
    idPengunggah varchar(30) FOREIGN KEY REFERENCES Pengguna,
	idVideo varchar(50) FOREIGN KEY REFERENCES Video,
	subtitle varchar(50),
	waktu INT
)
CREATE TABLE Tonton (
	idPenonton varchar(25) FOREIGN KEY REFERENCES Kanal,
	idVideo varchar(50) FOREIGN KEY REFERENCES Video,
	likes INT,
	duration INT,
	PRIMARY KEY (idPenonton, idVideo)
)
CREATE TABLE Thread(
	idVideo varchar(50) FOREIGN KEY REFERENCES Video,
	number INT,
	PRIMARY KEY (idVideo, number)
)
CREATE TABLE Komentar(
	idVideo varchar(50),
	threadNumber INT,
	FOREIGN KEY (idVideo, threadNumber) REFERENCES Thread,
	Waktu datetime,
	uploader varchar(25) FOREIGN KEY REFERENCES Kanal,
	msg varchar(200),
	PRIMARY KEY (idVideo, threadNumber, Waktu, uploader)
)

--Data Dummy

-- Data untuk Tabel Kanal
INSERT INTO Kanal VALUES 
('K001', 'ChannelA', 0, 0, 'gambar1.jpg', 'link1.com', 'Deskripsi A'),
('K002', 'ChannelB', 0, 0, 'gambar2.jpg', 'link2.com', 'Deskripsi B'),
('K003', 'ChannelC', 1, 1234, 'gambar3.jpg', 'link3.com', 'Group C');

-- Data untuk Tabel Pengguna
INSERT INTO Pengguna VALUES 
('userA@example.com', 'K001'),
('userB@example.com', 'K002'),
('userC@example.com', 'K003');

-- Data untuk Tabel Subscription (misalnya channel A subscribe ke channel B dan C)
INSERT INTO Subscription VALUES 
('K001', 'K002'),
('K001', 'K003'),
('K002', 'K003');

-- Data untuk Tabel Posisi
INSERT INTO Posisi VALUES 
(1, 'Admin'),
(2, 'Editor'),
(3, 'Member');

-- Data untuk Tabel PosisiPenggunaGroup (userA dan userB gabung ke ChannelC)
INSERT INTO PosisiPenggunaGroup VALUES 
('userA@example.com', 'K003', 1, 1),
('userB@example.com', 'K003', 2, 1);

-- Data untuk Tabel Video (userA unggah video ke ChannelA)
INSERT INTO Video VALUES 
('V001', 'Deskripsi video pertama', 'Judul Video A', '2025-06-01 10:00:00', 1, 'userA@example.com', 'K001');

-- Data untuk Tabel Caption (userA unggah subtitle)
INSERT INTO Caption VALUES 
('userA@example.com', 'V001', 'Subtitle awal video', 5);

-- Data untuk Tabel Tonton (userB dan userC menonton video V001)
INSERT INTO Tonton VALUES 
('K002', 'V001', 1, 120),
('K003', 'V001', 0, 80);

-- Data untuk Tabel Thread (thread diskusi pada video)
INSERT INTO Thread VALUES 
('V001', 1);

-- Data untuk Tabel Komentar
INSERT INTO Komentar VALUES 
('V001', 1, '2025-06-01 10:10:00', 'K002', 'Komentar dari Channel B'),
('V001', 1, '2025-06-01 10:15:00', 'K003', 'Komentar dari Channel C');

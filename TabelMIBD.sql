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
CREATE DATABASE 022_NOPS_AnomaliUniverse;

CREATE TABLE EntitasAnomali (
  id_entitas INT AUTO_INCREMENT PRIMARY KEY,
  nama_entitas VARCHAR(150) NOT NULL UNIQUE,
  tipe_entitas ENUM('Makhluk Hidup', 'Benda Mati', 'Fenomena Abstrak', 'Sound Viral') DEFAULT 'Fenomena Abstrak' NOT NULL,
  tingkat_absurditas INT DEFAULT 5 NOT NULL,
  tanggal_terdeteksi DATE NOT NULL DEFAULT (CURRENT_DATE),
  sumber_origin TEXT NOT NULL
);

CREATE TABLE KreatorKontenAnomali (
  id_kreator INT AUTO_INCREMENT PRIMARY KEY,
  username_kreator VARCHAR(100) NOT NULL UNIQUE,
  platform_utama ENUM('TikTok', 'YouTube', 'Instagram', 'X', 'Lainnya') DEFAULT 'TikTok' NOT NULL,
  jumlah_followers INT DEFAULT 0 NOT NULL,
  reputasi_brainrot ENUM('Pemula', 'Menengah', 'Ahli', 'Legenda Anomali') DEFAULT 'Pemula' NOT NULL
);

CREATE TABLE KontenAnomali (
  id_konten INT AUTO_INCREMENT PRIMARY KEY,
  id_entitas INT NOT NULL,
  id_kreator INT NOT NULL,
  judul_konten VARCHAR(255) NOT NULL,
  deskripsi_konten TEXT NULL,
  url_konten VARCHAR(512) NOT NULL UNIQUE,
  tipe_media ENUM('Video', 'Audio', 'Gambar', 'Teks') DEFAULT 'Video' NOT NULL,
  durasi_detik INT,
  tanggal_unggah DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  views INT DEFAULT 0 NOT NULL,
  likes INT DEFAULT 0 NOT NULL,
  shares INT DEFAULT 0 NOT NULL,
  potensi_tripping ENUM('Rendah', 'Sedang', 'Tinggi', 'CROCODILO!') DEFAULT 'Sedang' NOT NULL,

  FOREIGN KEY (id_entitas) REFERENCES EntitasAnomali(id_entitas) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_kreator) REFERENCES KreatorKontenAnomali(id_kreator) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TagAnomali (
  id_tag INT AUTO_INCREMENT PRIMARY KEY,
  nama_tag VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE KontenTag (
  id_konten INT NOT NULL,
  id_tag INT NOT NULL,

  PRIMARY KEY (id_konten, id_tag),
  FOREIGN KEY (id_konten) REFERENCES KontenAnomali(id_konten) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_tag) REFERENCES TagAnomali(id_tag) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LogInteraksiBrainrot (
  id_log INT AUTO_INCREMENT PRIMARY KEY,
  id_konten INT NOT NULL,
  username_penonton VARCHAR(100) NOT NULL,
  durasi_nonton_detik INT DEFAULT 0 NOT NULL,
  efek_dirasakan TEXT NOT NULL,
  waktu_interaksi DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

INSERT INTO
	EntitasAnomali (nama_entitas, tipe_entitas, tingkat_absurditas, tanggal_terdeteksi, sumber_origin)
VALUES
	('Trippi Troppa Dancer', 'Makhluk Hidup', 8, '2023-11-01', 'Video TikTok India'),
	('Bombardini Crocodilo Sound', 'Sound Viral', 9, '2024-01-15', 'Sound effect tak dikenal'),
	('Tralalelo Tralala Song', 'Sound Viral', 7, '2023-09-10', 'Lagu anak-anak yang di-remix jadi aneh'),
	('Capybara Hydrochaeris', 'Makhluk Hidup', 6, '2022-05-20', 'Berbagai meme capybara masbro'),
	('Filter Wajah Menangis Parah', 'Fenomena Abstrak', 7, '2023-06-01', 'Filter Instagram/TikTok'),
	('NPC Live Streamer', 'Makhluk Hidup', 9, '2023-08-15', 'Tren live streaming TikTok bertingkah seperti NPC');

INSERT INTO
	KreatorKontenAnomali (username_kreator, platform_utama, jumlah_followers, reputasi_brainrot)
VALUES
	('RajaTrippi69', 'TikTok', 1200000, 'Ahli'),
	('DJBombardiniOfficial', 'YouTube', 500000, 'Menengah'),
	('TralalaQueen', 'TikTok', 750000, 'Menengah'),
	('CapybaraEnjoyer_007', 'Instagram', 250000, 'Pemula'),
	('LiveNPCMaster', 'TikTok', 2000000, 'Legenda Anomali');

INSERT INTO
	KontenAnomali (id_entitas, id_kreator, judul_konten, url_konten, tipe_media, durasi_detik, views, likes, shares, potensi_tripping)
VALUES
	(1, 1, 'Trippi Troppa Challenge GONE WILD!', 'tiktok.com/trippi001', 'Video', 30, 5000000, 300000, 150000, 'Tinggi'),
	(2, 2, 'BOMBARDINI CROCODILOOO! (10 Hour Loop)', 'youtube.com/bombardini001', 'Audio', 36000, 10000000, 500000, 200000, 'CROCODILO!'),
	(3, 3, 'Tralalelo Tralala Remix Full Bass Jedag Jedug', 'tiktok.com/tralala001', 'Audio', 60, 2000000, 150000, 70000, 'Sedang'),
	(4, 4, 'Capybara chilling with orange', 'instagram.com/capy001', 'Gambar', NULL, 1000000, 100000, 40000, 'Rendah'),
	(6, 5, 'NPC Reacts to Gifts - ICE CREAM SO GOOD', 'tiktok.com/npc001', 'Video', 180, 15000000, 800000, 300000, 'CROCODILO!');

INSERT INTO
  TagAnomali (nama_tag)
VALUES
  ('TrippiTroppa'),
  ('Bombardini'),
  ('Tralalelo'),
  ('CapybaraCore'),
  ('NPCVibes'),
  ('Absurd'),
  ('BrainrotLevelMax'),
  ('HumorGelap');

INSERT INTO
  KontenTag (id_konten, id_tag)
VALUES
  (1,	1),
  (1,	6),
  (1,	7),
  (2,	2),
  (2,	6),
  (2,	7),
  (2,	8),
  (3,	3),
  (3,	6),
  (4,	4),
  (4,	6),
  (5,	5),
  (5,	6),
  (5,	7);

INSERT INTO
	LogInteraksiBrainrot (id_konten, username_penonton, durasi_nonton_detik, efek_dirasakan)
VALUES
	(1, 'User123', '25', 'Ikut bergoyang tanpa sadar, merasa sedikit trippy.'),
	(2, 'User456', '600', 'Telinga berdenging suara CROCODILO, mulai mempertanyakan realita.'),
	(5, 'User789', '170', 'Merasa perlu mengirim gift virtual dan mengulang kata-kata aneh.');

-- 1.
DELIMITER $$
CREATE PROCEDURE sp_RegistrasiEntitasBaru (
	p_nama_entitas VARCHAR(150),
	p_tipe_entitas ENUM('Makhluk Hidup', 'Benda Mati', 'Fenomena Abstrak', 'Sound Viral'),
	p_tingkat_absurditas INT,
	p_sumber_origin TEXT,
	OUT p_status_registrasi TEXT
)
BEGIN
	IF NOT EXISTS(SELECT nama_entitas FROM EntitasAnomali WHERE nama_entitas=p_nama_entitas)
	THEN
		INSERT INTO EntitasAnomali (nama_entitas, tipe_entitas, tingkat_absurditas, sumber_origin)
		VALUES (p_nama_entitas, p_tipe_entitas, p_tingkat_absurditas, p_sumber_origin);
		
		SET p_status_registrasi = CONCAT ("SUKSES! Entitas '", p_nama_entitas, "' telah ditambahkan.");
	ELSE
		SET p_status_registrasi = CONCAT ("GAGAL! Entitas '", p_nama_entitas, "' sudah terdaftar.");
	END IF;
END $$
DELIMITER ;

-- 2.
DELIMITER $$
CREATE FUNCTION fn_HitungSkorViralitasKonten (
	p_id_konten INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE score INT DEFAULT 0;
	DECLARE tripping VARCHAR(50);
	DECLARE bonus INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND RETURN 0;
	
	SELECT
		((views / 10000) + (likes * 0.5) + (shares * 1)), potensi_tripping
	INTO score, tripping
	FROM KontenAnomali WHERE id_konten=p_id_konten;
	
	SET bonus = CASE
		WHEN tripping = "CROCODILO!" THEN 100
		WHEN tripping = "Tinggi" THEN 50
		WHEN tripping = "Sedang" THEN 20
		ELSE 0
	END;
	
	SET score = score + bonus;
	
	RETURN score;
END $$
DELIMITER ;

-- 3.
DELIMITER $$
CREATE PROCEDURE sp_GetStatistikEntitasPalingPopuler (
  OUT p_nama_entitas_populer VARCHAR(150), 
  OUT p_total_views_entitas INT,
  OUT p_jumlah_konten_terkait INT
)
BEGIN
  DECLARE CONTINUE HANDLER FOR NOT FOUND
  BEGIN
    SET p_nama_entitas_populer = 'Tidak ada data konten';
    SET p_total_views_entitas = 0;
    SET p_jumlah_konten_terkait = 0;
  END;

  SELECT
    e.nama_entitas,
    SUM(k.views),
    COUNT(k.id_konten)
  INTO p_nama_entitas_populer, p_total_views_entitas, p_jumlah_konten_terkait
  FROM EntitasAnomali AS e
  JOIN KontenAnomali AS k ON e.id_entitas = k.id_entitas
  GROUP BY e.id_entitas
  ORDER BY SUM(k.views) DESC
  LIMIT 1;

  IF p_jumlah_konten_terkait = 0 THEN
    SET p_nama_entitas_populer = 'Tidak ada data konten';
  END IF;
END $$
DELIMITER ;

-- 4.
DELIMITER $$
CREATE PROCEDURE sp_LaporkanKontenBrainrotTeratasBulanan (
  p_bulan INT,
  p_tahun INT
)
BEGIN
  SELECT
    judul_konten,
    fn_HitungSkorViralitasKonten(id_konten) AS skor_viralitas,
    tanggal_unggah
  FROM KontenAnomali
  WHERE MONTH(tanggal_unggah) = p_bulan AND YEAR(tanggal_unggah) = p_tahun
  ORDER BY skor_viralitas DESC
  LIMIT 5;
END $$
DELIMITER ;

-- 5.
DELIMITER $$
CREATE FUNCTION fn_KlasifikasiAnomaliOtomatis (
  p_id_konten INT
)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE total_tag INT DEFAULT 0;
  DECLARE has_trippi BOOL DEFAULT FALSE;
  DECLARE has_npc BOOL DEFAULT FALSE;

  IF NOT EXISTS (SELECT 1 FROM KontenAnomali WHERE id_konten = p_id_konten) THEN
    RETURN 'Konten Tidak Ditemukan';
  END IF;

  SELECT COUNT(*) INTO total_tag
  FROM KontenTag
  WHERE id_konten = p_id_konten;

  SELECT COUNT(*) > 0 INTO has_trippi
  FROM KontenTag AS kt
  JOIN TagAnomali AS ta ON kt.id_tag = ta.id_tag
  WHERE kt.id_konten = p_id_konten AND ta.nama_tag = 'TrippiTroppa';

  SELECT COUNT(*) > 0 INTO has_npc
  FROM KontenTag AS kt
  JOIN TagAnomali AS ta ON kt.id_tag = ta.id_tag
  WHERE kt.id_konten = p_id_konten AND ta.nama_tag = 'NPCVibes';

  IF has_trippi AND has_npc THEN
    RETURN "Kombinasi Trippi NPC";
  ELSEIF has_trippi THEN
    RETURN "Dominan TrippiTroppa";
  ELSEIF has_npc THEN
    RETURN "Dominan NPCVibes";
  ELSEIF total_tag > 2 THEN
    RETURN 'Campuran Beragam Anomali';
  ELSE
    RETURN 'Anomali Standar';
  END IF;

END $$
DELIMITER ;
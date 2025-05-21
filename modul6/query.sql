-- 1
SELECT m.member_name, c.class_name, c.class_date FROM member AS m
JOIN participant AS p ON p.member_id=m.member_id
JOIN class AS c ON c.class_id=p.class_id;

-- 2
SELECT t.trainer_name, t.trainer_specialization, c.class_name FROM trainer AS t
LEFT JOIN class AS c ON c.trainer_id=t.trainer_id;

-- 3
SELECT m.member_name, COUNT(p.member_id) AS total_kelas FROM member AS m
LEFT JOIN participant AS p ON p.member_id=m.member_id
GROUP BY m.member_id;

-- 4
SELECT m.member_name, c.class_name, c.class_date, t.trainer_name FROM member AS m
JOIN participant AS p ON p.member_id=m.member_id
JOIN class AS c ON c.class_id=p.class_id
JOIN trainer AS t ON t.trainer_id=c.trainer_id
WHERE c.class_name LIKE '%Yoga%';

-- 5
CREATE TABLE LogPendaftaranKelas (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  member_id INT NOT NULL,
  class_id INT NOT NULL,
  nama_member VARCHAR(100) NOT NULL,
  nama_kelas VARCHAR(100) NOT NULL,
  waktu_pendaftaran DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE,
  FOREIGN KEY (class_id) REFERENCES class(class_id) ON DELETE CASCADE
);

-- 6
DELIMITER $$

CREATE TRIGGER trg_CatatPendaftaranKelas
AFTER INSERT ON participant
FOR EACH ROW
BEGIN
  INSERT INTO LogPendaftaranKelas (member_id, class_id, nama_member, nama_kelas)
  SELECT NEW.member_id, NEW.class_id, m.member_name, c.class_name
  FROM member AS m
  JOIN class AS c ON c.class_id=NEW.class_id
  WHERE m.member_id=NEW.member_id;
END$$

DELIMITER ;

-- 7
ALTER TABLE member
ADD COLUMN jumlah_kelas_diikuti_otomatis INT DEFAULT 0;

-- 8
DELIMITER $$

CREATE TRIGGER trg_UpdateJumlahKelasMember
AFTER INSERT ON participant
FOR EACH ROW
BEGIN
  UPDATE Member
  SET jumlah_kelas_diikuti_otomatis = jumlah_kelas_diikuti_otomatis + 1
  WHERE member_id = NEW.member_id;
END$$

DELIMITER ;

-- 9
CREATE VIEW InfoMemberGold AS
SELECT member_name, member_phone, joining_date
FROM member
WHERE member_type='Gold';

-- 10
INSERT INTO participant (member_id, class_id)
VALUES (4, 2);
    
-- 12
INSERT INTO participant (member_id, class_id)
VALUES (2, 3);

-- 14
SELECT * FROM InfoMemberGold;

-- 15
SELECT * FROM InfoMemberGold
WHERE joining_date > '2021-01-01';
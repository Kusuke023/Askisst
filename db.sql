/*ユーザー作成*/
DROP USER IF EXISTS'Askisst'@'localhost';
CREATE USER 'Askisst'@'localhost' IDENTIFIED BY 'ask';

/*データベース作成*/
DROP DATABASE IF EXISTS AskisstDB;
CREATE DATABASE AskisstDB;

/*データベース権限付与*/
GRANT ALL PRIVILEGES ON AskisstDB.* TO 'Askisst'@'localhost';

/*データベース選択*/
USE AskisstDB;

/*ユーザーデータテーブル*/
DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id               int(3) auto_increment PRIMARY KEY NOT NULL,
    first_name       VARCHAR(50) NOT NULL,     /*性*/
    last_name        VARCHAR(50) NOT NULL,     /*名*/
    first_name_kana  VARCHAR(50) NOT NULL,     /*セイ*/
    last_name_kana   VARCHAR(50) NOT NULL,     /*メイ*/
    gender           INT(1) NOT NULL,          /*性別(0:男性,1:女性,2:不明)*/
    emale            VARCHAR(50) NOT NULL,     /*メールアドレス*/
    postal           VARCHAR(80) NOT NULL,     /*郵便番号*/
    address          VARCHAR(50) NOT NULL,     /*住所*/
    tel              VARCHAR(20) NOT NULL,/*電話番号*/
    pass             VARCHAR(20)               /*パスワード*/
);

/*ユーザーデータサンプル*/
INSERT INTO users(first_name, last_name, first_name_kana, last_name_kana, gender, emale, postal, address, tel, pass)
	VALUES('井上', '魁人', 'イノウエ','カイト','0','kd1258431@st.kobedenshi.ac.jp','0000000','神戸市中央区','09000000000','inoue');
INSERT INTO users(first_name, last_name, first_name_kana, last_name_kana, gender, emale, postal, address, tel, pass)
	VALUES('今井', '雅也', 'イマイ','マサヤ','0','kd1300001@st.kobedenshi.ac.jp','0000001','神戸市中央区','09000000001','imai');
INSERT INTO users(first_name, last_name, first_name_kana, last_name_kana, gender, emale, postal, address, tel, pass)
	VALUES('青木', '涼介', 'アオキ','リョウスケ','0','kd1300002@st.kobedenshi.ac.jp','0000002','神戸市中央区','09000000002','aoki');
INSERT INTO users(first_name, last_name, first_name_kana, last_name_kana, gender, emale, postal, address, tel, pass)
	VALUES('植野', '竜之介', 'ウエノ','リュウノスケ','0','kd1300003@st.kobedenshi.ac.jp','0000003','神戸市中央区','09000000003','ueno');

SELECT * FROM users;

/*業種テーブル*/
DROP TABLE IF EXISTS Industry;
CREATE TABLE Industry(
    id        int PRIMARY KEY NOT NULL,
    name      varchar(50) DEFAULT NULL,
    name_kana varchar(50) DEFAULT NULL
);

/*業種データ*/
INSERT INTO Industry VALUES
  (1, '接客/サービス', 'セッキャク/サービス'),
  (2, '物流/配送', 'ブツリュウ/ハイソウ'),
  (3, '軽作業', 'ケイサギョウ'),
  (4, '事務', 'ジム'),
  (5, 'IT/コンピュータ', 'IT/コンピュータ'),
  (6, '専門職/その他', 'センモンショク/ソノタ');


/*仕事テーブル*/
DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs(
    id          int  PRIMARY KEY NOT NULL,
    Industry_id int(3) DEFAULT NULL,
    name        varchar(50) DEFAULT NULL,
    name_kana   varchar(50) DEFAULT NULL
);

/*仕事データ*/
INSERT INTO jobs VALUES
(1, 1, '家事代行', 'カジダイコウ'),
(2, 1, '清掃', 'セイソウ'),
(3, 1, 'ベビーシッター', 'ベビーシッター'),
(4, 1, '洗車', 'センシャ'),
(5, 1, 'その他サービス', 'ソノタサービス'),
(6, 2, 'ドライバー助手', 'ドライバージョシュ'),
(7, 2, '配達・配送', 'ハイタツ・ハイソウ'),
(8, 2, '引越し', 'ヒッコシ'),
(9, 2, 'その他物流/配送', 'ソノタブツリュウ/ハイソウ'),
(10, 3, '倉庫・検品', 'ソウコ・ケンピン'),
(11, 3, '在庫管理・商品管理', 'ザイコカンリ・ショウヒンカンリ'),
(12, 3, '仕分け', 'シワケ'),
(13, 3, '品だし・ピッキング', 'シナダシ・ピッキング'),
(14, 4, '一般事務', 'イッパンジム'),
(15, 4, '経理事務', 'ケイリジム'),
(16, 4, '営業事務', 'エイギョウジム'),
(17, 4, '伝票整理・資料作成', 'デンピョウセイリ・シリョウサクセイ'),
(18, 4, '電話対応', 'デンワタイオウ'),
(19, 4, '事務関連派遣職', 'ジムカンレンハケンショク'),
(20, 4, 'その他事務', 'ソノタジム'),
(21, 5, 'SE（システムエンジニア）', 'SE（システムエンジニア）'),
(22, 5, 'プログラマー', 'プログラマー'),
(23, 5, 'データ入力・PC入力', 'データニュウリョク・PCニュウリョク'),
(24, 5, 'ユーザーサポート', 'ユーザーサポート'),
(25, 5, 'OA・パソコンインストラクター', 'OA・パソコンインストラクター'),
(26, 5, 'IT系派遣職', 'ITケイハケンショク'),
(27, 5, 'デバッガー', 'デバッガー'),
(28, 5, 'その他コンピュータ関連職', 'ソノタコンピュータカンレンショク'),
(29, 6, 'クリエイター', 'クリエイター'),
(30, 6, 'WEBデザイナー', 'WEBデザイナー'),
(31, 6, 'デザイナー・イラストレーター', 'デザイナー・イラストレータ'),
(32, 6, 'グラフィックデザイナー', 'グラフイックデザイナー'),
(33, 6, '編集・記者・ライター', 'ヘンシュウ・キシャ・ライター'),
(34, 6, 'アンケート・モニター', 'アンケート・モニター'),
(35, 6, '通訳・翻訳', 'ツウヤク・ホンヤク'),
(36, 6, '整備士', 'セイビシ'),
(37, 6, 'その他派遣職', 'ソノタハケンショク'),
(38, 6, 'その他専門職', 'ソノタセンモンショク');

/*仕事依頼テーブル*/
DROP TABLE IF EXISTS rquest;
CREATE TABLE rquest(
    rquest_id  int auto_increment PRIMARY KEY NOT NULL,
    job_id     int(3) DEFAULT NULL,
    prefecture_id int(3) DEFAULT NULL,
    job_des    varchar(1000) NOT NULL,    /*仕事内容*/
    reward     varchar(20) NOT NULL,      /*報酬*/
    carfare    varchar(20) NOT NULL,      /*交通費*/
    work_time  varchar(20) NOT NULL,      /*勤務時間*/
    job_img    varchar(50)                /*仕事写真のパス*/
);

/*仕事依頼サンプル*/
INSERT INTO rquest(
  job_id,
  prefecture_id,
  job_des,
  reward,
  carfare,
  work_time,
  job_img)
  VALUES 
  (13,
  38,  
  'パソコンの修理の手伝い',
  '5000円',
  '2000円まで支給',
  '５時間',
  '/JobImg/job0001.jpg');

INSERT INTO rquest(
  job_id,
  prefecture_id,
  job_des,
  reward,
  carfare,
  work_time,
  job_img)
  VALUES 
  (1,
  28,  
  '家の家事代行',
  '4000円',
  '全額支給',
  '4時間',
  '/JobImg/job0002.png');

SELECT 
rquest.job_id,
rquest.prefecture_id,
rquest.job_des,
rquest.reward,
rquest.carfare,
rquest.work_time,
rquest.job_img,
prefecture.id,
jobs.id
FROM
rquest,
prefecture,
jobs

SELECT 
rquest.job_des,
rquest.reward,
rquest.carfare,
rquest.work_time,
rquest.job_img
FROM
rquest,
prefecture,
jobs



/*地方テーブル*/
DROP TABLE IF EXISTS region;
CREATE TABLE region(
    id          tinyint(3) unsigned PRIMARY KEY NOT NULL,
    name        varchar(255) DEFAULT NULL,
    name_kana   varchar(255) DEFAULT NULL
);

/*地方データ*/
INSERT INTO region VALUES
  (1,'北海道地方','ホッカイドウ'),
  (2,'東北地方','トウホクチホウ'),
  (3,'関東地方','カントウチホウ'),
  (4,'中部地方','チュウブチホウ'),
  (5,'近畿地方','キンキチホウ'),
  (6,'中国地方','チュウゴクチホウ'),
  (7,'四国地方','シコクチホウ'),
  (8,'九州地方','キュウシュウチホウ');

/*都道府県テーブル*/
DROP TABLE IF EXISTS prefecture;
CREATE TABLE prefecture (
  id            tinyint(3) unsigned PRIMARY KEY NOT NULL,
  region_id     tinyint(3) DEFAULT NULL,
  name          varchar(255) DEFAULT NULL,
  name_kana     varchar(255) DEFAULT NULL
);

/*都道府県データ*/
INSERT INTO prefecture VALUES
  (1,1,'北海道','ホッカイドウ'),
  (2,2,'青森県','アオモリケン'),
  (3,2,'岩手県','イワテケン'),
  (4,2,'宮城県','ミヤギケン'),
  (5,2,'秋田県','アキタケン'),
  (6,2,'山形県','ヤマガタケン'),
  (7,2,'福島県','フクシマケン'),
  (8,3,'茨城県','イバラキケン'),
  (9,3,'栃木県','トチギケン'),
  (10,3,'群馬県','グンマケン'),
  (11,3,'埼玉県','サイタマケン'),
  (12,3,'千葉県','チバケン'),
  (13,3,'東京都','トウキョウト'),
  (14,3,'神奈川県','カナガワケン'),
  (15,4,'新潟県','ニイガタケン'),
  (16,4,'富山県','トヤマケン'),
  (17,4,'石川県','イシカワケン'),
  (18,4,'福井県','フクイケン'),
  (19,4,'山梨県','ヤマナシケン'),
  (20,4,'長野県','ナガノケン'),
  (21,4,'岐阜県','ギフケン'),
  (22,4,'静岡県','シズオカケン'),
  (23,4,'愛知県','アイチケン'),
  (24,5,'三重県','ミエケン'),
  (25,5,'滋賀県','シガケン'),
  (26,5,'京都府','キョウトフ'),
  (27,5,'大阪府','オオサカフ'),
  (28,5,'兵庫県','ヒョウゴケン'),
  (29,5,'奈良県','ナラケン'),
  (30,5,'和歌山県','ワカヤマケン'),
  (31,6,'鳥取県','トットリケン'),
  (32,6,'島根県','シマネケン'),
  (33,6,'岡山県','オカヤマケン'),
  (34,6,'広島県','ヒロシマケン'),
  (35,6,'山口県','ヤマグチケン'),
  (36,7,'徳島県','トクシマケン'),
  (37,7,'香川県','カガワケン'),
  (38,7,'愛媛県','エヒメケン'),
  (39,7,'高知県','コウチケン'),
  (40,8,'福岡県','フクオカケン'),
  (41,8,'佐賀県','サガケン'),
  (42,8,'長崎県','ナガサキケン'),
  (43,8,'熊本県','クマモトケン'),
  (44,8,'大分県','オオイタケン'),
  (45,8,'宮崎県','ミヤザキケン'),
  (46,8,'鹿児島県','カゴシマケン'),
  (47,8,'沖縄県','オキナワケン');

/*ユーザー一覧確認*/
-- select user, host from mysql.user; 

/*ログインコマンド*/
-- mysql -h localhost -u Askisst -p AskisstDB
/*仕事依頼テーブル*/
-- DROP TABLE IF EXISTS rquest;
-- CREATE TABLE rquest(
--     rquest_id   int auto_increment PRIMARY KEY NOT NULL,
--     job_id      tinyint(3) unsigned NOT NULL,
--     rquest_text varchar(2000) NOT NULL
-- );


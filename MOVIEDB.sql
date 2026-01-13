
#0. DB 생성

CREATE DATABASE movie_review_db;
USE movie_review_db;

#1. 테이블 생성 (DDL)

#user table
CREATE TABLE user (
  user_id INT PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  birth_year INT,
  gender CHAR(1) CHECK (gender IN ('M', 'F')),
  signup_date DATE
);


#movie table
CREATE TABLE movie (
  movie_id INT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  release_year INT,
  genre VARCHAR(50),
  director VARCHAR(100),
  runtime INT
);


#actor table
CREATE TABLE actor (
  actor_id INT PRIMARY KEY,
  actor_name VARCHAR(100) NOT NULL,
  birth_year INT,
  nationality VARCHAR(100)
);


#review table
CREATE TABLE review (
  review_id INT PRIMARY KEY,
  user_id INT,
  movie_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at DATE,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);


#casting table
CREATE TABLE casting (
  movie_id INT,
  actor_id INT,
  role_name VARCHAR(100),
  PRIMARY KEY (movie_id, actor_id),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


#2. 데이터 삽입(Insert)

INSERT INTO user VALUES (1, 'Michael', 2010, 'M', '2023-08-26');
INSERT INTO user VALUES (2, 'Jason', 1971, 'F', '2022-06-28');
INSERT INTO user VALUES (3, 'Ashley', 1985, 'M', '2024-11-18');
INSERT INTO user VALUES (4, 'Russell', 1978, 'M', '2023-03-28');
INSERT INTO user VALUES (5, 'Daniel', 2004, 'M', '2023-03-10');
INSERT INTO user VALUES (6, 'Jennifer', 2007, 'F', '2024-09-22');
INSERT INTO user VALUES (7, 'Duane', 1972, 'M', '2024-06-06');
INSERT INTO user VALUES (8, 'Douglas', 1975, 'M', '2024-04-16');
INSERT INTO user VALUES (9, 'Elijah', 1984, 'M', '2023-08-24');
INSERT INTO user VALUES (10, 'Elizabeth', 2005, 'M', '2022-08-21');
INSERT INTO user VALUES (11, 'Diana', 2004, 'F', '2023-03-17');
INSERT INTO user VALUES (12, 'Amy', 1984, 'F', '2023-04-13');
INSERT INTO user VALUES (13, 'Nicholas', 2007, 'F', '2022-11-08');
INSERT INTO user VALUES (14, 'Justin', 1970, 'M', '2023-08-28');
INSERT INTO user VALUES (15, 'Thomas', 1997, 'F', '2022-07-23');
INSERT INTO user VALUES (16, 'Mario', 1987, 'M', '2024-08-17');
INSERT INTO user VALUES (17, 'Paula', 1983, 'F', '2024-01-02');
INSERT INTO user VALUES (18, 'Tiffany', 1976, 'M', '2023-12-28');
INSERT INTO user VALUES (19, 'Nicole', 1994, 'M', '2024-11-06');
INSERT INTO user VALUES (20, 'Laurie', 1992, 'F', '2024-04-18');
INSERT INTO user VALUES (21, 'Ronald', 2008, 'F', '2022-12-19');
INSERT INTO user VALUES (22, 'Mary', 1972, 'F', '2022-09-24');
INSERT INTO user VALUES (23, 'Courtney', 2004, 'M', '2025-03-16');
INSERT INTO user VALUES (24, 'Janice', 1994, 'M', '2025-05-26');
INSERT INTO user VALUES (25, 'Ryan', 2005, 'F', '2022-08-18');
INSERT INTO user VALUES (26, 'Michael', 2010, 'F', '2023-05-14');
INSERT INTO user VALUES (27, 'Grant', 2006, 'M', '2023-07-05');
INSERT INTO user VALUES (28, 'Benjamin', 1974, 'M', '2022-09-10');
INSERT INTO user VALUES (29, 'Sarah', 1984, 'F', '2024-08-09');
INSERT INTO user VALUES (30, 'Jennifer', 1975, 'M', '2023-07-15');
INSERT INTO movie VALUES (1, 'Movie 1', 2003, 'Thriller', 'Anthony Fisher', 138);
INSERT INTO movie VALUES (2, 'Movie 2', 2020, 'Horror', 'Sheri Herrera', 127);
INSERT INTO movie VALUES (3, 'Movie 3', 2011, 'Romance', 'Anthony Fisher', 89);
INSERT INTO movie VALUES (4, 'Movie 4', 2019, 'Drama', 'Jonathan Carroll', 111);
INSERT INTO movie VALUES (5, 'Movie 5', 2005, 'Fantasy', 'Logan Taylor', 114);
INSERT INTO movie VALUES (6, 'Movie 6', 2020, 'Romance', 'Alicia Watkins', 87);
INSERT INTO movie VALUES (7, 'Movie 7', 2007, 'Action', 'Alicia Watkins', 131);
INSERT INTO movie VALUES (8, 'Movie 8', 2008, 'Comedy', 'Stacey Hunt', 152);
INSERT INTO movie VALUES (9, 'Movie 9', 2022, 'Horror', 'Stacey Hunt', 143);
INSERT INTO movie VALUES (10, 'Movie 10', 2012, 'Fantasy', 'Shelia Alvarado', 113);
INSERT INTO movie VALUES (11, 'Movie 11', 2004, 'Romance', 'Jonathan Carroll', 148);
INSERT INTO movie VALUES (12, 'Movie 12', 2008, 'Thriller', 'David Moore', 131);
INSERT INTO movie VALUES (13, 'Movie 13', 2011, 'Romance', 'Shelia Alvarado', 145);
INSERT INTO movie VALUES (14, 'Movie 14', 2015, 'Comedy', 'Angel Davis', 94);
INSERT INTO movie VALUES (15, 'Movie 15', 2004, 'Drama', 'Belinda Stevens', 156);
INSERT INTO movie VALUES (16, 'Movie 16', 2002, 'Thriller', 'Logan Taylor', 156);
INSERT INTO movie VALUES (17, 'Movie 17', 2014, 'Sci-Fi', 'Jonathan Carroll', 81);
INSERT INTO movie VALUES (18, 'Movie 18', 2021, 'Comedy', 'Jonathan Carroll', 114);
INSERT INTO movie VALUES (19, 'Movie 19', 2024, 'Horror', 'Kevin Murray', 117);
INSERT INTO movie VALUES (20, 'Movie 20', 2013, 'Drama', 'Dr. Chloe Thompson MD', 80);
INSERT INTO movie VALUES (21, 'Movie 21', 2023, 'Sci-Fi', 'Connie Armstrong', 102);
INSERT INTO movie VALUES (22, 'Movie 22', 2016, 'Comedy', 'Vanessa Kim', 144);
INSERT INTO movie VALUES (23, 'Movie 23', 2019, 'Romance', 'Shelia Alvarado', 127);
INSERT INTO movie VALUES (24, 'Movie 24', 2024, 'Drama', 'Jonathan Carroll', 147);
INSERT INTO movie VALUES (25, 'Movie 25', 2000, 'Horror', 'Travis Moses', 82);
INSERT INTO movie VALUES (26, 'Movie 26', 2003, 'Horror', 'Vanessa Kim', 110);
INSERT INTO movie VALUES (27, 'Movie 27', 2001, 'Romance', 'David Moore', 90);
INSERT INTO movie VALUES (28, 'Movie 28', 2002, 'Fantasy', 'Alexander Horton', 148);
INSERT INTO movie VALUES (29, 'Movie 29', 2024, 'Drama', 'Shelia Alvarado', 140);
INSERT INTO movie VALUES (30, 'Movie 30', 2017, 'Drama', 'Anthony Fisher', 147);
INSERT INTO movie VALUES (31, 'Movie 31', 2019, 'Thriller', 'Stacey Hunt', 149);
INSERT INTO movie VALUES (32, 'Movie 32', 2024, 'Romance', 'Vanessa Kim', 131);
INSERT INTO movie VALUES (33, 'Movie 33', 2021, 'Horror', 'Dr. Chloe Thompson MD', 146);
INSERT INTO movie VALUES (34, 'Movie 34', 2014, 'Comedy', 'Frank Fischer', 108);
INSERT INTO movie VALUES (35, 'Movie 35', 2002, 'Horror', 'Kristopher Rodriguez', 155);
INSERT INTO movie VALUES (36, 'Movie 36', 2017, 'Romance', 'David Moore', 108);
INSERT INTO movie VALUES (37, 'Movie 37', 2000, 'Comedy', 'Angel Davis', 109);
INSERT INTO movie VALUES (38, 'Movie 38', 2002, 'Action', 'Alicia Watkins', 89);
INSERT INTO movie VALUES (39, 'Movie 39', 2016, 'Romance', 'Anthony Fisher', 142);
INSERT INTO movie VALUES (40, 'Movie 40', 2006, 'Drama', 'David Moore', 153);
INSERT INTO movie VALUES (41, 'Movie 41', 2015, 'Romance', 'Travis Moses', 132);
INSERT INTO movie VALUES (42, 'Movie 42', 2006, 'Comedy', 'Kevin Murray', 135);
INSERT INTO movie VALUES (43, 'Movie 43', 2011, 'Thriller', 'Belinda Stevens', 139);
INSERT INTO movie VALUES (44, 'Movie 44', 2023, 'Action', 'Kevin Murray', 87);
INSERT INTO movie VALUES (45, 'Movie 45', 2012, 'Horror', 'Kevin Murray', 111);
INSERT INTO movie VALUES (46, 'Movie 46', 2006, 'Romance', 'Jonathan Carroll', 137);
INSERT INTO movie VALUES (47, 'Movie 47', 2004, 'Thriller', 'Sheri Herrera', 115);
INSERT INTO movie VALUES (48, 'Movie 48', 2014, 'Romance', 'Alexander Horton', 136);
INSERT INTO movie VALUES (49, 'Movie 49', 2017, 'Comedy', 'Angel Davis', 149);
INSERT INTO movie VALUES (50, 'Movie 50', 2000, 'Comedy', 'Frank Fischer', 101);
INSERT INTO actor VALUES (1, 'Daniel Faulkner', 1976, 'Pakistan');
INSERT INTO actor VALUES (2, 'Samantha Allen', 1981, 'Afghanistan');
INSERT INTO actor VALUES (3, 'Nancy Fletcher', 1980, 'Malawi');
INSERT INTO actor VALUES (4, 'Julia Combs', 1963, 'Portugal');
INSERT INTO actor VALUES (5, 'Sonia Sullivan', 1975, 'Nigeria');
INSERT INTO actor VALUES (6, 'Carol Hanson', 1953, 'United States Minor Outlying Islands');
INSERT INTO actor VALUES (7, 'Emily Wilson', 1960, 'Qatar');
INSERT INTO actor VALUES (8, 'Trevor Myers', 1974, 'Timor-Leste');
INSERT INTO actor VALUES (9, 'Kevin Parsons', 1950, 'Greece');
INSERT INTO actor VALUES (10, 'Samantha Martinez', 1974, 'Tonga');
INSERT INTO actor VALUES (11, 'Margaret Roberts', 1966, 'Norway');
INSERT INTO actor VALUES (12, 'Shannon Hicks', 2000, 'Kazakhstan');
INSERT INTO actor VALUES (13, 'Dean Williams', 2000, 'Guyana');
INSERT INTO actor VALUES (14, 'Lauren Mitchell', 1979, 'Guernsey');
INSERT INTO actor VALUES (15, 'Brianna Gutierrez', 1968, 'Nauru');
INSERT INTO actor VALUES (16, 'Oscar Burton', 1977, 'Finland');
INSERT INTO actor VALUES (17, 'Joseph Prince', 1994, 'South Georgia and the South Sandwich Islands');
INSERT INTO actor VALUES (18, 'Antonio Hill', 1996, 'Western Sahara');
INSERT INTO actor VALUES (19, 'Michael Parker', 2000, 'Mozambique');
INSERT INTO actor VALUES (20, 'Marie Fitzgerald', 1985, 'Sweden');
INSERT INTO actor VALUES (21, 'Joshua Keith', 1992, 'Samoa');
INSERT INTO actor VALUES (22, 'Derek Phillips', 1995, 'Tajikistan');
INSERT INTO actor VALUES (23, 'Catherine Carroll', 1981, 'Haiti');
INSERT INTO actor VALUES (24, 'Allen Mason', 1959, 'Burundi');
INSERT INTO actor VALUES (25, 'Elijah Curtis', 1962, 'Cambodia');
INSERT INTO actor VALUES (26, 'Connie Mckenzie', 1968, 'Qatar');
INSERT INTO actor VALUES (27, 'Jessica Sloan', 1963, 'Bangladesh');
INSERT INTO actor VALUES (28, 'Nicole Warner', 1953, 'Myanmar');
INSERT INTO actor VALUES (29, 'Susan Alvarez', 1987, 'Andorra');
INSERT INTO actor VALUES (30, 'James Nelson', 1997, 'Norway');
INSERT INTO actor VALUES (31, 'Richard Murphy', 1984, 'Austria');
INSERT INTO actor VALUES (32, 'Maria Lindsey', 1953, 'Iraq');
INSERT INTO actor VALUES (33, 'Sean Williams', 1997, 'Angola');
INSERT INTO actor VALUES (34, 'Shawn White', 1970, 'Cyprus');
INSERT INTO actor VALUES (35, 'Joseph Mendez', 1953, 'Germany');
INSERT INTO actor VALUES (36, 'Kathy Cobb', 1953, 'Algeria');
INSERT INTO actor VALUES (37, 'Robin Garza', 1987, 'Sao Tome and Principe');
INSERT INTO actor VALUES (38, 'Jamie Turner', 1980, 'Turkmenistan');
INSERT INTO actor VALUES (39, 'Anthony Barnes', 1982, 'United States Minor Outlying Islands');
INSERT INTO actor VALUES (40, 'Melanie Paul', 1983, 'Albania');
INSERT INTO review VALUES (1, 6, 4, 5, 'Manager cut both type road pretty size news skill help.', '2025-03-27');
INSERT INTO review VALUES (2, 3, 12, 1, 'Price put want professional theory small those at similar light present.', '2025-01-08');
INSERT INTO review VALUES (3, 20, 5, 2, 'Benefit easy ever sign word country kind ago.', '2024-09-12');
INSERT INTO review VALUES (4, 13, 8, 5, 'Pattern those Mr garden thought realize.', '2024-09-12');
INSERT INTO review VALUES (5, 8, 38, 5, 'Production for effort avoid law region throw then win side man administration.', '2024-11-11');
INSERT INTO review VALUES (6, 2, 40, 1, 'Respond trouble pressure maintain kid professor most employee such open cell carry.', '2025-05-31');
INSERT INTO review VALUES (7, 14, 43, 5, 'Serious government level water field project sport building oil machine provide think.', '2024-09-16');
INSERT INTO review VALUES (8, 19, 34, 3, 'Military also boy by possible turn response fill mean.', '2024-07-20');
INSERT INTO review VALUES (9, 30, 17, 2, 'Hear understand fear everyone piece work week.', '2025-06-12');
INSERT INTO review VALUES (10, 22, 46, 3, 'Forget natural bag prove commercial old.', '2024-07-26');
INSERT INTO review VALUES (11, 8, 17, 4, 'Each professor various form suddenly assume board require type along do picture likely.', '2025-04-17');
INSERT INTO review VALUES (12, 5, 43, 3, 'Individual current line into person walk reach listen even pattern arm experience.', '2024-10-17');
INSERT INTO review VALUES (13, 15, 21, 1, 'When policy personal whatever attorney western.', '2025-06-06');
INSERT INTO review VALUES (14, 1, 30, 5, 'Environment save parent black politics color music security.', '2025-04-28');
INSERT INTO review VALUES (15, 19, 7, 1, 'Campaign entire ground great class marriage light whatever process require measure.', '2025-04-20');
INSERT INTO review VALUES (16, 18, 14, 5, 'Similar part teach during account dark produce suffer majority they personal opportunity miss.', '2025-04-29');
INSERT INTO review VALUES (17, 9, 9, 3, 'Sometimes we suggest green spend store star bag different.', '2025-03-26');
INSERT INTO review VALUES (18, 29, 5, 2, 'She necessary be reach form shake until new.', '2024-07-20');
INSERT INTO review VALUES (19, 12, 19, 2, 'Car forward difference minute surface peace.', '2024-07-20');
INSERT INTO review VALUES (20, 15, 35, 3, 'Difficult entire money service peace third various member benefit race.', '2025-01-05');
INSERT INTO review VALUES (21, 20, 42, 5, 'Start than talk break force alone try according wonder wear water consumer author.', '2024-10-15');
INSERT INTO review VALUES (22, 1, 43, 5, 'Per central true show sound recent.', '2024-07-05');
INSERT INTO review VALUES (23, 10, 43, 1, 'Kind drug century growth soon society hair dream follow argue down strategy while.', '2024-06-21');
INSERT INTO review VALUES (24, 29, 9, 3, 'Memory truth cup amount health result else race road.', '2025-03-15');
INSERT INTO review VALUES (25, 4, 7, 5, 'Bring before remain know bill return away action side relate.', '2025-02-25');
INSERT INTO review VALUES (26, 5, 18, 3, 'Generation matter deal maintain door fish fear whose personal environment hot another.', '2024-07-10');
INSERT INTO review VALUES (27, 20, 14, 3, 'Kitchen him land especially office statement clearly friend seek more artist reveal begin.', '2025-02-05');
INSERT INTO review VALUES (28, 7, 44, 3, 'Yourself star must blue choice live deep.', '2025-06-02');
INSERT INTO review VALUES (29, 17, 32, 3, 'Heart half art people remember window suddenly we.', '2024-10-12');
INSERT INTO review VALUES (30, 29, 4, 1, 'Song view impact statement much movie spend nice American list that several.', '2025-06-02');
INSERT INTO review VALUES (31, 21, 28, 3, 'Season food peace condition thousand always force who time different effort.', '2024-06-16');
INSERT INTO review VALUES (32, 2, 1, 3, 'Billion drop parent day mother prevent security himself section traditional.', '2024-07-29');
INSERT INTO review VALUES (33, 25, 9, 3, 'Second result wrong relate sort when fund bit lead.', '2025-04-23');
INSERT INTO review VALUES (34, 6, 48, 4, 'Population thank happen seem drug present bar continue rest matter.', '2024-07-17');
INSERT INTO review VALUES (35, 18, 46, 4, 'Cultural mean town leader by attention become.', '2025-01-09');
INSERT INTO review VALUES (36, 18, 1, 1, 'Out station people professional none stay represent act his toward amount point have.', '2024-11-23');
INSERT INTO review VALUES (37, 3, 45, 2, 'Challenge scientist despite sport standard across.', '2024-07-08');
INSERT INTO review VALUES (38, 18, 3, 3, 'Create grow section several political environmental attorney ground if improve perhaps material.', '2025-04-30');
INSERT INTO review VALUES (39, 19, 36, 2, 'Standard run among improve study character series senior treatment role yard yet.', '2024-08-04');
INSERT INTO review VALUES (40, 14, 9, 1, 'Can general already finish theory whose them ball it.', '2024-07-25');
INSERT INTO review VALUES (41, 10, 24, 1, 'Let rest think loss table word stock hour lose ten low.', '2025-05-21');
INSERT INTO review VALUES (42, 29, 23, 2, 'Type face tend change what purpose whole occur door drug bar ball decide.', '2025-01-09');
INSERT INTO review VALUES (43, 22, 16, 1, 'Recently special especially moment design those pay common nor current generation hear.', '2025-04-08');
INSERT INTO review VALUES (44, 12, 50, 5, 'Some shake clear machine our party guy born around car report suggest boy.', '2024-08-18');
INSERT INTO review VALUES (45, 29, 27, 5, 'Herself successful value image account control wear seat.', '2024-12-23');
INSERT INTO review VALUES (46, 24, 10, 2, 'Report table world gas card represent ahead few push record in piece create.', '2025-03-31');
INSERT INTO review VALUES (47, 28, 11, 2, 'Activity manager impact building social probably lay plan design break occur direction.', '2024-10-21');
INSERT INTO review VALUES (48, 29, 27, 1, 'Fly experience return down growth reach cultural federal although mention who put.', '2024-07-23');
INSERT INTO review VALUES (49, 6, 48, 3, 'Drug onto car happen catch better.', '2024-09-22');
INSERT INTO review VALUES (50, 26, 27, 2, 'By language maintain several whatever house change mention street sing interview weight.', '2024-09-28');
INSERT INTO review VALUES (51, 9, 11, 1, 'Their risk we as election white return determine entire choose human story citizen.', '2025-05-18');
INSERT INTO review VALUES (52, 13, 3, 4, 'Sometimes trip detail already page face mouth cultural walk environmental.', '2024-10-13');
INSERT INTO review VALUES (53, 8, 13, 4, 'Try result just data official out one catch.', '2024-09-12');
INSERT INTO review VALUES (54, 12, 20, 2, 'Kind agent how argue modern type something represent whom land others attack million.', '2025-01-10');
INSERT INTO review VALUES (55, 8, 2, 2, 'Among rule quality million consider mention heart public contain trouble enjoy drive.', '2025-01-25');
INSERT INTO review VALUES (56, 13, 22, 3, 'War enjoy base care way new road culture market.', '2025-02-20');
INSERT INTO review VALUES (57, 28, 5, 3, 'Responsibility nice campaign detail late class.', '2024-08-26');
INSERT INTO review VALUES (58, 12, 42, 5, 'Minute speech available direction threat hot so according.', '2025-05-01');
INSERT INTO review VALUES (59, 13, 44, 5, 'Full so loss detail which law pay.', '2025-01-20');
INSERT INTO review VALUES (60, 11, 2, 1, 'Responsibility writer if avoid bag question art message skill.', '2024-11-15');
INSERT INTO review VALUES (61, 29, 17, 2, 'Ask big tough car prove half involve pass change gun before five forget.', '2025-04-16');
INSERT INTO review VALUES (62, 19, 17, 1, 'Stuff Mrs research happen drop article agency someone pattern treat form figure.', '2024-10-24');
INSERT INTO review VALUES (63, 4, 39, 4, 'Watch quite together involve much better American.', '2025-05-19');
INSERT INTO review VALUES (64, 12, 47, 3, 'Pull statement discussion drop dinner beyond will sure peace.', '2024-11-23');
INSERT INTO review VALUES (65, 14, 39, 5, 'News technology support enough exactly official majority first without official.', '2024-07-16');
INSERT INTO review VALUES (66, 4, 25, 5, 'Mother receive among then human life paper wear skill.', '2025-05-14');
INSERT INTO review VALUES (67, 7, 17, 1, 'Then hot who range expect simply need third easy cost record read world.', '2024-08-04');
INSERT INTO review VALUES (68, 23, 28, 1, 'Threat director reach deal high decade real matter technology recognize those within.', '2024-11-28');
INSERT INTO review VALUES (69, 17, 35, 2, 'Toward couple front animal yes draw partner where I less treatment.', '2025-04-16');
INSERT INTO review VALUES (70, 12, 28, 1, 'Exactly debate window recognize really various democratic study.', '2025-06-13');
INSERT INTO review VALUES (71, 22, 22, 5, 'Real chance environment up anyone offer it strong.', '2025-05-16');
INSERT INTO review VALUES (72, 11, 43, 1, 'Gun board seek most but any artist yet song realize.', '2025-01-23');
INSERT INTO review VALUES (73, 24, 20, 5, 'Expect report north include majority dark site property.', '2024-12-23');
INSERT INTO review VALUES (74, 10, 43, 4, 'Employee his quality major garden speak can build.', '2024-10-02');
INSERT INTO review VALUES (75, 11, 26, 3, 'Poor green early imagine help less line appear church decide ability us wear.', '2025-06-07');
INSERT INTO review VALUES (76, 18, 9, 2, 'Concern skin name pay institution left condition day determine Congress any event.', '2024-06-28');
INSERT INTO review VALUES (77, 14, 43, 4, 'Character market remember level improve purpose term upon since remember name.', '2025-01-21');
INSERT INTO review VALUES (78, 22, 48, 2, 'Have how when painting phone risk measure decide account talk customer.', '2025-06-08');
INSERT INTO review VALUES (79, 20, 37, 3, 'Onto focus if according amount hear many indeed imagine far.', '2024-08-23');
INSERT INTO review VALUES (80, 13, 36, 1, 'Industry someone back rich west to financial.', '2024-06-21');
INSERT INTO review VALUES (81, 10, 19, 2, 'Range answer your response half seem responsibility let court far station bit.', '2024-10-19');
INSERT INTO review VALUES (82, 14, 38, 5, 'Identify no responsibility kid north mission.', '2024-09-18');
INSERT INTO review VALUES (83, 21, 21, 4, 'North seat together huge despite side occur much wrong.', '2024-08-21');
INSERT INTO review VALUES (84, 15, 29, 2, 'Forward more still person apply box system use.', '2025-05-21');
INSERT INTO review VALUES (85, 17, 31, 2, 'Different establish letter stay compare significant say defense social administration success letter others.', '2024-12-08');
INSERT INTO review VALUES (86, 22, 6, 3, 'Quickly top himself third hour population country those watch seem reveal.', '2024-12-16');
INSERT INTO review VALUES (87, 17, 43, 5, 'Take establish name young traditional nature left positive.', '2024-12-16');
INSERT INTO review VALUES (88, 11, 6, 2, 'Concern exactly increase person control lay generation.', '2025-06-14');
INSERT INTO review VALUES (89, 22, 20, 2, 'Hair its early according hold mission whatever within free be difference employee.', '2024-12-11');
INSERT INTO review VALUES (90, 26, 13, 2, 'Record few all do middle detail heavy year.', '2024-10-31');
INSERT INTO review VALUES (91, 1, 3, 2, 'Style administration unit dream full against outside born something those wall you positive.', '2025-02-21');
INSERT INTO review VALUES (92, 16, 40, 1, 'Become her same else trial health and food prepare believe thing class.', '2025-01-27');
INSERT INTO review VALUES (93, 15, 27, 5, 'And different not discuss support college letter of need.', '2024-08-08');
INSERT INTO review VALUES (94, 7, 46, 4, 'Human show to unit long anyone official cold cause book security last director.', '2024-09-15');
INSERT INTO review VALUES (95, 16, 26, 2, 'Relate recognize far some bring partner father around be.', '2024-07-18');
INSERT INTO review VALUES (96, 5, 42, 1, 'Letter song whether popular board memory take.', '2025-02-07');
INSERT INTO review VALUES (97, 29, 49, 1, 'Teacher against bed under sense this size clear include real.', '2024-08-26');
INSERT INTO review VALUES (98, 25, 28, 2, 'Available discuss start blood quite imagine per customer.', '2025-05-22');
INSERT INTO review VALUES (99, 6, 45, 5, 'Stuff other such as sing expert wife.', '2025-06-03');
INSERT INTO review VALUES (100, 15, 4, 5, 'Nothing area level stage black their hot even.', '2024-08-15');
INSERT INTO casting VALUES (1, 8, 'Writer');
INSERT INTO casting VALUES (1, 30, 'Special effects artist');
INSERT INTO casting VALUES (1, 9, 'Meteorologist');
INSERT INTO casting VALUES (2, 34, 'Building surveyor');
INSERT INTO casting VALUES (2, 36, 'Journalist, broadcasting');
INSERT INTO casting VALUES (2, 39, 'Media planner');
INSERT INTO casting VALUES (2, 21, 'Herpetologist');
INSERT INTO casting VALUES (3, 40, 'Education officer, museum');
INSERT INTO casting VALUES (3, 33, 'Administrator');
INSERT INTO casting VALUES (3, 28, 'Education administrator');
INSERT INTO casting VALUES (3, 36, 'Accountant, chartered management');
INSERT INTO casting VALUES (4, 11, 'Careers information officer');
INSERT INTO casting VALUES (4, 31, 'English as a foreign language teacher');
INSERT INTO casting VALUES (4, 29, 'Meteorologist');
INSERT INTO casting VALUES (4, 17, 'Advertising account executive');
INSERT INTO casting VALUES (5, 18, 'Merchandiser, retail');
INSERT INTO casting VALUES (5, 34, 'Chartered public finance accountant');
INSERT INTO casting VALUES (5, 32, 'Corporate treasurer');
INSERT INTO casting VALUES (6, 16, 'Pensions consultant');
INSERT INTO casting VALUES (6, 18, 'Chief Executive Officer');
INSERT INTO casting VALUES (6, 29, 'Lighting technician, broadcasting/film/video');
INSERT INTO casting VALUES (6, 5, 'Teacher, primary school');
INSERT INTO casting VALUES (6, 19, 'Database administrator');
INSERT INTO casting VALUES (7, 18, 'Engineer, mining');
INSERT INTO casting VALUES (7, 22, 'Teacher, primary school');
INSERT INTO casting VALUES (7, 21, 'Catering manager');
INSERT INTO casting VALUES (8, 6, 'Landscape architect');
INSERT INTO casting VALUES (8, 9, 'Data processing manager');
INSERT INTO casting VALUES (8, 10, 'Interior and spatial designer');
INSERT INTO casting VALUES (8, 15, 'Broadcast presenter');
INSERT INTO casting VALUES (8, 25, 'Scientist, research (medical)');
INSERT INTO casting VALUES (9, 10, 'Wellsite geologist');
INSERT INTO casting VALUES (9, 14, 'Hospital pharmacist');
INSERT INTO casting VALUES (9, 5, 'Audiological scientist');
INSERT INTO casting VALUES (9, 27, 'Chemical engineer');
INSERT INTO casting VALUES (9, 22, 'Contracting civil engineer');
INSERT INTO casting VALUES (10, 30, 'Geoscientist');
INSERT INTO casting VALUES (10, 27, 'Field seismologist');
INSERT INTO casting VALUES (10, 4, 'Chartered legal executive (England and Wales)');
INSERT INTO casting VALUES (10, 14, 'Education officer, community');
INSERT INTO casting VALUES (10, 25, 'Research scientist (maths)');
INSERT INTO casting VALUES (11, 2, 'Dentist');
INSERT INTO casting VALUES (11, 37, 'Surveyor, building');
INSERT INTO casting VALUES (11, 25, 'Physiological scientist');
INSERT INTO casting VALUES (11, 31, 'Air cabin crew');
INSERT INTO casting VALUES (11, 1, 'Media planner');
INSERT INTO casting VALUES (12, 20, 'Optometrist');
INSERT INTO casting VALUES (12, 25, 'Operational researcher');
INSERT INTO casting VALUES (12, 27, 'Publishing rights manager');
INSERT INTO casting VALUES (12, 35, 'Agricultural engineer');
INSERT INTO casting VALUES (13, 35, 'Theme park manager');
INSERT INTO casting VALUES (13, 39, 'Scientific laboratory technician');
INSERT INTO casting VALUES (13, 15, 'Architectural technologist');
INSERT INTO casting VALUES (13, 32, 'Energy engineer');
INSERT INTO casting VALUES (13, 18, 'Hydrogeologist');
INSERT INTO casting VALUES (14, 32, 'Research scientist (physical sciences)');
INSERT INTO casting VALUES (14, 2, 'Office manager');
INSERT INTO casting VALUES (14, 25, 'Nurse, mental health');
INSERT INTO casting VALUES (14, 22, 'Comptroller');
INSERT INTO casting VALUES (15, 26, 'Lecturer, higher education');
INSERT INTO casting VALUES (15, 11, 'Pharmacologist');
INSERT INTO casting VALUES (15, 30, 'Haematologist');
INSERT INTO casting VALUES (15, 9, 'Research scientist (life sciences)');
INSERT INTO casting VALUES (15, 40, 'Herpetologist');
INSERT INTO casting VALUES (16, 2, 'Sports therapist');
INSERT INTO casting VALUES (16, 26, 'Corporate treasurer');
INSERT INTO casting VALUES (16, 38, 'Medical sales representative');
INSERT INTO casting VALUES (16, 37, 'Aid worker');
INSERT INTO casting VALUES (16, 6, 'Architectural technologist');
INSERT INTO casting VALUES (17, 28, 'Forensic psychologist');
INSERT INTO casting VALUES (17, 9, 'Horticultural therapist');
INSERT INTO casting VALUES (17, 30, 'Administrator, arts');
INSERT INTO casting VALUES (17, 12, 'Investment banker, operational');
INSERT INTO casting VALUES (17, 4, 'Landscape architect');
INSERT INTO casting VALUES (18, 25, 'IT trainer');
INSERT INTO casting VALUES (18, 21, 'Museum education officer');
INSERT INTO casting VALUES (18, 14, 'Engineer, manufacturing');
INSERT INTO casting VALUES (18, 30, 'Museum/gallery exhibitions officer');
INSERT INTO casting VALUES (19, 22, 'Animator');
INSERT INTO casting VALUES (19, 25, 'Theatre stage manager');
INSERT INTO casting VALUES (19, 18, 'Physiotherapist');
INSERT INTO casting VALUES (19, 27, 'Engineer, control and instrumentation');
INSERT INTO casting VALUES (20, 6, 'Insurance underwriter');
INSERT INTO casting VALUES (20, 31, 'Materials engineer');
INSERT INTO casting VALUES (20, 2, 'Designer, textile');
INSERT INTO casting VALUES (20, 35, 'Counsellor');
INSERT INTO casting VALUES (21, 23, 'Merchant navy officer');
INSERT INTO casting VALUES (21, 15, 'IT technical support officer');
INSERT INTO casting VALUES (21, 5, 'Higher education careers adviser');
INSERT INTO casting VALUES (22, 3, 'Administrator, education');
INSERT INTO casting VALUES (22, 2, 'Higher education lecturer');
INSERT INTO casting VALUES (22, 16, 'Careers information officer');
INSERT INTO casting VALUES (22, 13, 'Outdoor activities/education manager');
INSERT INTO casting VALUES (22, 40, 'Journalist, newspaper');
INSERT INTO casting VALUES (23, 16, 'Regulatory affairs officer');
INSERT INTO casting VALUES (23, 9, 'Programme researcher, broadcasting/film/video');
INSERT INTO casting VALUES (23, 31, 'Child psychotherapist');
INSERT INTO casting VALUES (24, 8, 'Gaffer');
INSERT INTO casting VALUES (24, 37, 'Print production planner');
INSERT INTO casting VALUES (24, 14, 'Intelligence analyst');
INSERT INTO casting VALUES (24, 30, 'Nutritional therapist');
INSERT INTO casting VALUES (24, 17, 'Exhibitions officer, museum/gallery');
INSERT INTO casting VALUES (25, 11, 'Teacher, special educational needs');
INSERT INTO casting VALUES (25, 39, 'Chief of Staff');
INSERT INTO casting VALUES (25, 8, 'Amenity horticulturist');
INSERT INTO casting VALUES (25, 20, 'Emergency planning/management officer');
INSERT INTO casting VALUES (26, 38, 'Higher education lecturer');
INSERT INTO casting VALUES (26, 2, 'Banker');
INSERT INTO casting VALUES (26, 20, 'Engineer, energy');
INSERT INTO casting VALUES (27, 25, 'Structural engineer');
INSERT INTO casting VALUES (27, 26, 'Biomedical engineer');
INSERT INTO casting VALUES (27, 13, 'Broadcast engineer');
INSERT INTO casting VALUES (27, 5, 'Scientist, physiological');
INSERT INTO casting VALUES (27, 38, 'Horticultural therapist');
INSERT INTO casting VALUES (28, 16, 'Sport and exercise psychologist');
INSERT INTO casting VALUES (28, 7, 'Exhibition designer');
INSERT INTO casting VALUES (28, 20, 'Secretary/administrator');
INSERT INTO casting VALUES (28, 39, 'Firefighter');
INSERT INTO casting VALUES (28, 8, 'Forest/woodland manager');
INSERT INTO casting VALUES (29, 3, 'Editor, magazine features');
INSERT INTO casting VALUES (29, 23, 'Accountant, chartered');
INSERT INTO casting VALUES (29, 35, 'Designer, exhibition/display');
INSERT INTO casting VALUES (29, 28, 'Exhibitions officer, museum/gallery');
INSERT INTO casting VALUES (29, 24, 'Community pharmacist');
INSERT INTO casting VALUES (30, 33, 'Clinical molecular geneticist');
INSERT INTO casting VALUES (30, 22, 'Training and development officer');
INSERT INTO casting VALUES (30, 1, 'Production manager');
INSERT INTO casting VALUES (31, 32, 'Museum education officer');
INSERT INTO casting VALUES (31, 7, 'Cabin crew');
INSERT INTO casting VALUES (31, 28, 'Secretary/administrator');
INSERT INTO casting VALUES (31, 24, 'Radio producer');
INSERT INTO casting VALUES (32, 30, 'Homeopath');
INSERT INTO casting VALUES (32, 10, 'Clinical molecular geneticist');
INSERT INTO casting VALUES (32, 28, 'Exhibitions officer, museum/gallery');
INSERT INTO casting VALUES (32, 12, 'IT sales professional');
INSERT INTO casting VALUES (32, 34, 'Paediatric nurse');
INSERT INTO casting VALUES (33, 18, 'Administrator, charities/voluntary organisations');
INSERT INTO casting VALUES (33, 40, 'Education officer, museum');
INSERT INTO casting VALUES (33, 35, 'Brewing technologist');
INSERT INTO casting VALUES (33, 31, 'Oncologist');
INSERT INTO casting VALUES (33, 30, 'Personnel officer');
INSERT INTO casting VALUES (34, 38, 'General practice doctor');
INSERT INTO casting VALUES (34, 18, 'Nurse, mental health');
INSERT INTO casting VALUES (34, 21, 'Network engineer');
INSERT INTO casting VALUES (34, 16, 'Solicitor');
INSERT INTO casting VALUES (35, 18, 'Textile designer');
INSERT INTO casting VALUES (35, 29, 'Engineer, manufacturing systems');
INSERT INTO casting VALUES (35, 16, 'Quarry manager');
INSERT INTO casting VALUES (36, 37, 'Furniture conservator/restorer');
INSERT INTO casting VALUES (36, 40, 'Research scientist (physical sciences)');
INSERT INTO casting VALUES (36, 25, 'Records manager');
INSERT INTO casting VALUES (36, 22, 'Network engineer');
INSERT INTO casting VALUES (37, 32, 'Television floor manager');
INSERT INTO casting VALUES (37, 21, 'Biochemist, clinical');
INSERT INTO casting VALUES (37, 12, 'Engineering geologist');
INSERT INTO casting VALUES (38, 14, 'Conservation officer, nature');
INSERT INTO casting VALUES (38, 23, 'Financial planner');
INSERT INTO casting VALUES (38, 17, 'Hospital pharmacist');
INSERT INTO casting VALUES (38, 22, 'Market researcher');
INSERT INTO casting VALUES (39, 39, 'Accommodation manager');
INSERT INTO casting VALUES (39, 18, 'Brewing technologist');
INSERT INTO casting VALUES (39, 36, 'Magazine features editor');
INSERT INTO casting VALUES (39, 1, 'Tree surgeon');
INSERT INTO casting VALUES (40, 13, 'Hydrogeologist');
INSERT INTO casting VALUES (40, 6, 'Community pharmacist');
INSERT INTO casting VALUES (40, 16, 'Designer, furniture');
INSERT INTO casting VALUES (40, 27, 'Psychiatric nurse');
INSERT INTO casting VALUES (40, 32, 'Housing manager/officer');
INSERT INTO casting VALUES (41, 16, 'Water quality scientist');
INSERT INTO casting VALUES (41, 31, 'Therapist, art');
INSERT INTO casting VALUES (41, 32, 'Professor Emeritus');
INSERT INTO casting VALUES (41, 29, 'Conservation officer, historic buildings');
INSERT INTO casting VALUES (41, 2, 'Heritage manager');
INSERT INTO casting VALUES (42, 19, 'Designer, television/film set');
INSERT INTO casting VALUES (42, 15, 'Engineer, drilling');
INSERT INTO casting VALUES (42, 26, 'Multimedia programmer');
INSERT INTO casting VALUES (43, 16, 'Meteorologist');
INSERT INTO casting VALUES (43, 20, 'Analytical chemist');
INSERT INTO casting VALUES (43, 38, 'Furniture designer');
INSERT INTO casting VALUES (43, 24, 'Buyer, retail');
INSERT INTO casting VALUES (43, 31, 'Human resources officer');
INSERT INTO casting VALUES (44, 34, 'Data processing manager');
INSERT INTO casting VALUES (44, 23, 'Designer, blown glass/stained glass');
INSERT INTO casting VALUES (44, 28, 'Financial risk analyst');
INSERT INTO casting VALUES (44, 36, 'Air traffic controller');
INSERT INTO casting VALUES (44, 22, 'Rural practice surveyor');
INSERT INTO casting VALUES (45, 30, 'Engineer, maintenance');
INSERT INTO casting VALUES (45, 18, 'Politician''s assistant');
INSERT INTO casting VALUES (45, 20, 'Scientist, audiological');
INSERT INTO casting VALUES (45, 17, 'Theatre manager');
INSERT INTO casting VALUES (46, 8, 'Jewellery designer');
INSERT INTO casting VALUES (46, 13, 'Event organiser');
INSERT INTO casting VALUES (46, 21, 'Teaching laboratory technician');
INSERT INTO casting VALUES (47, 35, 'Teacher, early years/pre');
INSERT INTO casting VALUES (47, 12, 'Dietitian');
INSERT INTO casting VALUES (47, 13, 'Control and instrumentation engineer');
INSERT INTO casting VALUES (48, 31, 'Environmental consultant');
INSERT INTO casting VALUES (48, 18, 'Engineer, communications');
INSERT INTO casting VALUES (48, 38, 'Clothing/textile technologist');
INSERT INTO casting VALUES (49, 39, 'Clothing/textile technologist');
INSERT INTO casting VALUES (49, 19, 'Horticultural consultant');
INSERT INTO casting VALUES (49, 7, 'Trade union research officer');
INSERT INTO casting VALUES (49, 13, 'Theme park manager');
INSERT INTO casting VALUES (49, 15, 'Optometrist');
INSERT INTO casting VALUES (50, 12, 'Cabin crew');
INSERT INTO casting VALUES (50, 20, 'Financial risk analyst');
INSERT INTO casting VALUES (50, 1, 'Social worker');
INSERT INTO casting VALUES (50, 35, 'Writer');


#3. 데이터 분석 및 인사이트

#3-1. 장르별 평균 평점은 ?
SELECT genre, ROUND(AVG(rating), 2) AS avg_rating
FROM movie m
JOIN review r ON m.movie_id = r.movie_id
GROUP BY genre;

#3-2. 감독별 평균 평점 상위 TOP 5는?
SELECT director, ROUND(AVG(r.rating), 2) AS avg_rating
FROM movie m
JOIN review r ON m.movie_id = r.movie_id
GROUP BY director
HAVING COUNT(*) >= 3
ORDER BY avg_rating DESC
LIMIT 5;

#3-3. 어떤 영화 장르가 리뷰 수가 가장 많은가?
SELECT m.genre, COUNT(r.review_id) AS review_count
FROM movie m
JOIN review r ON m.movie_id = r.movie_id
GROUP BY m.genre
ORDER BY review_count DESC;
DROP DATABASE IF EXISTS bt_mysql;
CREATE DATABASE bt_mysql;
USE bt_mysql;

CREATE TABLE restaurant(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(200),
	image VARCHAR(500),
	description VARCHAR(500)
);

CREATE TABLE user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(150),
	email VARCHAR(150),
	password VARCHAR(150)
);

CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(200)
);

CREATE TABLE rate_res(
	rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	res_id INT,
	amount INT,
	date_rate DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE like_res(
	like_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	res_id INT,
	date_like DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(200),
	image VARCHAR(500),
	price FLOAT,
	description VARCHAR(500),
	type_id INT,
	
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE sub_food(
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(150),
	sub_price FLOAT,
	food_id INT,
	
	FOREIGN KEY (food_id) REFERENCES food(food_id)
);


CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	food_id INT,
	amount INT,
	code VARCHAR(300),
	arr_sub_id VARCHAR(300),
	
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (food_id) REFERENCES food(food_id)
);


INSERT INTO restaurant (res_name, image, description) VALUES
  ('Nhà hàng A', 'https://example.com/images/a.jpg', 'Đây là mô tả về nhà hàng A.'),
  ('Nhà hàng B', 'https://example.com/images/b.jpg', 'Đây là mô tả về nhà hàng B.'),
  ('Nhà hàng C', 'https://example.com/images/c.jpg', 'Đây là mô tả về nhà hàng C.'),
  ('Nhà hàng D', 'https://example.com/images/d.jpg', 'Đây là mô tả về nhà hàng D.'),
  ('Nhà hàng E', 'https://example.com/images/e.jpg', 'Đây là mô tả về nhà hàng E.');
  

INSERT INTO user (full_name, email, password) VALUES
  ('John Doe', 'john.doe@example.com', 'hashed_password_1'),
  ('Jane Smith', 'jane.smith@example.com', 'hashed_password_2'),
  ('Michael Johnson', 'michael.johnson@example.com', 'hashed_password_3'),
  ('Emily Brown', 'emily.brown@example.com', 'hashed_password_4'),
  ('Robert Lee', 'robert.lee@example.com', 'hashed_password_5'),
  ('David Williams', 'david.williams@example.com', 'hashed_password_6'),
  ('Sarah Davis', 'sarah.davis@example.com', 'hashed_password_7'),
  ('Daniel Martinez', 'daniel.martinez@example.com', 'hashed_password_8'),
  ('Jennifer Taylor', 'jennifer.taylor@example.com', 'hashed_password_9'),
  ('Christopher Anderson', 'christopher.anderson@example.com', 'hashed_password_10'),
  ('Lisa Thomas', 'lisa.thomas@example.com', 'hashed_password_11'),
  ('Matthew Jackson', 'matthew.jackson@example.com', 'hashed_password_12'),
  ('Elizabeth White', 'elizabeth.white@example.com', 'hashed_password_13'),
  ('Kevin Harris', 'kevin.harris@example.com', 'hashed_password_14'),
  ('Jessica Wilson', 'jessica.wilson@example.com', 'hashed_password_15'),
  ('William Martin', 'william.martin@example.com', 'hashed_password_16'),
  ('Megan Garcia', 'megan.garcia@example.com', 'hashed_password_17'),
  ('Richard Rodriguez', 'richard.rodriguez@example.com', 'hashed_password_18'),
  ('Amanda Martinez', 'amanda.martinez@example.com', 'hashed_password_19'),
  ('Thomas Hernandez', 'thomas.hernandez@example.com', 'hashed_password_20');


INSERT INTO food_type (type_name) VALUES
  ('Món Tráng Miệng'),
  ('Món Chính'),
  ('Món Ăn Nhanh'),
  ('Món Hấp'),
  ('Món Chiên'),
  ('Món Hầm'),
  ('Món Lẩu'),
  ('Món Xào'),
  ('Món Nướng'),
  ('Món Gỏi');
 
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
  (1, 1, 4, '2023-08-02 12:30:00'),
  (2, 1, 5, '2023-08-02 13:45:00'),
  (3, 2, 3, '2023-08-02 10:15:00'),
  (1, 3, 2, '2023-08-01 08:00:00'),
  (4, 2, 5, '2023-08-01 19:30:00');
 
INSERT INTO like_res (user_id, res_id, date_like) VALUES
  (1, 1, '2023-08-02 10:15:00'),
  (2, 1, '2023-08-02 11:30:00'),
  (3, 2, '2023-08-02 12:45:00'),
  (1, 3, '2023-08-01 08:30:00'),
  (4, 2, '2023-08-01 20:00:00'),
  (1, 4, '2023-08-02 10:15:00'),
  (5, 1, '2023-08-03 11:30:00'),
  (5, 2, '2023-07-02 12:45:00'),
  (9, 3, '2023-06-01 08:30:00'),
  (14, 2, '2023-05-01 20:00:00'),
  (4, 5, '2023-04-02 11:30:00'),
  (5, 5, '2023-03-02 12:45:00'),
  (9, 1, '2023-02-01 08:30:00'),
  (8, 2, '2023-01-01 20:00:00');
  

 INSERT INTO food (food_name, image, price, description, type_id) VALUES
  ('Bánh mỳ nướng', 'https://example.com/images/banh_my.jpg', 2.5, 'Bánh mỳ nướng giòn thơm', 3),
  ('Pizza hải sản', 'https://example.com/images/pizza_hai_san.jpg', 15.99, 'Pizza hải sản thơm ngon', 2),
  ('Gà nướng', 'https://example.com/images/ga_nuong.jpg', 10.5, 'Gà nướng hương thơm', 5),
  ('Bún chả', 'https://example.com/images/bun_cha.jpg', 8.75, 'Bún chả Hà Nội truyền thống', 2),
  ('Súp hải sản', 'https://example.com/images/sup_hai_san.jpg', 6.25, 'Súp hải sản đậm đà', 1);
  
  
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
  ('Rau', 10.5, 1),
  ('Khăn giấy', 25.0, 2),
  ('Sốt', 5.0, 3),
  ('Món ăn phụ', 7.5, 1),
  ('Phô mai thêm', 12.25, 2);
  
  
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
  (1, 1, 2, 'ORDER1234', '1,3'),
  (2, 2, 1, 'ORDER5678', '2'),
  (3, 1, 3, 'ORDER91011', '2,4,5'),
  (4, 3, 1, 'ORDER1213', '1,3'),
  (1, 2, 2, 'ORDER1415', '2,5');


-- =========================================================
-- Tìm 5 người đã like nhà hàng nhiều nhất.
-- =========================================================
SELECT full_name, COUNT(*) as total_like FROM user 
INNER JOIN like_res
ON user.user_id = like_res.user_id
INNER JOIN restaurant
ON restaurant.res_id = like_res.res_id
GROUP BY full_name
ORDER BY total_like DESC
LIMIT 5;


-- =========================================================
-- Tìm 2 nhà hàng có lượt like nhiều nhất
-- =========================================================
SELECT res_name, count(*) as total_user_like FROM user
INNER JOIN like_res 
ON user.user_id = like_res.user_id
INNER JOIN restaurant
ON restaurant.res_id = like_res.res_id
GROUP BY res_name
ORDER BY total_user_like DESC
LIMIT 2;


-- =========================================================
-- Tìm người đã đặt hàng nhiều nhất.
-- =========================================================
SELECT full_name, count(*) as total_orders FROM user
INNER JOIN orders
ON user.user_id = orders.user_id
GROUP BY full_name
LIMIT 1;

-- =========================================================
-- Tìm người dùng không hoạt động trong hệ thống
-- (không đặt hàng, không like, không đánh giá nhà hàng).
-- =========================================================
SELECT user.user_id, full_name FROM user
LEFT JOIN orders ON user.user_id = orders.user_id
LEFT JOIN like_res ON user.user_id = like_res.user_id
LEFT JOIN rate_res ON user.user_id = rate_res.user_id
WHERE orders.order_id IS NULL AND like_res.like_res_id IS NULL AND rate_res.rate_res_id IS NULL;


-- =========================================================
-- Tính trung bình sub_food của một food.
-- =========================================================


SELECT food_id, food_name, AVG(sub_food_count) AS avg_sub_food_count
FROM (
    SELECT food.food_id, food.food_name, COUNT(sub_food.sub_id) AS sub_food_count
    FROM food
    LEFT JOIN sub_food ON food.food_id = sub_food.food_id
    GROUP BY food.food_id, food.food_name
) AS sub_food_counts
GROUP BY food_id, food_name;


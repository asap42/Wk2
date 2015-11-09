/*
	# Wk 2 homework
    # Student: Mauricio Sanchez
    # Date: Nov 8th 2015
*/

CREATE DATABASE video_reviews;

# 1. Create videos table

CREATE TABLE videos(
  id INT(6) NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  length VARCHAR(10),
  url VARCHAR(255),
  PRIMARY KEY (id)
);

INSERT INTO videos 
	(id, title, length, url) 
VALUES
	(NULL, 'Insightly CRM Review', '14.21', 'https://www.youtube.com/watch?v=ajXACcw4Tsw'),
	(NULL, 'Insightly - How to create users and assign them under teams ', '6:51', 'https://www.youtube.com/watch?v=APrdKL7leDc');

# 2. Create and populate reviewers table

CREATE TABLE reviews(
  id INT(6) NOT NULL AUTO_INCREMENT,
  name_handle VARCHAR(50),
  review VARCHAR(255),
  rating int(1) NULL,
  video int(6),
  PRIMARY KEY (id)
);

INSERT INTO reviews 
	(id, name_handle, review, rating, video) 
VALUES
	(NULL, 'Anamaria McDanields', 'Thank you for the video', '4', '1'),
	(NULL, 'John Doe', 'Very informative', '3', '2'),
    (NULL, 'Lucas Taneda', 'Loved it!!!', '5', '1'),
    (NULL, 'Maria Lopez', 'Nice job', '3', '2');
    

# 3. Report on video reviews
    
SELECT videos.title,
       reviews.name_handle,
	   reviews.review,
       reviews.rating,
       videos.url
FROM
	videos INNER JOIN reviews
ON videos.id = reviews.video
GROUP BY videos.title,
       reviews.name_handle,
	   reviews.review,
       reviews.rating,
       videos.url
ORDER BY videos.title, reviews.rating ASC;

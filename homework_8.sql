USE vk;

*/Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).*/

SELECT * FROM messages;

SELECT * FROM users4;
 
SELECT from_user_id, to_user_id, txt, messages.created_at, 
COUNT(*) as send
FROM messages 
	JOIN users4 ON from_user_id = users4.id OR to_user_id = users4.id
WHERE users4.id = 1
ORDER BY messages.created_at DESC;

*/Подсчитать общее количество лайков, которые получили пользователи младше 10 лет*/

SELECT * FROM profiles;

SELECT * FROM posts_likes;

SELECT pr.user_id, 
COUNT(p.like_type > 1) as 'Кол-во лайков'
FROM profiles pr
	JOIN posts_likes p ON pr.user_id = p.user_id 
WHERE (YEAR(NOW())-YEAR(birthday)) < 10
GROUP BY pr.user_id;

*/Определить кто больше поставил лайков (всего): мужчины или женщины.*/
 
SELECT * FROM profiles;

SELECT * FROM posts_likes;

SELECT pr.gender, 
COUNT(p.like_type > 1) as 'Кол-во лайков'
FROM profiles pr
	JOIN posts_likes p ON pr.user_id = p.user_id 
GROUP BY pr.gender;



-- Jake Austin
--GA WDI Boston June
-- June 19, 2014
\c hw_joins
-- 1. Get posts containing a specific keyword (e.g. "about").
SELECT * FROM posts WHERE content ILIKE '%about%';

-- 2. Get a listing of all posts grouped by year.
--  These are in descending order but not actually grouped by year
--  According to David the fix is wierd, he will show me tomorrow
SELECT * FROM posts
  ORDER BY extract(year from created_at);

-- 3. Get the top 5 wordiest posts by character count.
SELECT * FROM posts
  ORDER BY length(content) DESC LIMIT 5;

-- 4. Find how many comments each user has across all of their posts.
SELECT u.login, COUNT(c.*)
  FROM users u, posts p, comments c
  WHERE c.post_id = p.id AND p.author_id = u.id
  GROUP BY u.login;

-- 5. Get a specific user's posts sorted by date of most recent comment.
--   For George, one post gets reported TWICE - David said to debug tomorrow
SELECT p.content, c.created_at
  FROM users u, posts p, comments c
  WHERE u.login = 'Tanya' AND p.author_id = u.id AND c.post_id = p.id
  ORDER BY c.created_at DESC;

-- 6. Find how many comments each user has made per post category.


-- 7. Get the 5 most-commented-on posts that were created in the last 7 days.


-- 8. Get the 5 posts with the longest-running comment threads
--    (longest time between first and last comments).


-- 9. Get all posts by a specific user that have comments,
--    but which that user hasn't commented on.


-- 10. Find which category of post each user has made the most comments on.

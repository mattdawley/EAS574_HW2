"""
Important notes:
- Anywhere you have quotes in your string, you must use an escape character backslash \ prior to each quote
- DO NOT CHANGE any of the variable names, or your will have errors on your tests and loose all points
- If you copy and paste queries, double check all special characters or quotes
- Do not include the semi-colon in the queries 

You must pass the pre-submission tests in order to get credit for your queries
"""
q2c_movies = "SELECT * FROM movies LIMIT 10"
q2c_ratings = "SELECT * FROM RATINGS LIMIT 10"
q3b = "SELECT * FROM s3_users_count WHERE num_of_reviews > 500"
q4b = "SELECT title, num_of_reviews from s4_popular_movies ORDER BY num_of_reviews DESC LIMIT 10"
q5b = "SELECT title, average_rating from s5_highest_stars WHERE title LIKE '%Toy%' ORDER BY average_rating DESC"
q6b = ""
q7b = ""
q8b = ""

#Skip Step 9, you only need to do the step 10 select query in this file
q10b =""
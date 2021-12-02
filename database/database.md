## Installation

- Create The schema from Execute the queries found in the following file

[create-database-tables.sql](./create-database-tables.sql)

<hr />

## Queries
**1- Find author by name "Leo"** 

#### - Query
```
SELECT * FROM authors WHERE "name" ILIKE 'Leo%';
```
#### - Time Complexity: `O(log(n))`

**2- Find books of author "Fitzgerald"** 

#### - Query
```
SELECT * FROM books WHERE "author" ILIKE '%Fitzgerald%';;
```

#### - Time Complexity: `O(log(n))`

**3- Find authors without books** 

#### - Query
```
SELECT authors.name
FROM authors
         LEFT JOIN books b on authors.name = b.author
WHERE b.name IS NULL;
```

#### - Time Complexity: `O(N + M) + O(log(N + M))`
#### - Suggestions: 
1- use indices for the join columns

2- use sequential(Auto Increment) fields for joining the both tables

**4- Count books per country** 

#### - Query
```
SELECT count(b.name) as books_count, country
FROM authors
         LEFT JOIN books b on authors.name = b.author
GROUP BY country;
```

#### - Time Complexity: `O(N + M) + ( N + M)log( N + M)`
#### - Suggestions: 
1- use indices for the join columns
2- Add Index for the group by field
3- use sequential(Auto Increment) fields for joining the both tables

**5- Count average book length (in pages) per author**

_I don't get "Count average", so I supposed that "Count" written by mistake_

#### - Query
```
SELECT round(avg(pages), 2), author
FROM books
         INNER JOIN authors a on books.author = a.name
group by books.author;
```

#### - Time Complexity: `O(N + M) + (N + M)log(N + M)`
#### - Suggestions: 
1- use indices for the join columns

2- Add Index for the group by field

3- use sequential(Auto Increment) fields for joining the both tables 
    



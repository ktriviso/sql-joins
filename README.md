# Relationships in SQL / SQL JOINs

## Learning Objectives

- Create tables with foreign key references.
- Create join tables to represent many-to-many relationships.
- Insert rows in join tables to create many-to-many relationships.
- Select data about many-to-many relationships using join tables.


## Introduction

While it is conceivable to store all of the data that is needed for a particular domain model object or resource in a single table, there are numerous downsides to such an approach.  For example, in the cheesy sql exercise, if we wanted to update the name `America` or `Ireland` to `United States of America` or `Republic Of Ireland`, we would have to update every single row in the `cheese` table that referred to either of these places of origin.  Thus, `redundancy` of common data points can make altering or updating these fields difficult.  

Further, there are weak guarantees for the consistency and correctness of hard-coded fields in a single column; what prevents a developer who is working on a different feature from using `french` rather than `France` when inserting new rows into the `cheese` table?  Leveraging table relations can improve `data integrity` and provide stronger guarantees regarding the consistency and correctness of what we store and retrieve from a database.


One of the key features of relational databases is that they can represent
relationships between rows in different tables.

Consider spotify, we could start out with two tables, `artist` and `track`.
Our goal now is to somehow indicate the relationship between an artist and a track.
In this case, that relationship indicates who performed the track.

You can imagine that we'd like to use this information in a number of ways, such as...
- Getting the artist information for a given track
- Getting all tracks performed by a given artist
- Searching for tracks based on attributes of the artist (e.g., all tracks
  performed by artists at Interscope)

## JOINS

### Building it from the ground up
Let's build out our spotify database, starting with artist, album, and track.
Note how id's are PRIMARY KEYs, and relationships are established when these
ids are referenced by other tables.

```sql
CREATE TABLE artist(
  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE album(
  name VARCHAR(255),
  label VARCHAR(255),
  id VARCHAR(255) PRIMARY KEY
);

CREATE TABLE track(
  name VARCHAR(255),
  artist_id VARCHAR(255),
  album_id VARCHAR(255),
  disc_number INTEGER,
  popularity INTEGER,
  id VARCHAR(255) PRIMARY KEY
);
```

Using simple `SELECT` statements, if we wanted to find all songs by `Beyonce` we would have to execute to queries, e.g.:

```sql
spots=# SELECT * FROM artist WHERE name LIKE 'Beyonc%';
           id           |  name
------------------------+---------
 6vWDO969PvNqNYHIOW5v0m | Beyoncé
(1 row)
```

And then copy + paste the artist.id into a `SELECT` query `FROM` the `track` table:

```sql
spots=# SELECT name FROM track WHERE artist_id = '6vWDO969PvNqNYHIOW5v0m';
                       name
--------------------------------------------------
 Video Phone - Extended Remix featuring Lady Gaga
 Crazy In Love
 Drunk in Love
 ***Flawless
 Video Phone
(5 rows)
```
We can see that the tables we are `SELECT`ing `FROM` are the exact tables defined in the db schema.  As will be shown below, SQL does not confine the user to simply querying data from individual tables.  It is possible, at least from a user interface perspective, to stitch together two tables along a common column such that the table to be queried from looks more like the following:

```sql
spots=# SELECT * FROM artist JOIN track ON track.artist_id = artist.id LIMIT 3;
           id           |     name      |            name            |       artist_id        |        album_id        | disc_number | popularity |           id
------------------------+---------------+----------------------------+------------------------+------------------------+-------------+------------+------------------------
 3HCpwNmFp2rvjkdjTs4uxs | Kyuss         | Demon Cleaner              | 3HCpwNmFp2rvjkdjTs4uxs | 1npen0QK3TNxZd2hLNzzOj |           1 |         52 | 2cVphsi72OjF7s0rtt2z5e
 1hCkSJcXREhrodeIHQdav8 | Ramin Djawadi | This World                 | 1hCkSJcXREhrodeIHQdav8 | 2poAUFGkHetMzM4xzLBVhY |           1 |         52 | 41otw6RUcMhVgO1LDOLmFX
 2gCsNOpiBaMNh20jQ5prf0 | Buddy Guy     | Baby Please Dont Leave Me | 2gCsNOpiBaMNh20jQ5prf0 | 7bkjnyiMG8mXzmEyfY49wD |           1 |         45 | 7JECM65zNFrYIHdvxj8NbO
```

How is this possible?

To `SELECT` information on two or more tables at ones, we can use a `JOIN` clause.
This will produce rows that contain information from both tables. When joining
two or more tables, we have to tell the database how to match up the rows.
(e.g. to make sure the author information is correct for each book).

This is done using the `ON` clause, which specifies which properties to match.

```
SELECT artist.name, track.name FROM artist JOIN track ON track.artist_id = artist.id WHERE artist.name LIKE 'Beyon%';
  name   |                       name
---------+--------------------------------------------------
 Beyoncé | Video Phone - Extended Remix featuring Lady Gaga
 Beyoncé | Crazy In Love
 Beyoncé | Drunk in Love
 Beyoncé | ***Flawless
 Beyoncé | Video Phone
(5 rows)
```

Notice that now we should include the table name for each column.
In some cases this isn't necessary where SQL can disambiguate the columns
between the various tables, but it makes parsing the statement much easier
when table names are explicitly included.

Also, our select items can be more varied now and include either all or
just some of the columns from the associated tables.

```sql
spots=# SELECT * FROM artist JOIN track ON track.artist_id = artist.id WHERE artist.name LIKE 'Beyon%';
-[ RECORD 1 ]-------------------------------------------------
id          | 6vWDO969PvNqNYHIOW5v0m
name        | Beyoncé
name        | Video Phone - Extended Remix featuring Lady Gaga
artist_id   | 6vWDO969PvNqNYHIOW5v0m
album_id    | 1wuC0jj7341uFOuCyqzwe8
disc_number | 1
popularity  | 53
id          | 2nX9948PslVYrrHUf6w0eL
-[ RECORD 2 ]-------------------------------------------------
id          | 6vWDO969PvNqNYHIOW5v0m
name        | Beyoncé
name        | Crazy In Love
artist_id   | 6vWDO969PvNqNYHIOW5v0m
album_id    | 6oxVabMIqCMJRYN1GqR3Vf
disc_number | 1
popularity  | 80
id          | 5IVuqXILoxVWvWEPm82Jxr
-[ RECORD 3 ]-------------------------------------------------
id          | 6vWDO969PvNqNYHIOW5v0m
name        | Beyoncé
name        | Drunk in Love
artist_id   | 6vWDO969PvNqNYHIOW5v0m
album_id    | 2UJwKSBUz6rtW4QLK74kQu
disc_number | 1
popularity  | 77
id          | 6jG2YzhxptolDzLHTGLt7S
-[ RECORD 4 ]-------------------------------------------------
id          | 6vWDO969PvNqNYHIOW5v0m
name        | Beyoncé
name        | ***Flawless
artist_id   | 6vWDO969PvNqNYHIOW5v0m
album_id    | 2UJwKSBUz6rtW4QLK74kQu
disc_number | 1
popularity  | 68
id          | 7tefUew2RUuSAqHyegMoY1
-[ RECORD 5 ]-------------------------------------------------
id          | 6vWDO969PvNqNYHIOW5v0m
name        | Beyoncé
name        | Video Phone
artist_id   | 6vWDO969PvNqNYHIOW5v0m
album_id    | 23Y5wdyP5byMFktZf8AcWU
disc_number | 2
popularity  | 55
id          | 53hNzjDClsnsdYpLIwqXvn
```

### What could go wrong?
There are no explicit checks to ensure that we're actually obeying these references.

### Solution: Foreign Keys
To remedy this problem, we can instruct the database to ensure that the relationships
between tables are valid, and that new records cannot be inserted that break these
constraints.  In other words, the `referential integrity` of our data is maintained.

By using the `REFERENCES` keyword, foreign key constraints can be added to the schema.

```SQL
CREATE TABLE track(
  name VARCHAR(255),
  artist_id VARCHAR(255) REFERENCES artist(id),
  album_id VARCHAR(255) REFERENCES album(id),
  disc_number INTEGER,
  popularity INTEGER,
  id VARCHAR(255) PRIMARY KEY
);
```

After adding references, postgresql will now reject insert/update/delete queries that violate the consistency of the define relationships, viz., a track can't be added that either has an invalid artist_id.


Note: `\d+` and a table name displays a helpful view of the structure of a table along with
its relationships and constraints.

### Types of JOINS

There are actually more than one type of `JOIN` statement.  See the following resource for a clean explanation:

Which have we already seen?  The `JOIN` statement defaults to the inner join, since only records that have rows in both tables are displayed.

[Visual Joins](http://www.dofactory.com/sql/join)

[More Visual Joins](http://www.sql-join.com/sql-join-types/)

And a nifty keyword postgresql provides for handling `null` values:

[psql coalesce](http://www.postgresqltutorial.com/postgresql-coalesce/)

### Multi-Joins

`JOIN` statements can also be linked together to query data across several tables.

```sql
SELECT album.name
FROM album
JOIN track ON track.album_id = album.id
JOIN artist ON track.artist_id = artist.id
WHERE artist.name LIKE 'Beyon%';

name
--------------------------------------
I AM...SASHA FIERCE THE BONUS TRACKS
Dangerously In Love
BEYONCÉ [Platinum Edition]
BEYONCÉ [Platinum Edition]
I AM...SASHA FIERCE
```
## Join tables > Many-to-Many Relations
Join Tables are used for Many-to-Many relationships.  They typically consist
of at minimum, two foreign keys and possibly other metadata:

```SQL
CREATE TABLE spotify_user(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE likes(
  user_id SERIAL REFERENCES spotify_user(id),
  track_id VARCHAR(255) REFERENCES track(id),
  confirmed BOOLEAN DEFAULT FALSE
);
```

The query above for all albums by Beyoncé is effectively a query across a join table, viz., albums, but due to the quirks of album/artist/track relations, `like`s are a slightly better example. 

Also, `AS` can be used to give more descriptive names to the values returned
by join clauses:

```sql
SELECT country.name AS countryName, countrylanguage.isofficial AS isLangOfficial
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE country.name = 'Brazil';
```

# Lab Join Queries
- Navigate to `lab` in this repo and follow the directions in the `README`

# Further Practice

- [SQL for Beginners](https://www.codewars.com/collections/sql-for-beginners/): Created by WDI14 graduate and current GA instructor Mike Nabil.
- [SQL Zoo](https://sqlzoo.net/)
- [Code School Try SQL](https://www.codeschool.com/courses/try-sql)
- [W3 Schools SQL tutorial](https://www.w3schools.com/sql/)
- [Postgres Guide](http://postgresguide.com/)
- [SQL Course](http://www.sqlcourse.com/)

## Further Lab

- first clone this repo
- Navigate to `spots`
-  `createdb musicdb`
- `psql -d musicdb -f seed.sql`

Then do the following:

- Identify all relations/constraints on the track table, are there any others?
- Find all songs released on albums from the `Interscope` label
    <!-- SELECT track.name AS track_name
    FROM track
    JOIN album
    ON (track.album_id = album.id)
    WHERE label='Interscope'; -->
- Find all of Beyoncé's track
    <!-- SELECT track.name AS track_name
    FROM track
    JOIN artist
    ON (track.artist_id = artist.id)
    WHERE artist.name='Beyoncé' -->
- Find all of the disc numbers only for Beyonce's track
    <!-- SELECT track.disc_number AS the_disc_number, track.name AS track_name, artist.name AS artist_name
    FROM track
    JOIN artist
    ON (track.artist_id = artist.id)
    WHERE artist.name LIKE 'Bey%'; -->
- Find all of the names of Beyoncé's albums
    <!-- SELECT album.name AS album_name
    FROM track
    JOIN artist
    ON (track.artist_id = artist.id)
    JOIN album
    ON (track.album_id = album.id)
    WHERE artist.name LIKE 'Bey%'
    ORDER BY album.name; -->
- Find all of the album names, track names, and artist id associated with Beyoncé
    <!-- SELECT track.name AS track_name, album.name AS album_name, artist.id AS artist_id
    FROM track
    JOIN artist
    ON (track.artist_id = artist.id)
    JOIN album
    ON (track.album_id = album.id)
    WHERE artist.name LIKE 'Bey%'; -->
- Find all songs released on `Virgin Records` that have a `popularity` score > 30
    <!-- SELECT track.name
    AS track_name
    FROM track JOIN album
    ON (track.album_id = album.id)
    WHERE album.label LIKE 'Virgin'
    AND track.popularity > 30; -->
- Find the artist who has released track on the most albums
    Hint: The last few may need more than one `join` clause each

    <!-- SELECT COUNT(DISTINCT album.name) AS album_name, artist.name AS artist_name FROM track
    JOIN artist
    ON (track.artist_id = artist.id)
    JOIN album
    ON (track.album_id = album.id)
    GROUP BY artist.name
    ORDER BY COUNT(album.name) DESC
    LIMIT 1 -->

<!-- STEP BY STEP -->
    <!-- SELECT COUNT(DISTINCT album.name) AS album_name, artist.name AS artist_name
    FROM artist
    JOIN track
    ON (artist.id = track.artist_id)
    JOIN album
    ON (album.id = track.album_id)
    GROUP BY artist.name
    ORDER BY COUNT(album.name)
    LIMIT 1 -->

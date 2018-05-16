CREATE TABLE movies (
  movie_id serial PRIMARY KEY,
  title varchar(255) NOT NULL,
  synopsis text,
  director_id integer REFERENCES directors
);

INSERT INTO movies (title, synopsis, director_id) VALUES
  (
    'Birdman or (The Unexpected Virtue of Ignorance)',
    'Illustrated upon the progress of his latest Broadway play, a former popular actor''s struggle to cope with his current life as a wasted actor is shown.',
    1
  ),
  (
    '21 Grams',
    'A freak accident brings together a critically ill mathematician, a grieving mother, and a born-again ex-con.',
    1
  ),
  (
    'The Revenant',
    'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.',
    1
  ),
  (
    'Whiplash',
    'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student''s potential.',
    2
  ),
  (
    'Nightcrawler',
    'When Louis Bloom, a driven man desperate for work, muscles into the world of L.A. crime journalism, he blurs the line between observer and participant to become the star of his own story. Aiding him in his effort is Nina, a TV-news veteran.',
    3
  ),
  (
    'Guardians of the Galaxy',
    'A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe.',
    4
  ),
  (
    'Mad Max: Fury Road',
    'A woman rebels against a tyrannical ruler in postapocalyptic Australia in search for her home-land with the help of a group of female prisoners, a psychotic worshipper, and a drifter named Max.',
    5
  ),
  (
    'Happy Feet',
    '
    Into the world of the Emperor Penguins, who find their soul mates through song, a penguin is born who cannot sing. But he can tap dance something fierce!',
    5
  ),
  (
    'Ex Machina',
    'A young programmer is selected to participate in a ground-breaking experiment in synthetic intelligence by evaluating the human qualities of a breath-taking humanoid A.I.',
    6
  ),
  (
    'Arrival',
    'When 12 mysterious spacecraft appear around the world, linguistics professor Louise Banks is tasked with interpreting the language of the apparent alien visitors.',
    7
  ),
  (
    'The Lobster',
    'In a dystopian near future, single people, according to the laws of The City, are taken to The Hotel, where they are obliged to find a romantic partner in forty-five days or are transformed into beasts and sent off into The Woods.',
    8
  ),
  (
    '2001: A Space Odyssey ',
    'Humanity finds a mysterious, obviously artificial object buried beneath the Lunar surface and, with the intelligent computer H.A.L. 9000, sets off on a quest.',
    9
  ),
  (
    'The Shining',
    'A family heads to an isolated hotel for the winter where an evil and spiritual presence influences the father into violence, while his psychic son sees horrific forebodings from the past and of the future.',
    9
  ),
  (
    'District 9',
    'An extraterrestrial race forced to live in slum-like conditions on Earth suddenly finds a kindred spirit in a government agent who is exposed to their biotechnology.',
    10
  ),
  (
    'The Godfather',
    'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
    11
  ),
  (
    'Annie Hall',
    'Neurotic New York comedian Alvy Singer falls in love with the ditzy Annie Hall.',
    12
  ),
  (
    'Manhattan',
    'The life of a divorced television writer dating a teenage girl is further complicated when he falls in love with his best friend''s mistress.',
    12
  ),
  (
    'Midnight in Paris',
    'While on a trip to Paris with his fiancée''s family, a nostalgic screenwriter finds himself mysteriously going back to the 1920s everyday at midnight.',
    12
  ),
  (
    'Boogie Nights',
    'The story of a young man''s adventures in the Californian pornography industry of the late 1970s and early 1980s.',
    13
  ),
  (
    'Punch Drunk Love',
    'A psychologically troubled novelty supplier is nudged towards a romance with an English woman, all the while being extorted by a phone-sex line run by a crooked mattress salesman, and purchasing stunning amounts of pudding.',
    13
  ),
  (
    'Magnolia',
    'An epic mosaic of interrelated characters in search of love, forgiveness, and meaning in the San Fernando Valley.',
    13
  ),
  (
    'There Will Be Blood',
    'A story of family, religion, hatred, oil and madness, focusing on a turn-of-the-century prospector in the early days of the business.',
    13
  ),
  (
    'The Red Shoes',
    'A young ballet dancer is torn between the man she loves and her pursuit to become a prima ballerina.',
    14
  ),
  (
    'Taxi Driver',
    'A mentally unstable Vietnam War veteran works as a night-time taxi driver in New York City where the perceived decadence and sleaze feeds his urge for violent action, attempting to save a preadolescent prostitute in the process.',
    15
  ),
  (
    'The Wolf of Wall Street',
    'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.',
    15
  ),
  (
    'Pulp Fiction',
    'The lives of two mob hit men, a boxer, a gangster''s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',
    16
  ),
  (
    'Kill Bill: Vol. 1',
    'The Bride wakens from a four-year coma. The child she carried in her womb is gone. Now she must wreak vengeance on the team of assassins who betrayed her - a team she was once part of.',
    16
  ),
  (
    'Fargo',
    'Jerry Lundegaard''s inept crime falls apart due to his and his henchmen''s bungling and the persistent police work of the quite pregnant Marge Gunderson.',
    17
  ),
  (
    'The Big Lebowski',
    '"The Dude" Lebowski, mistaken for a millionaire Lebowski, seeks restitution for his ruined rug and enlists his bowling buddies to help get it.',
    17
  ),
  (
    'Rosemary''s Baby',
    'A young couple move into an apartment, only to be surrounded by peculiar neighbors and occurrences. When the wife becomes mysteriously pregnant, paranoia over the safety of her unborn child begins to control her life.',
    18
  ),
  (
    'American Beauty',
    'A sexually frustrated suburban father has a mid-life crisis after becoming infatuated with his daughter''s best friend.',
    19
  );
-- Creating the 'questions' table
CREATE TABLE questions (
    ID INT PRIMARY KEY,
    name VARCHAR(32),
    email VARCHAR(32),
    title VARCHAR(32),
    content VARCHAR(32)
);

-- Creating the 'category' table
CREATE TABLE category (
    ID INT PRIMARY KEY,
    name VARCHAR(16)
);

-- Creating the 'article' table
CREATE TABLE article (
    ID INT PRIMARY KEY,
    crumb VARCHAR(32),
    image VARCHAR(16),
    image_cardarticolo VARCHAR(16),
    title VARCHAR(64),
    title_cardarticolo VARCHAR(64),
    subtitle_cardarticolo VARCHAR(64),
    description_cardarticolo VARCHAR(64),
    article TEXT,
    coords_X INT,
    coords_Y INT,
    category_ID INT,
    FOREIGN KEY (category_ID) REFERENCES category(ID)
);

-- Creating the 'randinfo' (random info) table
CREATE TABLE randinfo (
    ID INT PRIMARY KEY,
    image VARCHAR(16),
    information VARCHAR(16),
    label VARCHAR(16)
);

-- Creating the 'article_randinfo' table
CREATE TABLE article_randinfo (
    ID INT PRIMARY KEY,
    randinfo_ID INT,
    article_ID INT,
    FOREIGN KEY (randinfo_ID) REFERENCES randinfo(ID),
    FOREIGN KEY (article_ID) REFERENCES article(ID)
);

CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  description TEXT,
  galaxy_type VARCHAR(60),
  age_in_millions_of_years INT,
  is_spherical BOOLEAN,
  has_life BOOLEAN
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  age_in_millions_of_years INT,
  distance_from_earth NUMERIC,
  is_spherical BOOLEAN,
  has_life BOOLEAN
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  star_id INT REFERENCES star(star_id),
  distance_from_earth NUMERIC,
  planet_type VARCHAR(60),
  is_spherical BOOLEAN,
  has_life BOOLEAN
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  planet_id INT REFERENCES planet(planet_id),
  description TEXT,
  is_spherical BOOLEAN,
  has_life BOOLEAN
);

CREATE TABLE region (
  region_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  description TEXT
);

INSERT INTO galaxy (name, description, galaxy_type, age_in_millions_of_years, is_spherical, has_life) VALUES
('Milky Way','Home galaxy of Earth','Barred Spiral',13600,false,true),
('Andromeda','Nearest major galaxy','Spiral',10010,false,false),
('Triangulum','Third largest in Local Group','Spiral',13000,false,false),
('Messier 87','Supergiant elliptical galaxy','Elliptical',13240,true,false),
('Sombrero','Bright nucleus galaxy','Spiral',13250,false,false),
('Whirlpool','Interacting grand-design spiral','Spiral',12000,false,false),
('Cartwheel','Ring galaxy','Lenticular',13100,false,false);

INSERT INTO star (name, galaxy_id, age_in_millions_of_years, distance_from_earth, is_spherical, has_life) VALUES
('Sun',1,4600,0.0000158,true,true),
('Proxima Centauri',1,4850,4.24,true,false),
('Sirius',1,242,8.6,true,false),
('Betelgeuse',1,8,642.5,true,false),
('Vega',1,455,25.0,true,false),
('Rigel',1,8,860.0,true,false),
('Alpheratz',2,60,97.0,true,false);

INSERT INTO planet (name, star_id, distance_from_earth, planet_type, is_spherical, has_life) VALUES
('Mercury',1,0.61,'Terrestrial',true,false),
('Venus',1,0.28,'Terrestrial',true,false),
('Earth',1,0.0,'Terrestrial',true,true),
('Mars',1,0.52,'Terrestrial',true,false),
('Jupiter',1,4.2,'Gas Giant',true,false),
('Saturn',1,8.5,'Gas Giant',true,false),
('Uranus',1,18.2,'Ice Giant',true,false),
('Neptune',1,29.0,'Ice Giant',true,false),
('Proxima b',2,4.24,'Terrestrial',true,false),
('Sirius b',3,8.6,'Terrestrial',true,false),
('Vega b',5,25.0,'Gas Giant',true,false),
('Rigel b',6,860.0,'Gas Giant',true,false),
('Alpheratz b',7,97.0,'Terrestrial',true,false);

INSERT INTO moon (name, planet_id, description, is_spherical, has_life) VALUES
('Moon',3,'Earth natural satellite',true,false),
('Phobos',4,'Larger moon of Mars',false,false),
('Deimos',4,'Smaller moon of Mars',false,false),
('Io',5,'Volcanic moon of Jupiter',true,false),
('Europa',5,'Icy moon of Jupiter',true,false),
('Ganymede',5,'Largest moon in system',true,false),
('Callisto',5,'Cratered moon of Jupiter',true,false),
('Amalthea',5,'Inner moon of Jupiter',false,false),
('Titan',6,'Largest moon of Saturn',true,false),
('Rhea',6,'Second largest Saturn moon',true,false),
('Iapetus',6,'Two-toned moon',true,false),
('Dione',6,'Icy Saturn moon',true,false),
('Tethys',6,'Icy Saturn moon',true,false),
('Enceladus',6,'Geyser moon of Saturn',true,false),
('Mimas',6,'Death Star moon',true,false),
('Titania',7,'Largest moon of Uranus',true,false),
('Oberon',7,'Outer moon of Uranus',true,false),
('Miranda',7,'Small moon of Uranus',true,false),
('Ariel',7,'Bright moon of Uranus',true,false),
('Umbriel',7,'Dark moon of Uranus',true,false),
('Triton',8,'Largest moon of Neptune',true,false),
('Nereid',8,'Outer moon of Neptune',false,false);

INSERT INTO region (name, description) VALUES
('Inner Solar System','Rocky terrestrial planets'),
('Outer Solar System','Gas and ice giants'),
('Local Group','Galaxies gravitationally bound to us');

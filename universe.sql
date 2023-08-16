--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(25) NOT NULL,
    orbital_periodyrs numeric(3,2) NOT NULL,
    spectral_clss character varying(60),
    diameter integer,
    rotational_period_hrs numeric(4,2) NOT NULL,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(35) NOT NULL,
    rotational_period_earthdys numeric(4,2),
    orbital_periodyrs numeric(6,2) NOT NULL,
    mean_diam_km integer NOT NULL,
    last_perihelion_d date,
    next_perihelion_d date,
    perihelion numeric(5,3),
    aphelion numeric(5,1),
    mean_orbitspd_kmpersec numeric(4,2),
    magnitude numeric(3,1),
    albedo numeric(4,3),
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(38) NOT NULL,
    solar_mass text,
    no_of_stars text,
    diameter_lightyrs integer NOT NULL,
    no_of_constellations text,
    app_magnitude numeric(4,2),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: meteor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor (
    meteor_id integer NOT NULL,
    name character varying(25) NOT NULL,
    origin character varying(35) NOT NULL,
    radiant character varying(45) NOT NULL,
    peak_meteor_count integer NOT NULL,
    meteor_vel_kmpersec numeric(3,1) NOT NULL,
    description text
);


ALTER TABLE public.meteor OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_meteor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_meteor_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_meteor_id_seq OWNED BY public.meteor.meteor_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(22) NOT NULL,
    diameter_km numeric(6,1),
    distance_from_planet_km integer NOT NULL,
    year_discovered integer,
    description text,
    orbital_period_days numeric(5,2),
    gravity_m_per_sec_sq numeric(5,3),
    average_surface_temp_kelvin integer,
    rotational_period_days numeric(5,2),
    associated_planet character varying(15),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(12) NOT NULL,
    planet_type character varying(19),
    no_of_moons integer NOT NULL,
    orbital_period_earth_days bigint NOT NULL,
    rotational_period_earth_days numeric(5,2),
    mean_distance_from_sun_km bigint,
    mean_surface_temp_kelvin integer,
    has_life boolean,
    is_spherical boolean,
    planet_age_billionyrs numeric(2,1),
    mean_orb_vel_km_per_sec numeric(4,2),
    distance_from_earth_km bigint,
    surface_area_km2 bigint,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(35) NOT NULL,
    constellation_family character varying(50),
    s_luminosityunits integer NOT NULL,
    surface_temp_kelvin integer NOT NULL,
    distance_from_earth_lightyrs text NOT NULL,
    solar_radius_rel_sun numeric(5,2),
    solar_mass_rel_sun numeric(4,2),
    description text,
    colour text,
    spectral_type text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: meteor meteor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor ALTER COLUMN meteor_id SET DEFAULT nextval('public.meteor_meteor_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '99942 Apophis', 0.89, 'Sq', 340, 30.56, 'This is a near-Earth asteroid, which when discovered in 2004 was identified as one of the most hazardous asteroids that could hit Earth. But radar observation done in March 2021 found out that there is not a risk of this asteroid hitting Earth for at least 100 years. This asteroid got its name from a demon serpent in ancient Egyptian mythology that personified evil and chaos. It is classified as an S-type stony asteroid made from silicate materials and a mixture of metallic iron and nickel. Rader images show the asteroid has  elongated lobes that make the asteroid shaped like a peanut. It is though to have originated from the asteroid belt between Mars and Jupiter; due to gravitational influence of planets like Jupiter its orbit has changed and now orbits the Sun nearer to Earth. When this asteroid rotates on its long axis it does so with a rocking back and forth motion while it wobbles on its short axis.The rocking motion is longer lasting than the wobble motion and the rocking motion is called non-principal axis rotation.');
INSERT INTO public.asteroid VALUES (2, '101955 Bennu', 1.20, 'B', 492, 4.30, 'This is a carbonaceous B-Type asteroid in the Apollo group discovered by the LINEAR Project on 11th September 1999.This asteroid makes a close approach to Earth every 6 years, but the distance on these approaches varies.It is believed Bennu broke off from a much larger carbon-rich asteroid around 700 million to 2 billion years ago that was in the asteroid belt between Mars and Jupiter.Temperatures on the asteroid vary from hot to frigid so there are no conditions for life.This asteroid weighs around 77.6 million metric tons.Sunlight can change the asteroid''s entire trajectory; as Bennu continues to rotate it expels this heat and as a result it is pushed by around 0.29 km per year in the direction of the Sun,which changes its orbit. Sampling this asteroid in the future will be difficult as it is covered in large boulders.');
INSERT INTO public.asteroid VALUES (3, '16 Psyche', 5.01, 'M(Tholen)/X(SMASS)', 226, 4.19, 'This asteroid was discovered by Annabelle de Gasparis and was named after the Greek god Psyche. It is the largest and most massive of the M-type asteroids.It orbits between Mars and Jupiter in the main portion of the asteroid belt.Orbital simulations does by NASA''s JPL CNEOSdo not show any close approaches to Earth.It has an orbitl speed of 17.38km/s and is thought to be composed of iron,nickel and cobalt. It has a magnitude of 6.21 and an albedo of 0.1203.');
INSERT INTO public.asteroid VALUES (4, '162173 Ryugu', 1.30, 'Cb-type(SMASSII)|C/F-type(Tholen)', 1, 7.63, 'This is a diamond shaped asteroid visited by the Japanese spacecraft Hayabusa2.The name Ryugu means Dragon''s palace. This ia carbonaceous C-type asteroid; it is beleived to have broken off from a larger body and then the pulverized material under the influence of gravity came together to create a rubble pile. It is one of the darkest celestial bodies and it very dry, suggesting that maybe this asteroid had a laot of exposure to sunlight in the past. It contains organic molecules just like Bennu so it contains the building blocks for living organisms. It is classified as a Near Earth Asteroid (NEA) and is considred a Potentially Hazardous Asteroid due to predictions that it may come close to Earth.It has an albedo of 0.045 and a magnitude of 19.55.In addition to carbon, based off of its spectral class it may contain water,iron,nickel,cobalt,nitrogen and ammonia.');
INSERT INTO public.asteroid VALUES (5, '4 Vesta', 3.64, 'V-type', 530, 5.34, 'This is a Main-belt asteroid comparable to the size of Great Britain and is a dwarf planet orbiting between Mars and Jupiter in the asteroid belt; it is not considered hazardous to Earth at this time; at its closest point to Earth it is 1.14 AUs from Earth.There are two enourmous craters in Vesta''s southern hemisphere indicating numerous collisions occurred and fragments were lost from it around two billion years ago. The orbit of Vesta lies within that of Ceres.The surface of Vesta is covered in basaltic regions indicating some kind of lava flowed cross the surface. Vesta haan oblate spheroid shape. Its i interior is similar to that of other terrestrial planets having a crust of cooled lava, a rocky mantle and a core of iron and nickel. Vesta is a fast spinning asteroid with prograde rotation so it spins in the same direction as which it orbits the Sun.');
INSERT INTO public.asteroid VALUES (6, '243 Ida', 4.84, 'S-type', 31, 4.63, 'This astoroid was discovered in 1884 by Austrian astronomer Johann Palisa; its orbit lies between the planets of Mars and Jupiter.It is irregularly shaped and heavily cratered.It has an absolute magnitude of 9.99 so it is a faint body.Ida is the first known asteroid to be discovered that has a moon called Dactyl.This is a stony asteroid of the Koronis family,which was presumed to be created when a larger rocky body was smashed after the solar system was formed 4.5 billion years ago.');
INSERT INTO public.asteroid VALUES (7, '433 Eros', 1.76, 'S-type', 17, 5.27, 'This asteroid is known as a Mars-crosser(Amor) as it is known to come within the orbit of Mars. It is found within the inner asteroid belt and is shaped like a potato and is a Near Earth Asteroid. Eros was used in the past to calculate the mass of the Earth-moon system in AUs before ground-based radar was available. It was discovered in 1898 by Gustav Witt, director of Urania Observatory in Berlin. It got its name from Eros, who is the son of Mercury and Venus.Eros poses no threat of hitting Earth at the current time. This was the first asteroid to have a spacecraft on it and to have a spacecraft orbit it. It has an absolute magnitude of 10.31 and an albedo of 1. It has an elliptical orbit.');


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 2.20, 75.32, 11, '1986-02-09', '2061-07-28', 0.586, 35.1, 54.60, 28.2, 0.040, 'This is a short period comet that appears within our inner solar system every 75 years or so. The orbit of this comet is highly elliptical so it is brought as far as where Pluto is. At its closest approach it appears in the space between Mercury and Venus. This comet has a retrograde orbit so it rotates around the Sun in a direction that is opposite to the orbit of planets.To the naked eye it appears as  a blazing big ball of light. There can delays in the orbital period of this comet due to gravitational force influences of Jupiter,Saturn and Venus. Halley''s comet has already lost 80-90% of its original mass due to sublimation of the ice in the nucleus of the comet as it gets nearer to the Sun.');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp Comet', 0.48, 2525.00, 60, '1997-04-01', '4385-10-27', 0.914, 370.8, 43.81, 10.5, 0.040, 'This is a long-period orbit type comet. It flew by close to Earth in 1997. It was most prominently seen in the northern atmosphere and was present for at least 18 months by the naked unaided eye. This comet gets very bright as it approaches the Sun to vaporization of the ice in it; it has a thick white dust tail.Members of the Heaven''s Gate cult thought a spaceship was flying behind this comet and as a result, 39 members committed suicide believing they would be teleported to the spaceship. This comet has a bright blue ion tail of ionized gases that are blown away from the Sun due to interaction with solar wind.');
INSERT INTO public.comet VALUES (3, 'Borrelly Comet', NULL, 6.84, 5, '2022-02-01', '2028-12-11', 1.310, 5.9, 15.70, 9.7, 0.022, 'This is amid-sized Jupiter family comet with low inclination thion, short period and is controlled by Jupiter''s gravitational field. It is also referred to as the 19P/Borrelly with the P meaning period; the P also signifies that the orbital period of the comet is less than 20 years. It is not classified as a hazardous comet because its orbit is not brought close to the Earth. It has the shape of a chicken drumstick. This comet has an elliptical orbit that goes just outside the orbit of Jupiter and just within the orbit of Mars.');
INSERT INTO public.comet VALUES (36, 'Encke Comet', 11.08, 3.29, 5, '2017-03-10', '2023-10-22', 0.340, 4.1, 20.08, 15.4, 0.046, 'Encke Comet is a mid-sized comet whose orbit brings it closer to the Sun than Jupiter. 2P/Encke is considered to be a Near Earth Asteroid that is predicted to pass within 21106620km of Earth in 2063.Its discoverer Johann Encke calculated that its orbital period is reducing by around 2.5 hours on every rotation but the explanation for this suggested from American astronomer Fred Whipple  as being due to jet forces produced from sublimation of water ice on the surface of the comet nucleus in combination with the rotation of the nucleus.');
INSERT INTO public.comet VALUES (37, 'Swift-Tuttle Comet', NULL, 133.33, 26, '1992-12-11', '2126-07-12', 0.920, 51.2, 5.83, 4.5, NULL, 'This was an extremely bright comet discovered in 1862 by Lewis Swift and Horace Parnell Tuttle. Its nucleus is quite large at 26km, which is twice the size of the object the led to the extinction of dinosaurs. This is a periodic comet, hence it has an orbital period less than 200 years and is sometimes called the 109P/Swift-Tuttle Comet.It is highly inclined to the elliptical plane of our solar system. The Perseids meteor shower is thought to originate from the Swift-Tuttle Comet.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', '1.5 trillion solar masses', '100-400 billion', 100000, '30', -20.50, 'The Milky Way galaxy is a disk that is not perfectly flat; it is warped due to Large and Small Megellanic clouds that pull on the matter within this galaxy. It takes 250 million years for the Milky Way galaxy to rotate.10-15% of this galaxy is amde of dust and gas. There is a black hole at the centre of this galaxy called Sagitttarius A*. This galaxy is made from other galaxies it has consumed; at the moment it is currently consuming Canis Major Dwarf Galaxy and taking the stars within it and adding them to the outer spiral of the Milky Way. Milky Way Galaxy is made up of 90% dark matter and 10% luminous matter which creates an invisible halo around the galaxy; this galaxy is part of the Local Group of galaxies and is moving at a speed of 600km/s.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy/Messier 31', 'Spiral', '1 trillion solar masses', '1 trillion', 200000, '16', 3.44, 'Andromeda is the most massive galaxy in the Local Group; it is approaching the Milky Way at a rate of 110 km/s. It was thought to be formed from the fusion of earlier protogalaxies; it is the brightest external galaxy we can see with the unaided eye as a blue. This galaxy has a disk of blue stars and is encircled by a ring filled with red stars. It is situated in the constellation Andromeda between constellation Cassiopeia and the Great Square asterism of the Pegasus constellation. It is best viewed in the Spring in the southern hemisphere of Earth.');
INSERT INTO public.galaxy VALUES (3, 'Barnard''s Galaxy', 'Barred Irregular Galaxy', '0.16 solar masses', '10 million stars', 7000, '1', 9.30, 'This galaxy is located in the Sagittarius constellation; it is partly visible in both hemispheres at certain times of the year.This dwarf irregular galaxy is among one of the Milky Way''s galactic neighbours. It is filled with young blue stars and is mottled with a pink hydrogen glow which contains new stars forming. It too is a member of the Local Group of galaxies.');
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'Spiral', '0.4 billion solar masses', '100 billion stars', 53800, '1', 9.36, 'This galaxy is located in the Coma Berenices constellation in a galaxy group called the M94 Group or Canes Venatici I cloud.This galaxy is named so because of the dark band of absorbing dust that is in front of the galaxy''s bright nucleus(relative to Earth); it is best observed in May by telescope. The gas in this galaxy''s outer region rotates in a direction opposite from gas and stars in its inner region.');
INSERT INTO public.galaxy VALUES (5, 'Fireworks Galaxy', 'Spiral', '329 million solar masses cca.', '>100 billion stars', 40000, '2', 9.60, 'This galaxy gets its name from the considerable amount of supernovae explosions that have occured within it over the the last century alone; it is located on the border of northern constellations Cepheus and Cygnus. This galaxy has a high rate of star formation; it contains some unusual celestial objects such as the ''Red Eclipse'', that looks like a super-bubble or a supernova remnant. It contains half the stars of the Milky Way and is obscured by interstellar matter. The spiral arms of the galaxy are devoid of stars and gaseous hydrogen. There are also dark lanes within it called Hodge''s Complex, which is a superimposed dwarf galaxy.');
INSERT INTO public.galaxy VALUES (9, 'Bode''s Galaxy', 'Spiral', '50 billion solar masses', '250 billion stars', 90000, '1', 6.94, 'Bode''s Galaxy is the most blueshifted large galaxy;it is located in the Ursa Major constellation. It is one of the brightest galaxies in the night sky located 11.5 million light years from Earth; it contains a central red bulge where old red stars re; at the core of the galaxy there is a black hole that is 70 million times the mass of our Sun. The galaxy''s bluish spiral arms that extend down to the nucleus contain young stars that formed millions of years ago. The hot young stars emit UV radiation with clouds of hydrogen gas.');
INSERT INTO public.galaxy VALUES (6, 'Sunflower Galaxy', 'Spiral', '140 billion solar masses', '400 billion stars', 98000, '1', 9.30, 'This is quite a compact galaxy, where the spiral arms are bound closely together and it has a flocculent appearance; the spiral arms are dotted with young stars glowing bright blue so it is an active galaxy with rapid star formation.It is located in the constellation Canes Venatici and it part of the M51 Group of galaxies. Via small telescopes it looks like a faint white light.');
INSERT INTO public.galaxy VALUES (7, 'Sagittarius Dwarf Elliptical Galaxy', 'Dwarf Elliptical', '400 million solar masses', '1 billion stars', 10000, '1', 4.50, 'This galaxy is ellipsoidal in shape and smooth; this galaxy is suspected to pass through the galactic disk of the Milky Way within the next 100 million years. Studies by the 2018 Gaia Project of the European Space Agency showed that this galaxy had caused disturbances in a set of stars near the Milky Way''s core, which caused them to ripple.Currently the ellipsoidal part of the galaxy has already extended through the local space of the Milky Way and it is expected to be absorbed into the larger galaxy.');
INSERT INTO public.galaxy VALUES (8, 'Sculptor Galaxy', 'Spiral', '100 billion solar masses', '6 stars(exoplanets)', 90000, '1', 8.00, 'This is an intermediate spiral galaxy that is moving away from our galaxy at a rate of 243km/s. It is located within the constellation of Sculptor. It is located 13 million light years away from the Earth. This galaxy has thick dust lanes and this dust feeds the high rate of star formation within it; stars form and explode at a high rate within this galaxy. The Sculptor Group may be the next closest group of galaxies beyond the Local Group of galaxies. This galaxy is a strong source of high-energy x-rays and gamma rays likely due to the black holes that near the centre of the galaxy. It is dubbed the Silver Coin Galaxy for its appearance when viewed via small telescopes.');
INSERT INTO public.galaxy VALUES (10, 'Triangulum Galaxy', 'Spiral', '3-6 billion solar masses', '40 billion stars', 60000, '1', 5.72, 'This galaxy is located with the Triangulum constellation; it is one of the most distant deep sky objects that can be seen without binoculars; it is the third largest member of the Local Group of galaxies. It also has a small satellite galaxy of its own called the Pisces Dwarf Galaxy. It contains ionized hydrogen cloud regions called H-II regions; these are big regions of new star birth. In the loose spiral arms are stellar nurseries that contain short-lived but massive stars.UV radiation from the massive stars ionizes the surrounding hydrogen gas to produce the characteristic red glow. This galaxy is visible at latitudes north o degreesf -53 from March through May. This galaxy does not seem to have a large black hole at its centre like the Milky Way or Andromeda galaxies do.');
INSERT INTO public.galaxy VALUES (11, 'Centaurus A', 'Lenticular S(0)', '1 trillion solar masses', '281 stars', 97000, '1', 6.84, 'Located in the Centaurus constellation, this galaxy was thought to have been created when a small spiral galaxy collided with a large elliptical galaxy. Part of this galaxy looks like an S turned to the side. It has a bright disc where new stars form and a supermassive black hole much larger than that in our Milky Way. The black hole has a mass of 55 million suns. This was the first galaxy that humans were able to detect radio waves. It is the 5th brightest galaxy and the sideways portion of the galaxy has an interstellar dust lane, which feeds the material necessary to create stars and exoplanets. Two supernovae have been detected so far; the 1st is a type Ia supernova and the 2nd one is currently undergoing investigation. So at least two stars orbited each other with one of them collapsing on themselves.');
INSERT INTO public.galaxy VALUES (12, 'Large Magellanic Cloud', 'Irregular Dwarf', '250 billion solar masses', '30 billion stars', 14000, '2', 0.90, 'This is a satellite galaxy of the Milky Way; it shares some features of spiral galaxies with a visible bar and spiral arm-like structure.It contains an active starbirth region called the Tarantula Nebula; this is part of a larger part of an intrinsic cloud of gas and dust; its high rate of star formation may be due to the compression of insterstellar gas and dust the makes contact with an interstellar medium. This galaxy is the site of the 1987a supernova explosion. It is one of the closest galaxies to Earth and is located in the Dorado and Mensa constellations; it shares a gas envelope with Small Magellanic Cloud and floats around our Milky Way.');
INSERT INTO public.galaxy VALUES (13, 'Small Magellanic Cloud', 'Irregular Dwarf', '6.5 billion solar masses', '3 billion stars', 7000, '2', 2.70, 'This satellite galaxy is located within the constellations Tucana and Hydrus. It is a rich field of star formation and is thought to be a large source of X-ray binaries. This galaxy was originally presumed to be barred spiral but due to influence of the  Milky Way it became irregular. The LMC and SMC are connected by a bridge of gas called the Magellanic Bridge where stars form.');


--
-- Data for Name: meteor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor VALUES (1, 'Quadrantids', '2003 EH1(Asteroid)', 'Bootes Constellation', 80, 41.0, 'This meteor shower is active and visible between December 28th and January 12th and will peak between January 3rd and January 4th.This meteor shower is produced when Earth passes via the ice and dust left behind by 2003 EH1, which is considered an extinct comet. The peak for Quadrantids is short-lived because Earth passes the particles at near perpendicular angles. Quadrantids are known for their bright fireball meteors; these explosions of light and colour last longer than the average meteor streak. These fireballs arise from larger particles of material. This meteor shower is best seen in the northern hemisphere during the night and pre-dawn hours; it can also be seen at latitudes north of 51 degrees South. Asteroid 2003 EH1, from which t meteor is thought to originate from orbits the Sun every 5.52 year; as mentioned previously this asteroid may be dead due to substantial loss of material or just be a rock comet.');
INSERT INTO public.meteor VALUES (2, 'Lyrids', 'C/1861 G1 Thatcher', 'Lyra Constellation', 20, 49.0, 'Lyrid meteors are space debris from the Comet Thatcher, which was first discovered in 1861. The meteor showers have a duration of 15 days from April 15th to April 29th. The Comet Thatcher is right now far away from the Sun in s orbit and will reach its furthest point in year 2070, at which point it will begin its return trip orbit to reach its perihelion in year 2283. The comet produces a meteor shower outburst every 60 years with the next outburst being in 2042; these outbursts are due to the other planets re-shaping the long trail of comet debris left behind by Comet Thatcher in its long orbit; this debris intercepts Earth''s orbit to create the meteor shower.');
INSERT INTO public.meteor VALUES (3, 'Eta Aquarids', 'Halley''s Comet(1/P Halley)', 'Aquarius Constellation', 20, 66.0, 'This meteor shower occurs between April 19th and March 28th each year and peaks before dawn on May 5th. This meteor shower can be seen both in the northern and southern hemisphere, but are better seen in the southern hemisphere; in the northern hemisphere the meteors skim the surface of the sky and then disappear. This meteor shower is thought to originate from debris of Halley''s Comet that separated from the comet hundreds of years ago. Eta Aquarids is one of two meteor showers created from Halley''s Comet; the other is the Orionid meteor shower, which peaks around October 20th.');
INSERT INTO public.meteor VALUES (4, 'Perseids', '109P/Swift-Tuttle', 'Perseus Constellation', 100, 59.0, 'When Perseids meteors enter the atmosphere they compress the air in front of them causing temperatures to sometimes reach 1650 Celsius. The heat can vaporize the meteors creating shooting stars, a flash called a fireball and explosions that can heard from the ground. Perseids can from a river of comet debris left behind the the Swift-Tuttle comet as the comet makes its approximate 130 year orbit around the Sun; the debris created during the orbit folloroughly the same orbit as the comet before gradually dispersing in space. The Perseids meteor shower peaks around August 11th and 12th(for most of the night) and are best seen in the northern hemisphere.');
INSERT INTO public.meteor VALUES (5, 'Leonids', '55P/Tempel-Tuttle', 'Leo Constellation', 15, 71.0, 'This meteor shower becomes quite busy and active every 33-34 years as it produces a meteor storm(1000 meteors per hour). This meteor shower originates from the 55P/Tempel-Tuttle comet that orbits the Sun every 33 years. This meteor produces fireballs and earthgrazers(meteors that just skim the surface of the atmosphere of Earth); these meteor showers peak during mid-November.');
INSERT INTO public.meteor VALUES (6, 'Geminids', '3200 Phaethon', 'Gemini Constellation', 120, 35.0, 'This meteor shower stream is unique in that its parent source is not a comet but an asteroid Phaethon. This asteroid measures 5.1km in diameter. There are many theories but it is not known hon for sure  this asteroid produces the meteoroids of Geminids. The Geminids meteor shower occurs every year from early to mid-December(4th to 17th). The meteors produced are not numerous but they are very bright; they remain visible even when the shower is no longer intense and have a yellowish hue. Geminids are visible in both hemispheres and peak at night on December 13th until dawn of December 14th. The parent 3200 Phaethon asteroid orbits the Sun every 1.4 years.');
INSERT INTO public.meteor VALUES (7, 'Ursids', 'Tuttle''s Comet(8P/Tuttle)', 'Ursa Minor Constellation', 10, 33.0, 'The meteor showers are not that spectacular having a low peak meteor count; they have an activity period between 17th December and 26th December. Ursids arise from the Tuttle''s comet, which has an orbital period around the Sun of 13.6 years; this meteor shower is best seen in the northern hemisphere between midnight and dawn.');
INSERT INTO public.meteor VALUES (8, 'Northern Taurids', '2004 TG10', 'Taurus Constellation', 5, 29.0, 'This meteor shower does produce fireballs but with a low peak meteor count they are not as spectacular as other meteor showers.hey can be seen between mid-October and December 10th. The debris of this meteor shower is rather spread out meaning it takes Earth time tom move through the debris, explaining the long activity period. This meteor stream comes from an asteroid 2004 TG10, which is beleived to be from the bigger Comet Encke. 2004 TG10 is also the source of the Beta Taurids meteor shower.  The Southern Taurids occur at the same time as this meteor shower. The Northern Taurids emanate from the boundary of the Taurus Constellation.');
INSERT INTO public.meteor VALUES (9, 'Southern Taurids', '2P/Encke', 'Taurus Constellation', 5, 28.0, 'Southern Taurids are active around September to mid-November; this long activity period is due to the diffuse nature of the meteors. These meteor fragments undergo perturbations due to influence of planets (escpecially Jupiter). This meteor shower tends to peak on or around October 10th and cand can be seen from both hemispheres during ate night until dawn. These Southern Taurids are not very bright and are better seen in a moonless sky.. The parent source of this meteor shower is the Encke Comet, which is belid to be deriveved from a bigger body that broke into pieces approximately 20000 yeaars ago.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'Europa', 3121.0, 671000, 1610, 'Europa is composed of silicate rock and the outermost layer of the planet is made of watery ice so it is a promising candidate for possible life as there is suggested there may be an underground ocean; there are fluctuations in its magnetic field suggesting there is some sort of conductor present; it is the sixth closest satellite to Jupiter.', 3.55, 1.315, 33, 3.55, 'Jupiter', 5);
INSERT INTO public.moon VALUES (2, 'Deimos', 12.4, 23460, 1877, 'A theory is that Deimos may have been an asteroid pushed into the orbit of Mars from the asteroid belt by Jupiter; it has two big craters 3km across named after Swift and Voltaire; it is one of the smallest moons in the solar system and is gradually moving away from the orbit of Mars until it will break free from Mars; Deimos is ellipsoidal in shape.', 1.30, 0.003, 233, 1.30, 'Mars', 4);
INSERT INTO public.moon VALUES (5, 'Callisto', 4820.6, 1883000, 1610, 'Callisto is the 2nd largest moon of Jupiter and is heavily cratered and is considered a dead world due to lack of geologic activity; it is composed of 60% rock and iron and 40% ice and may contain liquid water; hence it is very reflective and is brighter than Luna. It may be able to harbour life and is assumed to have formed from dust and gas that surrounded Jupiter;; it is tidally locked to Jupiter so the same face is always seen from Jupiter.', 16.70, 1.236, 55, 16.70, 'Jupiter', 5);
INSERT INTO public.moon VALUES (41, 'Titan', 5150.0, 1200000, 1655, 'Titan is the 2nd largest moon in our solar system and the largest moon of Saturn.Titan has a hazy atmosphere with mostly nitrogen and clouds of methane and ethane that create a smog. Titan has water ice over a rocky terrain with liquid hydrocarbon lakes and cryovolcanoes responsible for some impact cratering. These methane lakes are concentrated near its southern pole.', 15.90, 1.352, 91, 15.90, 'Saturn', 6);
INSERT INTO public.moon VALUES (42, 'Enceladus', 504.2, 238000, 1789, 'Enceladus has massive fissures called tiger stripes; it has hydrothermal vents that release plumes containing hydrogen; while no life has been detected on this moon it has the right conditions for life.It has an atmosphere of mostly water vapour with small amounts of carbon dioxide, methane and nitrogen.It is largely and icy world and has a subsurface ocean consisting of water.It is thought to be heated by tidal flexing becasuse of the gravitational pull of Saturn or by radioactive decay within the core of the moon.', 1.37, 0.113, 75, 1.37, 'Saturn', 6);
INSERT INTO public.moon VALUES (75, 'Iapetus', 14.0, 2213000, 1671, 'This is the 3rd largest moon of Saturn; it has a bright and dark hemisphere and this dark region is called Cassini Regio; the dark region of the leading hemisphere comes from organic materials that have been left behind as ice in this warmer Cassini region undergoes sublimation; the organic matter is suggested to also come from nearby dust shed from asteroids and comets from nearby satellite Phoebe;this planet has no detectable atmosphere or magnetic field.', 79.00, 0.223, 110, 79.00, 'Saturn', 6);
INSERT INTO public.moon VALUES (76, 'Tethys', 1062.0, 295000, 1684, 'This is the 5th largest moon of Saturn;it is composed mostly of ice water, has plenty of craters and is scarred by a large chasm; it also has mysterious red streaks; it is tidally locked to Saturn as an inner moon so the same face always faces Saturn.The trailing hemisphere is darker in colour,which is naturally occuring due to radiation exposure of the water ice while the lighter colour leading hemisphere is sand-blasted from the E-ring of Saturn with icy dust and tiny particles ejected from Enceladus.It has an Odysseus impact crater and a valley called Ithaca Chasma created likely when the moon froze and expanded.', 1.88, 0.145, 86, 1.88, 'Saturn', 6);
INSERT INTO public.moon VALUES (77, 'Umbriel', 1169.4, 266000, 1851, 'Umbriel is the darkest moon of Uranus and is large;it is thought to be made up of 50% water ice(mantle) and 50% rock/metal(core); it has has many craters on its surface of unknown cause and it reflects only 16% of the light it receives to give off a slight bluish tint.The only substances detected so far have been water and carbon dioxide.', 4.13, 0.200, 73, 4.13, 'Uranus', 7);
INSERT INTO public.moon VALUES (78, 'Titania', 1576.8, 435840, 1787, 'It is the largest moon of Uranus that displays signs that it was geologically active; it has a thin atmosphere of carbon dioxide that is seasonal. It has a system of fault valleys over 15000km long with troughs that split the crust in two directions, which indicates tectonic extension.The largest chasma is Messina Chasmata with a diameter of 1483km; the largest crater on Titania is Gertrude with a diameter of 323km. Titania has no magnetic field and is a neutral grey colour.', 8.70, 0.367, 70, 8.80, 'Uranus', 7);
INSERT INTO public.moon VALUES (79, 'Ariel', 1157.8, 190900, 1851, 'Ariel has the brightest reflective surface when comapred to the other largest moons of Uranus;Ariel has no detectable atmosphere or magnetic field.This moon is covered with many craters and canyons and shape-wise it is almost perfectly spherical.The surface is covered with water ice and that are other carbonaceous material and rock that make up this planet.', 2.50, 0.249, 60, 2.50, 'Uranus', 7);
INSERT INTO public.moon VALUES (1, 'Luna', 3474.8, 384400, 1609, 'Luna is the 2nd densest satellite in our solar system; its gravity influences tides in seas and oceans and it causes tides of rock to move up a few cm; Luna has has weak quakes on it due tthe gravity of Earth; there is a a thin layer of ice on Luna due to delivery from comets and the appearance in the sky waxes and wanes depending on its position in relation the Sun; the moon is covered in craters and dead volcanoes where lava used to flow.', 29.50, 1.620, 250, 27.30, 'Earth', 3);
INSERT INTO public.moon VALUES (3, 'Phobos', 22.5, 6000, 1877, 'Phobos is quite close to Mars in its orbit; it is composed on material similar to that dwarf planets and asteroids, which is type 1 or 2 carbonaceous chondrites;it is predicted that Phobos will collide with Mars in 50 million years as it moving towards Mars at a rate of 1.8 centimetres per year.Phobos is believed to have formed from rock and dust drawn together by gravvity or from a large collision that broke away pieces from Mars.Phobos moves across the sky of Mars twice a day as it moves around Mars faster than Mars rotates itself', 0.32, 0.006, 215, 0.32, 'Mars', 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268.2, 1070400, 1610, 'This is the largest moon of Jupiter and in our solar system; Ganymede has a magnetosphere where charged particles are trapped and deflected; it has a core of iron with a layer of rock on to followed by a crust of thick ice.It shows craters and signs of tectonic activity and is believed to have a salty ocean underneath and has rock formations on its surface.', 7.15, 1.428, 110, 7.13, 'Jupiter', 5);
INSERT INTO public.moon VALUES (7, 'Io', 3643.2, 422000, 1610, 'Io is the innermost Galilean moon of Jupiter; its core is made of iron or iron sulphide but its colourful orange,red,black and yellow spongy appearance is due to brown silicate like orthopyroxene, sulphur and sulphur dioxide. It has over 400 active volcanoes from tidal heating that happens because it is squeezed and stretched as it orbits Jupiter.Io lies within a doughnut-shaped plasma cloud around Jupiter that is a plasma torus that strips ions from Io and creates radiation levels that are high and as a result deadly to life; it also has mountains taller than Mount Everest.', 1.77, 1.796, 110, 1.77, 'Jupiter', 5);
INSERT INTO public.moon VALUES (8, 'Cyllene', 2.0, 23800000, 2003, 'It is believed Cyllene was created from the Pasiphae asteroid that moved into the orbit of Jupiter and collisions caused this moon and other moons to be made that orbit around the same distance from the surface of Jupiter. Cyllene has an irregular shape.', 737.80, 0.001, 128, 732.00, 'Jupiter', 5);
INSERT INTO public.moon VALUES (80, 'Oberon', 1522.8, 582600, 1787, 'This is the 2nd largest moon of Uranus;Oberon is thought to originate from the accretion disc of Uranus which is a collection of dust and gas that gave rise to the origin of Uranus. Another possible origin is that the disc may have formed from a large impact with Uranus that caused this moon to have a large axial tilt, which causes the north and south poles of this moon to be bathed in darkness for 42 years.In appearance it is dark and slightly red; Oberon has an icy water mantle and a rock/carbon core;in between these layers is suspected to be a liquid ocean that contains antifreeze material like ammonia.', 13.46, 0.354, 75, 13.46, 'Uranus', 7);
INSERT INTO public.moon VALUES (81, 'Triton', 2706.8, 354800, 1846, 'Triton is the largest of the moons Neptune has;it is the only moon in our solar system to orbit in a direction that is opposite to its direction of rotation, i.e. retrograde orbit. This moon has a frozen environment with with craters, geysers and rugged terrain; it has a very thin atmosphere of nitrogen and the geysers spew out nitrogen gas too. The crust is ice water with layers of ice around a rocky core and there may be a subsurface liquid water ocean;the southern polar cap consists of frozen nitrogen and methane.It is said this moon is doomed and will break up in around 3.5 billion years as it is getting closer to Neptune after its orbit(s).', 5.90, 0.779, 36, 5.90, 'Neptune', 8);
INSERT INTO public.moon VALUES (82, 'Proteus', 420.0, 117647, 1989, 'Proteus is the 2nd largest moon of Neptune; it is irregularly shaped and heavily cratered; it rotates close to the equatorial plane of Neptune and rotates in the same direction as the planet. It have concave facts and is very dark. It is thought that Hippocamp, a smalle which is the smallest moon of Neptune is a broken off piece of Proteus, when it was hit by a comet.', 1.13, 0.070, 51, 1.13, 'Neptune', 8);
INSERT INTO public.moon VALUES (83, 'Charon', 1212.0, 19640, 1978, 'Charon is the largest moon out of the 5 moons Pluto has and is the most innermost; it has a frigid surface with methane and nitrogen ice mixed with some trace water ice; the aforementioned components are the main mass of the moon but there may be a small rocky core. It may have ice geysers as noted by ground-based observers; it has a canyon 7-9km deep and its origin is not fully understood; some say it is a Kuiper Belt object that collided with Pluto.', 6.38, 0.288, 51, 6.38, 'Pluto', 9);
INSERT INTO public.moon VALUES (84, 'Nix', 49.8, 48694, 2005, 'Nix is a small irregular moon found alongside Hydra in 2005;from camera observations it is likely Nix is composed of water ice just like Hydra with maybe a trace amount of methane ice on its surface. It is thought to have originated from a Kuiper Belt object that collided with Pluto and got caught in the gravitational field of Pluto.Nix has a reddish appearance thought to be caused by polymer-chain organic materials called tholins, made whe  simple compounds are exposed to UV irradiation and cosmic ray.', 25.00, 0.000, 44, 1.83, 'Pluto', 9);
INSERT INTO public.moon VALUES (85, 'Hi''iaka', 320.0, 49500, 2005, 'Hi''iaka is said to have formed billions of years ago when icy debris blasted into the orbit of Haumea. It is Haumea''s largest moon and has a very fast rotational rate. It has a high albedo of 0.8 due to the large mount of water ice on its surface.', 49.00, 0.000, 32, 0.41, 'Haumea', 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', 1, 365, 0.98, 149598262, 288, true, true, 4.5, 29.78, NULL, 510064472, 'Earth is the only confirmed planet with life; 29% of the land is continents and islands while the remaining 71% is water(from oceans, lakes, rivers and freshwater); atmosphere is rich in oxygen and nitrogen and is split into mantle and core layers that tectonic plates shift along.', 1);
INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', 0, 88, 59.00, 57909227, 440, false, true, 4.5, 47.36, 91691000, 74797000, 'Has an atmosphere that is very thin and its surface is pitted with craters;also is one of the most spherical and is located closest to the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', 0, 225, 243.00, 108209475, 737, false, true, 4.5, 35.00, 41400000, 46020000, 'Venus is the hottest planet in our solar system due to its thick atmonsphere of carbon dioxide and has clouds of sulphuric acid; it rotates clockwise on its axis.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', 2, 687, 1.03, 227943824, 210, false, false, 4.6, 24.10, 78340000, 144400000, 'Mars has a low atmospheric pressure so liquid does not exist on its surface; the soil is composed of iron oxide and has the highest mountain and canyon; also it has polar ice-caps in both hemispheres that remain frozen year-round.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'jovian', 79, 4333, 0.41, 778340821, 128, false, false, 4.6, 13.10, 628730000, 6142000000, 'Atmosphere is mostly hydrogen and helium; has 4 sets of rings made from the dust of its moons. Also has an area of high pressure anticyclone activity called the Great Red Spot containing cloud band storms.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'jovian', 82, 10765, 0.44, 1426666000, 95, false, false, 4.5, 9.60, 1275000000, 42700000000, 'Atmosphere contains ammonia crystals that creates the pale yellow colour of this planet;Saturn has three main rings and five dusty rings made from rock and ice from comets,asteroid and shattered moons; planet has seasons due to tilted axis.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'jovian', 27, 30687, 0.71, 2870658000, 78, false, false, 4.5, 6.80, 2723950000, 80830000000, 'Atmosphere contains a mixture of mostly hydrogen and helium with small amounts of methane and water(no solid surfaces but ices of the compounds mentioned); Uranus has two sets of rings that are thin and coloured grey,reddish and blue; the rings are possibly made of frozen methane and some dark organic matter; this planet rotates on its axis in a clockwise direction with a unique sideways tilt', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'dwarf planet', 5, 90560, 6.50, 5900000000, 41, false, true, 4.6, 4.64, 5060000000, 17646012, 'Pluto is located at the Kuiper Belt and has an eliptical and tilted orbit; its surface is made of rock and ice; the atmosphere is mostly nitrogen with some methane and carbon monoxide being detected. Pluto rotates in a clockwise direction.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'jovian', 14, 60190, 0.67, 4498396000, 73, false, false, 4.5, 5.43, 4351400000, 7618000000, 'Neptune is a small rocky core surrounded by an atmosphere of hydrogen and helium with some methane; it has six uneven planetary rings with one of them having an arc system; the gravity on Neptune is only 17% greater than that on Earth; it has a strong wind system formed with clouds of frozen methane that reach speeds of up to 2000 kilometres per hour and is the coldest planet in the solar system.', 1);
INSERT INTO public.planet VALUES (10, 'Haumea', 'dwarf planet', 2, 104096, 0.17, 6452000000, 33, false, false, 4.5, 4.53, 7513465873, 8140000, 'Haumea is located in the Kuiper Belt; it is not known whether it has any kind of atmosphere but it is assumed to be thin due to its small size; Haumea does have a mystery ring system and its surface is bright due to crystalline iced water on its surface. It is shaped like a rugby ball due to its high speed tornadic rotation.', 1);
INSERT INTO public.planet VALUES (11, 'Makemake', 'dwarf planet', 1, 111766, 0.94, 6487000000, 30, false, true, 4.5, 4.42, 5610000000, 6420000, 'Makemake is largely unknown in terms of structure, surface and atmosphere but it is assumed to have some similarities to Pluto but is redder in appearance.', 1);
INSERT INTO public.planet VALUES (12, 'Eris', 'dwarf planet', 1, 203810, 1.08, 10125000000, 42, false, true, 4.5, 3.44, 14278125229, 17000000, 'Eris is the second biggest dwarf planet after Pluto; it probably has a frozen atmosphere and is uniformly covered with a layer of thin ice that thaws as it gets nearer to the Sun.', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Aldebaran Star', 'Taurus', 518, 3900, '65.23', 44.13, 1.17, 'Aldebaran star is the eye of the Taurus constellation; it is an orange-red giant star. it has a visual magnitude of 0.8. It is the brightest star in Taurus and the 14th brightest star in the night sky. It is surrounded by Orion, Auriga, Perseus and Cetus constellations and the Pleiades star is located within the boundaries of the Taurus constellation. it is located near the popular asterism called Orion''s Belt. It has companion stars and a planett in its orbit. The companion stars are Alpha Tauri B,C,D,E anf F and the planet orbiting it is Aldebaran b. This star is a slow rotator with a rotational velcoity of 3.5 km per second and it takes 520 days to complete a full rotation.', 'Red-Orange', 'Red Giant K5 III', 1);
INSERT INTO public.star VALUES (3, 'Alnilam', 'Orion', 832000, 27500, '1344', 42.00, 40.00, 'This is a supergiant star and is the biggest star in Orion''s Belt.It is 5370000 times brighter than the Sun and it illuminates a molecular cloud that surrounds it called NGC 1990. Alnilam is located in the middle of the Orion''s Belt asterism with the other stars of the Belt being Alnitak and Mintaka.It has an apparent magnitude of 1.69. This star produces powerful stellar winds of up to 2km per second; as a result it loses mass 20 million times faster than the rate of loss of mass from the Sun. Due to its loss of mass it it is assumed to be on its way to being a red supergiant and finally a supernova.', 'Blue', 'B0Ia', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse Star', 'Orion', 126000, 3500, '650', 764.00, 16.50, 'This is a supergiant star that is the 2nd brightest star in the Orion constellation that marks the eastern shoulder of the hunter. This star has an orange-red hue. This star is younger than our Sun but will burn through its nuclear fusion resources much faster, since it is a red supergiant. 13% of this star''s radiant energy is in the form of visible light.This star is losing approximately 1 solar mass per 10 thousand years, with the star spewing out material hapazardly in all directions, which creates the nebula around this star. This star is destined to become a neutron star or black hole as it dims and eventually collapses on itself. This star forms one of the vertices of the Winter Triangle asterism with the other two vertices being composed of Sirius and Procyon. This sky pattern is best seen in the Winter in the northern hemisphere.', 'Orange-Red', 'M1-M2 Ia-Ib', 1);
INSERT INTO public.star VALUES (5, 'Capella Star', 'Auriga', 78, 4970, '42.92', 12.00, 2.69, 'In the night sky this star appears as if it is a single star. But in fact it is a pair of binary stars; this means that each star orbits around the other. Capella is a four star system, whereby Capella Aa andAb are paired and these are orbited by a pair of distant red dwarf stars. Capella Aa and Ab orbit each other every 100 days at a distance of 100000km. Aa and Ab are post sequence stars that have virtually used up their hydrogen supply at their core and have expanded in size by five times. They are destined to become red giants. The corona of Capella Aa is considered one of the brightest sources of x-rays. The distant dwarfs are referred to as Capella H and Capella L.', 'Yellow', 'G1III', 1);
INSERT INTO public.star VALUES (7, 'Algol Star', 'Perseus', 7, 13000, '92.95', 3.48, 5.80, 'Algol is a triple star system and the 2nd brightest star in the Perseus constellation.Its apparent magnitude is 2.21 and it is the head of the Gorgon Medusa in the constellation; this star is also known by its alternative name Beta Persei. Beta Persei Aa1 is the blue-white main sequence star; Beta Persei Aa2 is a cooler orange subgiant and Beta Persei Ab is a white star. Aa1 and Aa2 eclipse each other during their orbit and as a result reduce the brightness of the overall star system. Aa1 gets eclipsed by Aa2 every 2.87 days. This means that Aa1 as the hotter star is stripping the outer layers of Aa2 and exerting many tidal distortions upon it. All of the aforementioned contributes to the Algol star being a variable star that waxes and wanes in brightness. The age of this star system is not known currently. This star is located 2421437 light years from the galactic centre of the Milky Way.The interactions of the star system components is thought to generate the powerful x-ray flares and radio wave flares. Aa1 is known as Algol A, Aa2 is known as Algol B and Ab is known as Algol C.', 'Algol A:Blue | Algol B:Orange | Algol C: Blue-White', 'Algol A:B8-type | Algol B:K0 IV | Algol C:A7-type', 1);
INSERT INTO public.star VALUES (9, 'Rigel Star', 'Orion', 47000, 12000, '864', 78.90, 21.00, 'This is a supergiant star; although it appears as a single star it is a system actually composed of four stars. The brightest primary sstar is Beta Orionis A that is between 61500 and 353000 times brighter than the Sun.The other Rigel stars are smaller; Rigel Ba has 3.84 solar masses, Rigel Bb has 2.94 solar masses and Rigel C has 3.84 solar masses.Rigel is a young star system being approximately only 8 million years old.The three smaller stars(Ba,Bb and C) are blue-white main sequence stars.This star system has nearly used up its hydrogen supplies and will eventually become a red supergiant s These stars orbit each other approximately every 10 days. This sta star system is located in the Milky Way; Rigel star does have surrounding exoplanets  (around 14) but more than half are inhabitable due to the radiation given off by the Rigel component stars, so if Rigel was our Sun then Earth would completely burn out. Rigel star is the brightest star in the Orion constellation and is one of the stars that mark the Winter Hexagon.', 'Blue-White(B-Type)', 'B8 Ia', 1);
INSERT INTO public.star VALUES (12, '10 Lacertae Star', 'Lacerta', 102000, 32000, '1725.73', 8.27, 26.90, '10 Lacertae is located in the Milky Way galaxy but is outside of our solar system; there are no exoplanets associated with this star. Based on its colour and spectral type it is assumed to have a lifespan of a mere 5-6 million years. It is best seen with the unaided eye in the northern hemisphere of Earth. The radial velocity of 10 Lacertae is -10.10000km/s so it means our Sun and 10 Lacertae are getting closer to each other but despite this they are so far apart that this collision will never occur in our lifetimes, if ever.', 'Blue', 'O9V', 1);
INSERT INTO public.star VALUES (1, 'The Sun', 'none', 1, 5778, '0.00001581', 1.00, 1.00, 'The Sun in our solar system is a star that is a yellow dwarf. It has a radius of 695700km. Eight planets in our solar system orbit around it at various velocities and the Sun itself takes 27 Earth days to rotate on its axis. In the core of the Sun hydrogen atoms are fused to created helium atoms; these atoms release the energy that is eventually released in the form of heat and light.The energy made at the core takes about a million years to reach the outer convection zones. When plasma hydrogen is heated charged particles escape the surface of the Sun and its gravity and go into space as solar wind which can cause phenomena such as auroras. As well as hydrogen and helium other elements have been detected in the Sun such as oxygen, carbon, nitrogen, silicon, magnesium, neon, iron and sulphur. Sunspots are cooler parts of the Sun at its photosphere. These spots are darker than other parts of the Sun; they can be up to 50000km across and believed to occur due to interactions with the underlying magnetic field, which reduces the amount of radiation coming to the surface.The Sun is located in the spiral arm of the Milky Way at a place called the Orion Spur; this branches off the galaxy''s Sagittarius arm. The Sun and our solar system are orbiting around the centre of the Milky Way at a speed of 720000km per hour.', 'Yellow-White', 'G2', 1);
INSERT INTO public.star VALUES (6, 'Procyon Star', 'Canis Minor(Lesser Dog)', 7, 6530, '11.45', 2.05, 1.40, 'Procyon is a binary star system; there is Procyon A with an apparent magnitude of 0.34 and Procyon B with a magnitude of 10.7.Procyon A is a white main sequence star, while Procyon B is a fainter white dwarf companion star; the companion star is slowly coming to the end of its main sequence life and is using up the hydrogen at its core. These two stars have an orbital period of 40.840+/-0.022 years. They have an elliptical orbit with an eccentricity of 0.39785. This binary star system lies near Orion and Sirius. It forms the Winter Triangle asterism with stars Sirius and Betelgeuse. Procyon A is evolving into a subgiant while Procyon B which is less luminous (luminosity of 0.00049) will swell and expel its outer layers as nebulae.', 'White(F-Type)', 'Procyon A: F5 IV-V | Procyon B:DQZ', 1);
INSERT INTO public.star VALUES (10, 'Arcturus', 'Bootes(the herdsman)', 180, 4286, '36.66', 25.40, 1.10, 'It is the brightest star in Bootes constellation and has an apparent magnitude of -0.05; it is the brightest star in the northern celestial hemisphere.This is an orange giant star that has exhausted hydrogen from its core; this star is estimated to be around 7.1 billion years old making it older than the Sun. Arcturus can be found as part of three Spring asterisms(Spring Triangle,Great Diamond and Kite of Bootes); Arcturus is on the Red Giant Branch  at the moment; it has used up its hydrogen but has not started to fuse helium at its core. The helium core of the star is inert and is surrounded by a shell in which hydrogen fusion occurs via the carbon-nitrogen-oxygen cycle.Via this cycle the star will increase in mass and ultimately become cooloer and more luminous. When helium starts to be fused the star will become hotter and less luminous. Arcturus has no known companion stars.', 'Reddish-Orange', 'K1.5 IIIFe-0.5', 1);
INSERT INTO public.star VALUES (8, 'Alpha Centauri', 'Centaurus', 2, 5790, '4.367', 1.22, 2.00, 'Alpha Centauri is a triple star system composed of Alpha Centauri A(Rigil Kentaurus),Alpha Centauri B(Toliman) and Alpha Centauri C(Proxima Centauri); there is an accompanying exoplanet called Proxima Centauri b that is close to us.A and B appear as a single star with the unaided eye.A is a yellow main sequence star , while B is an orange main sequence star.Proxima Centauri is a faint red dwarf. A and B have an eccentric, elliptical orbit with an orbital period of 79.91 years, which takes them 11.2AUs near to each other and as far 35.6AUs from each other. Proxima Centauri is invisible to the unaided eye and lies 2.18 degrees southwest of the binary AB star system. As well as Proxima Centauri b there is are two other exoplanets too called Proxima Centauri c and Proxima Centauri d. These are the nearest exoplanets to the Sun. It is assumed that b is a terrestrial planet an believed to a super-Earth or mini-Neptune. But however due to their proximity to their host stars their atmosphere is likely to be eroded by x-ray and radio-wave flares that produce stellar winds far greater than what Earth is exposed to, making the likelihood of life on these planets low. The b exoplanet is known to have an orbital period of 11.2 Earth days. A is 1.1 times the mass of the Sun and 1.519 times its luminosity; B is 0.907 times the mass of the Sun and 0.445 times its luminosity. C''s solar mass is 0.1221 and its luminosity is 20 times fainter than the Sun.', 'Alpha Centauri A: Yellow | Alpha Centauri B: Orange | Alpha Centauri C: Red', 'Alpha Centauri A:G2V | Alpha Centauri B: K1V | Alpha Centauri C: M5.5Ve', 1);
INSERT INTO public.star VALUES (11, 'Sirius', 'Canis Major', 25, 9940, '8.611', 1.71, 2.02, 'This star within Canis Major constellation is found bordering on Monoceros,Lepus,,Columba and Puppis. Sirius exists with nine other stars in this constellation. This star forms part of the Winter Hexagon asterism, which appears  in the orthern sky between December and March.Sirius is a binary star system consisting of Sirius A and Sirius B with the latter being a faint companion star.This star system has a visual magnitude of -1.46 making it the brightest star in the night sky. Sirius star appears to flicker when viewed because its brightness exaggerates atmospheric particle events.Sirius B is a white dwarf while Sirius A is the main primary star. The Sirius star system altogether is around 242 million years old.Sirius B is four times hotter than our Sun at 25000 kelvin but is 100000 times fainter than Sirius A.', 'Sirius A:Blue-White|Sirius B:White', 'Sirius A:A0mA1 Va|Sirius B:DA2', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 39, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 37, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 45, true);


--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_meteor_id_seq', 41, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 85, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 108, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: meteor meteor_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_name_key UNIQUE (name);


--
-- Name: meteor meteor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_pkey PRIMARY KEY (meteor_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_orbital_period_earth_days_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_orbital_period_earth_days_key UNIQUE (orbital_period_earth_days);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_rotational_period_earth_days_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_rotational_period_earth_days_key UNIQUE (rotational_period_earth_days);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

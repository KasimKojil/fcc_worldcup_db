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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (67, 2018, 'Final', 539, 540, 4, 2);
INSERT INTO public.games VALUES (68, 2018, 'Third Place', 541, 542, 2, 0);
INSERT INTO public.games VALUES (69, 2018, 'Semi-Final', 540, 542, 2, 1);
INSERT INTO public.games VALUES (70, 2018, 'Semi-Final', 539, 541, 1, 0);
INSERT INTO public.games VALUES (71, 2018, 'Quarter-Final', 540, 543, 3, 2);
INSERT INTO public.games VALUES (72, 2018, 'Quarter-Final', 542, 544, 2, 0);
INSERT INTO public.games VALUES (73, 2018, 'Quarter-Final', 541, 545, 2, 1);
INSERT INTO public.games VALUES (74, 2018, 'Quarter-Final', 539, 546, 2, 0);
INSERT INTO public.games VALUES (75, 2018, 'Eighth-Final', 542, 547, 2, 1);
INSERT INTO public.games VALUES (76, 2018, 'Eighth-Final', 544, 548, 1, 0);
INSERT INTO public.games VALUES (77, 2018, 'Eighth-Final', 541, 549, 3, 2);
INSERT INTO public.games VALUES (78, 2018, 'Eighth-Final', 545, 550, 2, 0);
INSERT INTO public.games VALUES (79, 2018, 'Eighth-Final', 540, 551, 2, 1);
INSERT INTO public.games VALUES (80, 2018, 'Eighth-Final', 543, 552, 2, 1);
INSERT INTO public.games VALUES (81, 2018, 'Eighth-Final', 546, 553, 2, 1);
INSERT INTO public.games VALUES (82, 2018, 'Eighth-Final', 539, 554, 4, 3);
INSERT INTO public.games VALUES (83, 2014, 'Final', 555, 554, 1, 0);
INSERT INTO public.games VALUES (84, 2014, 'Third Place', 556, 545, 3, 0);
INSERT INTO public.games VALUES (85, 2014, 'Semi-Final', 554, 556, 1, 0);
INSERT INTO public.games VALUES (86, 2014, 'Semi-Final', 555, 545, 7, 1);
INSERT INTO public.games VALUES (87, 2014, 'Quarter-Final', 556, 557, 1, 0);
INSERT INTO public.games VALUES (88, 2014, 'Quarter-Final', 554, 541, 1, 0);
INSERT INTO public.games VALUES (89, 2014, 'Quarter-Final', 545, 547, 2, 1);
INSERT INTO public.games VALUES (90, 2014, 'Quarter-Final', 555, 539, 1, 0);
INSERT INTO public.games VALUES (91, 2014, 'Eighth-Final', 545, 558, 2, 1);
INSERT INTO public.games VALUES (92, 2014, 'Eighth-Final', 547, 546, 2, 0);
INSERT INTO public.games VALUES (93, 2014, 'Eighth-Final', 539, 559, 2, 0);
INSERT INTO public.games VALUES (94, 2014, 'Eighth-Final', 555, 560, 2, 1);
INSERT INTO public.games VALUES (95, 2014, 'Eighth-Final', 556, 550, 2, 1);
INSERT INTO public.games VALUES (96, 2014, 'Eighth-Final', 557, 561, 2, 1);
INSERT INTO public.games VALUES (97, 2014, 'Eighth-Final', 554, 548, 1, 0);
INSERT INTO public.games VALUES (98, 2014, 'Eighth-Final', 541, 562, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (539, 'France');
INSERT INTO public.teams VALUES (540, 'Croatia');
INSERT INTO public.teams VALUES (541, 'Belgium');
INSERT INTO public.teams VALUES (542, 'England');
INSERT INTO public.teams VALUES (543, 'Russia');
INSERT INTO public.teams VALUES (544, 'Sweden');
INSERT INTO public.teams VALUES (545, 'Brazil');
INSERT INTO public.teams VALUES (546, 'Uruguay');
INSERT INTO public.teams VALUES (547, 'Colombia');
INSERT INTO public.teams VALUES (548, 'Switzerland');
INSERT INTO public.teams VALUES (549, 'Japan');
INSERT INTO public.teams VALUES (550, 'Mexico');
INSERT INTO public.teams VALUES (551, 'Denmark');
INSERT INTO public.teams VALUES (552, 'Spain');
INSERT INTO public.teams VALUES (553, 'Portugal');
INSERT INTO public.teams VALUES (554, 'Argentina');
INSERT INTO public.teams VALUES (555, 'Germany');
INSERT INTO public.teams VALUES (556, 'Netherlands');
INSERT INTO public.teams VALUES (557, 'Costa Rica');
INSERT INTO public.teams VALUES (558, 'Chile');
INSERT INTO public.teams VALUES (559, 'Nigeria');
INSERT INTO public.teams VALUES (560, 'Algeria');
INSERT INTO public.teams VALUES (561, 'Greece');
INSERT INTO public.teams VALUES (562, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 98, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 562, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--


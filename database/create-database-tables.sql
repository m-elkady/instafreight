--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

DROP DATABASE IF EXISTS authors_books;
--
-- Name: authors_books; Type: DATABASE; Schema: -; Owner: elkady
--

CREATE DATABASE authors_books WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE authors_books OWNER TO elkady;

\connect authors_books

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
-- Name: authors; Type: TABLE; Schema: public; Owner: elkady
--

CREATE TABLE public.authors (
    name character varying(100) NOT NULL,
    country character varying(2) NOT NULL
);

--
-- Name: books; Type: TABLE; Schema: public; Owner: elkady
--

CREATE TABLE public.books (
    name character varying(150) NOT NULL,
    author character varying(100) NOT NULL,
    pages integer NOT NULL
);

--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: elkady
--

INSERT INTO public.authors (name, country) VALUES ('J. D. Salinger', 'US');
INSERT INTO public.authors (name, country) VALUES ('F. Scott. Fitzgerald', 'US');
INSERT INTO public.authors (name, country) VALUES ('Jane Austen', 'UK');
INSERT INTO public.authors (name, country) VALUES ('Leo Tolstoy', 'RU');
INSERT INTO public.authors (name, country) VALUES ('Sun Tzu', 'CN');
INSERT INTO public.authors (name, country) VALUES ('Johann Wolfgang von Goethe', 'DE');
INSERT INTO public.authors (name, country) VALUES ('Janis Eglitis', 'LV');


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: elkady
--

INSERT INTO public.books (name, author, pages) VALUES ('The Catcher in the Rye', 'J. D. Salinger', 300);
INSERT INTO public.books (name, author, pages) VALUES ('Nine Stories', 'J. D. Salinger', 200);
INSERT INTO public.books (name, author, pages) VALUES ('Franny and Zooey', 'J. D. Salinger', 150);
INSERT INTO public.books (name, author, pages) VALUES ('The Great Gatsby', 'F. Scott. Fitzgerald', 400);
INSERT INTO public.books (name, author, pages) VALUES ('Tender is the Night', 'F. Scott. Fitzgerald', 500);
INSERT INTO public.books (name, author, pages) VALUES ('Pride and Prejudice', 'Jane Austen', 700);
INSERT INTO public.books (name, author, pages) VALUES ('The Art of War', 'Sun Tzu', 128);
INSERT INTO public.books (name, author, pages) VALUES ('Faust I', 'Johann Wolfgang von Goethe', 300);
INSERT INTO public.books (name, author, pages) VALUES ('Faust II', 'Johann Wolfgang von Goethe', 300);


--
-- Name: books books_pk; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pk PRIMARY KEY (name);


--
-- Name: authors table_name_pk; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT table_name_pk PRIMARY KEY (name);


--
-- Name: table_name_name_uindex; Type: INDEX; Schema: public;
--

CREATE UNIQUE INDEX table_name_name_uindex ON public.authors USING btree (name);


--
-- Name: books books_authors_name_fk; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_authors_name_fk FOREIGN KEY (author) REFERENCES public.authors(name);


--
-- PostgreSQL database dump complete
--


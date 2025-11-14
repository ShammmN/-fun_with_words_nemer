--Sham Nemer--

--STEP 1--
CREATE OR REPLACE VIEW WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id;

SELECT * FROM WORD_REL;

CREATE OR REPLACE VIEW WORD_ANALYSIS (word, syn_col, ant_col, word_length) AS
SELECT word, syn_col, ant_col, LENGTH(word)
FROM WORD_REL;

SELECT * FROM WORD_ANALYSIS;

CREATE OR REPLACE VIEW WORD_SUMMARY (word, syn_col, ant_col) AS
SELECT word, syn_col, ant_col
FROM WORD_REL;

SELECT * FROM WORD_SUMMARY;

SELECT view_name FROM user_views;

--STEP 2--
--Question 1: --
SELECT * FROM WORD_REL; 

--Question 2: --
UPDATE WORD_REL SET SYN_COL = 'blithe' WHERE word = 'insouciant';
SELECT * FROM WORD_REL; 

--Question 3: --
UPDATE WORD_REL SET SYN_COL = 'blithe' WHERE word = 'insouciant' WITH READ ONLY;

--Question 4: -- 
SELECT WORD, WORD_LENGTH FROM WORD_ANALYSIS; 

--Question 5: --
SELECT WORD, SYN_COL, WORD_LENGTH
FROM (SELECT WORD, SYN_COL, LENGTH(WORD) AS WORD_LENGTH FROM WORD_REL ORDER BY LENGTH(WORD) DESC)
WHERE ROWNUM <= 2;

--Question 6: --
DROP VIEW WORD_REL; 

CREATE OR REPLACE VIEW WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id;

--Question 7: --
SELECT * FROM WORD_SUMMARY;

--Question 8: --
CREATE OR REPLACE VIEW HOMONYM_MEANINGS AS
SELECT WORD_TERM, LISTAGG(meaning, ', ') WITHIN GROUP (ORDER BY HOM_ID) AS MEANINGS
FROM HOMONYMS
GROUP BY WORD_TERM;

SELECT * FROM HOMONYM_MEANINGS;

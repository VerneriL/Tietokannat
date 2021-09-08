
CREATE TABLE tuoteryhma (
                tuoteryhma VARCHAR(20) NOT NULL,
                CONSTRAINT tuoteryhma_pk PRIMARY KEY (tuoteryhma)
);


CREATE TABLE tuotekoodi (
                tuotenumero INTEGER NOT NULL,
                tuoteryhma VARCHAR(20) NOT NULL,
                tuotetyyppi VARCHAR(30) NOT NULL,
                merkki VARCHAR(20) NOT NULL,
                malli VARCHAR(20) NOT NULL,
                vuokraushinta FLOAT NOT NULL,
                CONSTRAINT tuotekoodi_pk PRIMARY KEY (tuotenumero)
);


CREATE TABLE yhteystyyppi (
                yhteystyyppi VARCHAR(20) NOT NULL,
                CONSTRAINT yhteystyyppi_pk PRIMARY KEY (yhteystyyppi)
);
COMMENT ON COLUMN yhteystyyppi.yhteystyyppi IS 'Taulu on luotu vain käyttöliittymää varten. Se estää käyttäjää syöttämästä Yhteyshenkilö-tauluun muita kuin ennalta määritettyjä arvoja.';


CREATE TABLE asiakas (
                asiakasnumero INTEGER NOT NULL,
                yritys VARCHAR(30) NOT NULL,
                laskutusosoite VARCHAR(30) NOT NULL,
                postinumero VARCHAR(10) NOT NULL,
                postitoimipaikka VARCHAR(30) NOT NULL,
                CONSTRAINT asiakas_pk PRIMARY KEY (asiakasnumero)
);
COMMENT ON TABLE asiakas IS 'Asiakkaan perustiedot';
COMMENT ON COLUMN asiakas.laskutusosoite IS 'Yrityksen laskujen katu- tai PL-osoite';


CREATE TABLE vuokraus (
                tapahtumaid INTEGER NOT NULL,
                asiakasnumero INTEGER NOT NULL,
                tuotenumero INTEGER NOT NULL,
                alkamispaiva DATE NOT NULL,
                loppumispaiva DATE NOT NULL,
                CONSTRAINT vuokraus_pk PRIMARY KEY (tapahtumaid)
);
COMMENT ON COLUMN vuokraus.tapahtumaid IS 'Dummy id tulevia käyttötarkoituksia varten';


CREATE TABLE yhteishenkilo (
                yhteyshenkilo_id INTEGER NOT NULL,
                yhteystyyppi VARCHAR(20) NOT NULL,
                etunimi VARCHAR(20) NOT NULL,
                sukunimi VARCHAR(30) NOT NULL,
                puhelin VARCHAR(15),
                sahkoposti VARCHAR(40) NOT NULL,
                asiakasnumero INTEGER NOT NULL,
                CONSTRAINT yhteishenkilo_pk PRIMARY KEY (yhteyshenkilo_id)
);
COMMENT ON COLUMN yhteishenkilo.yhteyshenkilo_id IS 'Dummy-perusavain. Tulevaisuuden tarpeita varten.';
COMMENT ON COLUMN yhteishenkilo.yhteystyyppi IS 'Taulu on luotu vain käyttöliittymää varten. Se estää käyttäjää syöttämästä Yhteyshenkilö-tauluun muita kuin ennalta määritettyjä arvoja.';


ALTER TABLE tuotekoodi ADD CONSTRAINT tuoteryhma_tuotekoodi_fk
FOREIGN KEY (tuoteryhma)
REFERENCES tuoteryhma (tuoteryhma)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE vuokraus ADD CONSTRAINT tuotekoodi_vuokraus_fk
FOREIGN KEY (tuotenumero)
REFERENCES tuotekoodi (tuotenumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE yhteishenkilo ADD CONSTRAINT yhteystyyppi_yhteishenkilo_fk
FOREIGN KEY (yhteystyyppi)
REFERENCES yhteystyyppi (yhteystyyppi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE yhteishenkilo ADD CONSTRAINT asiakas_yhteishenkilo_fk
FOREIGN KEY (asiakasnumero)
REFERENCES asiakas (asiakasnumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE vuokraus ADD CONSTRAINT asiakas_vuokraus_fk
FOREIGN KEY (asiakasnumero)
REFERENCES asiakas (asiakasnumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

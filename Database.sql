CREATE SCHEMA IF NOT EXISTS NegozioMusica;
USE NegozioMusica;

CREATE TABLE Utente (
    username VARCHAR(50) NOT NULL PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    indirizzo VARCHAR(100) NOT NULL
);

CREATE TABLE Negozio (
    username VARCHAR(50) NOT NULL PRIMARY KEY,
    IBAN VARCHAR(34) NOT NULL,
    IVA VARCHAR(11) NOT NULL,
    CONSTRAINT fk_negozio_utente FOREIGN KEY(username)
        REFERENCES Utente(username) ON DELETE CASCADE
);

CREATE TABLE Privato (
    username VARCHAR(50) NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    CONSTRAINT fk_privato_utente FOREIGN KEY(username)
        REFERENCES Utente(username) ON DELETE CASCADE
);

CREATE TABLE Prodotto (
    data_caricamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    username VARCHAR(50) NOT NULL,
    titolo VARCHAR(50) NOT NULL PRIMARY KEY,
    prezzo FLOAT NOT NULL,
    formato_digitale VARCHAR(100) NOT NULL,
    descrizione VARCHAR(5000) NOT NULL CHECK(LENGTH(descrizione) <= 5000),
    media_voti FLOAT(2,1) NOT NULL DEFAULT 0,
    CONSTRAINT fk_prodotto_utente FOREIGN KEY(username)
        REFERENCES Utente(username) ON DELETE CASCADE
);

CREATE TABLE Recensione(
    codice_recensione SERIAL PRIMARY KEY, -- Alias di BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    username VARCHAR(50) NOT NULL,
    titolo VARCHAR(50) NOT NULL,
    voto INT NOT NULL CHECK(voto >= 0 AND voto <= 5),
    testo VARCHAR(700) NOT NULL CHECK(LENGTH(testo) <= 700) DEFAULT '',
    data_recensione TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT fk_recensione_privato FOREIGN KEY(username)
        REFERENCES Privato(username) ON DELETE CASCADE
);

CREATE TABLE Acquisto(
    codice_acquisto SERIAL PRIMARY KEY, -- Alias di BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    username VARCHAR(50) NOT NULL,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT fk_acquisto_utente FOREIGN KEY(username)
        REFERENCES Utente(username) ON DELETE CASCADE
);

CREATE TABLE Acquisti_Prodotti(
    codice_acquisto BIGINT UNSIGNED NOT NULL,
    titolo VARCHAR(50) NOT NULL,
    PRIMARY KEY(codice_acquisto, titolo),
    CONSTRAINT fk_acquisti_prodotti_acquisto FOREIGN KEY(codice_acquisto)
        REFERENCES Acquisto(codice_acquisto) ON DELETE CASCADE,
    CONSTRAINT fk_acquisti_prodotti_prodotto FOREIGN KEY(titolo)
        REFERENCES Prodotto(titolo) ON DELETE CASCADE
);

CREATE TABLE Tag(
    nome_tag VARCHAR(15) NOT NULL PRIMARY KEY CHECK(LENGTH(nome_tag) <= 15)
);

CREATE TABLE Prodotto_Tag(
    titolo VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY(titolo, nome),
    CONSTRAINT fk_prodotto_tag_prodotto FOREIGN KEY(titolo)
        REFERENCES Prodotto(titolo) ON DELETE CASCADE,
    CONSTRAINT fk_prodotto_tag_tag FOREIGN KEY(nome)
        REFERENCES Tag(nome_tag) ON DELETE CASCADE
);

CREATE TABLE Libro(
    titolo VARCHAR(50) NOT NULL PRIMARY KEY,
    pagine INT NOT NULL CHECK(pagine > 0),
    CONSTRAINT fk_libro_prodotto FOREIGN KEY(titolo)
        REFERENCES Prodotto(titolo) ON DELETE CASCADE
);

CREATE TABLE Audio(
    titolo VARCHAR(50) NOT NULL PRIMARY KEY,
    durata INT NOT NULL,
    CONSTRAINT fk_audio_prodotto FOREIGN KEY(titolo)
        REFERENCES Prodotto(titolo) ON DELETE CASCADE
);

CREATE TABLE Traccia(
    titolo VARCHAR(50) NOT NULL PRIMARY KEY,
    titolo_traccia VARCHAR(50) NOT NULL,
    CONSTRAINT fk_traccia_audio FOREIGN KEY(titolo)
        REFERENCES Audio(titolo) ON DELETE CASCADE
);


DELIMITER $$
CREATE TRIGGER tr_media_voti
    AFTER INSERT ON Recensione
    FOR EACH ROW
BEGIN
    DECLARE media FLOAT(2,1);
    SELECT AVG(voto) INTO media FROM Recensione WHERE titolo = NEW.titolo;
    UPDATE Prodotto SET media_voti = media WHERE titolo = NEW.titolo;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER tr_max_tags
    BEFORE INSERT ON Prodotto_Tag
    FOR EACH ROW
BEGIN
    DECLARE count_tags INT;
    SELECT COUNT(*) INTO count_tags FROM Prodotto_Tag WHERE titolo = NEW.titolo;
    IF count_tags > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Troppi tag per questo prodotto';
    END IF;
END $$
DELIMITER ;


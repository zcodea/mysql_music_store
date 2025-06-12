INSERT INTO Utente (username, email, indirizzo)
	VALUES('Steffy', 'stefo@mail.it', 'via Roma 9, Avellino');
INSERT INTO Privato (username, nome, cognome)
	VALUES( 'Steffy', 'Stefano', 'Ligure');


INSERT INTO Utente (username, email, indirizzo)
	VALUES('Murko', 'murko@mail.it', '00199 Roma Via Concordia 11');
INSERT INTO Negozio (username, IBAN, IVA)
 	VALUES('IT09F0300203280625926433964', '86364109827');


INSERT INTO Prodotto(username, titolo, prezzo, formato_digitale, descrizione)
	VALUES('Murko', 'Dark Dance', 5.00, 'mp3', 'Musica ambient basata sul folclore Svedese');
INSERT INTO Audio(titolo, durata)
	VALUES('Dark Dance', 500);
INSERT INTO Traccia(titolo, titolo_traccia)
	VALUES('Dark Dance', 'Dark dance traccia');
INSERT INTO Tag(nome_tag)
	VALUES('dark');
INSERT INTO Tag(nome_tag)
	VALUES('nord');


INSERT INTO Prodotto (username, titolo, prezzo, formato_digitale, descrizione)
	VALUES('Murko', 'Nord Oscuro', 2.00, 'epub', 'Companion del brano Dark Dance');
INSERT INTO Libro (titolo, pagine)
	VALUES('Nord Oscuro', 25);
INSERT INTO Tag (nome_tag)
	VALUES('dark');


INSERT INTO Prodotto (username, titolo, prezzo, formato_digitale, descrizione)
	VALUES ('Steffy', 'Rombi', 	0.00, 'epub;mp3', '?');
INSERT INTO Libro (titolo, pagine)
	VALUES ('Rombi', 23);
INSERT INTO Audio (titolo, durata)
	VALUES (200);


INSERT INTO Prodotto(username, titolo, prezzo, formato_digitale, descrizione)
    VALUES('utente1', 'Il Signore degli Anelli', 10.0, 'pdf', 'Il Signore degli Anelli è un romanzo fantasy scritto da J.R.R. Tolkien');
INSERT INTO Acquisto(username) VALUES('Ciccio');
INSERT INTO Acquisti_Prodotti(codice_acquisto, titolo) VALUES(1, 'Il Signore degli Anelli');


INSERT INTO Recensione(username, titolo, voto, testo)
	VALUES('tendis', 'Dark Dance', 5, 'Il miglior libro che abbia mai letto');


SELECT A.codice_acquisto, SUM(P.prezzo) AS Somma FROM Acquisti_Prodotti
   JOIN Acquisto A on Acquisti_Prodotti.codice_acquisto = A.codice_acquisto
   JOIN Prodotto P on Acquisti_Prodotti.titolo = P.titolo
    WHERE A.username = 'Marta'
    GROUP BY A.codice_acquisto, A.data
    ORDER BY A.data DESC;


SELECT titolo FROM Prodotto WHERE username = 'Ciccio'
    AND prezzo < 20;


SELECT P.titolo FROM Tag
    JOIN Prodotto_Tag PT ON Tag.nome_tag = PT.nome
    JOIN Prodotto P ON PT.titolo = P.titolo
    WHERE Tag.nome_tag = 'Rock'
    ORDER BY P.prezzo ASC;


SELECT A.titolo FROM Audio
    JOIN Predo.Audio A on Audio.durata = A.durata
    JOIN Prodotto P on A.titolo = P.titolo
    WHERE username = 'Marta';


SELECT R.codice_recensione, R.voto, R.testo FROM Recensione R
    JOIN Prodotto P on R.titolo = P.titolo
    WHERE P.titolo = 'Dieciii'
    ORDER BY R.data_recensione DESC;


SELECT SUM(prezzo) FROM Acquisti_Prodotti
    JOIN Prodotto P on Acquisti_Prodotti.titolo = P.titolo
    JOIN Acquisto A on Acquisti_Prodotti.codice_acquisto = A.codice_acquisto
    WHERE P.username = 'Ciccio' AND A.data > CURRENT_DATE() - INTERVAL(6) MONTH;


SELECT P.titolo, COUNT(*) FROM Acquisti_Prodotti
    JOIN Prodotto P on Acquisti_Prodotti.titolo = P.titolo
    JOIN Acquisto A on Acquisti_Prodotti.codice_acquisto = A.codice_acquisto
    WHERE A.data > CURRENT_DATE() - INTERVAL(6) MONTH
    GROUP BY P.titolo
    ORDER BY COUNT(*) DESC
    LIMIT 1;
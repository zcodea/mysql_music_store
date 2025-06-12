INSERT INTO Utente (username, email, indirizzo) VALUES
    ('Ciccio', 'Ciccio@example.com', 'Via Roma 1, Milano'),
    ('Puk', 'Puk@example.com', 'Corso Venezia 2, Torino'),
    ('Mal', 'Mal@example.com', 'Piazza Duomo 3, Firenze'),
    ('musicstore', 'musicstore@example.com', 'Via Garibaldi 4, Napoli'),
    ('Johnny', 'Johnny@example.com', 'Viale Mazzini 5, Bologna'),
    ('Marta', 'Marta@example.com', 'Via Dante 6, Genova'),
    ('marsio', 'marsio@example.com', 'Corso Italia 7, Palermo'),
    ('disco', 'disco@example.com', 'Piazza San Marco 8, Venezia'),
    ('nine', 'nine@example.com', 'Via Verdi 9, Verona'),
    ('tendis', 'tendis@example.com', 'Via Manzoni 10, Bari');

INSERT INTO Negozio (username, IBAN, IVA) VALUES
    ('Ciccio', 'IT60X0542811101000000123456', '12345678901'),
    ('Puk', 'IT60X0542811101000000123457', '12345678902'),
    ('Mal', 'IT60X0542811101000000123458', '12345678903'),
    ('musicstore', 'IT60X0542811101000000123459', '12345678904'),
    ('Johnny', 'IT60X0542811101000000123460', '12345678905');

INSERT INTO Privato (username, nome, cognome) VALUES
    ('Marta', 'Mario', 'Rossi'),
    ('marsio', 'Luigi', 'Bianchi'),
    ('disco', 'Giovanni', 'Verdi'),
    ('nine', 'Paolo', 'Neri'),
    ('tendis', 'Francesca', 'Gialli');

INSERT INTO Prodotto (username, titolo, prezzo, formato_digitale, descrizione) VALUES
    ('Ciccio', 'Balls', 19.99, 'MP3', 'Una raccolta di brani rock energici.'),
    ('Puk', 'Le pietre', 29.99, 'FLAC', 'Un album con melodie acustiche rilassanti.'),
    ('Mal', 'Musica Blu', 39.99, 'WAV', 'Una compilation di brani jazz smooth.'),
    ('musicstore', 'SV', 49.99, 'MP3', 'Sinfonie classiche eseguite da una rinomata orchestra.'),
    ('Johnny', 'Time', 59.99, 'FLAC', 'Un mix di successi pop moderni.'),
    ('Marta', 'Stand', 69.99, 'WAV', 'Un album rap con testi potenti e ritmi coinvolgenti.'),
    ('marsio', 'Hole', 79.99, 'MP3', 'Ritmi reggae che ti faranno muovere.'),
    ('disco', 'Stelle Bianche', 89.99, 'FLAC', 'Brani blues con assoli di chitarra pieni di sentimento.'),
    ('nine', 'NineOne', 99.99, 'WAV', 'Canzoni country che raccontano una storia.'),
    ('tendis', 'Dieciii', 109.99, 'MP3', 'Musica folk con strumenti tradizionali.'),
    ('Ciccio', 'Prodotto11', 119.99, 'FLAC', 'Un album di musica elettronica dance.'),
    ('Puk', 'Prodotto12', 129.99, 'WAV', 'Una raccolta di paesaggi sonori ambientali.'),
    ('Mal', 'Prodotto13', 139.99, 'MP3', 'Brani hip-hop con ritornelli accattivanti.'),
    ('musicstore', 'Prodotto14', 149.99, 'FLAC', 'Una compilation di canzoni indie rock.'),
    ('Johnny', 'Prodotto15', 159.99, 'WAV', 'Un mix di inni rock classici.'),
    ('Marta', 'Prodotto16', 169.99, 'MP3', 'Un album jazz con assoli di sax smooth.'),
    ('marsio', 'Prodotto17', 179.99, 'FLAC', 'Una raccolta di brani heavy metal.'),
    ('disco', 'Prodotto18', 189.99, 'WAV', 'Canzoni R&B piene di sentimento con voci potenti.'),
    ('nine', 'Prodotto19', 199.99, 'MP3', 'Una compilation di musica world.'),
    ('tendis', 'Prodotto20', 209.99, 'FLAC', 'Una raccolta di pezzi per pianoforte classico.'),
    ('Ciccio', 'Prodotto21', 219.99, 'WAV', 'Un album di musica elettronica sperimentale.'),
    ('Puk', 'Prodotto22', 229.99, 'MP3', 'Una raccolta di brani dance vivaci.'),
    ('Mal', 'Prodotto23', 239.99, 'FLAC', 'Un mix di canzoni rock alternative.'),
    ('musicstore', 'Prodotto24', 249.99, 'WAV', 'Una compilation di brani jazz smooth.'),
    ('Johnny', 'Prodotto25', 259.99, 'MP3', 'Una raccolta di successi pop classici.');

INSERT INTO Recensione (username, titolo, voto, testo) VALUES
    ('Marta', 'Balls', 5, 'Ottimo prodotto, altamente consigliato!'),
    ('marsio', 'Le pietre', 4, 'Buon prodotto, ma potrebbe essere migliorato.'),
    ('disco', 'Musica Blu', 3, 'Prodotto nella media, niente di speciale.'),
    ('nine', 'SV', 2, 'Non sono soddisfatto del prodotto.'),
    ('tendis', 'Time', 1, 'Pessimo prodotto, non lo consiglio.'),
    ('Marta', 'Stand', 5, 'Prodotto eccellente, qualità superiore.'),
    ('marsio', 'Hole', 4, 'Buon rapporto qualità-prezzo.'),
    ('disco', 'Stelle Bianche', 3, 'Prodotto discreto, ma non eccezionale.'),
    ('nine', 'NineOne', 2, 'Non vale il prezzo pagato.'),
    ('disco', 'Dieciii', 3, 'Prodotto discreto, ma non eccezionale.'),
    ('nine', 'Dieciii', 2, 'Non vale il prezzo pagato.'),
    ('tendis', 'Dieciii', 1, 'Esperienza negativa, non lo ricomprerei.');

INSERT INTO Acquisto (username) VALUES
    ('Marta'),
    ('marsio'),
    ('disco'),
    ('nine'),
    ('tendis'),
    ('Marta'),
    ('marsio'),
    ('disco'),
    ('nine'),
    ('tendis');

INSERT INTO Acquisti_Prodotti (codice_acquisto, titolo) VALUES
    (1, 'Balls'),
    (1, 'Le pietre'),
    (2, 'Le pietre'),
    (3, 'Musica Blu'),
    (3, 'Le pietre'),
    (4, 'SV'),
    (5, 'Time'),
    (6, 'Stand'),
    (7, 'Hole'),
    (8, 'Stelle Bianche'),
    (9, 'NineOne'),
    (10, 'Dieciii');

INSERT INTO Tag (nome_tag) VALUES
    ('Rock'),
    ('Pop'),
    ('Jazz'),
    ('Classica'),
    ('Metal'),
    ('Rap'),
    ('Reggae'),
    ('Blues'),
    ('Country'),
    ('Folk');

INSERT INTO Prodotto_Tag (titolo, nome) VALUES
    ('Balls', 'Rock'),
    ('Musica Blu', 'Rock'),
    ('Time', 'Rock'),
    ('Hole', 'Rock'),
    ('NineOne', 'Rock'),
    ('Le pietre', 'Pop'),
    ('Musica Blu', 'Jazz'),
    ('SV', 'Classica'),
    ('Time', 'Metal'),
    ('Stand', 'Rap'),
    ('Hole', 'Reggae'),
    ('Stelle Bianche', 'Blues'),
    ('NineOne', 'Country'),
    ('Dieciii', 'Folk');

INSERT INTO Libro (titolo, pagine) VALUES
    ('Balls', 150),
    ('Le pietre', 200),
    ('Musica Blu', 300),
    ('SV', 400),
    ('Time', 500);

INSERT INTO Audio (titolo, durata) VALUES
    ('Stand', '312'),
    ('Hole', '300'),
    ('Stelle Bianche', '300'),
    ('NineOne', '400'),
    ('Dieciii', '200');

INSERT INTO Traccia (titolo, titolo_traccia) VALUES
    ('Stand', 'Traccia1'),
    ('Hole', 'Traccia2'),
    ('Stelle Bianche', 'T3'),
    ('NineOne', 'Mors'),
    ('Dieciii', 'Five');
CREATE DATABASE `parmaturism` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

-- parmaturism.category definition

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- parmaturism.questions definition

CREATE TABLE `questions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- parmaturism.randinfo definition

CREATE TABLE `randinfo` (
  `ID` int(11) NOT NULL,
  `image` varchar(32) DEFAULT NULL,
  `information` varchar(32) DEFAULT NULL,
  `label` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- parmaturism.article definition

CREATE TABLE `article` (
  `ID` int(11) NOT NULL,
  `crumb` varchar(32) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  `image_cardarticolo` varchar(64) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `title_cardarticolo` varchar(64) DEFAULT NULL,
  `subtitle_cardarticolo` varchar(64) DEFAULT NULL,
  `description_cardarticolo` text DEFAULT NULL,
  `article` text DEFAULT NULL,
  `coords_X` double DEFAULT NULL,
  `coords_Y` double DEFAULT NULL,
  `category_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `category_ID` (`category_ID`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- parmaturism.article_randinfo definition

CREATE TABLE `article_randinfo` (
  `ID` int(11) NOT NULL,
  `randinfo_ID` int(11) DEFAULT NULL,
  `article_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `randinfo_ID` (`randinfo_ID`),
  KEY `article_ID` (`article_ID`),
  CONSTRAINT `article_randinfo_ibfk_1` FOREIGN KEY (`randinfo_ID`) REFERENCES `randinfo` (`ID`),
  CONSTRAINT `article_randinfo_ibfk_2` FOREIGN KEY (`article_ID`) REFERENCES `article` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO parmaturism.category (ID,name) VALUES
	 (1,'Teatro'),
	 (2,'Parco'),
	 (3,'Edificio religioso'),
	 (4,'Museo');

INSERT INTO parmaturism.questions (name,email,title,content) VALUES
	 ('Vincenzo Cesqui','mail@mail.com','Domandone','Me lo sono dimenticato il domandone...');

INSERT INTO parmaturism.randinfo (ID,image,information,label) VALUES
	 (1,'time.png','1821','Data di costruzione'),
	 (2,'chair.png','1092','Posti a sedere'),
	 (3,'architect.png','Nicola Bettoli','Architetto'),
	 (4,'time.png','2015','Data di costruzione'),
	 (5,'bamboo.png','300.000+','Piante di bambù'),
	 (6,'architect.png','Franca Maria Ricci','Ideatore'),
	 (7,'time.png','1196 D.C.','Data di costruzione'),
	 (8,'religion.png','Cattolica','Religione'),
	 (9,'architect.png','Benedetto Antelami','Ideatore'),
 	 (10,'time.png','1760','Data di istituzione'),
	 (11,'sculpture.png','700','Opere contenute'),
	 (12,'noble.png','Filippo I di Parma','fondatore');

INSERT INTO parmaturism.article (ID,crumb,image,image_cardarticolo,title,title_cardarticolo,subtitle_cardarticolo,description_cardarticolo,article,coords_X,coords_Y,category_ID) VALUES
   (1,'teatro-regio','teatro_regio.jpg','/image/featured_1.jpg','Teatro Regio','Teatro Regio','Un Simbolo di Parma','Il Teatro Regio è un simbolo di Parma e della sua tradizione culturale. Non perdere l''occasione di visitarlo durante il tuo soggiorno in città','<p><strong>Un gioiello neoclassico: </strong> Sulle rive del torrente Parma, il Teatro Regio sorge come un''imponente reggia della musica, custode di una storia secolare e palcoscenico di indimenticabili emozioni. Inaugurato nel 1829, il teatro incarna il fasto dell''architettura neoclassica, con la sua facciata monumentale e gli interni sontuosi, impreziositi da stucchi dorati e velluti rossi.
            <br><br> <strong>Nel tempio della lirica:</strong> Varcando la soglia del Regio, si respira l''atmosfera magica che ha visto esibirsi i più grandi nomi dell''opera italiana, da Verdi a Puccini. Il suo palcoscenico, tra i più grandi d''Italia, ha accolto capolavori immortali come Aida, Rigoletto e Traviata, consacrando il teatro come tempio indiscusso della lirica.
            <br><br> <strong>Un''acustica perfetta:</strong> Il Teatro Regio vanta un''acustica straordinaria, frutto di un sapiente gioco di proporzioni e materiali. Ogni nota risuona con purezza e armonia, avvolgendo il pubblico in un''esperienza sensoriale unica.
            <br><br> <strong>Oltre l''opera:</strong> Oltre alla lirica, il Regio propone un calendario ricco di concerti di musica classica, balletti, eventi speciali e rassegne dedicate alla musica contemporanea. Un''offerta variegata che accontenta i gusti di tutti gli appassionati di musica.
            <br><br> <strong>Informazioni e prenotazioni:</strong> Visita il <a href="https://www.teatroregioparma.it" target="_blank" rel="noopener">sito web del Teatro Regio</a> per consultare il programma degli spettacoli, prenotare i biglietti e scoprire la sua affascinante storia. Vivi la magia del Regio e lasciati conquistare dalle emozioni che solo la musica sa donare.</p><br><br>
          ',44.803128,10.327258,1),
   (2,'labirinto-della-masone','labirinto_masone.jpg','/image/featured_2.jpg','Labirinto della Masone','Labirinto della Masone','Un''opera d''arte a cielo aperto','Visita il Labirinto della Masone e vivi un''esperienza indimenticabile tra arte, natura e divertimento.','<p><strong>Un capolavoro verdeggiante: </strong> Il Labirinto della Masone si estende per sette ettari e rappresenta il più grande labirinto in bambù del mondo. Creato da Franco Maria Ricci, editore, designer e collezionista, questo parco culturale è un''opera d''arte vivente che coniuga sapientemente natura, cultura e bellezza.
            <br><br> <strong>Un percorso affascinante:</strong> Oltre 300.000 canne di bambù di diverse specie si intrecciano dando vita a un dedalo di sentieri che invitano all''esplorazione e al disorientamento. Perdersi tra questi alti fusti verdi è un''esperienza unica e suggestiva, un viaggio alla scoperta di sé e dei segreti del labirinto.
            <br><br> <strong>Un rifugio per l''anima:</strong> Il Labirinto della Masone è un luogo ideale per staccare dalla frenesia quotidiana e immergersi nella quiete della natura. Il fruscio delle foglie di bambù, il canto degli uccelli e il profumo della terra creano un''atmosfera rilassante e rigenerante.
            <br><br> <stronparmaturismg>Un connubio di arte e cultura:</strong> Al centro del labirinto si trova la Casa Editrice Franco Maria Ricci, uno spazio dedicato all''arte e alla cultura. Qui potrete ammirare la collezione d''arte di Franco Maria Ricci, ricca di opere dal Cinquecento al Novecento, e visitare la biblioteca, che custodisce preziosi volumi e manoscritti.
            <br><br> <strong>Informazioni e prenotazioni:</strong> Visita il <a href="https://www.labirintodifrancomariaricci.it" target="_blank" rel="noopener">sito web del Labirinto della Masone</a> per consultare gli orari di apertura e per la prenotazione dei biglietti.</p>',
            44.854002,10.146429,2),
   (3, 'battistero', 'battistero.jpg', '/image/featured_3.jpg', 'Battistero', 'Battistero','Un''esperienza unica','Vivi un''esperienza unica visitando il Battistero di Parma e lasciati conquistare dalla sua bellezza senza tempo' , '<p><strong>Un gioiello romanico-gotico nel cuore della città </strong> Sorge fiero e maestoso in Piazza del Duomo a Parma, il Battistero di Parma, un capolavoro dell''arte romanico-gotica che rappresenta uno dei monumenti più iconici della città e dell''intera Emilia-Romagna. Costruito tra il 1196 e il 1216 su progetto di Benedetto Antelami, questo battistero ottagonale in marmo rosa di Verona è un''opera d''arte a cielo aperto che racchiude al suo interno tesori inestimabili.
            <br><br> <strong>Un capolavoro scultoreo:</strong> L''esterno del battistero è un tripudio di sculture che narrano storie bibliche e simboli cristiani. Ammirate la porta sud, scolpita dallo stesso Antelami, che raffigura il mese di marzo e l''Annunciazione; soffermatevi sulla porta nord, impreziosita con la Fuga in Egitto; e lasciatevi incantare dalla porta occidentale, che celebra la Presentazione di Gesù al Tempio.
            <br><br> <strong>Un rifugio per l''anima:</strong> Il Labirinto della Masone è un luogo ideale per staccare dalla frenesia quotidiana e immergersi nella quiete della natura. Il fruscio delle foglie di bambù, il canto degli uccelli e il profumo della terra creano un''atmosfera rilassante e rigenerante.
            <br><br> <strong>Un connubio di arte e cultura:</strong> Al centro del labirinto si trova la Casa Editrice Franco Maria Ricci, uno spazio dedicato all''arte e alla cultura. Qui potrete ammirare la collezione d''arte di Franco Maria Ricci, ricca di opere dal Cinquecento al Novecento, e visitare la biblioteca, che custodisce preziosi volumi e manoscritti.
            <br><br> <strong>Informazioni e prenotazioni:</strong> Visita il <a href="https://www.labirintodifrancomariaricci.it" target="_blank" rel="noopener">sito web del Labirinto della Masone</a> per consultare gli orari di apertura e per la prenotazione dei biglietti.</p><br><br>',
            44.803168,10.330429,3),
   (4,'galleria-nazionale', 'galleria_nazionale.jpg', '/image/featured_4.jpg', 'Galleria Nazionale', 'Galleria Nazionale', 'Arte senza tempo', 'Scopri la Galleria Nazionale, un tesoro di capolavori che ti trasporterà in un viaggio attraverso la storia dell''arte. Un''esperienza imperdibile per gli amanti della bellezza e della cultura.', '<p><strong>Un viaggio tra capolavori dell''arte italiana </strong> Nel cuore di Parma, immersa nella suggestiva cornice di Palazzo della Pilotta, si trova la Galleria Nazionale, un vero e proprio scrigno d''arte che custodisce un''eccezionale collezione di capolavori che spaziano dal Medioevo al Novecento.
            <br><br> <strong>Un tuffo nella storia dell''arte italiana:</strong> Attraversando le sale della galleria, vi troverete di fronte a opere di artisti di fama mondiale, come Beato Angelico, Correggio, Parmigianino, Tintoretto e Tiepolo. Ogni sala racconta una storia, un''epoca, un movimento artistico. Lasciatevi guidare dalle emozioni che ogni opera suscita in voi e immergetevi nella bellezza e nella maestria dei grandi maestri italiani.
            <br><br> <strong>Dal Medioevo al Novecento:</strong>La Galleria Nazionale di Parma vanta una collezione ricca e diversificata, che copre un arco temporale che va dal Medioevo al Novecento. Ammirate le Madonne di Beato Angelico, i ritratti del Parmigianino, le scene mitologiche del Correggio, i paesaggi di Fontanesi e le opere di arte moderna e contemporanea di autori come Carracci, Guercino, Tiepolo e Boldini.
            <br><br> <strong>Un''esperienza unica:</strong> Visitare la Galleria Nazionale di Parma è un''esperienza unica e indimenticabile. Ogni opera è un invito a scoprire nuovi significati, ad approfondire la propria conoscenza dell''arte italiana e a lasciarsi emozionare dalla bellezza.
            <br><br> <strong>Informazioni e prenotazioni:</strong> Visita il <a href="https://complessopilotta.it/galleria-nazionale/" target="_blank" rel="noopener">sito web della Galleria Nazionale</a> per consultare gli orari di apertura e per conoscere le tariffe.</p><br><br>',
            44.804722,10.325861,4);

INSERT INTO parmaturism.article_randinfo (ID,randinfo_ID,article_ID) VALUES
	 (1,1,1),
	 (2,2,1),
	 (3,3,1),
	 (4,4,2),
	 (5,5,2),
	 (6,6,2),
 	 (7,7,3),
	 (8,8,3),
	 (9,9,3),
	 (10,10,4),
	 (11,11,4),
	 (12,12,4);

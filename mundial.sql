CREATE DATABASE Mundial_Rusia;

USE Mundial_Rusia;

CREATE TABLE confederacion(
    ID_Confederacion VARCHAR (3) NOT NULL,
    Nombre_Confederacion VARCHAR (45) NOT NULL,
    PRIMARY KEY (ID_Confederacion)
);

CREATE TABLE equipo (
    ID_Equipo VARCHAR(3) NOT NULL,
    Nombre_Equipo VARCHAR (50) NOT NULL,
    ID_Confederacion VARCHAR (3) NOT NULL,
    
    PRIMARY KEY (ID_Equipo),
    FOREIGN KEY (ID_Confederacion) REFERENCES confederacion (ID_Confederacion)
);

CREATE TABLE grupo (
    ID_Grupo VARCHAR (2) NOT NULL,
    Nombre_Grupo VARCHAR (1) NOT NULL,
    ID_Equipo VARCHAR (3) NOT NULL,
    
    PRIMARY KEY (ID_Grupo),
    FOREIGN KEY (ID_Equipo) REFERENCES equipo (ID_Equipo)
);

CREATE TABLE fase (
    ID_Fase INT (3) NOT NULL AUTO_INCREMENT,
    Nombre_Fase VARCHAR (40) NOT NULL,
    ID_Equipo VARCHAR (3) NOT NULL,
    
    PRIMARY KEY (ID_Fase),
    FOREIGN KEY (ID_Equipo) REFERENCES equipo (ID_Equipo)
);

CREATE TABLE estadio_partido (
    ID_Estadio INT (3) NOT NULL,
    Nombre_Estadio VARCHAR (45) NOT NULL,
    
    PRIMARY KEY (ID_Estadio)
);

CREATE TABLE partido (
    ID_Partido INT NOT NULL AUTO_INCREMENT,
    Fecha_Partido DATE NOT NULL,
    Hora_Partido TIME NOT NULL,
    Marcador_Equipo1 INT (2) NOT NULL,
    Marcador_Equipo2 INT (2) NOT NULL,
    ID_Equipo1 VARCHAR (3) NOT NULL,
    ID_Equipo2 VARCHAR (3) NOT NULL,
    
    PRIMARY KEY (ID_Partido),
    FOREIGN KEY (ID_Equipo1) REFERENCES equipo (ID_Equipo),
    FOREIGN KEY (ID_Equipo2) REFERENCES equipo (ID_Equipo)
);

CREATE TABLE jugador (
    ID_Jugador INT NOT NULL AUTO_INCREMENT,
    Nombre_Jugador VARCHAR (45) NOT NULL,
    Apellido_Jugador VARCHAR (45) NOT NULL,
    Fecha_Nacimiento_Jugador DATE NOT NULL,
    Dorsal_Jugador INT (2) NOT NULL,
    ID_Equipo VARCHAR(3) NOT NULL,
    
    PRIMARY KEY (ID_Jugador),
    FOREIGN KEY (ID_Equipo) REFERENCES Equipo (ID_Equipo)
);

CREATE TABLE jugador_partido (
    ID_Jugador INT NOT NULL,
    ID_Partido INT NOT NULL,
    
    FOREIGN KEY (ID_Jugador) REFERENCES jugador (ID_Jugador),
    FOREIGN KEY (ID_Partido) REFERENCES partido (ID_Partido)
);

CREATE TABLE sustitucion (
    ID_Sustitucion INT NOT NULL AUTO_INCREMENT,
    Minuto_Sustitucion TIME NOT NULL,
    Jugador_Entrante VARCHAR (45) NOT NULL,
    Jugador_Saliente VARCHAR (45) NOT NULL,
    ID_Equipo VARCHAR (3) NOT NULL,
    ID_Jugador INT NOT NULL,
    
    PRIMARY KEY (ID_Sustitucion),
    FOREIGN KEY (ID_Jugador) REFERENCES jugador (ID_Jugador),
    FOREIGN KEY (ID_Jugador) REFERENCES jugador (ID_Jugador)
);

CREATE TABLE motivo_amonestacion(
    ID_Motivo_Amonestacion INT NOT NULL,
    Descripcion_Motivo_Amonestacion VARCHAR (45) NOT NULL,
    
    PRIMARY KEY (ID_Motivo_Amonestacion)
);

CREATE TABLE amonestacion(
    ID_Amonestacion INT NOT NULL AUTO_INCREMENT,
    Minuto_Amonestacion TIME NOT NULL,
    ID_Equipo VARCHAR(3) NOT NULL,
    ID_Jugador INT NOT NULL,
    ID_Motivo_Amonestacion INT NOT NULL,
    
    PRIMARY KEY(ID_Amonestacion),
    FOREIGN KEY(ID_Equipo) REFERENCES equipo(ID_Equipo),
    FOREIGN KEY(ID_Jugador) REFERENCES jugador(ID_Jugador),
    FOREIGN KEY(ID_Motivo_Amonestacion) REFERENCES motivo_amonestacion(ID_Motivo_Amonestacion)
);

CREATE TABLE posicion_jugador(
    ID_Posicion_Jugador INT NOT NULL AUTO_INCREMENT,
    Descripcion_Posicion_Jugador VARCHAR (45) NOT NULL,
    ID_Jugador INT,
    
    PRIMARY KEY (ID_Posicion_Jugador),
    FOREIGN KEY (ID_Jugador) REFERENCES jugador (ID_Jugador)
);

CREATE TABLE gol (
    Autor_Gol INT NOT NULL AUTO_INCREMENT,
    Minuto_Gol TIME NOT NULL,
    ID_Jugador INT,
    
    PRIMARY KEY (Autor_Gol),
    FOREIGN KEY (ID_Jugador) REFERENCES jugador (ID_Jugador)
);
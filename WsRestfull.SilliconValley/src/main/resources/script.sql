DROP DATABASE IF EXISTS SILLICON_VALLEY;
CREATE DATABASE SILLICON_VALLEY;

USE SILLICON_VALLEY;

CREATE TABLE USUARIO(
	ID INT NOT NULL AUTO_INCREMENT,
    NOMBRE VARCHAR(200) NOT NULL,
    EMPRESA VARCHAR(100) NOT NULL,
    FECHA_NACIMIENTO DATETIME NOT NULL,
    SEXO CHAR(1) NOT NULL,
    CONTRASENA VARCHAR(100) NOT NULL,
    CORREO VARCHAR(100) NOT NULL,
    CARGO VARCHAR(50) NOT NULL,
    IMAGEN BLOB NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE EXPOSITOR(
	ID INT NOT NULL AUTO_INCREMENT,
    NOMBRE_EMPRESA VARCHAR(100) NOT NULL,
    TEMA VARCHAR(200) NOT NULL,
    FECHA_EXPOSICION DATETIME,
    BIOGRAFIA_DETALLE VARCHAR(1000) NOT NULL,
    IMAGEN BLOB NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE CATEGORIA(
	ID INT NOT NULL AUTO_INCREMENT,
    DESCRIPCION VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE TIPO(
	ID INT NOT NULL AUTO_INCREMENT,
    DESCRIPCION VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE NOTA(
	ID INT NOT NULL AUTO_INCREMENT,
    ID_EXPOSITOR INT NOT NULL,
    ID_USUARIO INT NOT NULL,
    COMENTARIO VARCHAR(1000) NULL,
    FECHA_REGISTRO DATETIME NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT FK_NOTAXEXPOSITOR FOREIGN KEY (ID_EXPOSITOR) REFERENCES EXPOSITOR(ID),
    CONSTRAINT FK_NOTAXUSUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID)
);

CREATE TABLE TIPOXNOTA(
	ID_NOTA INT NULL,
    ID_TIPO INT NULL,
    FOREIGN KEY (ID_NOTA) REFERENCES NOTA(ID),
    FOREIGN KEY (ID_TIPO) REFERENCES TIPO(ID)
);

CREATE TABLE CATEGORIAXNOTA(
	ID_NOTA INT NULL,
    ID_CATEGORIA INT NULL,
    FOREIGN KEY (ID_NOTA) REFERENCES NOTA(ID),
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID)
);

CREATE TABLE AUDIO(
	ID INT NOT NULL AUTO_INCREMENT,
    AUDIO BLOB NOT NULL,
    ID_NOTA INT NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT FK_AUDIOXNOTA FOREIGN KEY (ID_NOTA) REFERENCES NOTA(ID) 
);

CREATE TABLE TOKEN(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    authToken VARCHAR(500),
    issuedOn TIMESTAMP,
    expiresOn TIMESTAMP,
    userId INT,
    CONSTRAINT FK_TOKENXUSUARIO FOREIGN KEY (userId) REFERENCES USUARIO(id)
);

-- ----------------------------
-- Table structure for authority
-- ----------------------------
CREATE TABLE `authority` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);
-- ----------------------------
-- Table structure for user_authority
-- ----------------------------
CREATE TABLE `user_authority` (
  `USER_ID` int(11) NOT NULL,
  `AUTHORITY_ID` int(11) NOT NULL,
  KEY `USER_ID` (`USER_ID`),
  KEY `AUTHORITY_ID` (`AUTHORITY_ID`),
  FOREIGN KEY (`USER_ID`) REFERENCES `USUARIO` (`ID`),
  FOREIGN KEY (`AUTHORITY_ID`) REFERENCES `authority` (`ID`)
);

INSERT INTO `USUARIO` VALUES ('1', 'ALONSO UCHIDA', 'VALMAR GROUP SAC', NOW(), 'M', '12345', 'javier.uchida@valmar.com.pe', 'Analista Desarrollador Senior', NULL);
INSERT INTO `USUARIO` VALUES ('2', 'VICTOR MALAVER', 'VALMAR GROUP SAC', NOW(), 'M', '12345', 'victor.malaver@valmar.com.pe', 'Analista Desarrollador Senior', NULL);
INSERT INTO `USUARIO` VALUES ('3', 'JOSUE MOSQUERA', 'VALMAR GROUP SAC', NOW(), 'M', '12345', 'josue.mosquera@valmar.com.pe', 'Analista Desarrollador Senior', NULL);
INSERT INTO `USUARIO` VALUES ('4', 'JOHN ORREGO', 'VALMAR GROUP SAC', NOW(), 'M', '12345', 'john.orrego@valmar.com.pe', 'Analista Desarrollador Senior', NULL);
-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', 'ROLE_USER');
INSERT INTO `authority` VALUES ('2', 'ROLE_ADMIN');

-- ----------------------------
-- Records of user_authority
-- ----------------------------
INSERT INTO `user_authority` VALUES ('1', '1');
INSERT INTO `user_authority` VALUES ('1', '2');
INSERT INTO `user_authority` VALUES ('2', '1');
INSERT INTO `user_authority` VALUES ('3', '1');

-- ----------------------------
-- Records of CATEGORIA
-- ----------------------------

INSERT INTO `CATEGORIA` VALUES ('1', 'Tecnología');
INSERT INTO `CATEGORIA` VALUES ('2', 'Sistemas');
INSERT INTO `CATEGORIA` VALUES ('3', 'Negocios');
INSERT INTO `CATEGORIA` VALUES ('4', 'Otros');

-- ----------------------------
-- Records of TIPO
-- ----------------------------

INSERT INTO `TIPO` VALUES ('1', 'Interrogante');
INSERT INTO `TIPO` VALUES ('2', 'Propuesta');
INSERT INTO `TIPO` VALUES ('3', 'Concepto');
INSERT INTO `TIPO` VALUES ('4', 'Otros');


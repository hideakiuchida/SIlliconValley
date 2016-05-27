DROP DATABASE IF EXISTS SILICON_VALLEY;
CREATE DATABASE SILICON_VALLEY;

USE SILICON_VALLEY;

CREATE TABLE USUARIO(
	ID INT NOT NULL AUTO_INCREMENT,
    NOMBRE VARCHAR(200) NOT NULL,
    EMPRESA VARCHAR(100) NOT NULL,
    FECHA_NACIMIENTO DATETIME NOT NULL,
    SEXO CHAR(1) NOT NULL,
    CONTRASENA VARCHAR(100) NOT NULL,
    CORREO VARCHAR(100) NOT NULL,
    CARGO VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID)
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

CREATE TABLE EXPOSITOR(
	ID INT NOT NULL AUTO_INCREMENT,
    NOMBRE_EMPRESA VARCHAR(100) NOT NULL,
    TEMA VARCHAR(200) NOT NULL,
    FECHA_EXPOSICION DATETIME,
    BIOGRAFIA_DETALLE VARCHAR(1000) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE NOTA(
	ID INT NOT NULL AUTO_INCREMENT,
	ID_CATEGORIA INT NOT NULL,
    ID_TIPO INT NOT NULL,
    ID_EXPOSITOR INT NOT NULL,
    ID_USUARIO INT NOT NULL,
    COMENTARIO VARCHAR(1000) NULL,
    FECHA_REGISTRO DATETIME NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT FK_NOTAXCATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID),
	CONSTRAINT FK_NOTAXTIPO FOREIGN KEY (ID_TIPO) REFERENCES TIPO(ID),
    CONSTRAINT FK_NOTAXEXPOSITOR FOREIGN KEY (ID_EXPOSITOR) REFERENCES EXPOSITOR(ID),
    CONSTRAINT FK_NOTAXUSUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', 'ROLE_USER');
INSERT INTO `authority` VALUES ('2', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for user_authority
-- ----------------------------
CREATE TABLE `user_authority` (
  `USER_ID` int(11) NOT NULL,
  `AUTHORITY_ID` int(11) NOT NULL,
  KEY `USER_ID` (`USER_ID`),
  KEY `AUTHORITY_ID` (`AUTHORITY_ID`),
  CONSTRAINT `user_authority_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `USUARIO` (`ID`),
  CONSTRAINT `user_authority_ibfk_2` FOREIGN KEY (`AUTHORITY_ID`) REFERENCES `authority` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `usuario` VALUES ('1', 'ALONSO UCHIDA', 'VALMAR GROUP SAC', NOW(), 'M', '12345', 'javier.uchida@valmar.com.pe', 'Analista Desarrollador Senior');
INSERT INTO `usuario` VALUES ('2', 'VICTOR MALAVER', 'VALMAR GROUP SAC', NOW(), 'M', '12345', 'victor.malaver@valmar.com.pe', 'Analista Desarrollador Senior');
INSERT INTO `usuario` VALUES ('3', 'JOSUE MOSQUERA', 'VALMAR GROUP SAC', NOW(), 'M', '12345', 'josue.mosquera@valmar.com.pe', 'Analista Desarrollador Senior');
INSERT INTO `usuario` VALUES ('4', 'JOHN ORREGO', 'VALMAR GROUP SAC', NOW(), 'M', '12345', 'john.orrego@valmar.com.pe', 'Analista Desarrollador Senior');
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

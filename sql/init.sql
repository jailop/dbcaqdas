DROP DATABASE IF EXISTS dbcaqdas;
CREATE DATABASE dbcaqdas;
USE dbcaqdas;

DROP USER IF exists dbcaqdas_admin@localhost;
CREATE USER dbcaqdas_admin@localhost IDENTIFIED BY 'password';
GRANT ALL ON dbcaqdas.* TO dbcaqdas_admin@localhost;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INTEGER NOT NULL AUTO_INCREMENT,
    login VARCHAR(30) NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    hashed_password VARCHAR(120) NOT NULL,
    password_set_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    languate VARCHAR(3) NOT NULL DEFAULT 'spa',
    email VARCHAR(256) NOT NULL,
    email_set TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS project_users;
CREATE TABLE project_users (
    project_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    privilege VARCHAR(30) NOT NULL DEFAULT 'Guest',
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS documents;
CREATE TABLE documents (
    id INTEGER NOT NULL AUTO_INCREMENT,
    project_id INTEGER NOT NULL,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    content TEXT,
    filename VARCHAR(200),
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
    id INTEGER NOT NULL AUTO_INCREMENT,
    parent INTEGER,
    project_id INTEGER NOT NULL,
    label VARCHAR(200) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (parent) REFERENCES tags(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

DROP TABLE IF EXISTS highlights;
CREATE TABLE highlights (
    id INTEGER NOT NULL AUTO_INCREMENT,
    document_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    start_offset INTEGER NOT NULL DEFAULT 0,
    end_offset INTEGER NOT NULL DEFAULT 0,
    snippet TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (document_id) REFERENCES documents(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

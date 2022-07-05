DROP DATABASE medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    Doctor_ID INTEGER REFERENCES doctors(id),
    Patient_ID INTEGER REFERENCES patients(id)
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    Visit_ID INTEGER REFERENCES visits(id),
    Disease INTEGER REFERENCES diseases(id),
    Notes TEXT
);

insert into doctors (name)
VALUES
('dr james'),
('mr doctor sir'),
('surgeon');

insert into patients (name) VALUES
('patient-zero'),
('austin'),
('michael');

insert into visits (doctor_id, patient_id) VALUES
(1, 2),
(3, 3),
(2, 2),
(2, 1);

insert into diseases (name) VALUES
('that one disease nobody wants'),
('bad disease 2'),
('bad disease 3');

insert into diagnoses (visit_id, disease, notes) VALUES
(1, 2, 'he is done for'),
(2, 1, 'uh-oh');

insert into diagnoses (visit_id, disease) VALUES
(3, 3);
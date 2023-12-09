-- Create the database
CREATE DATABASE course_registration_processing_system;
-- Initialize the tables
USE course_registration_processing_system;
CREATE TABLE department(
    dept_id BIGINT NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (dept_id)
);
CREATE TABLE student(
    student_id BIGINT NOT NULL,
    student_name VARCHAR(255) NOT NULL,
    major VARCHAR(255) NOT NULL,
    level INT NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (student_id)
);
CREATE TABLE professor(
    prof_id BIGINT NOT NULL,
    prof_name VARCHAR(255) NOT NULL,
    dept_id BIGINT NOT NULL,
    PRIMARY KEY (prof_id)
);
CREATE TABLE course(
    course_code VARCHAR(10) NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (course_code)
);
CREATE TABLE semester_course(
    course_code VARCHAR(10) NOT NULL,
    quarter VARCHAR(10) NOT NULL,
    `year` INT NOT NULL,
    prof_id BIGINT NOT NULL,
    PRIMARY KEY (course_code, quarter, year)
);
CREATE TABLE enrolled(
    student_id BIGINT NOT NULL,
    course_code VARCHAR(10) NOT NULL,
    quarter VARCHAR(10) NOT NULL,
    year INT NOT NULL,
    enrolled_at DATE NOT NULL,
    PRIMARY KEY (student_id, course_code, quarter, year)
);
-- Add foreign keys
ALTER TABLE professor
ADD CONSTRAINT fk_professor_dept_id FOREIGN KEY (dept_id) REFERENCES department(dept_id);
ALTER TABLE semester_course
ADD CONSTRAINT fk_semester_course_course_id FOREIGN KEY (course_code) REFERENCES course(course_code),
    ADD CONSTRAINT fk_semester_course_prof_id FOREIGN KEY (prof_id) REFERENCES professor(prof_id);
ALTER TABLE enrolled
ADD CONSTRAINT fk_enrolled_student_id FOREIGN KEY (student_id) REFERENCES student(student_id),
    ADD CONSTRAINT fk_enrolled_course_code FOREIGN KEY (course_code) REFERENCES course(course_code);
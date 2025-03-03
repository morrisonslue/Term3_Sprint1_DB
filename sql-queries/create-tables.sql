-- Create Speakers table
CREATE TABLE Speakers (
    speaker_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

-- Create Attendees table
CREATE TABLE Attendees (
    attendee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    organization VARCHAR(100)
);

-- Create Sessions table
CREATE TABLE Sessions (
    session_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    speaker_id INT NOT NULL,
    session_date DATE NOT NULL,
    session_time TIME NOT NULL,
    FOREIGN KEY (speaker_id) REFERENCES Speakers(speaker_id) ON DELETE CASCADE
);

-- Create Registrations table (Many-to-Many Relationship)
CREATE TABLE Registrations (
    registration_id SERIAL PRIMARY KEY,
    attendee_id INT NOT NULL,
    session_id INT NOT NULL,
    UNIQUE (attendee_id, session_id),
    FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id) ON DELETE CASCADE,
    FOREIGN KEY (session_id) REFERENCES Sessions(session_id) ON DELETE CASCADE
);
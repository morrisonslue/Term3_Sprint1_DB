const { Pool } = require('pg');

// PostgreSQL connection
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'conference_management',
  password: 'Theelevator101!', 
  port: 5432,
});

/**
 * Creates the database tables, if they do not already exist
 */
async function createTables() {
  try {
    await pool.query(`
      CREATE TABLE IF NOT EXISTS Speakers (
        speaker_id SERIAL PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        specialty VARCHAR(100) NOT NULL
      );

      CREATE TABLE IF NOT EXISTS Attendees (
        attendee_id SERIAL PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        organization VARCHAR(100)
      );

      CREATE TABLE IF NOT EXISTS Sessions (
        session_id SERIAL PRIMARY KEY,
        title VARCHAR(100) NOT NULL,
        speaker_id INT NOT NULL,
        session_date DATE NOT NULL,
        session_time TIME NOT NULL,
        FOREIGN KEY (speaker_id) REFERENCES Speakers(speaker_id) ON DELETE CASCADE
      );

      CREATE TABLE IF NOT EXISTS Registrations (
        registration_id SERIAL PRIMARY KEY,
        attendee_id INT NOT NULL,
        session_id INT NOT NULL,
        UNIQUE (attendee_id, session_id),
        FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id) ON DELETE CASCADE,
        FOREIGN KEY (session_id) REFERENCES Sessions(session_id) ON DELETE CASCADE
      );
    `);
    console.log('Tables created or already exist');
  } catch (err) {
    console.error('Error creating tables:', err.message);
  }
}

/**
 * Inserts a new session
 */
async function insertSession(title, speakerId, date, time) {
  try {
    const res = await pool.query(
      'INSERT INTO Sessions (title, speaker_id, session_date, session_time) VALUES ($1, $2, $3, $4) RETURNING *',
      [title, speakerId, date, time]
    );
    console.log('Session inserted:', res.rows[0]);
  } catch (err) {
    console.error('Error inserting session:', err.message);
  }
}

/**
 * Print all sessions 
 */
async function displaySessions() {
  try {
    const res = await pool.query(`
      SELECT s.session_id, s.title, s.session_date, s.session_time, sp.first_name || ' ' || sp.last_name AS speaker
      FROM Sessions s
      JOIN Speakers sp ON s.speaker_id = sp.speaker_id
      ORDER BY s.session_date, s.session_time;
    `);
    console.table(res.rows);
  } catch (err) {
    console.error('Error retrieving sessions:', err.message);
  }
}

/**
 * Updates email address
 */
async function updateAttendeeEmail(attendeeId, newEmail) {
  try {
    const res = await pool.query(
      'UPDATE Attendees SET email = $1 WHERE attendee_id = $2 RETURNING *',
      [newEmail, attendeeId]
    );
    if (res.rowCount > 0) {
      console.log('Attendee email updated:', res.rows[0]);
    } else {
      console.log('Attendee not found');
    }
  } catch (err) {
    console.error('Error updating attendee email', err.message);
  }
}

/**
 * Removes an attendee from the database along with their registrations
 */
async function removeAttendee(attendeeId) {
  try {
    const res = await pool.query(
      'DELETE FROM Attendees WHERE attendee_id = $1 RETURNING *',
      [attendeeId]
    );
    if (res.rowCount > 0) {
      console.log('Attendee removed:', res.rows[0]);
    } else {
      console.log('Attendee not found');
    }
  } catch (err) {
    console.error('Error removing attendee:', err.message);
  }
}

/**
 * Prints a help message to the console.
 */
function printHelp() {
  console.log(`
    Usage:
    node index.js show                     → Show all sessions
    node index.js insert <title> <speaker_id> <session_date YYYY-MM-DD> <session_time HH:MM> → Insert a session
    node index.js update <attendee_id> <new_email> → Update an attendee's email
    node index.js remove <attendee_id>     → Remove an attendee
  `);
}

/**
 * Runs the CLI app to manage the conference event system
 */
async function runCLI() {
  await createTables(); 

  const args = process.argv.slice(2);
  switch (args[0]) {
    case 'insert':
      if (args.length !== 5) {
        printHelp();
        return;
      }
      await insertSession(args[1], parseInt(args[2]), args[3], args[4]);
      break;
    case 'show':
      await displaySessions();
      break;
    case 'update':
      if (args.length !== 3) {
        printHelp();
        return;
      }
      await updateAttendeeEmail(parseInt(args[1]), args[2]);
      break;
    case 'remove':
      if (args.length !== 2) {
        printHelp();
        return;
      }
      await removeAttendee(parseInt(args[1]));
      break;
    default:
      printHelp();
      break;
  }
  pool.end();
}

runCLI();


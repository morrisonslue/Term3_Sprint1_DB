const { Pool } = require('pg');

// PostgreSQL connection
const pool = new Pool({
  user: 'postgres', // This _should_ be your username, as it's the default one Postgres uses
  host: 'localhost',
  database: 'your_database_name', // Change this to reflect your actual database
  password: 'your_database_password', // Change this to reflect the password you used when setting up Postgres
  port: 5432,
});

/**
 * Creates the database tables, if they do not already exist.
 */
async function createTables() {
  // TODO: Add code to create Speakers, Attendees, Sessions, and Registrations tables
};

/**
 * Inserts a new session into the Sessions table.
 * 
 * @param {string} title - Title of the session
 * @param {number} speakerId - ID of the speaker presenting the session
 * @param {string} date - Date of the session (YYYY-MM-DD format)
 * @param {string} time - Time of the session (HH:MM format)
 */
async function insertSession(title, speakerId, date, time) {
  // TODO: Add code to insert a new session into the Sessions table
};

/**
 * Prints all sessions in the database to the console.
 */
async function displaySessions() {
  // TODO: Add code to retrieve and print all sessions from the Sessions table
};

/**
 * Updates an attendee's email address.
 * 
 * @param {number} attendeeId - ID of the attendee
 * @param {string} newEmail - New email address of the attendee
 */
async function updateAttendeeEmail(attendeeId, newEmail) {
  // TODO: Add code to update an attendee's email address
};

/**
 * Removes an attendee from the database along with their registrations.
 * 
 * @param {number} attendeeId - ID of the attendee to remove
 */
async function removeAttendee(attendeeId) {
  // TODO: Add code to remove an attendee and their session registrations
};

/**
 * Prints a help message to the console.
 */
function printHelp() {
  console.log('Usage:');
  console.log('  insert <title> <speaker_id> <date> <time> - Insert a session');
  console.log('  show - Show all sessions');
  console.log('  update <attendee_id> <new_email> - Update an attendee\'s email');
  console.log('  remove <attendee_id> - Remove an attendee from the database');
}

/**
 * Runs the CLI app to manage the conference event system.
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
};

runCLI();

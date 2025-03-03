-- Find all sessions an attendee is registered for 
SELECT
    s.session_id,
    s.title,
    s.session_date,
    s.session_time,
    sp.first_name || ' ' || sp.last_name AS speaker
FROM
    Sessions s
    JOIN Registrations r ON s.session_id = r.session_id
    JOIN Attendees a ON r.attendee_id = a.attendee_id
    JOIN Speakers sp ON s.speaker_id = sp.speaker_id
WHERE
    a.email = 'john@techcorp.io';

-- List all attendees registered for a session
SELECT
    a.first_name,
    a.last_name,
    a.email,
    a.organization
FROM
    Attendees a
    JOIN Registrations r ON a.attendee_id = r.attendee_id
    JOIN Sessions s ON r.session_id = s.session_id
WHERE
    s.title = 'AI’s Takeover: When Will the Robots Win?';

-- Retrieve the schedule for all sessions presented by a specific speaker
SELECT
    s.title,
    s.session_date,
    s.session_time,
    sp.first_name || ' ' || sp.last_name AS speaker
FROM
    Sessions s
    JOIN Speakers sp ON s.speaker_id = sp.speaker_id
WHERE
    sp.email = 'bob@aiinsights.io';

-- Find all attendees attending at least one session from a specific speaker
SELECT
    DISTINCT a.first_name,
    a.last_name,
    a.email
FROM
    Attendees a
    JOIN Registrations r ON a.attendee_id = r.attendee_id
    JOIN Sessions s ON r.session_id = s.session_id
    JOIN Speakers sp ON s.speaker_id = sp.speaker_id
WHERE
    sp.email = 'alice@cyberguard.com';

-- List all sessions on a specific date
SELECT
    title,
    session_time,
    (
        SELECT
            first_name || ' ' || last_name
        FROM
            Speakers
        WHERE
            speaker_id = s.speaker_id
    ) AS speaker
FROM
    Sessions s
WHERE
    session_date = '2025-05-01';
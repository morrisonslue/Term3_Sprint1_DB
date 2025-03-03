-- Insert Speakers
INSERT INTO
    Speakers (first_name, last_name, email, specialty)
VALUES
    (
        'Alice',
        'Johnson',
        'alice@cyberguard.com',
        'Cybersecurity'
    ),
    (
        'Bob',
        'Smith',
        'bob@aiinsights.io',
        'AI & Machine Learning'
    ),
    (
        'Charlie',
        'Davis',
        'charlie@webwizard.dev',
        'Web Development'
    ),
    (
        'Dana',
        'Lopez',
        'dana@cloudhaven.net',
        'Cloud Computing'
    ),
    (
        'Eve',
        'Adams',
        'eve@blockchainvault.co',
        'Blockchain Technology'
    ),
    (
        'Frank',
        'Reynolds',
        'frank@darkwebdefense.com',
        'Ethical Hacking'
    ),
    (
        'Grace',
        'Hopper',
        'grace@historicaltech.org',
        'Programming History'
    ),
    (
        'Henry',
        'Ford',
        'henry@automaind.com',
        'Automation & Robotics'
    ),
    (
        'Isabella',
        'Stone',
        'isabella@quantumfuture.ai',
        'Quantum Computing'
    ),
    (
        'Jack',
        'Sparrow',
        'jack@piratehackers.com',
        'Cryptography & Cybersecurity'
    ),
    (
        'Luna',
        'Star',
        'luna@uxmagic.io',
        'User Experience Design'
    ),
    (
        'Maverick',
        'Sky',
        'maverick@aerospaceinnovate.com',
        'Aerospace Engineering'
    ),
    (
        'Olivia',
        'Tesla',
        'olivia@electricfuture.com',
        'Sustainable Energy'
    ),
    (
        'Noah',
        'Newton',
        'noah@gravitylabs.com',
        'Physics & Mathematics'
    ),
    (
        'Ava',
        'Curie',
        'ava@nuclearvision.com',
        'Nuclear Science'
    ),
    (
        'Ethan',
        'AI',
        'ethan@robotrevolution.io',
        'Humanoid Robotics'
    ),
    (
        'Zara',
        'Quantum',
        'zara@quantumfields.ai',
        'Quantum Computing'
    ),
    (
        'Leo',
        'Neural',
        'leo@deepnetworks.com',
        'Deep Learning'
    ),
    (
        'Mia',
        'Bio',
        'mia@genetech.com',
        'Genetic Engineering'
    ),
    (
        'Ryan',
        'Crypto',
        'ryan@cryptovault.io',
        'Decentralized Finance'
    );

-- Insert Attendees
INSERT INTO
    Attendees (first_name, last_name, email, organization)
VALUES
    ('John', 'Doe', 'john@techcorp.io', 'Tech Corp'),
    ('Jane', 'Doe', 'jane@websoft.com', 'WebSoft'),
    ('Michael', 'Brown', 'michael@nomad.dev', NULL),
    (
        'Sarah',
        'Miller',
        'sarah@ai-startups.com',
        'AI Startups'
    ),
    ('David', 'Wilson', 'david@opensource.net', NULL),
    (
        'Emily',
        'Clark',
        'emily@cybersecinc.com',
        'CyberSec Inc.'
    ),
    ('James', 'Lee', 'james@freelance.dev', NULL),
    (
        'Sophia',
        'Harris',
        'sophia@frontendmasters.com',
        'Frontend Masters'
    ),
    (
        'Daniel',
        'Martinez',
        'daniel@quantuminnovate.ai',
        NULL
    ),
    (
        'Olivia',
        'White',
        'olivia@cloudinnovations.com',
        'Cloud Innovations'
    ),
    (
        'Mason',
        'Storm',
        'mason@techwave.com',
        'TechWave'
    ),
    (
        'Ethan',
        'Volt',
        'ethan@energynet.com',
        'EnergyNet'
    ),
    (
        'Liam',
        'Neutron',
        'liam@fusionlabs.com',
        'Fusion Labs'
    ),
    (
        'Emma',
        'Rodriguez',
        'emma@neuralnetworks.org',
        'Neural Networks Inc.'
    ),
    (
        'Noah',
        'Steele',
        'noah@hackerdojo.com',
        'Hacker Dojo'
    ),
    (
        'Ava',
        'Turing',
        'ava@cryptoanalysts.com',
        'Crypto Analysts'
    ),
    (
        'William',
        'Data',
        'william@bigdatauniverse.com',
        'Big Data Universe'
    ),
    (
        'Mia',
        'Montgomery',
        'mia@uxcreators.io',
        'UX Creators'
    ),
    (
        'Harper',
        'Lovelace',
        'harper@machinegenius.net',
        'Machine Genius'
    ),
    (
        'Lucas',
        'Vega',
        'lucas@devopsflow.com',
        'DevOps Flow'
    );

-- Insert Sessions
INSERT INTO
    Sessions (title, speaker_id, session_date, session_time)
VALUES
    (
        'Hacking the Matrix: Ethical Edition',
        6,
        '2025-05-01',
        '10:00'
    ),
    (
        'AI’s Takeover: When Will the Robots Win?',
        2,
        '2025-05-01',
        '12:00'
    ),
    (
        'Frontend Magic: The Dark Arts of CSS',
        3,
        '2025-05-02',
        '09:30'
    ),
    (
        'Cloud Domination: AWS vs. Azure vs. Google',
        4,
        '2025-05-02',
        '14:00'
    ),
    (
        'The Blockchain Conspiracy',
        5,
        '2025-05-03',
        '10:30'
    ),
    (
        'Quantum Computing for Mere Mortals',
        9,
        '2025-05-03',
        '15:00'
    ),
    (
        'The Pirate’s Guide to Cybersecurity',
        10,
        '2025-05-04',
        '11:00'
    ),
    (
        'UX: The Magic of Human Interaction',
        11,
        '2025-05-04',
        '14:45'
    ),
    (
        'Big Data, Bigger Lies: How to Spot Fake Analytics',
        15,
        '2025-05-05',
        '16:00'
    ),
    (
        'The UX Experience No One Talks About',
        12,
        '2025-05-05',
        '14:30'
    ),
    (
        'DevOps: The Good, The Bad, and The Burnout',
        19,
        '2025-05-06',
        '08:30'
    ),
    (
        'AI in Healthcare: The Robot Doctors are Here',
        2,
        '2025-05-06',
        '11:15'
    ),
    (
        'The Future of Self-Driving Cars',
        14,
        '2025-05-07',
        '10:00'
    ),
    (
        'How Quantum Computing Will Change Everything',
        17,
        '2025-05-07',
        '13:00'
    ),
    (
        'The Ethics of Artificial Intelligence',
        18,
        '2025-05-08',
        '15:00'
    );

-- Insert Registrations
INSERT INTO
    Registrations (attendee_id, session_id)
VALUES
    (1, 1),
    (1, 3),
    (2, 2),
    (2, 4),
    (3, 1),
    (3, 5),
    (4, 2),
    (4, 6),
    (5, 3),
    (5, 7),
    (6, 4),
    (6, 5),
    (7, 6),
    (7, 7),
    (8, 1),
    (9, 10),
    (10, 11),
    (11, 2),
    (12, 9),
    (13, 8),
    (14, 4),
    (15, 7),
    (16, 12),
    (17, 6),
    (18, 3),
    (19, 1),
    (20, 5),
    (6, 11),
    (5, 14),
    (14, 15),
    (3, 12),
    (8, 10),
    (12, 13),
    (2, 9);
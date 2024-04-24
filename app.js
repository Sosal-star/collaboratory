const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');
const session = require('express-session');

const app = express();
const port = 3000;

// Database connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'bus_ticketing'
});

connection.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(session({
  secret: '9563',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

app.use(express.static('public'));
app.get('/', (req, res) => {
  res.redirect('/login.html');
});

function getTableName(role) {
  switch (role.toLowerCase()) { // Convert role to lowercase to match database entries
    case 'admin':
      return 'admin';
    case 'customer':
      return 'customer';
    case 'driver':
      return 'drivers';
    case 'station_manager':
      return 'stationmanager';
    default:
      return null;
  }
}

// Login endpoint
app.post('/login', (req, res) => {
  const { email, password, role } = req.body;
  let tableName = getTableName(role);
  if (!tableName) {
    return res.status(400).send('Invalid role specified');
  }
  const query = `SELECT * FROM ${tableName} WHERE email = ?`;
  connection.query(query, [email], (error, results) => {
    if (error) {
      return res.status(500).send('Error on the server.');
    }
    if (results.length > 0) {
      const user = results[0];
      if (password === user.password) { // Simplified for clarity; use password hashing in production
        req.session.user = { id: user.id, role: user.role };
        if (role === 'admin') {
          res.redirect('/admindashboard.html');
        } else if (role === 'customer') {
          res.redirect('/userdashboard.html');
        } else {
          res.send('Login successful, redirecting...');
        }
      } else {
        return res.status(401).send('Incorrect password.');
      }
    } else {
      return res.status(401).send('User not found.');
    }
  });
});

// Admin dashboard route
app.get('/admindashboard', (req, res) => {
  if (req.session.user && req.session.user.role === 'admin') {
    res.sendFile(path.join(__dirname, 'admindashboard.html'));
  } else {
    res.status(403).send('Unauthorized');
  }
});

// User Dashboard Route
app.get('/userdashboard.html', (req, res) => {
  if (req.session.user && req.session.user.role === 'customer') {
    res.sendFile(path.join(__dirname, 'userdashboard.html'));
  } else {
    res.status(403).send('Unauthorized');
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

// Signup or register as a user
app.post('/signup', (req, res) => {
  const { name, email, password, confirmPassword, contactNumber } = req.body;

  if (password !== confirmPassword) {
    return res.status(400).send('Passwords do not match.');
  }

  const query = 'INSERT INTO customer (name, email, password, contact_info) VALUES (?, ?, ?, ?)';
  connection.query(query, [name, email, password, contactNumber], (error, results) => {
    if (error) {
      console.error('Error registering user:', error);
      return res.status(500).send('Error registering user.');
    }
    res.redirect('/login.html'); // Redirect to login page after successful registration
  });
});

// Endpoint to add a new bus
app.post('/addbus', (req, res) => {
  // Extract bus details from the request body
  const {registrationnumber, model, capacity, status } = req.body;

  // SQL query to insert a new bus into the database
  const query = 'INSERT INTO buses (registration_number, model, capacity, status) VALUES (?, ?, ?, ?)';
  
  connection.query(query, [registrationnumber, model, capacity, status], (error, results) => {
      if (error) {
          console.error('Error adding bus:', error);
          return res.status(500).send('Error adding bus to the database.');
      }
      res.redirect('/managebus.html'); // Redirect back to the manage bus page after successful insertion
  });
});
// Fetch all buses
app.get('/getbuses', (req, res) => {
  const query = 'SELECT * FROM buses';
  connection.query(query, (error, results) => {
      if (error) {
          console.error('Error fetching buses:', error);
          return res.status(500).send('Error fetching buses.');
      }
      res.json(results);
  });
});
// Delete a bus
app.post('/deletebus', (req, res) => {
  const bus_id = req.body;
  const query = 'DELETE FROM buses WHERE bus_id = ?';
  connection.query(query, [bus_id], (error, results) => {
      if (error) {
          console.error('Error deleting bus:', error);
          return res.status(500).send('Error deleting bus.');
      }
      res.send('Bus deleted successfully');
  });
});
// editing bus details
app.get('/getbus/:bus_id', (req, res) => {
  const { bus_id } = req.params;
  connection.query('SELECT * FROM buses WHERE bus_id = ?', [bus_id], (error, results) => {
      if (error) {
          return res.status(500).send('Error fetching bus data.');
      }
      res.json(results[0]); // Assuming bus_id is unique and only one result is returned
  });
});
app.post('/editbus', (req, res) => {
  const { bus_id, registrationnumber, model, capacity, status } = req.body;
  const query = 'UPDATE buses SET registration_number = ?, model = ?, capacity = ?, status = ? WHERE bus_id = ?';
  connection.query(query, [registrationnumber, model, capacity, status, bus_id], (error, results) => {
      if (error) {
          return res.status(500).send('Error updating bus.');
      }
      res.redirect('/managebus.html'); // Redirect back or handle differently
  });
});
// Endpoint to add a new driver
app.post('/adddriver', (req, res) => {
  // Extract driver details from the request body
  const { driver_name, driver_email, driver_password, driver_contact, bus_id, driver_status } = req.body;

  // SQL query to insert a new driver into the database
  const query = 'INSERT INTO drivers (name, email, password, contact_number, bus_id, status) VALUES (?, ?, ?, ?, ?, ?)';
  
  connection.query(query, [driver_name, driver_email, driver_password, driver_contact, bus_id, driver_status], (error, results) => {
      if (error) {
          console.error('Error adding driver:', error);
          return res.status(500).send('Error adding driver to the database.');
      }
      res.redirect('/managedriver.html'); // Redirect back to the manage bus page after successful insertion
  });
});
// Endpoint to get all drivers
app.get('/getdrivers', (req, res) => {
  const query = 'SELECT * FROM drivers';
  connection.query(query, (error, results) => {
      if (error) {
          console.error('Error fetching drivers:', error);
          return res.status(500).send('Error fetching drivers.');
      }
      res.json(results); // Send driver data as JSON
  });
});
// Endpoint to add a new route
app.post('/addroute', (req, res) => {
  const { origin, destination, distance, duration, status, bus_id } = req.body;

  // SQL query to insert a new route into the database
  const query = 'INSERT INTO routes (origin, destination, distance, duration, status, bus_id) VALUES (?, ?, ?, ?, ?, ?)';
  
  connection.query(query, [origin, destination, distance, duration, status, bus_id], (error, results) => {
      if (error) {
          console.error('Error adding route:', error);
          return res.status(500).send('Error adding route to the database.');
      }
      res.redirect('/manageroutes.html'); // Redirect back to the manage routes page after successful insertion
  });
});
// Endpoint to get all routes
app.get('/getroutes', (req, res) => {
  const query = 'SELECT * FROM routes';
  connection.query(query, (error, results) => {
      if (error) {
          console.error('Error fetching routes:', error);
          return res.status(500).send('Error fetching routes.');
      }
      res.json(results); // Send route data as JSON
  });
});
// Endpoint to add a new schedule
app.post('/addschedule', (req, res) => {
  const { route_id, bus_id, departuretime, arrivaltime, status } = req.body;
  console.log(departuretime, arrivaltime);

  // SQL query to insert a new schedule into the database
  const query = 'INSERT INTO schedules (route_id, bus_id, departure_time, arrival_time, status) VALUES (?, ?, ?, ?, ?)';
  
  connection.query(query, [route_id, bus_id, departuretime, arrivaltime, status], (error, results) => {
      if (error) {
          console.error('Error adding schedule:', error);
          return res.status(500).send('Error adding schedule to the database.');
      }
      res.send('Schedule added successfully');
  });
});
// Endpoint to get all schedules
app.get('/getschedules', (req, res) => {
  const query = 'SELECT * FROM schedules';
  connection.query(query, (error, results) => {
      if (error) {
          console.error('Error fetching schedules:', error);
          return res.status(500).send('Error fetching schedules.');
      }
      res.json(results); // Send schedule data as JSON
  });
});

app.post('/search-buses', (req, res) => {
  const { from, to, date } = req.body;  // assuming 'from' and 'to' are location IDs or names and 'date' is the travel date

  const query = `
      SELECT b.*, r.origin, r.destination, s.departure_time, s.arrival_time
      FROM buses b
      JOIN schedules s ON b.bus_id = s.bus_id
      JOIN routes r ON s.route_id = r.route_id
      WHERE r.origin = ? AND r.destination = ? AND DATE(s.departure_time) = ?
  `;

  // Executing the query
  connection.query(query, [from, to, date], (error, results) => {
      if (error) {
          console.error('Error fetching buses:', error);
          return res.status(500).send('Error fetching buses.');
      }
      res.json(results);
  });
});




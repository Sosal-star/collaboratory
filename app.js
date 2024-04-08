const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');

//const mysql = require('mysql2');
const session = require('express-session');

const app = express();
const port = 5500;

// Database connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'online_bus_ticketing'
});

connection.connect();

app.use(bodyParser.urlencoded({ extended: true }));

// Session middleware setup
app.use(session({
  secret: '9563', // use a secret key for your session
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false } // for HTTPS use secure: true
}));

app.use(express.static('public')); // Serve your static HTML files
app.get('/', (req, res) => {
  res.redirect('/login.html');
});

// Login endpoint
app.post('/login', (req, res) => {
  const { email, password, role } = req.body;
  let tableName = getTableName(role);

  // SQL query to check the user’s credentials
  const query = `SELECT * FROM ?? WHERE email = ? AND password = ?`; // Consider hashing the password
  connection.query(query, [tableName, email, password], (error, results) => {
    if (error) {
      return res.status(500).send('Error on the server.');
    }
    if (results.length > 0) {
      // User found, set the session
      req.session.user = { id: results[0].id, role: role };

      // Redirect to the admin dashboard if the role is admin
      if (role === 'admin') {
        res.redirect('/admindashboard.html');
      } else {
        res.send('Login successful, but not an admin');
      }
    } else {
      // User not found
      res.status(401).send('Login failed');
    }
  });
});

// Admin dashboard route
app.get('/admindashboard', (req, res) => {
  res.sendFile(path.join(__dirname, 'admindashboard.html'));
});
app.get('/admindashboard', (req, res) => {
  if (req.session.user && req.session.user.role === 'admin') {
    res.sendFile(__dirname + '/admindashboard.html');
 // Update with the correct path to your dashboard HTML file
  } else {
    res.status(403).send('Unauthorized');
  }
});
app.get('/managebuses', (req, res) => {
  res.sendFile(path.join(__dirname,'public','managebus.html'));
});


app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
// Handle 405 errors
app.use(function(req, res, next) {
  var flag = false;
  for (var i = 0; i < req.route.stack.length; i++) {
    if (req.method == req.route.stack[i].method) {
      flag = true;
    }
  }
  if (!flag) {
    err = new Error('Method Not Allowed')
    err.status = 405;
    return next(err)
  }

  next();
});

function getTableName(role) {
  switch (role) {
    case 'admin':
      return 'admin';
    case 'driver':
      return 'drivers';
    case 'station_manager':
      return 'stationmanager';
    case 'customer':
      return 'customer';
    default:
      return null;
  }
}

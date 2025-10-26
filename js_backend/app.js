// Import required Node.js modules for the application
var express = require("express");
var session = require("express-session");
var Keycloak = require("keycloak-connect");
var cors = require("cors");

// Import DNS module and set default result order to prefer IPv4 addresses
var dns = require("node:dns");
dns.setDefaultResultOrder("ipv4first");

// Create an Express application instance
var app = express();

// Enable Cross-Origin Resource Sharing (CORS) for all routes
app.use(cors());

// Create a memory store for session management
var memoryStore = new session.MemoryStore();

// Configure session middleware with secret, resave, and saveUninitialized options
app.use(
  session({
    secret: "some secret",
    resave: false,
    saveUninitialized: true,
    store: memoryStore,
  }),
);

// Initialize Keycloak with the memory store for authentication
var keycloak = new Keycloak({ store: memoryStore });

// Use Keycloak middleware to handle authentication
app.use(keycloak.middleware());

app.get(
  "/role-secured",
  keycloak.protect("realm:autobot"), // only user with realm-role of autobot can access
  function (req, res) {
    res.setHeader("content-type", "text/plain");
    res.send("Autobot Secret message!");
  },
);

app.get("/secured", keycloak.protect(), function (req, res) {
  res.setHeader("content-type", "text/plain");
  res.send("Cybertron Secret message!");
});

app.get("/public", function (req, res) {
  res.setHeader("content-type", "text/plain");
  res.send("Public message!");
});

app.get("/", function (req, res) {
  res.send("Go to either /public or /secured or /role-secured");
});

// Start the server on port 3000
app.listen(3000, function () {
  console.log("Backend service started on port 3000");
});

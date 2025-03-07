const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

// Middleware to parse JSON and URL-encoded data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files if needed (for the HTML, CSS, etc.)
app.use(express.static('public'));

// Endpoint to send variables to the calculator
app.post('/send-variable', (req, res) => {
  const { value, variable } = req.body;

  if (!value || !variable) {
    return res.status(400).send('Missing value or variable');
  }

  // Your logic to send the variable to the TI-84 calculator
  console.log(`Sending value: ${value} to variable: ${variable}`);

  // For now, just send back a success response
  res.send(`Successfully sent ${value} to ${variable}`);
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

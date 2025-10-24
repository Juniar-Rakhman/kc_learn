import express from "express";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

app.use(
  "/keycloak-js",
  express.static(path.join(__dirname, "./node_modules/keycloak-js/lib")),
);

// Serve your frontend files
app.use(express.static(__dirname));

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

app.listen(8000, () => console.log("Server running at http://localhost:8000"));

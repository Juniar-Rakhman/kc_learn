import Keycloak from "/keycloak-js/keycloak.js";

const BACKEND_URL = "http://localhost:3000";

const kc = new Keycloak({
  url: "http://localhost:8080",
  realm: "cybertron",
  clientId: "myclient",
});

function output(content) {
  if (typeof content === "object") {
    content = JSON.stringify(content, null, 2);
  }
  document.getElementById("output").textContent = content;
}

function profile() {
  const tokenData = kc.idTokenParsed;
  document.getElementById("name").textContent =
    "Hello " + (tokenData.name || tokenData.preferred_username || "User");
  if (tokenData.picture) {
    document.getElementById("picture").src = tokenData.picture;
  }
  document.getElementById("user").style.display = "block";
}

function sendPrivateRequest() {
  const req = new XMLHttpRequest();
  req.onreadystatechange = function () {
    if (req.readyState === 4) {
      output(req.status + "\n\n" + req.responseText);
    }
  };
  req.open("GET", BACKEND_URL + "/secured", true);
  req.setRequestHeader("Authorization", "Bearer " + kc.token);
  req.send();
}

function sendPublicRequest() {
  const req = new XMLHttpRequest();
  req.onreadystatechange = function () {
    if (req.readyState === 4) {
      output(req.status + "\n\n" + req.responseText);
    }
  };
  req.open("GET", BACKEND_URL + "/public", true);
  req.send();
}

function sendSuperSecretRequest() {
  const req = new XMLHttpRequest();
  req.onreadystatechange = function () {
    if (req.readyState === 4) {
      output(req.status + "\n\n" + req.responseText);
    }
  };
  req.open("GET", BACKEND_URL + "/role-secured", true);
  req.setRequestHeader("Authorization", "Bearer " + kc.token);
  req.send();
}

window.addEventListener("load", () => {
  kc.init({ onLoad: "check-sso", checkLoginIframe: false })
    .then((authenticated) => {
      window.kc = kc;
      if (authenticated) {
        profile();
      } else {
        document.getElementById("anonymous").style.display = "block";
      }
    })
    .catch((err) => {
      console.error("Keycloak init failed:", err);
      document.getElementById("anonymous").style.display = "block";
    });

  document.getElementById("login-btn").onclick = () => kc.login();
  document.getElementById("logout-btn").onclick = () =>
    kc.logout({ redirectUri: window.location.origin });
  document.getElementById("id-token-btn").onclick = () =>
    output(kc.idTokenParsed);
  document.getElementById("access-token-btn").onclick = () =>
    output(kc.tokenParsed);
  document.getElementById("refresh-btn").onclick = () =>
    output(kc.refreshTokenParsed);
  document.getElementById("public-btn").onclick = () => sendPublicRequest();
  document.getElementById("private-btn").onclick = () => sendPrivateRequest();
  document.getElementById("role-btn").onclick = () => sendSuperSecretRequest();
});

const PROXY_CONFIG = [
  {
    "/api/*": { // 
      "target": "http://localhost:7246", // the target url for backend endpoint
      "secure": false,
      "logLevel": "debug",
      "changeOrigin": true
    },
    context: [
      "/api/**"
    ],
    target: "https://localhost:7246",
    secure: false
  },

]

module.exports = PROXY_CONFIG;

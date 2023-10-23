<!-- Description -->
## Description

This is a simple Node.js web app that can connect to MongoDB and count the number of website visitors.

### Installation

Install the required packages located in package.json.
  ```sh
  npm i
  ```

### Prerequisites

Environment variables needed for the app

   ```sh
   WEBport # Web app port, (optional) default: 3000
   DBuser # MongoDB user, (required) example: test
   DBpass # MongoDB pass, (required) example: test123
   DBhosts # MongoDB host(s):port(s), (required) example: "mongo-0.mongo:27017" or "mongo-0.mongo:27017,mongo-1.mongo:27000", port 27017 will be used for each host with no specified port.
   ```

<!-- USAGE EXAMPLES -->
## Usage

Start your app
  ```sh
  node index.js
  ```

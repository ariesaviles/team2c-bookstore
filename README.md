# Team2C Bookstore pre-release

<p align="center">
  <a href="https://github.com/ariesaviles/team2c-bookstore">
    <img src="src/main/webapp/images/logo.png" alt="Logo" >
  </a>

<h3 align="center">Current: Deliverable 6 out of 8</h3>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#setup-&-running">How to Run</a></li>
      </ul>
   
  </ol>
</details>

## About The Project

This text is a placeholder

### Built With

<u>Languages:</u>
* HTML
* CSS
* Java
* SQL

<u>Technologies:</u>
* Maven
* IntelliJ
* MySQL
* JavaServer Pages
* Spring Boot
    * Spring Security


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

To run, users should have [MySQL](https://dev.mysql.com/downloads/mysql/) & [Maven](https://maven.apache.org/download.cgi) installed and set up. 

### Setup & Running

1. Clone the repo
   ```sh
   git clone https://github.com/ariesaviles/team2c-bookstore.git
   ```
1. Change into the newly cloned repository.
1. Sign in to MySQL & setup the database   
   ```sh
   mysql -u root -p
   ```
    Then create the empty database (`create mydb;`) and logout (`exit`). Once logged out, call the following command to use the dumpfile:

    ```sh
   mysql -u root -p mydb < /database/Dump20210331.sql
   ```
   Check to see if mydb was properly populated by logging back into MySQL and `use mydb;` and `show tables;`
   

4. Change into the repository and setup maven with the following command
   ```sh
   mvn clean install
   ```
1. Run the localhost webapp with
   ```sh
   mvn spring-boot:run
   ```
1. The application should now be running. In your preferred browser, go to
    http://localhost:8080 to get started.

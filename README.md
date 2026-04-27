University Honors Program Management System

A full-stack web application designed to manage the University Honors Program, 
including student applications, eligibility verification, academic performance 
tracking, and selection based on merit.

This system helps departments efficiently manage honors programs
and automate the student selection process based on defined
eligibility criteria and academic performance.


## Features
# Student Features
  *Register and manage student profile
  *View available honors programs
  *Apply for honors programs
  *Track application status
  *View selection results and rank

#Department Features
  *Manage departments
  *Create and manage honors programs
  *Define eligibility criteria
  *View applicants and selection results

# Academic Performance Management
  *Track student GPA, credits, and backlogs per semester
  *Maintain academic history
  *Use performance data for eligibility and ranking

# Selection System
  *Automated merit-based selection
  *Rank students based on final score
  *Store selection results
  *Ensure fair and transparent selection process

## MySQL setup

1. Start MySQL and run the setup script:

```sql
SOURCE honors-backend/src/main/resources/db/mysql-schema-and-seed.sql;
```

Or open that file in MySQL Workbench and execute it.

2. Configure the backend database credentials. Defaults are:

```properties
DB_URL=jdbc:mysql://localhost:3306/university_honors?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
DB_USERNAME=root
DB_PASSWORD=
```

3. Run the backend from `honors-backend`:

```bash
mvn spring-boot:run
```

4. Run the frontend from `honors-frontend`:

```bash
npm start
```

The React app reads values from Spring Boot at `http://localhost:8081/api`.
Open the `DB Status` page to confirm the JDBC connection and row counts.

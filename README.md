# Python-SQL Clinic Management System

This repository contains a **Clinic Appointment Management System** developed using **Python** and **MySQL**. The project facilitates efficient patient appointment scheduling, doctor availability management, and database-driven record keeping.

## Table of Contents
- [Introduction]
- [Features]
- [Installation]
- [Usage]
- [Database Schema]
- [License]

## Introduction
This system is designed to help clinics manage their day-to-day operations, including:
- Patient registration and appointment scheduling
- Doctor availability tracking
- Database management using MySQL

The project is built using **Python** for backend logic and **MySQL** for data storage, leveraging the **PyMySQL** library for database interactions.

## Features
- **User Authentication**: Secure login for admin and staff.
- **Patient Management**: Add, update, and remove patient records.
- **Appointment Scheduling**: Book, modify, and cancel appointments.
- **Doctor Management**: Maintain doctor availability and specialties.
- **Database Integration**: Persistent storage using MySQL.

## Installation
To set up the project locally, follow these steps:

1. Clone the repository:

   git clone https://github.com/AngelosKontalis/PYTHON-SQL-CLINIC-GROUP22.git
   cd PYTHON-SQL-CLINIC-GROUP22

2. Install required dependencies:

   pip install pymysql

3. Set up the MySQL database:
   - Create a new database.
   - Execute the SQL script (`database.sql`) to create necessary tables.
   - Update database credentials in the Python script (`config.py`).

## Usage
1. Start the application:

   python main.py

2. Follow on-screen instructions to log in and manage the clinic’s operations.

## Database Schema
The MySQL database consists of multiple tables, including:
- **Patients** (ID, Name, Age, Contact, Medical History)
- **Doctors** (ID, Name, Specialty, Availability)
- **Appointments** (ID, Patient ID, Doctor ID, Date, Status)

## License
This project is open-source and available under the [MIT License]. Contributions and modifications are welcome!


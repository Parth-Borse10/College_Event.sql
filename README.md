📘 Event Management System – SQL Project

A simple and structured MySQL database project designed to manage college events, students, venues, and registrations efficiently.

⭐ Overview

This project includes:

Event creation & scheduling
Student and venue management
Categories for organizing events
Registration and attendance tracking
Clean relational design using primary/foreign keys

🧱 Database Tables

Categories
Venue
Student
Event
Registration

🛠️ How to Run

Create the database:

CREATE DATABASE CollegeEvent;
USE CollegeEvent;


Run the CollegeEvent.sql file to create all tables and insert sample data.

🔍 Sample Query
SELECT e.event_name, c.category_name, e.event_date, e.status
FROM Event e
JOIN Categories c ON e.category_id = c.category_id;

🎯 Features

✔️ Normalized database
✔️ Proper relationships (PK & FK)
✔️ Unique event registrations
✔️ Realistic college event workflow

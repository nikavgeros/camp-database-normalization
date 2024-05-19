# Database Normalization: A Practical Approach with Camp Data

## Introduction

Efficiently managing and organizing data is crucial for businesses today. Transitioning from ad hoc solutions like Excel to a robust, scalable database system is essential for growth. This project introduces database normalization, using a practical example of a company improving its reservation data management.

## What is Database Normalization?

Database normalization is the process of organizing data to reduce redundancy and improve data integrity. It involves dividing large tables into smaller, related tables while preserving the relationships between them. This project focuses on achieving up to the Third Normal Form (3NF), which is typically sufficient for most practical purposes.

## The Problem: Excel-Based Camp Data System

A company managing multiple campsites is currently using Excel spreadsheets for reservation data, leading to:

- Data redundancy and inconsistency
- Scalability issues
- Lack of data integrity and security
- Difficulty managing complex business rules

## Project Files

- `campData.txt`: The raw data file containing initial camp data.
- `initial_schema.sql`: SQL script to create the initial single table schema.
- `normalized_schema.sql`: SQL script to create the normalized tables up to 3NF.
- `data_insertion.sql`: SQL script to insert data into the normalized tables.
- `queries.sql`: SQL script containing sample queries for data analysis.

## Load the initial data

```sh
\copy campData FROM 'path_to/campData.txt' CSV HEADER;
```

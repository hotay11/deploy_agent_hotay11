#!/usr/bin/env bash
# A script responsible for setting up the whole system

# Attaining of the project name 
read -r -p "Enter project name: " project_name

PROJECT_DIR="attendance_tracker_${project_name}"

# Adding the required directories
mkdir -p "$PROJECT_DIR/Helpers"
mkdir -p "$PROJECT_DIR/reports"

echo "directories created"

# Adding the required files
cp attendance_checker.py "$PROJECT_DIR/"
cp assets.csv "$PROJECT_DIR/Helpers/"
cp config.json "$PROJECT_DIR/Helpers/"
cp reports.log "$PROJECT_DIR/reports/"

echo "Files added succesfully"

echo "Project setup complete"

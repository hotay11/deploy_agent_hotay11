#!/usr/bin/env bash
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

# setting up of attendance threshold update
read -r -p "Update thresholds? (y/n): " choice
choice=${choice,,}

if [[ "$choice" == "y" ]]; then

 read -r -p "Warning threshold (default 75): " warning
 read -r -p "Failure threshold (default 50): " failure

 warning=${warning:-75}
 failure=${failure:-50}

    if ! [[ "$warning" =~ ^[0-9]+$ && "$failure" =~ ^[0-9]+$ ]]; then
        echo "Error: thresholds must be numbers"
        exit 1
    fi

  sed -i "s/\"warning\": *[0-9]\+/\"warning\": $warning/" "$PROJECT_DIR/Helpers/config.json"
  sed -i "s/\"failure\": *[0-9]\+/\"failure\": $failure/" "$PROJECT_DIR/Helpers/config.json"

    echo "Updated successfully"

else
	echo "skipped"
fi

# Process managemnet (The trap)
Signal_handling() {
 echo ""
 echo "SIGINT detected. Saving current project state..."

  ARCHIVE_NAME="attendance_tracker_${project_name}_archive.tar.gz"

  tar -czf "$ARCHIVE_NAME" "$PROJECT_DIR"

  rm -rf "$PROJECT_DIR"

 echo "Archive created: $ARCHIVE_NAME"
 echo "Incomplete project removed"
 exit 1
}

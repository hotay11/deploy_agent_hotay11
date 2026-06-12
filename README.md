Project: Automated Project Bootstrapping & Process Management

# How to run the script
-After fully completing the script and saving it make sure it is executable by running the ( chmod +x setup_project.sh) then if it wasnt executable it will finally be executable
-Then run the script by the command (./setup_project.sh)
-It will give you a chance to enter a directory name of you licking then the directory is created in the form attendance_tracker_{directory name of your choice} and all the files are copied into the directory youve opted to create
-Then it will ask youu if you want to update attendance threshold (y/n)
-If yes, it prompts for warning and failure values, uses default values if none are provided, validates that the inputs are numeric, and updates config.json using sed.
-The script checks whether Python3 is installed using python3 --version. It displays a success message if installed or a warning if not found.

# How to trigger the archieve feature
-The script sets a trap for the SIGINT signal. If the user presses CTRL + C at any point during execution, the script automatically triggers a cleanup process. 
It creates a compressed archive named attendance_tracker_<project_name>_archive.tar.gz containing the current state of the project and then deletes the incomplete project directory to keep the workspace clean.

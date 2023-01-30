# Automate GNU / Linux command  

## ***
In Go, the os.Getenv function retrieves the value of an environment variable from the operating system's environment. The values set in the shell profile files like .bashrc or .zshrc are not directly accessible through the environment, and will not be retrieved by os.Getenv.

To make the values set in these files available to your Go program, you will need to source the file in your shell before running your program. For example, in a bash shell, you would run the following command before starting your program:

bash
Copy code
source ~/.bashrc
This will make the environment variables set in .bashrc available to your program, and you can retrieve them using os.Getenv.
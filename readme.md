# linux-infra-tools

**linux-infra-tools** is a collection of Bash scripts for managing Linux system administration tasks, including package installation and system command execution. This repository provides a simple and interactive menu-driven interface for performing these tasks. The scripts are designed to make it easier to handle common Linux infrastructure tasks efficiently.

## Usage

### Prerequisites

Before using these scripts, make sure you have the following prerequisites installed on your Linux system:

1. Bash shell
2. Standard Unix utilities (e.g., `sed`, `awk`)
3. Superuser (root) privileges for certain operations

### Getting Started

1. Clone this repository to your Linux system:

git clone https://github.com/your-username/linux-infra-tools.git
cd linux-infra-tools

2. Make the main script executable:
chmod +x main.sh

3. Execute the main script:
./main.sh


4. You will be presented with a menu-driven interface that allows you to perform various system administration tasks.

### Menu Options

- **Index Menu**: Navigate the main menu, which provides options to access other menus.

- **Packages Menu**: Install and manage packages using package names from the configuration file `packages.conf`.

- **System Menu**: Execute various system commands specified in the configuration file `system.conf`.

### Configuration

The repository includes several configuration files located in the `config/` directory:

- `index.conf`: Contains menu options and navigation instructions.
- `packages.conf`: Lists the packages that can be installed.
- `system.conf`: Specifies the system commands that can be executed.

You can customize these configuration files to add, modify, or remove options as needed.

## Contributing

Contributions to this repository are welcome. If you have ideas for improving or extending these infrastructure tools, please submit a pull request.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Disclaimer

Use these tools responsibly and with caution. Some operations may require superuser privileges and can affect the stability and security of your Linux system. It is recommended to have backups and test these scripts in a safe environment before using them in a production setting. The repository maintainers are not responsible for any issues or data loss caused by the use of these scripts.

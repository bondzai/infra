# Linux Infrastructure Toolbox
This repository provides a collection of **Bash scripts for Unix/Linux** machines. 

## Installation
1. Clone this repository
2. Make the main.sh and setup.sh executable
3. Execute the setup script

```bash
git clone https://github.com/introbond/linux-infra-toolbox.git
cd linux-infra-toolbox/cmd
chmod +x main.sh setup.sh && ./setup.sh
```

## Usage
Execute the main script
```bash
./main.sh
```

You will be presented with a menu-driven interface that allows you to perform various tasks like this.
```bash
 === Linux Infrastructure Toolbox === 
 USER: jb 
 MACHINE: jamesbond 
 OS: Linux Mint 21.1 
 TIME ZONE: Asia/Bangkok 
 ABOUT ME: https://thejb.onrender.com 
 ==================================== 

 MAIN MENU:
 ------------------------------------
 [1]  |  System tools
 [2]  |  Network tools
 [3]  |  Package Installers
 [99] |  Exit
 ------------------------------------
 Enter your choice:
```
You can customize these configuration files to add, modify, or remove options as needed.

## Contributing
Contributions to this repository are welcome. If you have ideas for improving or extending these infrastructure tools, please submit a pull request.

## License
This repository is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for more details.

## Disclaimer
Use these tools responsibly and with caution. Some operations may require superuser privileges and can affect the stability and security of your Linux system. It is recommended to have backups and test these scripts in a safe environment before using them in a production setting. The repository maintainers are not responsible for any issues or data loss caused by the use of these scripts.

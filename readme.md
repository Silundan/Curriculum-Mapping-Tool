# In-house Curriculum Mapping Tool

## About this project

This is a web application serving the purpose of easily managemant and planning of degrees and courses for course coordinators.
This project is designed for internal use only.
Users can add, delete, and edit the contents and relations of the degrees availabled and assoicated courses.
We implimented a sand-box mode (study plan planner) with exporting the study plan to a PDF for easy sharing or future reference.

## Preparation

Deploying the web application is quick and easy, provided you have installed the required softwares/frameworks.
This application is builded with NPM and Node.js, also using MySQL (or MariaDB on linux) as the database backend.

## Installing NPM & Node.js

You can acquire the installer of Node.js [here](https://nodejs.org/en/download). Installation on Windows is quite straightforward -- just execute the binary and follow the prompts. For Linux & OSX users, you can consider using nvm for version management, which can be acquired [here](https://github.com/nvm-sh/nvm), and instruction for installation [here](https://github.com/nvm-sh/nvm#installing-and-updating).

## Installing MySQL (or MariaDB)

On Linux machines, you can install the package `mysql-server` from your platform's package managers. On our development environment, we built the database on MySQL 8.0.34. The following instructions are based on Debian variant distros, and using `apt` as package manager.

To install the server package, you can use the following command in your terminal:-

```text
sudo apt install mysql-server
```

You can verify your installation with the following command:-

```text
mysql --version
```

After the installation of the server, you can start the initialisation process with the following command:-

```text
sudo mysql_secure_installation
```

We recommended you provide a strong password on production server.
After that you can start using the SQL server with the following command:-

```text
mysql -u root -p
```

and type your newly setup password.

## Setting up MySQL user for deployment

### Setting up a user

In the following commands, we are using the setting on development server for quick testing purpose, we ***recommend you pick a unique username and password combination*** for security reasons at deployment of production version.

Default user for the database:-

 | catagory | value |
 |:---:|:---:|
 | username | admin |
 | password | 12345678 |

```sql
CREATE USER 'admin'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345678';
```

The prepared database included table and database creation, so you can import it right away. (Located in ../\_DATABASE_/ in this archive).
To import the prepared database:-

```sql
source <full_path_to_the_*.sql_file>
```

You can follow the guide [from DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql) should you require more details.

## Deploying the web application

After you set up the environment, you can extract the archive and start using the application.

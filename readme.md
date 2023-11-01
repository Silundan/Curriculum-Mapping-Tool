# In-house Curriculum Mapping Tool

## Table of content

1. [About this project](#about-this-project)
2. [Preparation](#preparation)
3. [Setting up MySQL user for deployment](#setting-up-mysql-user-for-deployment)
4. [Deploying the web application](#deploying-the-web-application)
5. [File structure of the web application](#file-structure-of-the-web-application)
6. [License](#license)

## About this project

This is a web application serving the purpose of easily managemant and planning of degrees and courses for course coordinators.
This project is designed for internal use only.
Users can add, delete, and edit the contents and relations of the degrees availabled and assoicated courses.
We implimented a sand-box mode (study plan planner) with exporting the study plan to a PDF for easy sharing or future reference.

---

## Preparation

Deploying the web application is quick and easy, provided you have installed the required softwares/frameworks.
This application is builded with NPM and Node.js, also using MySQL (or MariaDB on linux) as the database backend.

### Installing NPM & Node.js

You can acquire the installer of Node.js [here](https://nodejs.org/en/download). Installation on Windows is quite straightforward -- just execute the binary and follow the prompts. For Linux & OSX users, you can consider using nvm for version management, which can be acquired [here](https://github.com/nvm-sh/nvm), and instruction for installation [here](https://github.com/nvm-sh/nvm#installing-and-updating).

### Installing MySQL (or MariaDB)

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

---

## Setting up MySQL user for deployment

### Setting up a user

In the following commands, we are using the setting on development server for quick testing purpose, we ***recommend you pick a unique username and password combination*** for security reasons at deployment of production version.

Default user for the database:-

 | username | password |
 |:---:|:---:|
 | admin | 12345678 |

```sql
CREATE USER 'admin'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345678';
FLUSH PRIVILEGES;
```

The prepared database included table and database creation, so you can import it right away. (Located in ../\_DATABASE_/ in this archive).
To import the prepared database:-

```sql
source <full_path_to_the_*.sql_file>
```

After that, you can grant the user `admin` the control of the database `adelaide_dev`:-

```sql
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES on adelaide_dev.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

---

## Deploying the web application

After you set up the environment, you can open a terminal to the root folder and start using the application.

### First time setup

For module installation, please run the command once before your first start up of the application:-

```text
npm i
```

After that you can start the server with the following command:-

```text
npm start
```

By default the server is listening on port 9000 on localhost. [http://localhost:9000](http://localhost:9000).

---

## File structure of the web application

```text
/
+-- _DATABASE_
    ... database related files ...
+-- public
    ... everything accessible on client side will be placed here ...
    +-- css
        ... style sheets ...
    +-- images
        ... images ...
    +-- javascripts
        ... javascripts FOR CLIENT SIDE ...
    +-- users
        ... place holder for contents accessible by logged in users only ...
+-- routes
    ... javascript setting files for the SERVER side ...
    ... these files are not accessible from the client side and solely for server configuration ...
+-- views
    ... pre-install debugging templates, recommended to be removed on production version...
```

Should you wanted to change the database connection information and/or listening port for the application, you may change that in `./server.js`.

---

## License

This web application is distributed with MIT License.

``` text
Copyright (c) 2023 Denis Li, Michael Ma, Nick Xu, Edison Deng.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

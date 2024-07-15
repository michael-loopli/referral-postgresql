## Referral Application

### Frontend

-   cd into 'referral-app'
-   install node-modules with command <code>npm install</code>

### Backend 

open the 'main.go' file and change the credentials for your Postgres application

current credential are:

-   user: postgres
-   password: postgres

save the file.

### Database

type of database is a Posgresql

dbname: dbtest3

a backup of the db is included here 'dbtest3_bak' ; install this in your system, and open it with Postgresql

dummy user data is inclued in the 'user-data.txt' file

### Run the Application

have two terminal instances open

-   run backend server in one terminal window: command <code>go run main.go</code>

-   run frontend server in the other terminal window. cd into 'referral-app' , run the command <code>npm start</code>

notifications within each terminal window will show both servers successfully running.

a browser window will open on port: 3000

login with the super user admin credentials




## 67-373 Information Systems Consulting Project:QCRI Research Library



##### **Pre-requisites:**

- Ruby 3.1.2
- PostgreSQL 14.5

##### **Cloning the directory:**

In your terminal, navigate to the desired installation path, then run:

`git clone https://github.com/67-373-QCRI/QCRI-Research-Library.git`

***
**Developer Documentation**

> The setup will assume you are using the default configuration in **config/database.yml**. If you wish to have a different configuration, change the **database.yml** file to suit your preferences and adjust the following steps accordingly. 

- A new role named "qcri" must be created with permissions to login and create/delete databases. If the role is secured by a password, the password must be "qcri-ruby" (it is recommended to change this).

     > We recommend the using pgAdmin4 to configure your Postgres

- Run the following commands in the terminal after navigating to your local repository's path:
    ```
    bundle install
    rake db:create
    rake db:migrate
    rails server -e development
    ```
    If you wish to seed the database, you can run `rake db:seed`. The seed file can be found in **db/seed.rb**.
    
- If any changes are made to existing migrations, you must run the `rake db:migrate:reset` command. Note that this will also seed the database automatically. Alternatively, you can run the following commands to avoid seeding the database:
    ```
    rake db:drop
    rake db:create
    rake db:migrate
    ```

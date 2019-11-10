# URL Shorter

This is a Rails + Vuejs project that helps you to short any valid url.

To run this project:

** With Docker:
1 - install Docker on your OS as [Install Documentation](https://docs.docker.com/install/)
2 - Install Docker Compose as well [Docker compose documentation](https://docs.docker.com/compose/install/)
3 - Run `docker-compose up`
4 - Access on your browser: `http://localhost:3000/`

** Without Docker:
1 - Run the base Rails commands to setup the project: `bundle install`, `rails db:setup db:seed`
2 - Run `rails -s` to start the project
3 - In a second terminal tab run `./bin/webpack-dev-server`
4 - Access on browser: `http://localhost:3000/`

** Using the features:
To Use the system just paste a valid url on input and click submit, it will generate a short url, also will update the table to show 
the top 100 most sortened websites.

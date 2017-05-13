# Cookit 
## Share, store and discover Grandma's perfected recipes.

Cookit is a Ruby on Rails application that allows members to preserve cherished family recipes, discover new ones and 
collaborate with other members. 

This app is deployed on Heroku: https://cookit-grandmasrecipes.herokuapp.com/

The source code is available, here, on github: https://github.com/bethios/Cookit

## Features
- Users can sign up for an account and view their activity (recipes, comments and favorites).
- Users can view, edit and create recipes using markdown syntax (via the RedCarpet gem). 
- Users can add photos of their dishes, grandma or process photos. 
- Users can comment on recipes with their versions, opinions and insights.
- Users can mark recipes as favorites to get notified of new comments or changes to the recipe. 
- Admins can alter or delete any recipe or dish. 

## Setup and Configuration
**Ruby v. 2.3.3**
**Rails v. 4.2.8**
**Databases:** SQLite (Test, Development), PostgreSQL (Production)

**Gems Used:** 
- Factory Girl, Development
- Bootstrap, styling
- Bcrypt, data encryption
- Figaro, environmental variables
- RedCarpet, Markdown syntax
- Rspec, TDD
- Capybara, testing

**Set-up:**
- Environmental variables were secured using Figaro and are stored in config/application.yml (ignored by github)
- The config/application.example.yml illustrates the formatting for environmental variables.

**To run Cookit locally:**
- Clone the repository
- Run bundle install
- Create and migrate the SQLite database with rake db:create and rake db:migrate
- Start the server using rails s
- Run the app on localhost:3000

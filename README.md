# External Ruby Camp
## Summary
### Flight Searcher App

### Technologies to use
### Backend
  - **Language**: Ruby
  - **Framework**: Rails
  - **Database**: Postgres

### Frontend
  - **Language**: Javascript
  - **Framework**: React
  - **Framework**: FlowType
  - **UI**: BulmaIO

### Scenario to choose
1. You are building a flight search web application where you need to connect to a third party JSON service to retrieve airport codes & names and their availability.

2. Your application will work as a middle tier and cache some information in the sense that will persist data that is not very likely to change in a short/med period (like airport codes). This information can be saved in database or using a Non Relational Database (NRDMS).

### Scope of this is:
1. To be able to search for flight availability
2. retrieve airport codes and names
3. build backend JSON rest services
4. build Frontend controllers and map model using React

### Out of scope:
1. Bookings

### Expected Results
I should be able to search for a location and the start / end dates of my trip.

The application should display real flight availability, you choose how (grouped vs non grouped, high vs low price etc).

#### Sources
[Airport Database](https://github.com/jpatokal/openflights)

## Development
### Setup
1. Install postgres
  - Mac: `$ brew install postgres`
  - Linux: `$ apt-get install postgresql`

2. Install Ruby using (rvm)
  - `$ rvm install 2.7.2`

3. Install Bundler
  - `$ gem install bundler`

4. Install project gems
  - Go to your project root folder
  - Execute `$ bundle install`

5. Create DB
  - `$ rails db:create`
    **Note**: For this you might notice that this project contains `database.yml`, if you have problems connecting to postgres add the following:
    ```
    host: {Your hostname} # I.E. localhost
    port: {Your port} # I.E. 5432
    username: {Your DB username} # I.E. postgres
    ```
    **Note**: Maybe in the future this could be change to use .env file
### Run App
1. Create DB -> `$ rails db:create` 
2. Migrate DB -> `$ rails db:migrate` 
3. Create default app state -> `$ rails db_seeds:load_airports`
   - For tests run: `$ rails db_seeds:load_airports RAILS_ENV='test'`
4. Install dependencies -> `$ bundle install && rails server`

### Endpoints
- Airports: 
  a) City `/api/v1/airports?search={city}`
  b) Iata `/api/v1/airports?search={city}`
  b) Country `/api/v1/airports?search={city}`
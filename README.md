# External Ruby Camp
## Flight Searcher App

## Technologies to use
### Backend
  - **Language**: Ruby
  - **Framework**: Rails
  - **Database**: Postgres

### Frontend
  - **Language**: Javascript
  - **Framework**: React
  - **Framework**: FlowType
  - **UI**: BulmaIO

## Scenario to choose
1) You are building a flight search web application where you need to connect to a third party JSON service to retrieve airport codes & names and their availability.

2) Your application will work as a middle tier and cache some information in the sense that will persist data that is not very likely to change in a short/med period (like airport codes). This information can be saved in database or using a Non Relational Database (NRDMS).

## Scope of this is:
1) To be able to search for flight availability
2) retrieve airport codes and names
3) build backend JSON rest services
4) build Frontend controllers and map model using React

## Out of scope:
1) Bookings

## Expected Results
I should be able to search for a location and the start / end dates of my trip.

The application should display real flight availability, you choose how (grouped vs non grouped, high vs low price etc).

### Sources
[Airport Database](https://github.com/jpatokal/openflights)

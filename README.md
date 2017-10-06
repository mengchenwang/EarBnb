# Earbnb
============================

At the beginning of the week, our cohort were tasked with working in teams to build copies of Airbnb. We were free to use any programming language we desired in order to complete the task. Our group, Byte 1, decided to stick with languages we had spent time learning (Ruby, HTML, CSS and a bit of JavaScript) to ensure that we could focus on one of the main goals of the week "work as part of a team to build a web app".

## User Stories

As a property owner,
So I can rent my property,
I would like to list my property.

As a renter,
So I can rent a property,
I would like to view a list of available properties.

As a property owner,
So I can un-list a property,
I would like to remove my property listing.

As a user,
So I can rent a property,
I would like to sign up to EarBnb.

As a user,
So I can use EarBnb,
I would like to log in to the website.

As a user,
So I can protect my account,
I would like to be able to log out of EarBnb.

As a renter,
So I can communicate with property owners,
I would like to be able to message a property owner.

As a property owner,
So I can communicate with renters,
I would like to reply to messages.

## Getting Started

### Prerequisites
To setup a localhost:
```
$ Clone the repo
$ brew install imagemagick
$ Run bundle
$ create earbnb_development and earbnb_test database with PSQL
$ rake db:auto_migrate
$ rake db:auto_migrate RACK_ENV=test
$ rspec
$ rackup
```

## Running the tests
RSpec - using the command line, navigate to the root folder using the command line and type 'rspec' to run the feature tests.
The feature tests test for the following scenarios:
- Creating properties
- Clicking on property
- Conversation
- Creating properties
- Upload photos for property
- Delete property
- User sign in
- User signs out
- User sign up
- Viewing properties
- User

## Deployment
The web app for EarBnb app is on the following url:
https://earbnb.herokuapp.com/

## Built with
- Sinatra: Ruby framework
- Ruby: Programming language
- HTML & CSS: Styling
- RSpec/ Capybara: For unit and feature testing
- DataMapper: ORM
- Database Cleaner: To clear the databases before/after each test
- Rake: Rakefile made with database upgrade/migrate options
- BCrypt: For user password encryption
- Sinatra-Flash: For displaying notices/errors to users
- Waffle.io: Used during development of the app to monitor GitHub issues

## Authors

Nero, Keith, Marcus, Mengchen

## Acknowledgements
AirBnb

## Notes
### Challenges
We began our project by agreeing to have regular stand ups (every morning and afternoon) to ensure that we all knew what was going on at all times. Though our afternoon stand ups became more conversations at the end of the day by our desks we maintained a high level on contact throughout the week. Our smooth planning and focus on an MVC underpinned our whole project however git and GitHub issues soon slowed us all down in the middle of the week. Though we did not have time to implement all our desired features (a booking system is lacking) we throughly tested our project (no less than 26 tests) to ensure a TDD approach to the task at hand.

### Extra features
Features we would have liked to have implemented:

- Booking function - Ideally, this would have involved selecting the dates for a booking and making sure that these don't conflict with other bookings
- Google maps API - so potential renters can see the location of EarBnb properties
- Visuals - we would have liked to spend more time making the site more visually appealing

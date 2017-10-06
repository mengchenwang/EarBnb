# Earbnb
============================

At the beginning of the week, our cohort were tasked with working in teams to build copies of Airbnb. We were free to use any programming language we desired in order to complete the task. Our group, Byte 1, decided to stick with languages we had spent time learning (Ruby, HTML, CSS and a bit of JavaScript) to ensure that we could focus on one of the main goals of the week "work as part of a team to build a web app".

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

## Build with
- Sinatra: The web framework used
- Ruby: Programming language
- HTML & CSS: Styling


## Authors

Nero, Keith, Marcus, Mengchen

## Acknowledgements
AirBnb

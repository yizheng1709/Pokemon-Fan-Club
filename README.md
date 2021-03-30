# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Pokeman Fan Club

The greatest joy for any Pokémon fan is being able to plan all of my dream teams!

The homepage allows the user to signup or login through the web application's authentication and database or through GitHub's authentication system.

![Alt text](app/assets/images/readme01.gif?raw=true "Home Page")

There is a list of Pokémon movie summaries available for the user to browse through. 

![Alt text](app/assets/images/readme02.gif?raw=true "Movies")

Users can create their dream teams and give nicknames to their Pokémon.

![Alt text](app/assets/images/readme03.gif?raw=true "Teams")


### Prerequisites

This little web application was mainly written with the Ruby language and uses several gems. The Installing section will show you how to install this gem! 

### Installing
    
Copy the code of this repo.

In your terminal:

    git clone <github-repo-code>

Go to the first level directory that contains all of MyLife's folders. 

    bundle install #this will install any necessary gems

Then,

    rails db:seed #this will load all of the Pokemon's data. This might take a few minutes as there is a lot of data.

Finally go to http://localhost:3000/. 

Enjoy!

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code
of conduct, and the process for submitting pull requests to us.


## Authors
 - [Eva Yi Zheng](https://github.com/yizheng1709)

## License

This project is licensed under the [CC0 1.0 Universal](LICENSE.md)
Creative Commons License - see the [LICENSE.md](LICENSE.md) file for details


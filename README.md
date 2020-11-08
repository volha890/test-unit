# Selenium WebDriver Ruby

## To get set up:

 - install rvm
   `\curl -sSL https://get.rvm.io | bash -s stable --ruby`
 - reload rvm
   `source ~/.rvm/scripts/rvm`
 - install latest version of Ruby
   `rvm install 2.7.2`
 - Download Selenium client webDriver language bindings for Ruby
    http://rubygems.org/gems/selenium-webdriver
 
 - enter gem to Gemfile
    `gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'`
 - install bundler
   `gem install bundler`
 - run bundle, which will install gems from Gemfile
   `bundle install`
 - Rspec as assertion library by entering it to Gemfile
   `gem 'rspec', '~> 3.4'`
 - install Rspec
   `bundle install`
 - enter rubocop to Gemfile it is Ruby code style checking tool
    `gem 'rubocop', '~> 0.39.0'`
 - install rubocop
    `bundle install`
 - run rubocop and auto-fix
   `rubocop --auto-correct-all`
 

    
## Running test:
 - navigate to specs directory
    `cd specs`
 - enter command to run test and see test description
    `rspec feedback_collection_test.rb --format documentation`
    
 - output of the test run
 ```
 Feedback collection
  when on the page
    should render The Knotch Unit correctly
    when in the iframe
      should render 5 user response options
      should display the correct messaging based on the user positive response
      should display the correct messaging based on the user negative response
      should display the correct messaging based on the user extremely positive response

Finished in 10.94 seconds (files took 1.25 seconds to load)
5 examples, 0 failures
```

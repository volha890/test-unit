# Selenium WebDriver Ruby 
[![CircleCI](https://circleci.com/gh/volha890/test-unit.svg?style=svg&circle-token=cd7fa37242c81cdb2653eff3b1f58083758472a6)](https://app.circleci.com/pipelines/github/volha890)



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
 - download chromedriver for your operating system and make it discoverable in the PATH
   
   <ul>
<li>https://chromedriver.storage.googleapis.com/index.html?path=86.0.4240.22/</li>
<li>echo $PATH</li>
<li>export PATH=$PATH:~/Downloads/</li>
<li>echo $PATH</li>
</ul>
   
 

    
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
## Running tests in CircleCI
Any change will trigger CircleCI test run, `.circleci/config.yml` contains all steps to run tests. 
CircleCI status can be checked by clicking on the badge below README header. https://app.circleci.com/pipelines/github/volha890/knotch-test





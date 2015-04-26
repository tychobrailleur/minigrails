# Build

First, package the application using maven:

    mvn package

Download dependencies:

    bundle exec buildr artifacts

Then, package the gem:

    gem build minigrails.gemspec

The gem can then be installed:

    gem install minigrails

# Usage

- `create-app` creates an application
- `run-app` runs the application.

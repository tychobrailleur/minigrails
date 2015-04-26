# Build

First, compile java classes with Buildr:

    bundle exec buildr compile package

Then, package the gem:

    gem build minigrails.gemspec

The gem can then be installed:

    gem install minigrails

# Usage

- `create-app` creates an application
- `run-app` runs the application.

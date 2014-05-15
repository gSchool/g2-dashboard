g2-dashboard
============

[![Build Status](https://travis-ci.org/gSchool/g2-dashboard.svg?branch=master)](https://travis-ci.org/gSchool/g2-dashboard)

# Dashboard

## Background
Dashboard is an app for viewing and calculating statistics about data you submit.
You can sign up and interact with Dashboard through our website.
Through the api you can submit data and pull statistics.


## Important Links

* [Tracker](https://www.pivotaltracker.com/n/projects/1079694)
* [Staging](http://g2-dashboard-staging.herokuapp.com/)

## Setup

Please follow the steps below to get this site set up for local development.

1. Clone this repo
1. `$bundle` to install gems
1. `$rake db:create` to create your test and development databases
1. `$rake db:migrate` to migrate your test and development databases
1. `$rspec` to run tests
1. `$rails s` to start local server (`$rails s -p #` to specify port)
1. in browser visit `localhost:3000` (or specified port) to view local server

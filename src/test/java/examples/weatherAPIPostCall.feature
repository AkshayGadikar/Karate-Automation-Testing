@ignore
Feature: Weather Stations API 3.0 Post call

Scenario:

# this call is declared as generic post call...and used in feature.call
Given url stationUrlBase
And path 'stations'
And param APPID = appid
And request {"external_id": '#(external_id)',"name": '#(name)'}
When method post
Then status 201
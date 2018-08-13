Feature: Testing Historical Weather API using Karate

Scenario: Verify weather API is Up when all parameters are correct

Given url 'https://api.openweathermap.org/data/2.5/forecast?id=1283240&APPID=c3d20f18a9b8738b81c9f1c15af82d8d'
When method get
Then status 200
And match response ==
"""
{"cod": "200","message": "#ignore", "cnt": 40, "list":"#ignore","city":{"id": 1283240,"name": "Kathmandu",
"coord":{"lat": 27.7167,"lon": 85.3167},"country": "NP"}
}
"""

* def id = response.city.id
* print 'created id is: ' + id


Scenario: API should return error message when City-id is not correct

Given url 'https://api.openweathermap.org/data/2.5/forecast?id=1283&APPID=c3d20f18a9b8738b81c9f1c15af82d8d'
When method get
Then status 404
And match response.message == 'city not found'

Scenario: API should return error message when API-ID is not correct

Given url 'https://api.openweathermap.org/data/2.5/forecast?id=1283240&APPID=c3d20f18a9b8738b81c9f1c15af82d'
When method get
Then status 401
And match response.message == 'Invalid API key. Please see http://openweathermap.org/faq#error401 for more info.'


Scenario: API should return error message when City-id is missing

Given url 'https://api.openweathermap.org/data/2.5/forecast?APPID=c3d20f18a9b8738b81c9f1c15af82d8d'
When method get
Then status 400
And match response.message == 'Nothing to geocode'
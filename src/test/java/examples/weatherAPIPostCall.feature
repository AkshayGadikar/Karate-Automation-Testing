Feature: Weather Stations API 3.0 creation using dynamic parameters

Background:
* url stationUrlBase

Scenario:Test creating weather station

    * def stationData =
    """
    {
        "external_id": "SF_TEST001",
        "name": "San Francisco Test Station",
        "latitude": 37.76,
        "longitude": -122.43,
        "altitude": 150
    }
    """

    Given path 'stations'
    And param APPID = appid
    And request stationData
    When method post
    Then status 201

    * def stationId = response.ID

    Given path 'stations', stationId
    And param APPID = appid
    When method get
    Then status 200
    And match response.name = 'San Francisco Test Station'

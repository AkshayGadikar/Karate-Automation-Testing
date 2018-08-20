Feature: Weather Stations API 3.0 creation using dynamic parameters

Background:
* url stationUrlBase

Scenario Outline: Create stations and test using dynamic parameters
    * def stationData=
    """
    {
        "external_id": '<external_id>',
        "name": '<name>',
        "latitude": '<latitude>',
        "longitude": '<longitude>',
        "altitude": '<altitude>'
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
    And match response.name = stationData.name
    And match response.latitude = stationData.latitude
    And match response.longitude = stationData.longitude
    And match response.altitude = stationData.altitude

    Given path 'stations', stationId
    And param APPID = appid
    When method delete
    Then status 204
  Examples:
    | external_id   | name                | latitude | longitude | altitude |
    | 'station1'    | 'station created_1' | 37.22    |     67.89 | 100      |
    | 'station2'    | 'station created_2' | 37.98    |     98.76 | 200      |
    | 'station3'    | 'station created_3' | 56.66    |     54.54 | 300      |



Feature:Weather Stations feature-ca

Background:
* url stationUrlBase

Scenario: Using feature.call and Regex
    # call to 'weatherAPIPostCall'
    * def result = call read('weatherAPIPostCall.feature') {"external_id": "S1","name": "Test_Station_1"}
    * def stationID1 = result.response.ID
    * match result.response.name == 'Test_Station_1'

    * def result = call read('weatherAPIPostCall.feature') {"external_id": "S2","name": "Test_Station_2"}
    * def stationID2 = result.response.ID
    * match result.response.name == 'Test_Station_2'

    Given path 'stations'
    And param APPID = appid
    When method get
    Then status 200
    And match response == '#array'
    And match response[0].id == '#regex [A-Za-z0-9]{24}'
    And match response[0].id == '#notnull'
    And match response[0].rank == '#number'

    Given path 'stations', stationID1
    And param APPID = appid
    When method delete
    Then status 204

    Given path 'stations', stationID2
    And param APPID = appid
    When method delete
    Then status 204

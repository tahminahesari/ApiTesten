*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}=    https://videogamedb.uk:443

*** Test Cases ***
TC01 Return all the video games (GET)
    Create Session  mysession  ${base_url}
    ${response}=  GET On Session  mysession  /api/v2/videogame
    Log To Console  ${response.status_code}
    Log To Console  ${response.content}

    #Validaties
    ${status_code}=  Convert To String  ${response.status_code}
    Should Be Equal  ${status_code}  200

TC02 Add a new video game to the list (POST)
    Create Session  mysession  ${base_url}
    ${body}=  Create Dictionary  category=Platform  name=Donkey Kong  rating=Universal  releaseDate=1983-09-20  reviewScore=60
    ${headers}=  Create Dictionary  Content-Type=application/json
    ${response}=  POST On Session  mysession  /api/v2/videogame  json=${body}  headers=${headers}
    Log To Console  ${response.status_code}
    Log To Console  ${response.content}







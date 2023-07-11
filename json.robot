*** Settings ***
Library  JSONLibrary
Library  io
Library  Collections
Library  RequestsLibrary

*** Test Cases ***
TC01 Validate JSON File
    ${json_obj}=  Load Json From File    C:/Users/thesari/PycharmProjects/testdata.json
    ${name_value}=  Get Value From Json    ${json_obj}    $.firstName
    Log To Console    ${name_value[0]}

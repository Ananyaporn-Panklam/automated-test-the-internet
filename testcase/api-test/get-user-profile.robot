*** Settings ***
Library    RequestsLibrary
Resource    ../../keywords/get-user-profile.resource

*** Variables ***
${base_url}    https://reqres.in/api/users
${expected_email}    rachel.howell@reqres.in
${expected_first_name}    Rachel
${expected_last_name}    Howell
${expected_avatar}    https://reqres.in/img/faces/12-image.jpg
${expected_id}    12

*** Test Cases ***
TC-001 Get user profile success
    [Documentation]    To verify get user profile api will return correct data when trying to get profile of existing user.
    Call Get User Profile    ${base_url}    /12
    Verify Response Body Is Correct - 200 Success

TC-002 Get user profile but user not found
    [Documentation]    To verify get user profile api will return 404 not found when trying to get exist profile of not existing user.
    Call Get User Profile    ${base_url}    /1234  
    Verify Response Body Is Correct - Not Found  
    Verify Body Is Empty

*** Keywords ***

Call Get User Profile
    [Arguments]    ${url}    ${path}
    ${response} =    GET    ${url}${path}    expected_status=any
    ${response_status_code}    Set Variable    ${response.status_code}
    Set Test Variable    ${response}
    Set Test Variable    ${response_status_code}

    Run Keyword If    '${response_status_code}' == '200'
        ...    Set Variables For 200 Status Code    ${response}

Set Variables For 200 Status Code
    [Arguments]    ${response}
    ${response_id}        Set Variable    ${response.json()['data']['id']}
    ${response_email}     Set Variable    ${response.json()['data']['email']}
    ${response_first_name}    Set Variable    ${response.json()['data']['first_name']}
    ${response_last_name}     Set Variable    ${response.json()['data']['last_name']}
    ${response_avatar}    Set Variable    ${response.json()['data']['avatar']}
    
    Set Suite Variable    ${response_id} 
    Set Suite Variable    ${response_email} 
    Set Suite Variable    ${response_first_name}
    Set Suite Variable    ${response_last_name}
    Set Suite Variable    ${response_avatar}

Verify Body Is Empty
    ${get_response}    Set Variable    ${response.content.decode('utf-8')}
    Should Be Equal    ${get_response}     {}

Verify Response Body Is Correct - 200 Success
    Verify ID Is Correct    ${response_id}    ${expected_id}
    Verify Email Is Correct    ${response_email}    ${expected_email}
    Verify first Name Is Correct    ${response_first_name}    ${expected_first_name}
    Verify Last Name Is Correct    ${response_last_name}    ${expected_last_name}
    Verify Avatar Is Correct     ${response_avatar}    ${expected_avatar}
    Verify Status Is Success    ${response_status_code}    200

Verify Response Body Is Correct - Not Found
    Verify Status Is Not Found    ${response_status_code}     404
    
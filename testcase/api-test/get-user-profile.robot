*** Settings ***
Library    RequestsLibrary
Resource    ../../keywords/ger-user-profile.resource

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
    Verify ID Is Correct    
    Verify Email Is Correct    
    Verify first Name Is Correct    
    Verify Last Name Is Correct    
    Verify Avatar Is Correct    
    Verify Status Is Success   

TC-002 Get user profile but user not found
    [Documentation]    To verify get user profile api will return 404 not found when trying to get exist profile of not existing user.
    Call Get User Profile    ${base_url}    /1234  
    Verify Status Is Not Found    
    Verify Body Is Empty

*** Keywords ***

Call Get User Profile
    [Arguments]    ${url}    ${path}
    ${response} =    GET    ${url}${path}    expected_status=any
    ${response_status_code}    Set Variable    ${response.status_code}
    Set Test Variable    ${response}
    Set Test Variable    ${response_status_code}

    Run Keyword And Continue On Failure    Run Keyword If    '${response_status_code}' == '200'
        ...    Set Variables For 200 Status Code    

Set Variables For 200 Status Code
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
**Settings***
Documentation    This is an automation script by using Robot Framework following test cases in login feature
Library    SeleniumLibrary    screenshot_root_directory=${None}
Suite Setup    Open Browser    about:blank    chrome    
Suite Teardown    Close All Browsers
Resource    ../../xpath-variable/login-xpath.resource
Resource    ../../datatest/login.resource
Resource    ../../keywords/login.resource

***Variables***
${base_url}    https://the-internet.herokuapp.com/
${expected_text_login_page}    Login Page
${expected_text_login_success}    You logged into a secure area!
${expected_text_login_invalid_password}    Your password is invalid!
${expected_text_login_invalid_username}    Your username is invalid!
${expected_text_logout_success}    You logged out of the secure area!

***Test Cases***
TC-001 Login success    
    [Documentation]    To verify that a user can login successfully when they put a correct username and password.
    Go to login page
    Verify Title Login Page    
    Input Username    ${correct_username}
    Input Password    ${correct_password}
    Click Login Button
    Verify Message After Login Success
    Click Logout Button
    Verify Message After Logout Success

TC-002 Login failed - Password incorrect
    [Documentation]     To verify that a user can login unsuccessfully when they put a correct username but wrong password.
    Go to login page
    Verify Title Login Page  
    Input Username   ${correct_username}
    Input Password    ${incorrect_password}
    Click Login Button
    Verify Message After Login Unsuccess - Password Is Invalid

TC-003 Login failed - Username not found
    [Documentation]    To verify that a user can login unsuccessfully when they put a username that did not exist.
    Go to login page
    Verify Title Login Page  
    Input Username    ${incorrect_username}
    Input Password    ${correct_password}
    Click Login Button
    Verify Message After Login Unsuccess - Username Is Invalid
    
***Keywords***
Go to login page
    Go To Page   ${base_url}/login    

Verify Title Login Page
    Verify Title Page    ${text_login_page_xpath}    ${expected_text_login_page}

Input Username
    [Arguments]    ${input_username}
    Fill Text    ${input_username_xpath}    ${input_username}

Input Password
    [Arguments]    ${input_password}
    Fill Text    ${input_password_xpath}    ${input_password}
    
Click Login Button
    Click The Button    ${button_login_xpath}
    
Verify Message After Login Success
    Verify Message    ${text_login_success_xpath}    ${expected_text_login_success} 

Verify Message After Login Unsuccess - Password Is Invalid
    Verify Message    ${text_login_unsuccess_xpath}    ${expected_text_login_invalid_password}

Verify Message After Login Unsuccess - Username Is Invalid
    Verify Message    ${text_login_unsuccess_xpath}    ${expected_text_login_invalid_username}

Click Logout Button
    Click The Element    ${button_logout_xpath}

Verify Message After Logout Success
    Verify Message    ${text_logout_success_xpath}    ${expected_text_logout_success}


            
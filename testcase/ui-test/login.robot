**Settings***
Documentation    This is an automation script by using Robot Framework following test cases in login feature
Library    SeleniumLibrary    screenshot_root_directory=${None}
Suite Setup    Open Browser    about:blank    headlesschrome    
Suite Teardown    Close All Browsers

***Variables***
${base_url}    https://the-internet.herokuapp.com/
${text_title_page}    The Internet
${text_login_page}    Login Page
${username}    tomsmith
${password}    SuperSecretPassword!
${incorrect_password}    Password!
${incorrect_username}    tomholland

${text_login_page_xpath}    //*[@id="content"]//h2
${input_username_xpath}    //input[@id="username"]
${input_password_xpath}    //input[@id="password"]
${button_login_xpath}    //*[@id="login"]/button
${text_login_success_xpath}    //div[@id='flash' and contains(@class, 'flash success')]
${text_login_unsuccess_xpath}    //div[@id='flash-messages']//div[@id='flash' and contains(@class, 'flash error')]
${button_logout_xpath}    //a[contains(@class, 'button secondary radius') and contains(@href, '/logout')]
${text_logout_success_xpath}    //div[@id='flash-messages']//div[@id='flash' and contains(@class, 'flash success')] 

${expected_text_login_success}    You logged into a secure area!
${expected_text_login_invalid_password}    Your password is invalid!
${expected_text_login_invalid_username}    Your username is invalid!
${expected_text_logout_success}    You logged out of the secure area!

***Test Cases***
TC-001 Login success    
    [Documentation]    To verify that a user can login successfully when they put a correct username and password.
    Go to login page
    Verify title login page    ${text_title_page} 
    verrify login page    ${text_login_page}
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button
    Verify Message After Login Success
    Click Logout Button
    Verify Message After Logout Success

TC-002 Login failed - Password incorrect
    [Documentation]     To verify that a user can login unsuccessfully when they put a correct username but wrong password.
    Go to login page
    Verify title login page    ${text_title_page} 
    verrify login page    ${text_login_page}
    Input Username    ${username}
    Input Password    ${incorrect_password}     
    Click Login Button
    Verify Message After Login Unsuccess - Password Is Invalid

TC-003 Login failed - Username not found
    [Documentation]    To verify that a user can login unsuccessfully when they put a username that did not exist.
    Go to login page
    Verify title login page    ${text_title_page} 
    verrify login page    ${text_login_page}
    Input Username    ${incorrect_username}
    Input Password    ${password}
    Click Login Button

***Keywords***
Go to login page
    Go To   ${base_url}/login    

Verify title login page
    [Arguments]    ${title}
    Title Should Be     ${title}

verrify login page
    [Arguments]    ${text}
    Element Text Should Be    ${text_login_page_xpath}    ${text}
    
Input Username
    [Arguments]    ${username}
    Input Text     ${input_username_xpath}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${input_password_xpath}    ${password}
    
Click Login Button
    Click Button    ${button_login_xpath}
    
Verify Message After Login Success
    Wait Until Element Is Visible  ${text_login_success_xpath}
    ${actual_text}=  Get Text  ${text_login_success_xpath}
    Should Contain    ${actual_text}    ${expected_text_login_success} 

Verify Message After Login Unsuccess - Password Is Invalid
    Wait Until Element Is Visible  ${text_login_unsuccess_xpath}
    ${actual_text}=  Get Text      ${text_login_unsuccess_xpath}
    Should Contain    ${actual_text}    ${expected_text_login_invalid_password}

Verify Message After Login Unsuccess - Username Is Invalid
    Wait Until Element Is Visible  ${text_login_unsuccess_xpath}
    ${actual_text}=  Get Text      ${text_login_unsuccess_xpath}
    Should Contain    ${actual_text}    ${expected_text_login_invalid_username}

Click Logout Button
    Wait Until Element Is Visible    ${button_logout_xpath}
    Click Element    ${button_logout_xpath}

Verify Message After Logout Success
    Wait Until Element Is Visible   ${text_logout_success_xpath}
    ${actual_text}=    Get Text    ${text_logout_success_xpath}
    Should Contain  ${actual_text}  ${expected_text_logout_success}

            
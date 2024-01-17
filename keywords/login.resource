*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Go To Page
    [Arguments]    ${url}
    Go TO    ${url}

Verify Title Page
    [Arguments]    ${xpath}    ${expected_text}
    Wait Until Element Is Visible    locator=${xpath}    timeout=10
    ${actual_text}    Get Text    ${xpath}
    Should Be Equal As Strings    ${actual_text}    ${expected_text}

Fill Text
    [Arguments]    ${xpath}    ${input_text}
    Wait Until Element Is Visible    locator=${xpath}    timeout=10
    Input Text    ${xpath}    ${input_text}

Click The Button
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    locator=${xpath}    timeout=10
    Click Button    ${xpath}

Click The Element
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    locator=${xpath}    timeout=10
    Click Element    ${xpath}

Verify Message
    [Arguments]    ${xpath}    ${expected_text}
    Wait Until Element Is Visible    locator=${xpath}    timeout=10
    ${actual_text}=    Get Text    ${xpath}
    Should Contain    ${actual_text}    ${expected_text}
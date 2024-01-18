*** Keywords ***

Verify ID Is Correct 
    [Arguments]    ${response_result}    ${expected_result}
    Should Be Equal As Integers   ${response_result}    ${expected_result}

Verify Email Is Correct
    [Arguments]    ${response_result}    ${expected_result}
    Should Be Equal As Strings   ${response_result}    ${expected_result}

Verify first Name Is Correct
    [Arguments]    ${response_result}    ${expected_result}
    Should Be Equal As Strings    ${response_result}    ${expected_result}

Verify Last Name Is Correct
    [Arguments]    ${response_result}    ${expected_result}
    Should Be Equal As Strings    ${response_result}    ${expected_result}

Verify Avatar Is Correct
    [Arguments]    ${response_result}    ${expected_result}
    Should Be Equal As Strings    ${response_result}    ${expected_result}

Verify Status Is Success 
    [Arguments]    ${response_result}    ${expected_result}
    Should Be Equal As Integers    ${response_result}    ${expected_result}

Verify Status Is Not Found
    [Arguments]    ${response_result}    ${expected_result}
    Should Be Equal As Integers    ${response_result}    ${expected_result}
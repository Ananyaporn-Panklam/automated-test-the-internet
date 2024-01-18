*** Keywords ***

Verify ID Is Correct 
    Should Be Equal As Integers   ${response_id}    ${expected_id}

Verify Email Is Correct
    Should Be Equal As Strings    ${response_email}    ${expected_email}

Verify first Name Is Correct
    Should Be Equal As Strings    ${response_first_name}    ${expected_first_name}

Verify Last Name Is Correct
    Should Be Equal As Strings    ${response_last_name}    ${expected_last_name}

Verify Avatar Is Correct
    Should Be Equal As Strings    ${response_avatar}    ${expected_avatar}

Verify Status Is Success 
    Should Be Equal As Integers    ${response_status_code}    200

Verify Status Is Not Found
    Should Be Equal As Integers    ${response_status_code}     404
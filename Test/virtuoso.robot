*** Settings ***
Library    ../Library/Virtuoso.py
Test Setup        Set Default Project And Token   ${project_id}    ${api_token}

*** Variables ***
${project_id}    1304
${api_token}    %{VIRTUOSO_TOKEN}
${goal_id}    7911



*** Test Cases ***
Execute First Journey
    [Tags]    foo    bar
    ${execution_id}    Run Virtuoso Journey    First Journey    ${goal_id}
    Check Virtuoso Execution Outcome    ${execution_id}    FAIL


Execute Second Journey
     ${execution_id}    Run Virtuoso Journey    Second Journey    ${goal_id}
     Check Virtuoso Execution Outcome    ${execution_id}    PASS

Execute Third Journey
     ${execution_id}    Run Virtuoso Journey    Third Journey    ${goal_id}
     Check Virtuoso Execution Outcome    ${execution_id}    PASS


Execute All Journeys Parallel
     ${execution_id_1}    Run Virtuoso Journey    First Journey    ${goal_id}
     ${execution_id_2}    Run Virtuoso Journey    Second Journey    ${goal_id}
     ${execution_id_3}    Run Virtuoso Journey    Third Journey    ${goal_id}
     Check Virtuoso Execution Outcome    ${execution_id_1}    FAIL
     Check Virtuoso Execution Outcome    ${execution_id_2}    PASS
     Check Virtuoso Execution Outcome    ${execution_id_3}    PASS
    

Execute All Journeys Sequential
     ${execution_id_1}    Run Virtuoso Journey    First Journey    ${goal_id}
     Check Virtuoso Execution Outcome    ${execution_id_1}    FAIL
     ${execution_id_2}    Run Virtuoso Journey    Second Journey    ${goal_id}
     Check Virtuoso Execution Outcome    ${execution_id_2}    PASS
     ${execution_id_3}    Run Virtuoso Journey    Third Journey    ${goal_id}
     Check Virtuoso Execution Outcome    ${execution_id_3}    PASS

Execute Goal
     ${execution_id_1}    Run Virtuoso Goal    ${goal_id}
     Check Virtuoso Execution Outcome    ${execution_id_1}    FAIL

Execute Plan
     ${execution_id}    Run Virtuoso Plan    2437
     Check Virtuoso Execution Outcome    ${execution_id}    FAIL


Execute Non existing journey
     ${execution_id}    Run Virtuoso Journey    FOOBAR    ${goal_id}
     Check Virtuoso Execution Outcome    ${execution_id}    PASS



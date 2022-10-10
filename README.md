# Robot Framework Virtuoso Extension

For more information on the robot framework check the user [guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html).
## Using the keywords

The robot framework uses tabs to differentiate the input's and outputs so make sure you separate them by tabs and not spaces.

## Virtuoso's Keywords

### Run Virtuoso Journey

Starts the execution of a journey in Virtuoso.

**Inputs**: 

----
 - **Virtuoso Journey Name**: Name of the journey to be executed in Virtuoso.
 - **Virtuoso Goal ID**: Identifier of the Virtuoso Goal where the journey is located.
----

**Output:**:

----
- **Execution ID**: Identifier of the Virtuoso Execution
----

**Example Usage**:

`
${execution_id}    Run Virtuoso Journey    First Journey    ${goal_id}
`

----


### Check Virtuoso Execution Outcome

Check the execution of a Virtuoso execution for a given execution ID.

**Inputs**: 

----
- **Execution ID**: Execution identifier to check
- **Expected outcome**: Expected outcome of an execution (e.g. PASS/FAIL)
----

**Example Usage**:

`
Check Virtuoso Execution Outcome    ${execution_id}    PASS
`

----

### Run Virtuoso Goal

Starts the execution of a goal in Virtuoso.

**Inputs**: 

----
 - **Virtuoso Goal ID**: Identifier of the Virtuoso Goal.
----

**Output:**:

----
- **Execution ID**: Identifier of the Virtuoso Execution
----

**Example Usage**:

`
${execution_id}    Run Virtuoso Goal    ${goal_id}
`

----


### Run Virtuoso Plan

Starts the execution of a plan in Virtuoso.

**Inputs**: 

----
 - **Virtuoso Plan ID**: Identifier of the Virtuoso plan.
----

**Output:**:

----
- **Execution Id**: Identifier of the Virtuoso Execution
----

**Example Usage**:

`
${execution_id}    Run Virtuoso Plan    ${plan_id}
`

----


For more example on how to use the Virtuoso keywords check the virtuoso.robot file located in the Tests folder.


## CI/CD Pipeline Integrations

For an example on how to integrate with CI/CD Pipelines check the Examples folder.
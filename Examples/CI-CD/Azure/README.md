# Robot Framework Virtuoso Extension with Azure DevOps


# Test Case Synchronization

To correctly synchronize the test cases with the execution make sure that the name of the test case in your robot file is exactly the same as your test case in the Azure test plan.



## Required environment variables

To successfully run the Pipeline you need to provide the following environment variables.

To set variables in the Azure CI/CD please check the Microsoft [documentation](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch)

To set secret variables in the Azure CI/CD pipeline please check the Microsoft [documentation](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/set-secret-variables?view=azure-devops&tabs=yaml%2Cbash).

### Environment Variables from Virtuoso

**VIRTUOSO_TOKEN**: Token to access the Virtuoso API's.

Generate a Virtuoso Token by following the instructions [here](https://docs.virtuoso.qa/guide/advanced-topics/virtuoso-api.html#creating-an-api-access-token).

**NOTE:** The user that generated the Virtuoso token should have read and write permissions to the projects were the goals to execute are located.

### Environment Variables from Azure DevOps

**ORGANIZATION_URL**: Azure DevOps organization URL (e.g. https://dev.azure.com/virtuoso).


**PROJECT_NAME**: Name of the project where the tests to updated are located.


**PERSONAL_ACCESS_TOKEN**: Personal access token for a User on Azure DevOps, for more information on how to generate a PAT check the Microsoft [documentation](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows).

**NOTE**: The PAT should have read an write permissions to **Test Management**.

**PLAN_ID**: Test plan identifier this can easily be retrieved from the URL once navigating to the plan (e.g. https://dev.azure.com/virtuoso/testplan/_testPlans/execute?**planId**=15&suiteId=16)

**SUITE_ID**: Test suite identifier this can easily be retrieved from the URL once navigating to the plan (e.g. https://dev.azure.com/virtuoso/testplan/_testPlans/execute?planId=15&**suiteId**=16)


## Executing the pipeline

import os, sys
sys.path.append(os.path.join(os.path.dirname(__file__), ".."))
import API.Virtuoso as virtuosoApi


class Virtuoso ():
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self) -> None:
        self.api = virtuosoApi.VirtuosoApi()
        self.project_id = None
        self.api_token = None
        self.environment = None

    def set_virtuoso_environment(self, environment):
        self.environment = environment
        self.api.set_virtuoso_environment(environment)
    
    def set_project_id(self, project_id):
        self.project_id = project_id
        self.api.set_project_id(project_id)

    def set_api_token(self, api_token):
        self.api_token = api_token
        self.api.set_api_token(api_token)

    def run_virtuoso_journey(self, journey_name, goal_id=None):
        execution_id = self.api.journey.execute_journeys([journey_name], [goal_id])
        if not execution_id:
            raise Exception("Unable to run Journey {} in goal {} in project {}".format(
                journey_name, 
                goal_id, 
                self.project_id))
        return execution_id

    def run_virtuoso_goal(self, goal_id):
        execution_id = self.api.goal.execute_goal(goal_id)
        if not execution_id:
            raise Exception("Unable to run Goal {} in project {}".format(goal_id, self.project_id))
        return execution_id

    def run_virtuoso_plan(self, plan_id):
        execution_id = self.api.plan.execute_plan(plan_id)
        if not execution_id:
            raise Exception("Unable to run Plan {} in project {}".format(plan_id, self.project_id))
        return execution_id

    def check_virtuoso_execution_outcome(self, execution_id, expected_outcome):
        execution_outcome = self.api.check_execution_outcome(execution_id)
        check_outcome =  execution_outcome == expected_outcome
        if not check_outcome:
            error_message  = ("Execution {} outcome: {} != Expected outcome: {}\n"
                              "Virtuoso Link: {}/#/project/{}/execution/{}""".format(
                                execution_id, 
                                execution_outcome, 
                                expected_outcome,
                                self.api.ui_url,
                                self.project_id, 
                                execution_id))
            raise Exception(error_message)

    def set_default_project_and_token(self, project_id, api_token, environment=None):
        self.set_api_token(api_token)
        self.set_project_id(project_id)
        if environment:
            self.set_virtuoso_environment(environment)

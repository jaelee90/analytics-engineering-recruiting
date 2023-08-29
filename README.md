# analytics-engineering-recruiting
This repo houses the base data for the Analytics Engineering take-home assessment given to prospective Engineers.

<b>Possible next steps</b>:
- review with the team to see if `accepted_values` tests should be implemented for true/false values and categorical data
    - this might not provide too much value and might just add more time to our project runs
- incorporate additional testing packages like `dbt-artifacts`, `dbt-expectations`, or `dbt-elementary` to run more sophisticated tests
    - these tests should help us detect anomalies in our data, monitor how fresh our data is, and assist in monitoring our data pipelines
    - if a specific merchant category decreases by a measurable amount, these tests shoudl notify us
- work with stakeholders to learn more about the return process
    - we have a lot of data in the `return_policy` column and it might be worth creating a new downstream model with only that data
- do some analysis on merchant returns
    - which merchants have the most returns, what type of merchant, etc.
#!/usr/bin/python3
"""Displays fake user data using the JSON Placeholder API."""
import requests
from sys import argv


if __name__ == "__main__":
    employee_id = argv[1]
    api = 'https://jsonplaceholder.typicode.com/'
    endpoint = 'users/{}'.format(employee_id)
    employee = requests.get(api + endpoint).json()

    endpoint = 'todos?userId={}'.format(employee_id)
    employee_tasks = requests.get(api + endpoint).json()

    employee_name = employee.get("name")
    employee_tasks_count = len(employee_tasks)

    endpoint = 'todos'
    all_tasks_count = len(requests.get(api + endpoint).json())

    print("Employee {} is done with tasks({}/{}):".format(
        employee_name, employee_tasks_count, all_tasks_count
        )
    )
    for task in employee_tasks:
        print("\t " + task.get("title"))

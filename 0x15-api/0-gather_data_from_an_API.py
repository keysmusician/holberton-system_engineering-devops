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
    tasks = requests.get(api + endpoint).json()

    employee_name = employee.get("name")
    task_count = len(tasks)

    completed_tasks = [task for task in tasks if task.get("completed")]

    print("Employee {} is done with tasks({}/{}):".format(
        employee_name, len(completed_tasks), task_count
        )
    )
    for task in completed_tasks:
        print("\t " + task.get("title"))

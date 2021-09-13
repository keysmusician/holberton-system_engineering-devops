#!/usr/bin/python3
"""Creates a JSON dump from fake user data using the JSON Placeholder API."""
import json
import requests
from sys import argv


if __name__ == "__main__":
    employee_id = argv[1]
    api = 'https://jsonplaceholder.typicode.com/'

    endpoints = [
        'users/{}'.format(employee_id),
        'todos?userId={}'.format(employee_id)
    ]

    employee, tasks = \
        [requests.get(api + endpoint).json() for endpoint in endpoints]

    username = employee.get("username")

    csv_headers = [
        "USER_ID",
        "USERNAME",
        "TASK_COMPLETED_STATUS",
        "TASK_TITLE"
    ]

    data = {employee_id:
            [{
                "USER_ID": employee_id,
                "username": username,
                "completed": task.get("completed"),
                "task": task.get("title")
             } for task in tasks]
            }

    filename = "{}.json".format(employee_id)
    with open(filename, "w") as file:
        json.dump(data, file)

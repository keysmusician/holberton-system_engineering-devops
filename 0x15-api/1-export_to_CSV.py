#!/usr/bin/python3
"""Creates a CSV from fake user data using the JSON Placeholder API."""
import csv
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

    data_dicts = [
        {
            "USER_ID": employee_id,
            "USERNAME": username,
            "TASK_COMPLETED_STATUS": task.get("completed"),
            "TASK_TITLE": task.get("title")
        } for task in tasks
    ]

    filename = "{}.csv".format(employee_id)
    with open(filename, "w") as file:
        csv.DictWriter(file, csv_headers, quoting=csv.QUOTE_ALL)\
           .writerows(data_dicts)

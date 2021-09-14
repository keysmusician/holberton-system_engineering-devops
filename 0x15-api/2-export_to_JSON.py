#!/usr/bin/python3
"""Creates a JSON dump from fake user data using the JSON Placeholder API."""
import json
import requests
from sys import argv


if __name__ == "__main__":
    user_id = argv[1]
    api = 'https://jsonplaceholder.typicode.com/'

    endpoints = [
        'users/{}'.format(user_id),
        'todos?userId={}'.format(user_id)
    ]

    user, tasks = \
        [requests.get(api + endpoint).json() for endpoint in endpoints]

    username = user.get("username")

    data = {user_id:
            [{
                "username": username,
                "completed": task.get("completed"),
                "task": task.get("title")
             } for task in tasks]
            }

    filename = "{}.json".format(user_id)
    with open(filename, "w") as file:
        json.dump(data, file)

#!/usr/bin/python3
"""
Queries the Reddit API and returns the number of total subscribers for a given
subreddit. 
"""
import requests

def number_of_subscribers(subreddit):
    url = 'http://www.reddit.com/r/{}/about.json'.format(subreddit)
    response = requests.get(url)
    if (not response.ok):
        return 0
    subscriber_count = response.json().get('data').get('subscribers')
    return subscriber_count
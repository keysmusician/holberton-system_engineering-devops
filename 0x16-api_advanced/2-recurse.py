#!/usr/bin/python3
"""
Queries the Reddit API and returns a list containing the titles of all hot
articles for a given subreddit.
"""
import requests


def recurse(subreddit, hot_list=[], count=0, after=''):
    """
    Queries the Reddit API and returns a list containing the titles of all hot
    articles for a given subreddit.
    """
    base = 'https://www.reddit.com/'
    endpoint = 'r/{}/hot.json'.format(subreddit)
    query_string = '?show="all"&limit=100&after={}&count={}'.format(
        after, count)
    url = base + endpoint + query_string
    headers = {'User-Agent': 'Python/1.0(Holberton School 0x16)'}
    response = requests.get(url, headers=headers)
    data = response.json()['data']
    for post in data['children']:
        hot_list.append(post['data']['title'])
    after = data['after']
    dist = data['dist']
    if (after):
        recurse(subreddit, hot_list, count + dist, after)
    return hot_list

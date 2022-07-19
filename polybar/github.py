#!/usr/bin/env python3

import datetime
import json
import os
import sys

GITHUB_LOGIN = 'elliotalexander'
ACCESS_TOKEN = os.getenv('GITHUB_TOKEN')

# (optional) PRs with this label (e.g 'in progress') will be grayed out on the list
WIP_LABEL = ''

# (optional) Filter the PRs by an organization, labels, etc. E.g 'org:YourOrg -label:dropped draft:false'
FILTERS = 'draft:false'

try:
    # For Python 3.x
    from urllib.request import Request, urlopen
except ImportError:
    # For Python 2.x
    from urllib2 import Request, urlopen

query = '''{
  search(query: "%(search_query)s", type: ISSUE, first: 100) {
    issueCount
    edges {
      node {
        ... on PullRequest {
          repository {
            nameWithOwner
          }
          author {
            login
          }
          createdAt
          number
          url
          title
          labels(first:100) {
            nodes {
              name
            }
          }
        }
      }
    }
  }
}'''

def execute_query(query):
    headers = {
        'Authorization': 'bearer ' + ACCESS_TOKEN,
        'Content-Type': 'application/json'}
    data = json.dumps({'query': query}).encode('utf-8')
    req = Request(
        'https://api.github.com/graphql', data=data, headers=headers)
    body = urlopen(req).read()
    return json.loads(body)


def search_pull_requests(login, filters=''):
    search_query = 'type:pr state:open review-requested:%(login)s' % {
        'login': login, 'filters': filters}
    response = execute_query(query % {'search_query': search_query})
    return response['data']['search']

if __name__ == '__main__':
    if not all([ACCESS_TOKEN, GITHUB_LOGIN]):
        print('ACCESS_TOKEN and GITHUB_LOGIN cannot be empty')
        sys.exit(0)
    response = search_pull_requests(GITHUB_LOGIN, FILTERS)
    print(response['issueCount'])

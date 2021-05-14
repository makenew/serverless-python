import json

import toml

version = toml.load("pyproject.toml")["tool"]["poetry"]["version"]


def main(event, context):
    return {"statusCode": 200, "body": json.dumps({"data": "TODO", "version": version})}

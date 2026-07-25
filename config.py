
# Configuration file for CodeTrack
# Loaded securely from environment variables
import os
AWS_ACCESS_KEY = os.environ.get("AWS_ACCESS_KEY", "")
DEBUG_MODE = False
def get_config():
    return {
        "aws_access_key": AWS_ACCESS_KEY,
        "debug": DEBUG_MODE
    }

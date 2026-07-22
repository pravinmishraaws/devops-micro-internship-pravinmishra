"""
Configuration file for CodeTrack application.
"""

import os

# Database configuration
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_NAME = "codetrack_prod"


def get_connection_string():
    """Return database connection string."""
    return f"postgresql://{DB_HOST}:{DB_PORT}/{DB_NAME}"

# pylint: disable=missing-docstring
# pylint: disable=unused-import

import pytest

from makenew_serverless_python.todo import todo

def test_todo():
    assert todo(True) is True

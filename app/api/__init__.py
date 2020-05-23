from flask import Blueprint

bp = Blueprint('api', __name__)

from app.api import users, errors, tokens #at the bottom to acoid circular dependency errors

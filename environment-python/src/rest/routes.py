from app import app

from . import healthz

from ..shared.ResponseMiddleware import ResponseMiddleware

@app.route("/")
@app.route("/healthz")
@ResponseMiddleware()
def helthzRequest():
    return healthz.up()
from {{project_name}}.wsgi import application
from v2 import app as asgi_app
from cv_utils.starlette import initialize_router

app = initialize_router(
    [{"path": "/v2", "app": asgi_app}, {"path": "", "app": application, "wsgi": True}]
)

DATA_DIR = '/var/lib/pgadmin4'
LOG_FILE =        DATA_DIR + '/pgadmin4.log'
SQLITE_PATH =     DATA_DIR + '/pgadmin4.db'
SESSION_DB_PATH = DATA_DIR + '/sessions'
STORAGE_DIR =     DATA_DIR + '/storage'

CSRF_SESSION_KEY = 'SuperSecret1'
SECRET_KEY = 'SuperSecret2'
SECURITY_PASSWORD_SALT = 'SuperSecret3'
CONSOLE_LOG_LEVEL = 30

DEFAULT_SERVER = '0.0.0.0'
DEFAULT_SERVER_PORT = 5050

MAIL_SERVER = 'mailhost'
MAIL_PORT = 25
MAIL_USE_SSL = False
MAIL_USE_TLS = False
MAIL_USERNAME = ''
MAIL_PASSWORD = ''
MAIL_DEBUG = False

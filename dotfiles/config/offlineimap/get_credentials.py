import subprocess

def get_credentials(account):
    if account == "TUHH":
        path = "TUHH/TUHH"
    elif account == "Mailbox":
        path = "E-Mail/mailbox.org"
    return subprocess.check_output(["pass", "first-line", path]).strip()


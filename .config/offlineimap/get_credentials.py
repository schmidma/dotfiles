import subprocess

def get_credentials(account):
    if account == "TUDelft":
        path = "TUDelft/TUDelft"
    elif account == "TUHH":
        path = "TUHH/TUHH"
    elif account == "Mailbox":
        path = "E-Mail/mailbox.org"
    return subprocess.check_output(["/usr/bin/pass", "first-line", path]).strip()


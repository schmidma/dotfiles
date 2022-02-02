#!/bin/sh
notmuch new

# tag Mailbox messages
notmuch tag +mailbox -- path:Mailbox/**

# tag TUHH messages
notmuch tag +tuhh -- path:TUHH/**

# tag TUDelft messages
notmuch tag +tudelft -- path:TUDelft/**

# Trash
notmuch tag -inbox +deleted -- path:/Trash/
# Spam
notmuch tag -inbox +junk -- path:Mailbox/Junk/** or path:/TUHH/Spam/ or path:TUDelft/Junk\ Email/**
# Sent
notmuch tag -inbox +sent -- path:/Sent/

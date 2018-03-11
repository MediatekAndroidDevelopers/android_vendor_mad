#!/usr/bin/env python3

"""
Author: Ming Wen (bitmingw@gmail.com)
When resolving conflicts on a merge or rebase, this script
automates `git add/rm` and `git checkout` with --ours or --theirs
for a large batch of changes.
Usage: `./git_batch_resolver.py` in your git repository.
Note:
for `git merge`, ours -> current branch, theirs -> other branch
for `git rebase`, ours -> other branch, theirs -> current branch
"""

import fileinput
import os
from subprocess import check_output


BOTH_ADDED = "both added:"
BOTH_MODIFIED = "both modified:"
ADDED_BY_US = "added by us:"
ADDED_BY_THEM = "added by them:"
DELETED_BY_US = "deleted by us:"
DELETED_BY_THEM = "deleted by them:"


def main():
    stat = read_stat()
    prompt = "To solve conflict, use (o)urs, (t)heirs or (a)bort? "
    while True:
        response = input(prompt)
        if len(response) == 0 or (response[0] not in ["o", "t", "a"]):
            prompt = "Invalid option. Type [o/t/a]. Please try again: "
        else:
            break
    if response[0] == "o":
        for f in stat["both-added"]:
            check_output("git add " + f, shell=True)
        for f in stat["both-modified"]:
            check_output("git checkout --ours " + f, shell=True)
            check_output("git add " + f, shell=True)
        for f in stat["added-by-us"]:
            check_output("git add " + f, shell=True)
        for f in stat["added-by-them"]:
            check_output("git rm " + f, shell=True)
        for f in stat["deleted-by-us"]:
            check_output("git rm " + f, shell=True)
        for f in stat["deleted-by-them"]:
            check_output("git add " + f, shell=True)
    elif response[0] == "t":
        for f in stat["both-added"]:
            check_output("git add " + f, shell=True)
        for f in stat["both-modified"]:
            check_output("git checkout --theirs " + f, shell=True)
            check_output("git add " + f, shell=True)
        for f in stat["added-by-us"]:
            check_output("git rm " + f, shell=True)
        for f in stat["added-by-them"]:
            check_output("git add " + f, shell=True)
        for f in stat["deleted-by-us"]:
            check_output("git add " + f, shell=True)
        for f in stat["deleted-by-them"]:
            check_output("git rm " + f, shell=True)
    elif response[0] == "a":
        print("Action abort by user.")
        return

    print("\n==== results: git status ====")
    res = str(check_output(["git", "status"]), encoding='utf-8')
    res = res.split("\n")
    for line in res:
        print(line)
    print("==== end of result ====")
    print("Please resolve remaining issues manually. Thanks!")


def read_stat():
    check_output("git status > _tmp.txt", shell=True)
    stat = {"both-added": [],
            "both-modified": [],
            "added-by-us": [],
            "added-by-them": [],
            "deleted-by-us": [],
            "deleted-by-them": []}
    print("==== git status ====")
    for line in fileinput.input("_tmp.txt"):
        print(line, end="")
        if match_str_head(line, BOTH_ADDED):
            stat["both-added"].append(
                extract_path(line, BOTH_ADDED))
        elif match_str_head(line, BOTH_MODIFIED):
            stat["both-modified"].append(
                extract_path(line, BOTH_MODIFIED))
        elif match_str_head(line, ADDED_BY_US):
            stat["added-by-us"].append(
                extract_path(line, ADDED_BY_US))
        elif match_str_head(line, ADDED_BY_THEM):
            stat["added-by-them"].append(
                extract_path(line, ADDED_BY_THEM))
        elif match_str_head(line, DELETED_BY_US):
            stat["deleted-by-us"].append(
                extract_path(line, DELETED_BY_US))
        elif match_str_head(line, DELETED_BY_THEM):
            stat["deleted-by-them"].append(
                extract_path(line, DELETED_BY_THEM))
    print("==== end of git status ====\n")
    os.remove("_tmp.txt")
    return stat


def match_str_head(s, template):
    s = s.strip()
    return True if s.find(template) == 0 else False


def extract_path(s, template):
    s = s.strip()
    assert match_str_head(s, template)
    s = s[len(template):]  # remove prefix
    return s.strip()


if __name__ == "__main__":
    main()

#!/usr/bin/env bash

old_head=7c66458
new_head=c559af0

echo "CASE 1: A force-pushed branch that has no branch changes, just the latest master"
echo "  e.g. they just did git rebase master && git push --force-with-lease"
echo
echo "With PR: https://github.com/dbalatero/test-repo/pull/1"
echo "It had been force pushed from $old_head to $new_head, with no distinguishable changes."
echo

old_diff=$(curl --silent -H 'Accept: application/vnd.github.v3.diff' \
  https://github.com/dbalatero/test-repo/compare/master...$old_head.diff)

echo "Patch from $old_head:"
echo "===="
echo "$old_diff"
echo

new_diff=$(curl --silent -H 'Accept: application/vnd.github.v3.diff' \
  https://github.com/dbalatero/test-repo/compare/master...$new_head.diff)

echo "Patch from $new_head:"
echo "===="
echo "$new_diff"
echo

#############################################

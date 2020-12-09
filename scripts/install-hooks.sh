#!/bin/bash

for hook in hooks/*; do
   if [[ $1 == check ]]; then
      diff "$hook" ".git/$hook" &>/dev/null || exit 1
   else
      cp "$hook" ".git/$hook"
   fi
done
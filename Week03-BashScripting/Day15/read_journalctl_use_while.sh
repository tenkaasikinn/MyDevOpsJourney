#!/bin/bash

journalctl -f | while IFS= read -r line; do
      echo "log $line"
done

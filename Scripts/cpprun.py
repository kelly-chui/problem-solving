#!/usr/bin/env python3

import subprocess
import sys

source = sys.argv[1]
output = "/tmp/cpprun"

subprocess.run(
    ["g++", "-std=c++20", "-O2", "-Wall", source, "-o", output],
    check=True,
)

subprocess.run([output], check=True)

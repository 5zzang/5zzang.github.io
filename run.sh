#!/bin/bash
docker run -t --rm -v ~/git/Personal/github/5zzang.github.io/:/app -p 4000:4000 --name jekyll jekyll

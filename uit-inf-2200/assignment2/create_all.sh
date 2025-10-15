#!/usr/bin/bash
#ASSGMENT_DIR=mips-simulator-submissions
#ASSGMENT_ID=858010
ASSGMENT_DIR=microbenchmark-submissions
ASSGMENT_ID=835308
echo "assign-repo.py\n"
python assign-repo.py "$ASSGMENT_DIR" | tee "repo-name-$ASSGMENT_DIR.md"
echo "create-repo-githubid.py\n"
python create-repo-githubid.py "$ASSGMENT_ID" | tee "repo-githubid-$ASSGMENT_DIR.md"
echo "create-repo-githubid-name.py\n"
python create-repo-githubid-name.py "$ASSGMENT_DIR" | tee "repo-name-githubid-$ASSGMENT_DIR.md"

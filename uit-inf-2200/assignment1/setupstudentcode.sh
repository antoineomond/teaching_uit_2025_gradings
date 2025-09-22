if [ ! -d /tmp/studentcode ]; then
  mkdir -p /tmp/studentcode;
fi

rm -r /tmp/studentcode/*
cp -r * /tmp/studentcode/
docker run -dit --rm --name studentcodecontainer -w /tmp/studentcode -v /tmp/studentcode:/tmp/studentcode studentcodeimage:latest /bin/bash
docker network disconnect bridge studentcodecontainer
docker attach studentcodecontainer

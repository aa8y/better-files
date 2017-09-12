#!/bin/sh

docker build -t better-files .
docker run --rm better-files sbt updateImpactSubmit \
  && sbt coverage test coverageReport coverageAggregate \
  && bash <(curl -s https://codecov.io/bash) \
  && sbt codacyCoverage \
  && git config --global user.email "pathikritbhowmick@msn.com" \
  && git config --global user.name "circle-ci" \
  && git config --global push.default simple \
  && sbt ghpagesPushSite \
  && sbt +publish

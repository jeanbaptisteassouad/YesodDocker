FROM haskell:8.2.1

RUN apt-get update && apt-get install \
  make=4.0-8.1 \
  xz-utils=5.1.1alpha+20120614-2+b3

RUN stack upgrade --binary-version 1.6.5

WORKDIR /usr/src/app

RUN stack new apiHaskell yesod-sqlite

WORKDIR ./apiHaskell

RUN stack install yesod-bin --install-ghc

RUN stack build

CMD ["stack", "exec", "--", "yesod", "devel"]

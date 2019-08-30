#
# GitLab CI: Android v0.2
#
# https://hub.docker.com/r/diwasjoshi/gitlab-ci-ndk19-android/
#

FROM sandrios/gitlab-ci-android

ENV VERSION_ANDROID_NDK "android-ndk-r19c"

ENV ANDROID_NDK_HOME "/sdk/${VERSION_ANDROID_NDK}"

RUN  rm /var/lib/dpkg/available
RUN  touch /var/lib/dpkg/available

RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends \
    build-essential \
    file \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://dl.google.com/android/repository/${VERSION_ANDROID_NDK}-linux-x86_64.zip /ndk.zip
RUN unzip /ndk.zip -d /sdk && \
    rm -v /ndk.zip

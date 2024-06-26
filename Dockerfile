ARG BASE_IMAGE='openjdk:11-jdk'

from ${BASE_IMAGE}

ARG ANDROID_COMPILE_SDK='33'
ARG ANDROID_BUILD_TOOLS='33.0.0'
ARG ANDROID_SDK_TOOLS='9477386_latest'
ARG ANDROID_HOME="/usr/local/android-sdk"

WORKDIR /opt

# Update the package list
RUN apt-get --quiet update --yes

# Install the required packages
RUN apt-get --quiet install --yes wget curl tar unzip
# lib32stdc++6 lib32z1

# Add NodeSource repository
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
# Install NodeJS
RUN apt --quiet install --yes nodejs
# Update NPM
RUN npm install -g npm
# Install Yarn
RUN npm install -g yarn

# Android SDK
RUN mkdir android-sdk-linux
RUN wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS}.zip
RUN unzip -d android-sdk-linux android-sdk.zip

RUN mv android-sdk-linux/cmdline-tools android-sdk-linux/tools
RUN mkdir android-sdk-linux/cmdline-tools
RUN mv android-sdk-linux/tools android-sdk-linux/cmdline-tools/tools

# Download the platform toolse
RUN wget --quiet --output-document=platform-tools.zip https://dl.google.com/android/repository/platform-tools-latest-linux.zip
# Unzip the platform tools
RUN unzip -d android-sdk-linux platform-tools.zip

RUN rm platform-tools.zip android-sdk.zip

# In this step, we set the variable ANDROID_HOME to the path of the Android SDK
ENV ANDROID_HOME /opt/android-sdk-linux
ENV SDK_MANAGER_DIR $ANDROID_HOME/cmdline-tools/tools/bin

ENV PATH $PATH:$SDK_MANAGER_DIR

RUN echo y | $SDK_MANAGER_DIR/sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null
RUN echo y | $SDK_MANAGER_DIR/sdkmanager "platform-tools" >/dev/null
RUN echo y | $SDK_MANAGER_DIR/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null

RUN yes | $SDK_MANAGER_DIR/sdkmanager --licenses
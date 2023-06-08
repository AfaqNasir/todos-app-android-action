FROM node:14

# Set up the Android environment
RUN apt-get update -y && apt-get install -y openjdk-8-jdk-headless curl unzip
RUN curl -sL https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -o sdk-tools-linux.zip \
    && unzip -q sdk-tools-linux.zip -d android-sdk \
    && rm sdk-tools-linux.zip

ENV ANDROID_SDK_ROOT=/android-sdk
ENV PATH=$PATH:/android-sdk/tools/bin:/android-sdk/platform-tools

RUN yes | sdkmanager --licenses && sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"

# Copy the necessary files to the image
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Set the entrypoint command
ENTRYPOINT ["/entrypoint.sh"]

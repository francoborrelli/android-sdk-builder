# Android SDK Builder (Dockerized Android App Build)

![Android Studio](https://img.shields.io/badge/android%20studio-346ac1?style=for-the-badge&logo=android%20studio&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![GitLab CI](https://img.shields.io/badge/gitlab%20ci-%23181717.svg?style=for-the-badge&logo=gitlab&logoColor=white)

This repository contains a Dockerfile and associated configurations to facilitate the build and generation of APK files for Android applications. By using Docker containers, developers can create a standardized build environment, eliminating dependency issues and ensuring consistent builds across different systems.

## 🚀 Getting Started

To get started with building Android apps using Docker, follow these steps:

1. **Clone the Repository:**
   ```
   git clone https://github.com/francoborrelli/android-sdk-builder.git
   cd your_repository
   ```

2. **Build the Docker Image:**
   ```
   docker build -t android-build .
   ```

3. **Run the Docker Container:**
   ```
   docker run --rm -v $(pwd):/workspace android-build
   ```

4. **Retrieve the APK File:**
   Once the build process is complete, the generated APK file will be available in the `/workspace` directory within the Docker container. You can copy it to your host machine using the `docker cp` command.

## 🛠️ Customization

The Dockerfile provided in this repository offers a basic configuration for building Android apps. However, you can customize it to suit your specific requirements. Here are some possible modifications:

- **Android SDK/NDK Versions:** Update the `ANDROID_COMPILE_SDK`, `ANDROID_BUILD_TOOLS`, and `ANDROID_SDK_TOOLS` variables in the Dockerfile to specify the desired versions.
- **Additional Dependencies:** Install additional dependencies required for your Android project by adding corresponding commands to the Dockerfile.
- **Environment Variables:** Set environment variables in the Dockerfile to configure the build environment as needed.

## 🤝 Contributing

Contributions to this project are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request. 

## ⚔️ License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify the code according to your needs.

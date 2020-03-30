# Unity Actions

[![Actions status](https://github.com/webbertakken/unity-actions/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-actions/actions?query=branch%3Amaster+event%3Apush+workflow%3A"Actions%20%F0%9F%98%8E")

---

The fastest and **easiest** way to automatically test and build any Unity project!

---

#### Supported versions

It's generally considered good practice to use the same Unity version for Unity Actions as you do to develop your project.

Unity Actions are based on the 
[unity3d](https://gitlab.com/gableroux/unity3d) 
images from 
[GabLeRoux](https://github.com/GabLeRoux). 
Any version in this 
[list](https://hub.docker.com/r/gableroux/unity3d/tags)
can be used to test and build projects.

## Project Status

#### Checkout

| Description             | Done | Status |
|-------------------------|------|--------|
| [Checkout project](https://github.com/actions/checkout) | ✔ | Native support |

#### Configure

| Description             | Done | Status |
|-------------------------|------|--------|
| [Request activation file](https://github.com/marketplace/actions/unity-request-activation-file) | ✔ | [![Actions status](https://github.com/webbertakken/unity-request-manual-activation-file/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-request-manual-activation-file) |
| [Activate license](https://github.com/marketplace/actions/unity-activate) | ✔ | [![Actions status](https://github.com/webbertakken/unity-activate/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-activate) |
| [Return license](https://github.com/marketplace/actions/unity-return-license) | ✔ | [![Actions status](https://github.com/webbertakken/unity-return-license/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-return-license) |
| [Caching dependencies](https://github.com/marketplace/actions/cache)  | ✔ | Native support |

#### Test

| Description             | Done | Status |
|-------------------------|------|--------|
| [Test edit mode](https://github.com/marketplace/actions/unity-test-runner) | ✔ | [![Actions status](https://github.com/webbertakken/unity-test-runner/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-test-runner#edit-mode) |
| [Test play mode](https://github.com/marketplace/actions/unity-test-runner) | ✔ | [![Actions status](https://github.com/webbertakken/unity-test-runner/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-test-runner#play-mode) |
| [Test all in one](https://github.com/marketplace/actions/unity-test-runner) | ✔ | [![Actions status](https://github.com/webbertakken/unity-test-runner/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-test-runner#all-in-one-mode) |

#### Build

| Description             | Done | Status |
|-------------------------|------|--------|
| [Build for WebGL](https://github.com/marketplace/actions/unity-builder) | ✔ | [![Actions status](https://github.com/webbertakken/unity-builder/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-builder#webgl) |
| [Build for Windows](https://github.com/marketplace/actions/unity-builder) | ✔ | [![Actions status](https://github.com/webbertakken/unity-builder/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-builder#windows) |
| [Build for Linux](https://github.com/marketplace/actions/unity-builder) | ✔ | [![Actions status](https://github.com/webbertakken/unity-builder/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-builder#linux) |
| [Build for MacOS](https://github.com/marketplace/actions/unity-builder) | ✔ | [![Actions status](https://github.com/webbertakken/unity-builder/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-builder#macos) |
| [Build for Android](https://github.com/marketplace/actions/unity-builder) | ❕ | In progress |
| [Build for iOS](https://github.com/marketplace/actions/unity-builder) | ✔ | [![Actions status](https://github.com/webbertakken/unity-builder/workflows/Actions%20%F0%9F%98%8E/badge.svg?event=push&branch=master)](https://github.com/webbertakken/unity-builder#ios) |
| [Build for Windows store](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |
| [Build for PS4](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |
| [Build for XboxOne](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |
| [Build for tvOS](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |
| [Build for Switch](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |

## Setup

#### Mental model

There are two parts to setting up Unity Actions;

- Configuring a license
- Setting up a workflow

#### First time using GitHub Actions?

Read the official documentation on how to setup a 
[workflow](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow).

Any subsequent steps assume you have read the above.

### Setting up license

All actions utilize an installment of Unity, and as such need to be activated.

To set up your license for use in Unity Actions, create a file called 
`.github/workflows/activate.yml` in your repository and follow the steps for 
either `personal` or `professoinal` license below.

##### Personal license
 
1. Request your activation file for usage on GitHub using
   [Request Manual Activation File](https://github.com/marketplace/actions/unity-request-activation-file).
3. Request your license on 
   [license.unity3d.com](https://license.unity3d.com/manual).
4. Open `Github` > `<Your repository>` > `Settings` > `Secrets`
5. Create a secret called `UNITY_LICENSE` and add the contents of the obtained license file.

##### Professional license

1. Open `Github` > `<Your repository>` > `Settings` > `Secrets`
2. Create the following secrets;
    - `UNITY_SERIAL` - _(Add the code that looks like `XX-XXXX-XXXX-XXXX-XXXX-XXXX`)_
    - `UNITY_EMAIL` - _(Add the email address that you use to login to Unity)_
    - `UNITY_PASSWORD` - _(Add the password that you use to login to Unity)_

##### Optional steps

- Verify your license using 
  [Activate](https://github.com/marketplace/actions/unity-activate)
  and for pro licenses also 
    [Return License](https://github.com/marketplace/actions/unity-return-license). This is to free up the license allocation after usage.

    > _Note: Test runner and Builder already include these steps._

### Setting up a workflow

Setting up a workflow is easy!

Create a file called `.github/workflows/main.yml` in your repository and configure the following steps;

1. Checkout a repository using
 [Checkout](https://github.com/marketplace/actions/checkout).
2. Cache your library folder using 
[Cache](https://github.com/marketplace/actions/cache).
3. Configure your test job using 
 [Test Runner](https://github.com/marketplace/actions/unity-test-runner).
4. Configure your build job using 
 [Builder](https://github.com/marketplace/actions/unity-builder). 
5. Deploy your application.

Detailed instructions for each step can be found in the corresponding actions.

## Simple example

Below is a simple example. It is __recommended__ to start from here.
 
This example assumes that your Unity project is in the root of your repository.

> _Note: this repository tests this workflow_
>
```yaml
name: Actions 😎

on:
  pull_request: {}
  push: { branches: [master] }

env:
  UNITY_LICENSE: ${{ secrets.UNITY_LICENSE }}

jobs:
  build:
    name: Build my project ✨
    runs-on: ubuntu-latest
    steps:
    
      # Checkout
      - name: Checkout repository
        uses: actions/checkout@v2
        with:
          lfs: true
    
      # Cache
      - uses: actions/cache@v1.1.0
        with:
          path: Library
          key: Library

      # Test
      - name: Run tests
        uses: webbertakken/unity-test-runner@v1.3
        with:
          unityVersion: 2019.2.11f1

      # Build
      - name: Build project
        uses: webbertakken/unity-builder@v0.10
        with:
          unityVersion: 2019.2.11f1
          targetPlatform: WebGL 

      # Output 
      - uses: actions/upload-artifact@v1
        with:
          name: Build
          path: build
```

## Advanced example

To get an idea of how to create a more advanced workflows,
have a look at the example below.

> _Note: this repository tests this workflow_

```yaml
name: Actions 😎

on:
  pull_request: {}
  push: { branches: [master] }

env:
  UNITY_LICENSE: ${{ secrets.UNITY_LICENSE }}

jobs:
  buildAndTestForSomePlatforms:
    name: Build for ${{ matrix.targetPlatform }} on version ${{ matrix.unityVersion }}
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        projectPath:
          - test-project
        unityVersion:
          - 2019.2.11f1
        targetPlatform:
          - StandaloneOSX # Build a macOS standalone (Intel 64-bit).
          - StandaloneWindows64 # Build a Windows 64-bit standalone.
          - StandaloneLinux64 # Build a Linux 64-bit standalone.
          - iOS # Build an iOS player.
          - WebGL # WebGL.
    steps:
      - uses: actions/checkout@v2
        with:
          lfs: true
      - uses: actions/cache@v1.1.0
        with:
          path: ${{ matrix.projectPath }}/Library
          key: Library-${{ matrix.projectPath }}-${{ matrix.targetPlatform }}
          restore-keys: |
            Library-${{ matrix.projectPath }}-
            Library-
      - uses: webbertakken/unity-test-runner@v1.3
        id: testRunner
        with:
          projectPath: ${{ matrix.projectPath }}
          unityVersion: ${{ matrix.unityVersion }}
      - uses: actions/upload-artifact@v1
        with:
          name: Test results (all modes)
          path: ${{ steps.testRunner.outputs.artifactsPath }}
      - uses: webbertakken/unity-builder@v0.10
        with:
          projectPath: ${{ matrix.projectPath }}
          unityVersion: ${{ matrix.unityVersion }}
          targetPlatform: ${{ matrix.targetPlatform }}
          customParameters: "-myParameter myValue -myBoolean -ThirdParameter andItsValue"
      - uses: actions/upload-artifact@v1
        with:
          name: Build
          path: build
```

Have any questions or comments? Feel free to create an issue!

## Contributions

To contribute please follow the contribution
[guide](./CONTRIBUTING.md)
to get set up quickly.

This repository, and all related actions are open for your suggested changes!

Feel free to submit a pull request with the suggested changes.

## Licence 

This repository is licensed under the
[MIT](./LICENSE)
license.

This also includes contributions from the community.

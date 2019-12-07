# Unity Actions

[![Actions status](https://github.com/webbertakken/unity-actions/workflows/Actions%20😎/badge.svg)](https://github.com/webbertakken/unity-actions/actions?query=branch%3Amaster+workflow%3A%22Actions+%F0%9F%98%8E%22)

---

GitHub Actions for testing and building Unity projects.

Contributions are welcomed!

---

## Workflow steps

Here's a complete mental model of how to build, test and deploy your Unity app.
 
1. Checkout your repository
2. Configure `request activation file` job.
3. Activate your license and 
[add](https://github.com/webbertakken/unity-request-manual-activation-file)
the environment variable `UNITY_LICENSE`.
    - Optionally verify your license using `Activate licence` job.
4. Configure your test jobs.
5. Create builds for your desired targets.
6. Optionally, return your license (applicable to pro licenses only)
7. Deploy your application.

Detailed instructions can be found in each action below.

## Jobs

#### Checkout

| Description             | Done | Status |
|-------------------------|------|--------|
| [Checkout project](https://github.com/actions/checkout) | ✔ | Native support |

#### Configure

| Description             | Done | Status |
|-------------------------|------|--------|
| [Request activation file](https://github.com/marketplace/actions/unity-request-activation-file) | ✔ | [![Actions status](https://github.com/webbertakken/unity-request-manual-activation-file/workflows/Actions%20%F0%9F%98%8E/badge.svg)](https://github.com/webbertakken/unity-request-manual-activation-file) |
| [Activate license](https://github.com/marketplace/actions/unity-activate) | ✔ | [![Actions status](https://github.com/webbertakken/unity-activate/workflows/Actions%20%F0%9F%98%8E/badge.svg)](https://github.com/webbertakken/unity-activate) |
| [Return license](https://github.com/marketplace/actions/unity-return-license) | ✔ | [![Actions status](https://github.com/webbertakken/unity-return-license/workflows/Actions%20%F0%9F%98%8E/badge.svg)](https://github.com/webbertakken/unity-return-license) |

#### Test

| Description             | Done | Status |
|-------------------------|------|--------|
| [Test edit mode](https://github.com/marketplace/actions/unity-test-runner) | ✔ | [![Actions status](https://github.com/webbertakken/unity-test-runner/workflows/Actions%20%F0%9F%98%8E/badge.svg)](https://github.com/webbertakken/unity-test-runner#edit-mode) |
| [Test play mode](https://github.com/marketplace/actions/unity-test-runner) | ✔ | [![Actions status](https://github.com/webbertakken/unity-test-runner/workflows/Actions%20%F0%9F%98%8E/badge.svg)](https://github.com/webbertakken/unity-test-runner#play-mode) |
| [Test all in one](https://github.com/marketplace/actions/unity-test-runner) | ✔ | [![Actions status](https://github.com/webbertakken/unity-test-runner/workflows/Actions%20%F0%9F%98%8E/badge.svg)](https://github.com/webbertakken/unity-test-runner#all-in-one-mode) |

#### Build

| Description             | Done | Status |
|-------------------------|------|--------|
| [Build for WebGL](https://github.com/marketplace/actions/unity-builder) | ✔ | [![Actions status](https://github.com/webbertakken/unity-builder/workflows/Actions%20%F0%9F%98%8E/badge.svg)](https://github.com/webbertakken/unity-builder#webgl) |
| [Build for Windows](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |
| [Build for Linux](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |
| [Build for MacOS](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |
| [Build for Android](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |
| [Build for iOS](https://github.com/marketplace/actions/unity-builder) | ❌ | In progress |

#### Reference implementation

A full example implementation can be found in `main.yml` of this repo.

## Credits

Huge thanks to
[GabLeRoux](https://github.com/GabLeRoux)
for his docker [image](https://hub.docker.com/r/gableroux/unity3d/)
and gitlab-ci [example](https://gitlab.com/gableroux/unity3d).

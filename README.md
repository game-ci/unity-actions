# Unity Actions

[![Actions status](https://github.com/WebberTakken/unity-actions/workflows/Actions%20😎/badge.svg)](https://github.com/WebberTakken/unity-actions/workflows/Actions%20😎/badge.svg)

Github actions for testing and building Unity projects.  🦄

Contributions are welcomed!

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
6. Deploy your application.

Detailed instructions can be found in each action below.

## Jobs

#### Checkout

| Description             | Done | Status |
|-------------------------|------|--------|
| [Checkout project](https://github.com/actions/checkout) | ✔ | Native support |

#### Configure

| Description             | Done | Status |
|-------------------------|------|--------|
| [Request activation file](https://github.com/webbertakken/unity-request-manual-activation-file) | ✔ | [![Actions status](https://github.com/WebberTakken/unity-request-manual-activation-file/workflows/Actions%20%F0%9F%98%8E/badge.svg)](https://github.com/WebberTakken/unity-request-manual-activation-file/workflows/Actions%20%F0%9F%98%8E/badge.svg) |
| Activate license | ✔ | Not yet separated |

#### Test

| Description             | Done | Status |
|-------------------------|------|--------|
| Test all in one | ✔ | Not yet separated |
| Test edit mode only | ✔ | Not yet separated |
| Test play mode only | ✔ | Not yet separated |

#### Build

| Description             | Done | Status |
|-------------------------|------|--------|
| Build for WebGL | ❌ | In progress |
| Build for Windows | ❌ | In progress |
| Build for Linux | ❌ | In progress |
| Build for MacOS | ❌ | In progress |
| Build for Android | ❌ | In progress |
| Build for iOS | ❌ | In progress |

#### Reference implementation

A full example implementation can be found in `main.yml` of this repo.

## Credits

Huge thanks to
[gableroux](https://gableroux.com/)
for his docker [image](https://hub.docker.com/r/gableroux/unity3d/)
and gitlab-ci [example](https://gitlab.com/gableroux/unity3d).

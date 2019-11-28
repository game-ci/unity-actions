# Unity Actions

[![Actions status](https://github.com/WebberTakken/unity-actions/workflows/%F0%9F%98%8E%20Actions/badge.svg)](https://github.com/WebberTakken/unity-actions/workflows/%F0%9F%98%8E%20Actions/badge.svg)

Github actions for testing and building Unity projects.  🦄

Contributions are welcomed!

## Jobs

- [X] Checkout project
- [X] Activate license
- [X] Open project in Unity
- [X] Install dependencies
- [X] Perform edit mode tests
- [X] Perform play mode tests
- [X] Perform all tests in one
- [ ] Select scene(s)
- [ ] Build scene(s)

## Platforms

- [ ] WebGL
- [ ] Windows
- [ ] Linux
- [ ] MacOS
- [ ] Android
- [ ] iOS

## How to use

Create a workflow in `.github/workflows/main.yml`.

- Look at the examples in `main.yml` from this repo.
- To activate license: [readme](./request-activation/README.md).

## Credits

Huge thanks to
[gableroux](https://gableroux.com/)
for his docker [image](https://hub.docker.com/r/gableroux/unity3d/)
and gitlab-ci [example](https://gitlab.com/gableroux/unity3d).

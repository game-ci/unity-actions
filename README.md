# Unity Actions

[//]: # (TODO - Update to use the names of the workflows instead)

[![Actions status](https://github.com/WebberTakken/unity-actions/workflows/.github/workflows/main.yml/badge.svg)](https://github.com/WebberTakken/unity-actions/workflows/.github/workflows/main.yml/badge.svg)
[![Actions status](https://github.com/WebberTakken/unity-actions/workflows/.github/workflows/request.yml/badge.svg)](https://github.com/WebberTakken/unity-actions/workflows/.github/workflows/request.yml/badge.svg)

Github actions for testing and building Unity projects (WIP)

Feel free to contribute.

## Jobs

- [X] Checkout project
- [X] Activate license
- [X] Open project in Unity
- [ ] Install dependencies
- [ ] Perform test suite
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

- Activate license: [readme](./activate/README.md).

## Credits

Huge thanks to
[gableroux](https://gableroux.com/)
for his docker [image](https://hub.docker.com/r/gableroux/unity3d/)
and gitlab-ci [example](https://gitlab.com/gableroux/unity3d).

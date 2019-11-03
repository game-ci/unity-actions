# Unity Actions

Github actions for testing and building Unity projects (WIP)

Feel free to contribute.

## Jobs

- [ ] Checkout project
- [ ] Acquire license
- [ ] Open project in Unity
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

Add the following yaml to your workflow in `.github/workflows/main.yml`

```yaml
name: Testing and building my Unity project
on: push
jobs:
  test:
    name: Test

    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@master

      - name: Get license
        uses: webbertakken/unity-actions/get-license@master
        env:
          UNITY_USERNAME: ${{ secrets.UNITY_USERNAME }}
          UNITY_PASSWORD: ${{ secrets.UNITY_USERNAME }}

      - name: Test project
        uses: webbertakken/unity-actions/test@master
        env:
          FOLDER: .
          PLATFORM: playmode
```

## Credits

Huge thanks to
[gableroux](https://gableroux.com/)
for his docker [image](https://hub.docker.com/r/gableroux/unity3d/)
and gitlab-ci [example](https://gitlab.com/gableroux/unity3d).

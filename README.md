# Unity Actions
Github actions for testing and building Unity projects (WIP)

Feel free to contribute. 

## Jobs

- [ ] Checkout project
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
      - uses: actions/checkout@master
      - uses: webbertakken/unity-actions/test@master
        env:
          FOLDER: .
```

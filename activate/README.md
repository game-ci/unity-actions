# Activate Unity

Activates personal of professional license of unity.

## Usage

#### Personal license example

1. Goto `Repository` > `Settings` > `Secrets`
2. Create a new secret called `UNITY_LICENSE`
3. Find the license file:
    - Windows: `C:/ProgramData/Unity/Unity_lic.ulf`
    - MacOS: `/Library/Application Support/Unity/Unity_lic.ulf`
4. Copy the contents into the value field of the secret `UNITY_LICENSE`
5. Use the action as follows:

```yaml
- name: Activate Unity
  uses: webbertakken/unity-actions/activate@master
  env:
    UNITY_LICENSE: ${{ secrets.UNITY_LICENSE }}
```

#### Professional license example

1. Goto `Repository` > `Settings` > `Secrets`
2. Set the following secrets:
    - `UNITY_EMAIL`: &lt;your_unity_login_email_address&gt;
    - `UNITY_PASSWORD`: &lt;your_unity_login_password&gt;
    - `UNITY_SERIAL`: &lt;your_unity_serial&gt;
3. Use the action as follows:

```yaml
- name: Activate Unity
  uses: webbertakken/unity-actions/activate@master
  env:
    UNITY_EMAIL:    ${{ secrets.UNITY_EMAIL }}
    UNITY_PASSWORD: ${{ secrets.UNITY_PASSWORD }}
    UNITY_SERIAL:   ${{ secrets.UNITY_SERIAL }}
```

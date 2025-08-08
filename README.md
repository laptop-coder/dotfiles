> [!WARNING]
>
> Some code may be written in a hurry, so it has not been tested enough and may
> lead to unexpected behavior. DO NOT USE this repository (especially scripts)
> if you are not sure what you are doing.

# Wallpapers

## Manage (`wallpapers.py`)

1. Create new directory for wallpapers, e. g., `$HOME/wallpapers` and put
   wallpapers in it.
2. Make backup of the wallpapers, because you may lose them as a result of the
   script :)
3. Edit `.scripts/wallpapers.py` from this repo: specify full path to the
   created wallpapers directory (you can use the `HOME` env variable, see the
   code) in the `main()` function (directly in the script)
4. Create Python virtual environment and install `Pillow`, e. g.:
   ```sh
   python -m venv env
   . ./env/bin/activate
   pip install Pillow
   ```
5. Run `wallpapers.py` script. It will rename wallpapers with ordered numbers,
   then it will create blurred dimmed copies of the wallpapers for the lock
   screen. Now, after each time you add a new wallpaper, run this script.

> [!TIP]
>
> You can use `uv` instead of Python `venv`. Simply run the script with
> `uv run --with pillow wallpapers.py`

## Setup (`set_random_wallpaper.sh`)

1.  This script uses `swaybg` by default. If you are using something else, e.
    g., replace the following line in the script, where
    `$PATH_TO_RANDOM_WALLPAPER` is the image:

    ```sh
    swaybg -m fill -i $PATH_TO_RANDOM_WALLPAPER
    ```

2.  Make `.scripts/set_random_wallpaper.sh` executable, e. g.:

    ```sh
    chmod u+x .scripts/set_random_wallpaper.sh
    ```

3.  Add this script to the autostart, e. g. (for `niri`):

    ```kdl
    spawn-at-startup "~/.scripts/set_random_wallpaper.sh"
    ```

> [!NOTE]
>
> This script creates `lock_screen/current` in the wallpapers directory, so
> this is the blurred dimmed version of the current desktop wallpaper and you
> can use it, for example, in `hyprlock`. Just specify this file as the lock
> screen wallpaper:

```sh
background {
    color = rgb(0, 0, 0)
    path = $HOME/wallpapers/lock_screen/current
}
```

In conclusion, to add new wallpapers, you just need to put them in the
wallpapers directory and run the `wallpapers.py` script (don't forget to
activate the virtual environment if you use it).

> [!WARNING]
>
> This script in some cases leads to unexpected behavior. For example, if you
> removed some wallpapers and ran `wallpapers.py`, their lock screen copies
> will not be deleted.
>
> This happens because the script, during normal operation, simply overwrites
> the lock screen wallpaper, but does not delete it.
>
> Just delete all lock screen wallpapers, and the script will create them from
> scratch.

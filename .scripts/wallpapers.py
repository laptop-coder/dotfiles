from uuid import uuid4
import os
import logging
from PIL import Image, ImageFilter, ImageEnhance


logging.basicConfig(
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    level=logging.INFO,
)
logger = logging.getLogger(__name__)


def number(path: str) -> None:
    """
    This function takes the directory path as input and numbers all the files
    in it in order, starting with one. The function does not return anything.
    """
    logger.info("First iteration: random names")
    # First iteration: random names
    wallpapers = os.listdir(path)
    for file in wallpapers:
        if os.path.isfile(f"{path}/{file}"):
            name, ext = os.path.splitext(file)  # ext format is ".ext"
            new_name = uuid4()
            os.rename(f"{path}/{name}{ext}", f"{path}/{new_name}{ext}")
            logger.info(f"{name}{ext} \u2192 {new_name}{ext}")
    i = 0
    logger.info("Second iteration: numbering")
    # Second iteration: numbering
    wallpapers = os.listdir(path)
    for file in wallpapers:
        if os.path.isfile(f"{path}/{file}"):
            i += 1
            name, ext = os.path.splitext(file)
            os.rename(f"{path}/{name}{ext}", f"{path}/{i}{ext}")
            logger.info(f"{name}{ext} \u2192 {i}{ext}")


def create_lock_screen_wallpapers(path: str) -> None:
    """
    IMPORTANT:
    1. All files in the specified directory must be images.
    2. Pillow (or ImageMagick, see below) must be installed
    This function takes the path to a directory with wallpapers and creates a
    "lock_screen" directory in it, where it puts blurred and dimmed copies of
    images. The function does not return anything.
    """

    path_to_lock_screen = f"{path}/lock_screen"
    if not os.path.exists(path_to_lock_screen):
        os.mkdir(path_to_lock_screen)

    wallpapers = os.listdir(path)
    logger.info("Third iteration: creating blurred and dimmed copies of wallpapers")
    for file in wallpapers:
        if os.path.isfile(f"{path}/{file}"):
            # You can use ImageMagick instead of Pillow, but this code below is
            # UNSAFE (because of os.system()) and SLOW
            #
            # command = (
            #     f"magick {path}/{file} -blur 0x30 -fill black "
            #     + f"-colorize 60% {path_to_lock_screen}/{file}"
            # )
            # os.system(command)
            source_img = Image.open(f"{path}/{file}")
            blurred_img = source_img.filter(ImageFilter.GaussianBlur(radius=35))
            enhancer = ImageEnhance.Brightness(blurred_img)
            dimmed_img = enhancer.enhance(0.5)  # the value from 0 to 1
            dimmed_img.save(f"{path_to_lock_screen}/{file}")

            logger.info(f"Created {path_to_lock_screen}/{file}")


def main():
    # ─────EDIT─THIS───────────────────────────────────────────────────────────
    HOME = os.getenv("HOME")
    if HOME is None:
        logger.error("The HOME env variable is not set")
        print("Exiting.")
        return
    # Full path to the directory with wallpapers
    PATH_TO_WALLPAPERS = HOME + "/wallpapers"
    # ─────────────────────────────────────────────────────────────────────────

    user_confirm_msg = (
        "Please make a backup of wallpapers and specify the "
        + "full path to them (directly in the main function "
        + 'of this script). If you are ready, print "y": '
    )
    user_confirm = input(user_confirm_msg)
    if not user_confirm == "y":
        print("Exiting.")
        return
    number(PATH_TO_WALLPAPERS)
    create_lock_screen_wallpapers(PATH_TO_WALLPAPERS)
    logger.info("Done. Have a nice day!")


if __name__ == "__main__":
    main()

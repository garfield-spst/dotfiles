import sys
import subprocess
import importlib

from libqtile.confreader import Config, ConfigError
from libqtile.command import lazy
from libqtile.xkeysyms import keysyms
from libqtile.core.xcore import XCore


# python package 'regex' is required
# will fail gracefully if it is not importable, see validate_config
def find_similar_keys(key):
    import regex

    regexp = regex.compile(r"({}{{e<{}}})".format(key, len(key)), regex.IGNORECASE)
    similar_keys = []
    for qtile_key in keysyms.keys():
        if regexp.match(qtile_key):
            similar_keys.append(qtile_key)
    if not similar_keys:
        return "No key similar to '{}' could be found in libqtile.xkeysyms.keysyms :/".format(
            key
        )
    if len(similar_keys) == 1:
        return "Maybe you meant '{}'?".format(similar_keys[0])
    return "Maybe you meant '{}', or '{}'?".format(
        "', '".join(similar_keys[:-1]), similar_keys[-1]
    )


def validate_config():
    output = [
        "The configuration file '",
        __file__,
        "' generated the following error:\n\n",
    ]

    try:
        # mandatory: we must reload the module (the config file was modified)
        importlib.reload(sys.modules[__name__])
        Config.from_file(XCore(), __file__)

    except ConfigError as error:
        output.append(str(error))

        # handle the case when a key is erroneous
        # more cases could be handled maybe
        if str(error).startswith("No such key"):
            output.append("\n\n")
            key = str(error).replace("No such key: ", "")
            try:
                similar_keys = find_similar_keys(key)
            except ImportError:
                output.append("Install 'regex' if you want to see valid similar keys")
            else:
                output.append(similar_keys)
        raise ConfigError("".join(output))

    except Exception as error:
        # here we handle SyntaxError and the likes
        output.append("{}: {}".format(sys.exc_info()[0].__name__, str(error)))
        raise ConfigError("".join(output))


@lazy.function
def validate_and_restart(qtile):
    try:
        validate_config()
    except ConfigError as error:
        # adapt to fit your needs: here I pop a system notification with the error
        subprocess.call(["notify-send", "-t", "10000", str(error)])
    else:
        qtile.cmd_restart()


keys = [
    Key(["mod4", "control"], "r", validate_and_restart),
]


if __name__ == "__main__":
    try:
        validate_config()
    except ConfigError as error:
        print(str(error), file=sys.stderr)
        sys.exit(1)
    else:
        print("OK!")
        sys.exit(0)

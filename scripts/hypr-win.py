#!/usr/bin/env python3

import subprocess
import json
import asyncio

# Dictionary to store window origins
_windows_origins: dict[str, str] = {}

# Define the fuzzel command
fuzzel_menu = [
    "fuzzel",
    "--dmenu",
    "-p",
    "Select window: ",
    "--font=JetBrainsMono:weight=Bold:size=25",
    "--width=25",
]


async def hyprctl(command: str):
    """Run hyprctl command and return output."""
    result = subprocess.run(
        ["hyprctl"] + command.split(), capture_output=True, text=True
    )
    return result.stdout


async def get_active_workspace():
    """Get the name of the active workspace."""
    output = await hyprctl("activeworkspace -j")
    data = json.loads(output)
    return data["name"]


async def get_clients(exclude_workspace=None):
    """Retrieve a list of open windows."""
    output = await hyprctl("clients -j")
    clients = json.loads(output)
    if exclude_workspace:
        clients = [c for c in clients if c["workspace"]["name"] != exclude_workspace]
    return clients


async def run_fuzzel_menu(options: list[str]) -> str:
    """Display options using fuzzel and return the user's choice."""
    process = subprocess.Popen(
        fuzzel_menu, stdin=subprocess.PIPE, stdout=subprocess.PIPE
    )
    stdout_data, _ = process.communicate(input="\n".join(options).encode())
    return stdout_data.decode().strip()


async def run_fetch_client_menu():
    """Select a client window and move it to the active workspace."""
    active_workspace = await get_active_workspace()

    clients = await get_clients(exclude_workspace=active_workspace)

    # Configuration for display separator
    separator = "|"

    # Display windows using fuzzel
    window_list = [f"{i + 1} {separator} {c['title']}" for i, c in enumerate(clients)]
    choice = await run_fuzzel_menu(window_list)

    if choice:
        num = int(choice.split(None, 1)[0]) - 1
        addr = clients[num]["address"]
        _windows_origins[addr] = clients[num]["workspace"]["name"]
        await hyprctl(f"movetoworkspace {active_workspace},address:{addr}")


async def run_unfetch_client():
    """Return a window back to its origin."""
    output = await hyprctl("activewindow -j")
    data = json.loads(output)
    addr = data["address"]

    try:
        origin = _windows_origins[addr]
    except KeyError:
        print("Unknown window origin")
    else:
        await hyprctl(f"focuswindow {origin},address:{addr}")


async def main():
    # You can choose to run fetch or unfetch client based on some condition or input
    await run_fetch_client_menu()
    # Uncomment the following line to test returning a window to its origin
    # await run_unfetch_client()


if __name__ == "__main__":
    asyncio.run(main())

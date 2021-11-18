# ftpd

FTP Server for 3DS/Linux.

## Features

- Appears to work well with a variety of clients.
- Supports multiple simultaneous clients. The 3DS itself only appears to support enough sockets to perform 4-5 simultaneous data transfers, so it will help if you limit your FTP client to this many parallel requests.
- Cutting-edge [graphics](#dear-imgui).

- Exit on 3DS with START button


- Toggle backlight on 3DS with SELECT button


- Emulation of a /dev/zero (/devZero) device for network performance testing
  - Example retrieve `curl ftp://192.168.1.115:5000/devZero -o /dev/zero`
  - Example send `curl -T /dev/zero ftp://192.168.1.115:5000/devZero`

## Dear ImGui

ftpd uses [Dear ImGui](https://github.com/ocornut/imgui) as its graphical backend.

Standard Dear ImGui controller inputs are supported.

- A
  - Activate/Open/Toggle
  - Tweak value with D-Pad (+ L/R to tweak slower/faster)
- B
  - Cancel/Close/Exit
- X
  - Edit text / on-screen keyboard
- Y
  - Tap: Toggle menu
  - Hold + L/R: Focus windows
- Left Stick
  - Scroll
  - Move window (when holding Y)
- D-Pad
  - Move
  - Tweak values (when activated with A)
  - Resize window (when holding Y)

## Latest Builds

CIA: https://github.com/raventhecat333/ftpd/releases/latest/ftpd.cia

3DSX: https://github.com/raventhecat333/ftpd/releases/latest/ftpd.3dsx


CIA QR Code

![ftpd.cia](https://github.com/raventhecat333/ftpd/raw/master/ftpd-qr.png)

## Classic Builds WARNING THESE WILL LIKELY BE DEPRICATED

Classic builds use a console instead of Dear ImGui.

CIA: https://github.com/raventhecat333/ftpd/releases/latest/ftpd-classic.cia

3DSX: https://github.com/raventhecat333/ftpd/releases/latest/ftpd-classic.3dsx

CIA QR Code

![ftpd-classic.cia](https://github.com/raventhecat333/ftpd/raw/master/ftpd-classic-qr.png)

## Build and install

You must set up the [development environment](https://devkitpro.org/wiki/Getting_Started).


### 3DSX

The following pacman packages are required to build `3ds/ftpd.3dsx`:

    3dstools
    devkitARM
    libctru

They are available as part of the `3ds-dev` meta-package.

Build `3ds/ftpd.3dsx`:

    make 3dsx

## Supported Commands

- ABOR
- ALLO (no-op)
- APPE
- CDUP
- CWD
- DELE
- FEAT
- HELP
- LIST
- MDTM
- MKD
- MLSD
- MLST
- MODE (no-op)
- NLST
- NOOP
- OPTS
- PASS (no-op)
- PASV
- PORT
- PWD
- QUIT
- REST
- RETR
- RMD
- RNFR
- RNTO
- SITE
- SIZE
- STAT
- STOR
- STRU (no-op)
- SYST
- TYPE (no-op)
- USER (no-op)
- XCUP
- XCWD
- XMKD
- XPWD
- XRMD

## Planned Things
- poking at 

## SITE commands

- Show help:    SITE HELP
- Set username: SITE USER <NAME>
- Set password: SITE PASS <PASS>
- Set port:     SITE PORT <PORT>
- Set getMTime*: SITE MTIME [0|1]
- Save config:  SITE SAVE

*getMTime only on 3DS. Enabling will give timestamps at the expense of slow listings.

# rpi-bluetooth-audio-player
Bluetooth audio streamer for any audio device using a Raspberry Pi based on [balena-sound](https://github.com/balena-io-projects/balena-sound/)

# installation
```bash
$ git clone https://github.com/AdityaTelange/rpi-bluetooth-audio-player
$ cd rpi-bluetooth-audio-player
$ sudo bash install.sh
```
And you are ready to Stream Music from your Device to Rpi

# uninstalling
```bash
$ sudo bash uninstall.sh
```
note: does not remove [installed apt packages](https://github.com/AdityaTelange/rpi-bluetooth-audio-player/blob/531e8d023a56a7c2654954ff2bf6248df41af0c9/install.sh#L12)

# Testing

Tested on _Raspbery-Pi-3 Model B_ with _Diet-Pi_ installed
one has to enable Bluetooth in 

```dietpi-config -> 4  : Advanced Options -> Bluetooth```

# caracol_frontend

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# caracol_frontend
To connect to caracol_backend server you need to do the following:
IF using an AVD:
  1. Change the url of the requests on the http functions to: 10.0.2.2
IF using physical device to debug:
  1. Use wifi
  2. Connect the phone and computer to the same wifi network
  3. Get your ip address from the wireless device on the computer, ip addr if using linux, try with the one that resembles wlxx.
  4. Replace that ip address as so: 192.168.1.xx:3000

<p align="center">
  <a href="" rel="noopener">
 <img width="250px" src="https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png" alt="Project logo"></a>
 &nbsp;
 <img width="250px" src="https://cloud.boltiot.com/static/images/logo.png" alt="Bolt logo"></a>
</p>
<h3 align="center">Home Automation</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![Platform](https://img.shields.io/badge/platform-flutter-lightgrey)]()
[![GitHub Issues](https://img.shields.io/github/issues/SahilKr24/boltiot-control-app)](https://github.com/SahilKr24/boltiot-control-app/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/SahilKr24/boltiot-control-app)](https://github.com/SahilKr24/boltiot-control-app/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>


---

<p align="center"> A Flutter App to control digital pins on bolt module using api-key and device id
    <br> 
</p>

## 📝 Table of Contents

- [Idea](#idea)
- [Dependencies](#limitations)
- [Future Scope](#future_scope)
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Technology Stack](#tech_stack)
- [Authors](#authors)
- [Acknowledgments](#acknowledgments)

## 💡 Idea / Solution <a name = "idea"></a>

The idea behind this app was to enable users to implement the functionality of Bolt IOT without having to login into the Bolt cloud everytime and by streamlining the use of API through the help of an Android app and not relying upon the Bolt IOT app or cloud services that require prior knowledge of HTML CSS and JS to implement.

There are two versions of the app:

- One vision relies upon API key and Device ID which is stored locally on the device which can be used to trigger one of the four pins on the Bolt module that is 1, 2, 3 and 4 respectively.
- The second version relies upon the use of an handwritten API that is hosted in any of the cloud platforms such as ec2 or heroku. The need for such was eminent because the Bolt cloud does not store the state of the pins in which they were triggered so this custom API that sits between the app and the original Bolt API helps in saving the state at which the pins are, thus when you re-open the app you can again get back the state at which you have left it the last time and also enable custom JS functions to automate stuff.

Depending upon the need, the users can either opt for the **API + Device ID** version on the **master** branch or the **custom API version** on the **API based** branch that could require additional deployment on web service which can be found in the GIT repository linked here.[Bolt-API](https://github.com/SahilKr24/bolt_api)
 

## ⛓️ Dependencies / Limitations <a name = "limitations"></a>

-The app depends upon the axios module to make http requests to either the Bolt API on the custom API hosted and then processes the responses to store the state in a local variable which is then displayed on the user interaction screen.
-Users can also customise and setup custom scenes which can act as macros for larger tasks such as managing all the four pins at once thus reducing the number of API calls which is limited by the Bolt cloud.
-Currently if the Bolt module is restarted it loses its state.

## 🚀 Future Scope <a name = "future_scope"></a>

In a future update, we will include custom scripts that will enable the bolt module to reinitialise to the state it had last saved thus reducing the impact of power loss.

## 🏁 Getting Started <a name = "getting_started"></a>

Download the app as per your needs from the release section and install it on your Android device. Depending on the version you selected, you will either need to enter the API key and the Device ID or custom API host URL and the port number.

## 🎈 Usage <a name="usage"></a>

The interface of the app is fairly simple, you just have to tap on one of the big grey buttons on the app home screen to Trigger the pins on or off in the order 1, 2, 3 and 4.

## ⛏️ Built With <a name = "tech_stack"></a>

- [Flutter](https://flutter.dev/) - Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.

## ✍️ Authors <a name = "authors"></a>

- [@SahilKr24](https://github.com/SahilKr24) - Idea & Coding
- [@RKRohk](https://github.com/Rkrohk) - Coding & Bug Fixes

See also the list of [contributors](https://github.com/kylelobo/The-Documentation-Compendium/contributors)
who participated in this project.

## 🎉 Acknowledgments <a name = "acknowledgments"></a>

- [BOLT API](https://docs.boltiot.com/docs/introduction)
- [BOLT FOURM](https://forum.boltiot.com/)
- [BOLT CLOUD](https://cloud.boltiot.com/)

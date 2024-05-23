## iOS MVVM Project

### Project Overview

This project aimed to create an iOS application that meets specific specifications using various technologies, unit tests and follows the MVVM architecture.

### Project Specifications

#### Features:

- Application includes a Toolbar and a Side menu.
- Side menu contains 4 items: Home, Users, TODOs, About us.
- Home screen displays a feed of posts obtained from the provided API.
- Users screen displays a feed of users obtained from the provided API.
- TODOs screen displays a feed of TODOs obtained from the provided API.
- Users details screen shows details of a selected user and allows interactions such as deleting the user, showing posts, comments, and TODOs.
- Validation of information screen validates user input in text fields before enabling the submit button.


#### Project Technologies:

- Swift Programming language
- Alamofire networking
- SwiftUI
- Combine
- Protocol Oriented Programming
- Concurrency (async/await)
- MVVM Architecture
- Generics
- Error Handling
- Unit Tests
- Swift Snapshot Testing for snapshot tests
- Swinject for dependency injection from graphs

### Additional Notes

- Navigation and design were implemented using SwiftUI.
- The application works only online, without using cache.
- Unit testing was performed on multiple screens (ViewModel) using non-instrumented XCTest to test the states of a screen using MVVM.
- Unit testing coverage over **90%** for tested ViewModels.
- Snapshot testing was implemented using Swift Snapshot Testing for UI testing.
- Swinject was used for dependency injection from graphs.
- The application allows the deletion of users, triggering a DELETE request to the API, and refreshing the user list afterwards.

### How to Run the Project

To run the project, follow these steps:

1. Clone the project repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on a simulator or device with a minimum iOS version of 17.

### Acknowledgments

This project was completed as part of the internship at Netcompany-Intrasoft. We would like to acknowledge the guidance and support provided by Dimitris Tsiflitzis, as well as the instructors and mentors during the project.

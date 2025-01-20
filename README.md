# snag_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Run
```dart pub run build_runner build```
to build model stuff

## Might be needed according to chatGPT
- SQLite
a relational data storage that can store local things? i think but by the sounds of it online?
existing package for flutter

- Hive
A NoSQL solution which works offline. This might be the better option, although SQL would be nice


- Use json_serializable instead of manually creating from and to Json functions



## Outline

user downloads the app for the first time.
User is prompted with a message "Are you a contractor or a client?"
User selects contractor
User is transferred to project list screen.
No projects are shown
Text in the middle saying no projects yet, and guides the user to create one
User clicks the add project button.
A new screen appears of the project creation.
User is prompted to enter the name and other details of the project. All are optional
User is transferred to project view, which shows all 'snags', and light details of the project.
User can create a new snag by pressing the add snag button.
User is transferred to snag creationg screen.
The user can upload or take a photo(s), name the snag, add description, location, priority, assignee, tags etc...
After saving snag user is returned to project view page.


### Main View
- Project List view
In this view there will be a title bar, with title Project List, and a settings button on the top right side
Under the title bar, there will be a body component, which will hold the project's components.
In the top part of the body component there will be a sliding menu bar for the statuses.
    i.e. All, To do, Working on / In Progress, Resolved, Unresolved
Clicking the status will display a list of the snags under that status

! will need a way to filter by categories 'epics' not only the status



## Project Settings view
When creating the project, at the bottom there will be an "Advanced" area for modification.
Here the user creates the different categories among other stuff. 







## How it works

The UI calls the controller
the controller calls the repository
the repository manages the model state
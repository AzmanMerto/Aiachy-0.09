# File Structure
* Aiachy
    * App
    - In this app folder, there is the app's initializer, AppDelegate, and the heart of the application called AiachyState.
    * VIPER
    - We are using the VIPER architecture here, which stands for View Interactor Presenter Entity Router. These components are organized into different folders, and if you're familiar with them, you'll understand their roles. In our app, we primarily rely on the Router for handling navigation instead of using NavigationView. After the Splash view, everything is controlled by the Router
    * Helper
    - We don't want to populate the VIPER folder with certain files, and we also handle asset values under the Handler and Helper folders.
    * Service
    - I process the local and online services I use here.
    * Resource
    - The necessary files such as assets, languages, and fonts are located here.
    * ReadMe
    - Thats the map and versions. Just check there
* AiachyUITests
* AiachyTests

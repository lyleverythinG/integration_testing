# integration_testing
_This app shows how to do integration testing in Flutter. App also uses Bloc design pattern and Firebase services_.


Important Information:
- Read the TODO in the main.dart if you want to setup and run the app.
- Integration tests are the highest-level testing technique available in Flutter. This type of test provides the highest level of confidence.
- find.byKey - this means find the particular widget with the particular key name.
- find.text - this means find the widget with the particular text.
- tester.enterText - this means to enter a text value in a textfield, textformfield, or in an editable text.
- tester.pump() - this method is to trigger a single frame for the test. Note: If multiple frames are needed(Ex.animations), use tester.pumpAndSettle() instead.

- Packages Used:
    cupertino_icons: ^1.0.2
    firebase_core: ^1.10.0
    firebase_auth: ^3.2.0
    firebase_storage: ^10.1.0
    cloud_firestore: ^3.0.0
    flutter_bloc: ^8.0.1
    provider: ^6.0.0
    equatable: ^2.0.3
    fluttertoast: ^8.0.9
- Packages Used for Testing:
    integration_test:
    flutter_test:
- After Firebase and project setup, DO THIS:
    Run the app first and create an account
    Once a user account is created, stop the app.
    //Changed the email in integration_test/app_test.dart file into the email of the account you've created.
    Example:
    await tester.enterText(emailLoginField, 'testt@gmail.com');
    //Changed the password in integration_test/app_test.dart file into the password of the account you've created.
    Example:
    await tester.enterText(passwordLoginField, '1234567!!');
 

# App Demo
https://user-images.githubusercontent.com/75658617/209923448-c6b86310-ab0e-45f9-a8db-7afe6d204b92.mp4


# Testing Demo
https://user-images.githubusercontent.com/75658617/209923605-536c1eae-4baf-4954-8926-f42b258cfb17.mp4




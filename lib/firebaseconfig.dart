// Import the functions you need from the SDKs you need
import 'package:firebase_core/firebase_core.dart';
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  "apiKey": "AIzaSyATBowlwkvchyRcpVhO0j5K51g6mv-WN8o",
  "authDomain": "gestionnaire-tache333.firebaseapp.com",
  "projectId": "gestionnaire-tache333",
  "storageBucket": "gestionnaire-tache333.appspot.com",
  "messagingSenderId": "170630877696",
  "appId": "1:170630877696:web:2aa96f4fecdc132f7cbee5"
};

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: firebaseConfig["apiKey"]!,
      authDomain: firebaseConfig["authDomain"]!,
      projectId: firebaseConfig["projectId"]!,
      storageBucket: firebaseConfig["storageBucket"]!,
      messagingSenderId: firebaseConfig["messagingSenderId"]!,
      appId: firebaseConfig["appId"]!,
    ),
  );
}
const firebase = require('firebase-admin');
const fr = require('face-recognition');

firebase.initializeApp({
	apiKey: "AIzaSyAFGJjHp3LeLeO2NwpPTqkFWCgi8tnH6kE",
	authDomain: "makestagram-de700.firebaseapp.com",
	databaseURL: "https://makestagram-de700.firebaseio.com",
	projectId: "makestagram-de700",
	storageBucket: "makestagram-de700.appspot.com",
	messagingSenderId: "329513841758"
});

const database = firebase.database();

const detector = fr.FaceDetector();
const recognizer = fr.FaceRecognizer();

database.ref('posts').on('child_added', function(snapshot) {
	console.log(snapshot.ref)
});
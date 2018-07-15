const functions = require('firebase-functions');
const firebase = require('firebase-admin');
const fr = require('face-recognition');

const detector = fr.FaceDetector();
const recognizer = fr.FaceRecognizer();

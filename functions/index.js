const functions = require('firebase-functions');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.onCreate = functions.database.ref('/posts').onUpdate(function snapshot() {
  return console.log(snapshot)
})

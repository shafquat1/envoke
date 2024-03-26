const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("users/" + user.uid);
  await firestore
    .collection("memories")
    .where("user_id", "==", user.uid)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        await doc.ref
          .collection("moments")
          .get()
          .then(async (q) => {
            for (var d of q.docs) {
              console.log(`Deleting document ${d.id} from collection moments`);
              await d.ref.delete();
            }
          });
      }
    });
  await firestore.collection("users").doc(user.uid).delete();
  await firestore
    .collection("memories")
    .where("user_id", "==", user.uid)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection memories`);
        await doc.ref.delete();
      }
    });
});

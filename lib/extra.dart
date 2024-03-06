// Future<String> uploadImageToStorage(File imageFile) async {
//   Reference referenceStorage = FirebaseStorage.instance
//       .ref()
//       .child("Profile Images")
//       .child(FirebaseAuth.instance.currentUser!.uid);
//   UploadTask task = referenceStorage.putFile(imageFile);
//   TaskSnapshot snapshot = await task;
//   String downloadUrlOfImage = await snapshot.ref.getDownloadURL();
//   return downloadUrlOfImage;
// }
// String UrlofDownloadedImage = await uploadImageToStorage(Dp);
//
//
// PersonModel.Person personInstance = PersonModel.Person(
//   Uid: FirebaseAuth.instance.currentUser!.uid,
//   Dp: UrlofDownloadedImage,
//   email: email,
//   name: name,
//   mobileno: mobileno,
//   password: password,
// );
// await FirebaseFirestore.instance
//     .collection("users")
// .doc(FirebaseAuth.instance.currentUser!.uid)
// .set(personInstance.toJson());
//
//
//
//
//
//
// checkIfUserIsLoggedIn(User? currentuser) {
//   if (currentuser == null) {
//     Get.to(firstscreen());
//   } else {
//     Get.to(Dashboard());
//   }
// }
//
// @override
// void onReady() {
//   super.onReady();
//   firebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
//   firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());
//   ever(firebaseCurrentUser, checkIfUserIsLoggedIn);
// }
//
//
// Obx(() {
// return Expanded(
// child: PageView.builder(
// itemCount: profileController.allUsersProfileList.length,
// controller:
// PageController(initialPage: 0, viewportFraction: 1),
// scrollDirection: Axis.horizontal,
// itemBuilder: (context, index) {
// final eachProfileInfo =
// profileController.allUsersProfileList[index];
// return DecoratedBox(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: NetworkImage(eachProfileInfo.Dp.toString()),
// fit: BoxFit.cover,
// )));
// }),
// );
// }),
//

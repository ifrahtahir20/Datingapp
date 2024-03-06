import 'package:flutter/material.dart';
import '../Hive databse/data record.dart';

class UserDetailsScreen extends StatelessWidget {
  final Person user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(user.name?.toUpperCase() ?? 'User Details'),
      ),
      body: Container(
        // padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 350.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: user.Dp != null
                      ? MemoryImage(user.Dp!)
                      : AssetImage('assets/default_avatar.png')
                          as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Name: ${user.name ?? ''}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.0),
            Text('Contact No: ${user.mobileno ?? ''}'),
            SizedBox(height: 15.0),
            Text('Gender: ${user.gender ?? ''}'),
            SizedBox(height: 15.0),
            Text('Age: ${user.age ?? ''}'),
            SizedBox(height: 15.0),
            Text('Marital Status: ${user.maritalStatus ?? ''}'),
            SizedBox(height: 15.0),
            Text('Education: ${user.education ?? ''}'),
            SizedBox(height: 15.0),
            Text('City: ${user.city ?? ''}'),
            SizedBox(height: 15.0),
            Text('Height: ${user.height ?? ''}'),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../Hive databse/data record.dart';
//
// class UserDetailsScreen extends StatelessWidget {
//   final Person user;
//
//   const UserDetailsScreen({Key? key, required this.user}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(user.name?.toUpperCase() ?? 'User Details'),
//       ),
//       body: Container(
//         //padding: EdgeInsets.all(10),
//         child: Center(
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 350.0,
//                 decoration: BoxDecoration(
//                   // shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: user.Dp != null
//                         ? MemoryImage(user.Dp!)
//                         : AssetImage('assets/default_avatar.png')
//                             as ImageProvider,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 'Name: ${user.name ?? ''}',
//                 style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 15.0),
//               Text('Contact No: ${user.mobileno ?? ''}'),
//               SizedBox(height: 15.0),
//               Text('Gender: ${user.mobileno ?? ''}'),
//               SizedBox(height: 15.0),
//               Text('Age: ${user.mobileno ?? ''}'),
//               SizedBox(height: 15.0),
//               Text('Marital Status: ${user.mobileno ?? ''}'),
//               SizedBox(height: 15.0),
//               Text('Education: ${user.mobileno ?? ''}'),
//               SizedBox(height: 15.0),
//               Text('City: ${user.mobileno ?? ''}'),
//               SizedBox(height: 15.0),
//               Text('Height: ${user.mobileno ?? ''}'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}

class ProfileScreen extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: "Friend 1", imageUrl: 'assets/friend1.jpg'),
    Friend(name: "Friend 2", imageUrl: 'assets/friend2.jpg'),
    Friend(name: "Friend 3", imageUrl: 'assets/friend3.jpg'),
    Friend(name: "Friend 4", imageUrl: 'assets/friend4.jpg'),
    Friend(name: "Friend 5", imageUrl: 'assets/friend5.jpg'),
    Friend(name: "Friend 6", imageUrl: 'assets/friend6.jpg'),
    Friend(name: "Friend 7", imageUrl: 'assets/friend7.jpg'),
    // Add more friends as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/png.png'),
              radius: 100,
            ),
            Text(
              "yaseen",
              style: TextStyle(fontSize: 34),
            ),
            Text(
              "yaseen@gmail.com",
              style: TextStyle(fontSize: 34),
            ),
            Text(
              "16/7/2009",
              style: TextStyle(fontSize: 34),
            ),
            SizedBox(height: 30), // Add spacing between profile info and friends list
            Text(
              "Friends List",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: friends.length,
                itemBuilder: (BuildContext context, int index) {
                  return FriendListItem(
                    friend: friends[index],
                    onPhotoTap: () {
                      // Implement the action you want to perform when a friend's photo is tapped.
                      // For example, you can open a detailed view of the friend's profile.
                      print("Tapped on ${friends[index].name}'s photo.");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Friend {
  final String name;
  final String imageUrl;

  Friend({required this.name, required this.imageUrl});
}

class FriendListItem extends StatelessWidget {
  final Friend friend;
  final VoidCallback? onPhotoTap;

  const FriendListItem({
    required this.friend,
    this.onPhotoTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: onPhotoTap,
        child: CircleAvatar(
          backgroundImage: AssetImage(friend.imageUrl),
          radius: 30, // Adjust the size of the photo
        ),
      ),
      title: Text(friend.name),
    );
  }
}

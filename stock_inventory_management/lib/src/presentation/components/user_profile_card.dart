import 'package:flutter/material.dart';

class UserProfileCard extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  const UserProfileCard(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.address});

  @override
  State<UserProfileCard> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.transparent),
                    image: const DecorationImage(
                      image: AssetImage('images/yomi2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black)),
                  Text(widget.email,
                      style: const TextStyle(fontSize: 18, color: Colors.grey)),
                  Text(widget.phone,
                      style: const TextStyle(fontSize: 18, color: Colors.grey)),
                  Text(widget.address,
                      style: const TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFCE7128),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('View Detail'),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}

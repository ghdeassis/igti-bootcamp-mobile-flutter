import 'package:flutter/material.dart';
import 'package:social_app/components/custom_drawer.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/service/placeholder_service.dart';

import 'comments.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final PlaceholderService _placeholderService = PlaceholderService();

  //List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    /*_placeholderService.getPosts().then((resp) {
      setState(() {
        _posts = resp;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Feed'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.white70,
        child: FutureBuilder<List<Post>>(
          future: _placeholderService.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Comments(snapshot.data[index].id)));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                                title: Text('${snapshot.data[index].title}'),
                                subtitle: Text('${snapshot.data[index].body}')),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('erro');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

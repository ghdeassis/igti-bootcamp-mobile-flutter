import 'package:flutter/material.dart';
import 'package:social_app/models/comment.dart';
import 'package:social_app/service/placeholder_service.dart';

class Comments extends StatelessWidget {
  final _placeholderService = PlaceholderService();

  final int postId;

  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text('Comentários'),
            centerTitle: true
        ),
        body: Container(
            color: Colors.white70,
            child: FutureBuilder<List<Comment>>(
              future: _placeholderService.getComments(postId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('${snapshot.data[index].name}'),
                              subtitle: Text('${snapshot.data[index].email}'),
                            ),
                            ListTile(
                              title: Text('${snapshot.data[index].body}')
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                }
                return Center(
                    child: CircularProgressIndicator()
                );
              },
            )
        )
    );
  }
}

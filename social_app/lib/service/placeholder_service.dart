import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/models/comment.dart';

class PlaceholderService {
  final baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    var response = await http.get('$baseUrl/posts');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var posts = objs.map((obj) => Post.fromJson(obj)).toList();
      return posts;
    } else {
      throw Exception('Erro ao buscar posts');
    }
  }

  Future<User> getPerfil() async {
    var response = await http.get('$baseUrl/users/1');
    if (response.statusCode == 200) {
      var user = User.fromJson(jsonDecode(response.body));
      return user;
    } else {
      throw Exception('Erro ao buscar perfil do usuário.');
    }
  }

  Future<List<Comment>> getComments(int postId) async {
    var response = await http.get('$baseUrl/posts/$postId/comments');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var comments = objs.map((obj) => Comment.fromJson(obj)).toList();
      return comments;
    } else {
      throw Exception('Erro ao buscar comentários');
    }
  }
}
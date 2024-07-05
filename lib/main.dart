import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:news_api_app/components/customListTile.dart';
import 'package:news_api_app/model/article_model.dart';
import 'package:news_api_app/services/api_service.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BounceIn(
                  child: Image.asset(
                    'assets/news.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(height: 16),
                FadeIn(
                  child: Text(
                    'News App',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideInUp(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Made by Bhaswanth',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = _fetchArticles();
  }

  Future<List<Article>> _fetchArticles() async {
    return client.getArticle();
  }

  Future<void> _refresh() async {
    setState(() {
      futureArticles = _fetchArticles();
    });
  }

  void _exitApp() {
    if (Platform.isAndroid || Platform.isIOS) {
      exit(0);
    } else {
      print("Exit not supported on this platform.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 175, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('assets/26.jpg'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        ' Bhaswanth',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        ' bhaswanth@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: _exitApp,
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: futureArticles,
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading articles'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No articles available'),
              );
            } else {
              List<Article> articles = snapshot.data!;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) => customListTile(articles[index], context),
              );
            }
          },
        ),
      ),
    );
  }
}

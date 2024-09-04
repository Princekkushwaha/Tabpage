import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages for BottomNavigationBar
  final List<Widget> _pages = [
    const PostTab(postType: 'Text', content: 'This is a sample text post.'),
    const PostTab(
        postType: 'Image',
        content:
            'https://cdn.pixabay.com/photo/2023/10/10/15/37/motorcycle-8306765_1280.jpg'),
    const PostTab(
        postType: 'Video',
        content: 'https://youtu.be/n_FCrCQ6-bA?si=yZrkI_ebfn2S_OR-'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Tabs'),
        // backgroundColor: Colors.cyanAccent,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Image Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Video Page',
          ),
        ],
      ),
    );
  }
}

class PostTab extends StatelessWidget {
  final String postType;
  final String content;

  const PostTab({super.key, required this.postType, required this.content});

  void _sharePost() {
    String url;
    if (postType == 'Text') {
      url = 'https://example.com/text-post';
    } else if (postType == 'Image') {
      url =
          'https://cdn.pixabay.com/photo/2023/10/10/15/37/motorcycle-8306765_1280.jpg';
    } else if (postType == 'Video') {
      url = 'https://youtu.be/n_FCrCQ6-bA?si=yZrkI_ebfn2S_OR-';
    } else {
      url = '';
    }
    Share.share('Check out this $postType post: $url');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (postType == 'Text')
            Text(
              content,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          if (postType == 'Image') Image.network(content),
          if (postType == 'Video')
            Container(
              width: 300,
              height: 250,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Video Placeholder',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyanAccent,
            ),
            onPressed: _sharePost,
            child: const Text(
              'Share Post',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

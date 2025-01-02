import 'package:flutter/material.dart';
import 'dio_client.dart';

class MelodyMakerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MelodyMaker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MusicScreen(),
    );
  }
}

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final DioClient _dioClient = DioClient();
  List<dynamic> _songs = [];
  bool _loading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchSongs();
  }

  Future<void> _fetchSongs() async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      final response = await _dioClient
          .get('/songs'); // Replace `/songs` with your API endpoint
      setState(() {
        _songs = response.data;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load songs. Please try again later.';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _addSong(String title, String artist) async {
    try {
      await _dioClient.post('/songs', data: {
        'title': title,
        'artist': artist,
      });
      _fetchSongs(); // Refresh the song list
    } catch (e) {
      print('Failed to add song: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MelodyMaker'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : ListView.builder(
                  itemCount: _songs.length,
                  itemBuilder: (context, index) {
                    final song = _songs[index];
                    return ListTile(
                      title: Text(song['title']),
                      subtitle: Text(song['artist']),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addSong(
              'New Song', 'Unknown Artist'); // Example of adding a new song
        },
      ),
    );
  }
}

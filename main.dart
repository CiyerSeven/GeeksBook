import 'package:flutter/material.dart';

void main() {
  runApp(const GeeksBookApp());
}

class GeeksBookApp extends StatelessWidget {
  const GeeksBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3B1E54),
        scaffoldBackgroundColor: const Color(0xFF3B1E54),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFEEEEEE)),
          bodyMedium: TextStyle(color: Color(0xFFEEEEEE)),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3B1E54),
          foregroundColor: Color(0xFFEEEEEE),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  void _login() {
    if (_usernameController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(username: _usernameController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Ekle
            Image.asset(
              'assets/logo.png',
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Kullanıcı Adınızı Girin',
              style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final String username;

  const MainScreen({required this.username, super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _movies = [
    {
      'title': 'Inception',
      'director': 'Christopher Nolan',
      'genre': 'Bilim-Kurgu',
      'description': 'Inception, 2010 bilimkurgu aksiyon filmidir. Film, Christopher Nolan tarafından yazılmış ve yönetilmiş olup, yapımcılığını eşi Emma Thomas ile birlikte üstlenmiştir. Başrollerinde Leonardo DiCaprio, hedeflerinin bilinçaltına sızarak bilgi çalan bir profesyonel hırsızı canlandırır.',
      'poster': 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
    },
    {
      'title': 'The Dark Knight',
      'director': 'Christopher Nolan',
      'genre': 'Aksiyon',
      'description': 'Kara Şövalye, Christopher Nolanın yönettiği bir süper kahraman filmidir. DC Comicsin kurgusal karakteri Batmanden uyarlanan 2005 tarihli Batman Başlıyor filminin devamıdır. Kara Şövalyenin senaryosunu Christopher ve kardeşi Jonathan Nolan yazmıştır. Hikâyeyi ise David S. Goyer oluşturmuştur',
      'poster': 'https://image.tmdb.org/t/p/w500//1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg',
    },
    {
      'title': 'Interstellar',
      'director': 'Christopher Nolan',
      'genre': 'Bilim-Kurgu',
      'description': 'Yıldızlararası, Christopher Nolan tarafından yönetilen, epik bilimkurgu türündeki 2014 yapımı bir ABD filmidir. Başrollerinde Matthew McConaughey, Anne Hathaway, Jessica Chastain, Bill Irwin, Ellen Burstyn, Matt Damon ve Michael Caine yer almaktadır.',
      'poster': 'https://image.tmdb.org/t/p/w500//gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    },
    {
      'title': 'Titanic',
      'director': 'James Cameron',
      'genre': 'Romantik',
      'description': 'Amerikan yapımı meşhur titanik kazasını konu alan filmdir',
      'poster': 'https://m.media-amazon.com/images/I/91WlTjCgu4L.jpg',
    },
    {
      'title': 'The Matrix',
      'director': 'The Wachowskis',
      'genre': 'Bilim-Kurgu',
      'description': '"Matrix, 1999 yapımı bir bilimkurgu aksiyon filmidir. Wachowski kardeşler tarafından yazılmış ve yönetilmiştir.[a] Matrix film serisinin ilk bölümü olup, Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving ve Joe Pantolianonun başrollerini paylaştığı filmdir',
      'poster': 'https://static.azall.com/images/detailed/3898/wbGSLmi.jpg?t=1644572498',
    },
    {
      'title': 'The Avengers',
      'director': 'Joss Whedon',
      'genre': 'Aksiyon',
      'description': 'Yenilmezler, bazı ülkelerde Avengers Assemble olarak da bilinmektedir. Marvel Studios tarafından üretilen ve Marvel Comicsin süper kahraman ekibidir. Dağıtımını Wss Whedon yazıp yönetmiştir. Ayrıca altıncı Marvel Sinematik Evreni filmi olup 1. Evrenin kapanış filmidir.',
      'poster': 'https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SL1183_.jpg',
    },
  ];

  final List<Map<String, String>> _reviewedMovies = [];

  void _addReview(String movieTitle, String review, String rating, String poster, String date) {
    setState(() {
      _reviewedMovies.add({
        'title': movieTitle,
        'review': review,
        'rating': rating,
        'poster': poster,
        'date': date,
      });
    });
  }

  void _removeReview(int index) {
    setState(() {
      _reviewedMovies.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(movies: _movies, username: widget.username, onAddReview: _addReview),
      ReviewedMoviesScreen(reviewedMovies: _reviewedMovies, onRemoveReview: _removeReview),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Hoşgeldin, ${widget.username}'),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF3B1E54),
        selectedItemColor: const Color(0xFFD4BEE4),
        unselectedItemColor: const Color(0xFF9B7EBD),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Yorumlanan Filmler',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> movies;
  final String username;
  final Function(String, String, String, String, String) onAddReview;

  const HomeScreen({
    required this.movies,
    required this.username,
    required this.onAddReview,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmler'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            leading: Image.network(
              movie['poster'],
              width: 50,
              height: 75,
              fit: BoxFit.cover,
            ),
            title: Text(movie['title'], style: Theme.of(context).textTheme.bodyLarge),
            subtitle: Text(movie['director'], style: Theme.of(context).textTheme.bodyMedium),
            trailing: const Icon(Icons.arrow_forward, color: Color(0xFFEEEEEE)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(
                    movie: movie,
                    onAddReview: onAddReview,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final Map<String, dynamic> movie;
  final Function(String, String, String, String, String) onAddReview;

  const MovieDetailScreen({
    required this.movie,
    required this.onAddReview,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie['poster'],
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text('Yönetmen: ${movie['director']}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text('Tür: ${movie['genre']}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text(movie['description'], style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewScreen(
                      movieTitle: movie['title'],
                      poster: movie['poster'],
                      onAddReview: onAddReview,
                    ),
                  ),
                );
              },
              child: const Text('Yorum Yap ve Puanla'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewScreen extends StatefulWidget {
  final String movieTitle;
  final String poster;
  final Function(String, String, String, String, String) onAddReview;

  const ReviewScreen({
    required this.movieTitle,
    required this.poster,
    required this.onAddReview,
    super.key,
  });

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0.0;
  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now().toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yorum Yap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.poster,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              widget.movieTitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _reviewController,
              decoration: const InputDecoration(
                labelText: 'Yorumunuzu Yazın',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: const Color(0xFFD4BEE4),
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                widget.onAddReview(
                  widget.movieTitle,
                  _reviewController.text,
                  _rating.toString(),
                  widget.poster,
                  _currentDate,
                );
                Navigator.pop(context);
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewedMoviesScreen extends StatelessWidget {
  final List<Map<String, String>> reviewedMovies;
  final Function(int) onRemoveReview;

  const ReviewedMoviesScreen({required this.reviewedMovies, required this.onRemoveReview, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yorumlanan Filmler'),
      ),
      body: reviewedMovies.isEmpty
          ? const Center(child: Text('Henüz yorumlanan film yok.'))
          : ListView.builder(
        itemCount: reviewedMovies.length,
        itemBuilder: (context, index) {
          final movie = reviewedMovies[index];
          return ListTile(
            leading: Image.network(
              movie['poster']!,
              width: 50,
              height: 75,
              fit: BoxFit.cover,
            ),
            title: Text(movie['title']!, style: Theme.of(context).textTheme.bodyLarge),
            subtitle: Text('Puan: ${movie['rating']} - ${movie['date']}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Color(0xFFEEEEEE)),
              onPressed: () {
                onRemoveReview(index);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedReviewScreen(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailedReviewScreen extends StatelessWidget {
  final Map<String, String> movie;

  const DetailedReviewScreen({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final double rating = double.tryParse(movie['rating'] ?? '0') ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie['poster']!,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'Film Adı: ${movie['title']}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Yorumunuz: ',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              movie['review'] ?? 'Yorum bulunamadı.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Verilen Puan:',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: const Color(0xFFD4BEE4),
                );
              }),
            ),
            const SizedBox(height: 20),
            Text(
              'Tarih: ${movie['date']}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

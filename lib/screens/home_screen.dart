import 'package:flutter/material.dart';
import 'package:book_tracker/models/book.dart';
import 'package:book_tracker/services/database_helper.dart';
import 'package:book_tracker/widgets/book_card.dart';
import 'add_book_screen.dart';
import 'book_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  late TabController _tabController;
  List<Book> _allBooks = [];
  List<Book> _currentlyReading = [];
  List<Book> _completed = [];
  List<Book> _wantToRead = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadBooks();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadBooks() async {
    setState(() => _isLoading = true);

    try {
      final books = await _dbHelper.getAllBooks();
      setState(() {
        _allBooks = books;
        _currentlyReading = books.where((book) => book.status == 'reading').toList();
        _completed = books.where((book) => book.status == 'completed').toList();
        _wantToRead = books.where((book) => book.status == 'want_to_read').toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading books: $e')),
        );
      }
    }
  }

  Future<void> _navigateToAddBook() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddBookScreen()),
    );
    if (result == true) {
      _loadBooks();
    }
  }

  Future<void> _navigateToBookDetail(Book book) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailScreen(book: book),
      ),
    );
    if (result == true) {
      _loadBooks();
    }
  }

  Widget _buildBookList(List<Book> books) {
    if (books.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.book_outlined,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No books found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookCard(
          book: books[index],
          onTap: () => _navigateToBookDetail(books[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Tracker'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.library_books),
              text: 'All (${_allBooks.length})',
            ),
            Tab(
              icon: const Icon(Icons.book),
              text: 'Reading (${_currentlyReading.length})',
            ),
            Tab(
              icon: const Icon(Icons.check_circle),
              text: 'Completed (${_completed.length})',
            ),
            Tab(
              icon: const Icon(Icons.bookmark),
              text: 'Want to Read (${_wantToRead.length})',
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
        controller: _tabController,
        children: [
          _buildBookList(_allBooks),
          _buildBookList(_currentlyReading),
          _buildBookList(_completed),
          _buildBookList(_wantToRead),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddBook,
        child: const Icon(Icons.add),
      ),
    );
  }
}
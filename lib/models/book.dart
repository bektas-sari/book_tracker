class Book {
  final int? id;
  final String title;
  final String author;
  final String? description;
  final int? totalPages;
  final int? currentPage;
  final String status; // 'reading', 'completed', 'want_to_read'
  final DateTime? startDate;
  final DateTime? finishDate;
  final double? rating;
  final String? notes;
  final String? coverImagePath;

  Book({
    this.id,
    required this.title,
    required this.author,
    this.description,
    this.totalPages,
    this.currentPage,
    this.status = 'want_to_read',
    this.startDate,
    this.finishDate,
    this.rating,
    this.notes,
    this.coverImagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'totalPages': totalPages,
      'currentPage': currentPage,
      'status': status,
      'startDate': startDate?.millisecondsSinceEpoch,
      'finishDate': finishDate?.millisecondsSinceEpoch,
      'rating': rating,
      'notes': notes,
      'coverImagePath': coverImagePath,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      description: map['description'],
      totalPages: map['totalPages'],
      currentPage: map['currentPage'],
      status: map['status'] ?? 'want_to_read',
      startDate: map['startDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startDate'])
          : null,
      finishDate: map['finishDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['finishDate'])
          : null,
      rating: map['rating']?.toDouble(),
      notes: map['notes'],
      coverImagePath: map['coverImagePath'],
    );
  }

  Book copyWith({
    int? id,
    String? title,
    String? author,
    String? description,
    int? totalPages,
    int? currentPage,
    String? status,
    DateTime? startDate,
    DateTime? finishDate,
    double? rating,
    String? notes,
    String? coverImagePath,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      finishDate: finishDate ?? this.finishDate,
      rating: rating ?? this.rating,
      notes: notes ?? this.notes,
      coverImagePath: coverImagePath ?? this.coverImagePath,
    );
  }

  double get progress {
    if (totalPages == null || currentPage == null || totalPages! <= 0) {
      return 0.0;
    }
    return (currentPage! / totalPages!).clamp(0.0, 1.0);
  }
}
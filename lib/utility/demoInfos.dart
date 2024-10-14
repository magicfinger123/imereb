import 'package:flutter/material.dart';

List<MessageItem> messageItems = [
  MessageItem(
    title: "Alvaro Macías (Docente)",
    description: "Solicitud de reunión",
    date: "09:25   Sep 5",
  ),
  MessageItem(
    title: "Juan Pérez (Estudiante)",
    description: "Consulta sobre el proyecto final",
    date: "14:30   Sep 4",
  ),
  MessageItem(
    title: "Carlos Ruiz (Coordinador)",
    description: "Actualización del cronograma",
    date: "11:15   Sep 3",
  ),
  MessageItem(
    title: "María González (Padre)",
    description: "Reunión de seguimiento",
    date: "10:00   Sep 2",
  ),
  MessageItem(
    title: "Ana López (Docente)",
    description: "Consulta sobre las notas",
    date: "12:45   Sep 1",
  ),
  MessageItem(
    title: "Pedro Sánchez (Estudiante)",
    description: "Solicitud de tutoría",
    date: "08:30   Aug 31",
  ),
];

class MessageItem {
  final String title;
  final String description;
  final String date;

  MessageItem({
    required this.title,
    required this.description,
    required this.date,
  });
}

String demoText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vel mi consectetur, finibus dolor vestibulum, euismod neque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse porta, ligula id tincidunt consectetur, est metus luctus est, nec mollis ex ex sit amet nisi. Mauris fermentum auctor leo at feugiat. Donec pharetra dignissim quam eu vulputate. Curabitur finibus tristique mauris, eu feugiat felis semper id. Integer rutrum eget eros in suscipit. Phasellus eleifend, ipsum non elementum vestibulum, nunc purus imperdiet magna, quis euismod erat leo in turpis. Aliquam sollicitudin enim neque, eu interdum leo dignissim vitae. Nullam id fringilla erat, non pretium quam. Donec in quam eros. Vestibulum sed nunc placerat, tristique tellus fringilla, imperdiet diam.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";


class Subjects {
  final String name;
  final String grade;

  Subjects({required this.name, required this.grade});
}
class SubjectsRating {
  final String name;
  final String grade;

  SubjectsRating({required this.name, required this.grade});
}

final List<MapEntry<DateTimeRange, List<String>>> agendaData = [
  MapEntry(
    DateTimeRange(
    start: DateTime(2024, 10, 08),
    end: DateTime(2024, 10, 12),
    ),
    ['Meeting with team', 'Code review'],
    ),
  MapEntry(
    DateTimeRange(
    start: DateTime(2024, 10, 14),
    end: DateTime(2024, 10, 18),
    ),
    ['Project planning'],
    ),
  MapEntry(
    DateTimeRange(
    start: DateTime(2024, 10, 20),
    end: DateTime(2024, 10, 24),
    ),
    ['Client follow-up', 'Feedback session'],
  ),
];



class Document {
  final String title;
  final DateTime date;

  Document({required this.title, required this.date});
}

List<Document> documents = [
  Document(title: "Manual de Disciplina", date: DateTime.parse("2024-02-03")),
  Document(title: "Contrato de Matrícula", date: DateTime.parse("2024-03-01")),
  Document(title: "Circular día civil", date: DateTime.parse("2024-04-20")),
];


class FinancialEntry {
  final String description;
  final double amount;

  FinancialEntry({required this.description, required this.amount});
}

List<FinancialEntry> financialEntries = [
  FinancialEntry(description: "Matrícula", amount: 500.00),
  FinancialEntry(description: "Pago Matrícula", amount: -500.00),
  FinancialEntry(description: "Cuota 1", amount: 300.00),
  FinancialEntry(description: "Pago Cuota 1", amount: -300.00),
  FinancialEntry(description: "Cuota 2", amount: 300.00),
  FinancialEntry(description: "Recargo Cuota 2", amount: 30.00),
  FinancialEntry(description: "Cuota 3", amount: 300.00),
  FinancialEntry(description: "Pago Cuota 2", amount: -300.00),
  FinancialEntry(description: "Pago recargo 2", amount: -30.00),
  FinancialEntry(description: "Saldo", amount: 0.00),
];

class DisciplinaryRecord {
  final String description;
  final DateTime date;

  DisciplinaryRecord({required this.description, required this.date});
}

List<DisciplinaryRecord> disciplinaryRecords = [
  DisciplinaryRecord(description: "Bajo Rendimiento Escolar", date: DateTime.parse("2024-07-03")),
  DisciplinaryRecord(description: "Ausencia", date: DateTime.parse("2024-06-01")),
  DisciplinaryRecord(description: "Amonestación", date: DateTime.parse("2024-05-20")),
  DisciplinaryRecord(description: "Suspensión de Clases", date: DateTime.parse("2024-05-01")),
];
final String qrData = "James Watts\n8-888-8888";


class User {
  String name;

  User({required this.name,});
}

class Category {
  String categoryName;
  List<User> users;

  Category({required this.categoryName, required this.users});
}

List<Category> categories = [
  Category(categoryName: "Directivos", users: [
    User(name: "Ozil Mendoza"),
    User(name: "Marisol Montenegro"),
  ]),
  Category(categoryName: "Docentes", users: [
    User(name: "Marielis Hurtado"),
    User(name: "Pedro Santo"),
    User(name: "Reinaldo Achurra"),
  ]),
  Category(categoryName: "Secretaría", users: [
    User(name: "Lucia Rodriguez"),
  ]),
  Category(categoryName: "Enfermería", users: [
    User(name: "Carla Gomez"),
  ]),
];

enum Status { Accepted, Pending, Cancelled }

// Create a model for the user info
class UserStatusInfo {
  final String name;
  final String date;
  Status status;

  UserStatusInfo({required this.name, required this.date, required this.status});
}

List<UserStatusInfo> usersStatusList = [
  UserStatusInfo(name: 'Felix Gonzáles', date: '2024-08-10', status: Status.Accepted),
  UserStatusInfo(name: 'María Pérez', date: '2024-07-01', status: Status.Pending),
  UserStatusInfo(name: 'Robert Arthur', date: '2024-06-20', status: Status.Cancelled),
];

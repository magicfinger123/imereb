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


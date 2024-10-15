class AppProvider {

  final int id;
  final String name;
  final String lastName;
  final String email;
  final bool isActive;

  AppProvider({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    this.isActive = true,
  });

}
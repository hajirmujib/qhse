class AuthUserDto {
  final String id;
  final String name;
  final int role;
  final String siteLocation;
  final String nik;


  const AuthUserDto({
    this.id = '',
    this.name = '',
    this.role = 0,
    this.siteLocation = '',
    this.nik = ''
  });

  @override
  String toString() {
    return 'AuthUserDto{id: $id, name: $name}';
  }
}

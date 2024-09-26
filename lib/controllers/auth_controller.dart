class AuthController {
  bool login(String username, String password) {
    // Logic untuk validasi login, misalnya:
    if (username == 'admin' && password == 'admin') {
      return true; // Login sukses
    }
    return false; // Login gagal
  }

  void register(String username, String password) {
    // Logika untuk registrasi
    print('User registered: $username');
  }

  void logout() {
    // Logika untuk logout
    print('User logged out');
  }
}

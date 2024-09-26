class AuthService {
  Future<void> login(String username, String password) async {
    // Simulasi request login
    await Future.delayed(const Duration(seconds: 2));
    print('Login successful for user: $username');
  }

  Future<void> register(String username, String password) async {
    // Simulasi request registrasi
    await Future.delayed(const Duration(seconds: 2));
    print('Register successful for user: $username');
  }
}

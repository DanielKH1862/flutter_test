class ApiService {
  Future<void> fetchData() async {
    // Simulasi pengambilan data dari API
    await Future.delayed(const Duration(seconds: 2));
    print('Data fetched from API');
  }
}

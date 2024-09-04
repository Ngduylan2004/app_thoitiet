import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) => _searchWeather(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchWeather,
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  void _searchWeather() {
    final cityName = _controller.text;
    if (cityName.isNotEmpty) {
      // Thực hiện tìm kiếm thời tiết tại đây
      Navigator.pop(context, cityName); // Trả về tên thành phố cho trang gọi
    }
  }
}

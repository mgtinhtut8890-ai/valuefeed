import 'package:flutter/material.dart';

void main() {
  runApp(const ValueFeedApp());
}

class ValueFeedApp extends StatelessWidget {
  const ValueFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValueFeed Pro',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF13131A),
        primaryColor: const Color(0xFF00FF66),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> liveMatches = [
    {
      'league': 'MMA Championship',
      'teamA': 'Fighter 01',
      'teamB': 'Fighter 02',
      'status': 'LIVE',
      'time': 'today',
    },
    {
      'league': 'Muay Thai Elite',
      'teamA': 'Buakaw Pro',
      'teamB': 'Saenchai Fan',
      'status': 'LIVE',
      'time': '10:30 PM',
      'date': 'Oct 04',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF13131A),
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'ValueFeed ',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              'pro',
              style: TextStyle(color: Colors.greenAccent[400], fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.telegram, color: Colors.blueAccent),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00FF66),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sports_mma, color: Colors.black, size: 20),
                          SizedBox(width: 8),
                          Text('Live MMA', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F1F2E),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_circle_outline, color: Colors.white70, size: 20),
                          SizedBox(width: 8),
                          Text('Muay Thai', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1E2235), Color(0xFF111422)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.blue.withOpacity(0.3)),
                ),
                child: const Column(
                  children: [
                    Text(
                      'အားလုံး ဘေးကင်းလုံခြုံကြပါစေ',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '🇲🇲 MMA & Muay Thai Live Streaming',
                      style: TextStyle(color: Colors.white60, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: liveMatches.length,
                itemBuilder: (context, index) {
                  final match = liveMatches[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C28),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              match['league']!,
                              style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.red),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.fiber_manual_record, color: Colors.red, size: 10),
                                  SizedBox(width: 4),
                                  Text('LIVE', style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                match['teamA']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2A2A3D),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                match['time']!,
                                style: const TextStyle(color: Colors.white70, fontSize: 12),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                match['teamB']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF13131A),
        selectedItemColor: const Color(0xFF00FF66),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label: 'Highlight'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Channel'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
    );
  }
}

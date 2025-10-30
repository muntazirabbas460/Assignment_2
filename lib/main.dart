import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

//
// ─── SCREEN 1: WELCOME SCREEN ──────────────────────────────────────────────
//
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              const Center(
                child: Text(
                  'Welcome to My Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'View Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// ─── SCREEN 2: PROFILE SCREEN ──────────────────────────────────────────────
//
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        child: const Icon(Icons.info_outline),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutMeScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/DP_pic.png'),
            ),
            const SizedBox(height: 16),

            // Name & Profession
            const Text(
              'Muntazir Abbas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Bio
            const Text(
              'A passionate Flutter developer who loves crafting smooth, elegant, and responsive mobile experiences. '
              'I enjoy designing user-friendly interfaces and exploring creative UI/UX ideas.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 20),

            // Contact Info Card
            Card(
              color: const Color(0xFF1E1E1E),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text('muntazir@example.com'),
                    ),
                    Divider(color: Colors.white24),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.blue),
                      title: Text('+92 300 1234567'),
                    ),
                    Divider(color: Colors.white24),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.blue),
                      title: Text('Lahore, Pakistan'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Social Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.linked_camera),
                  color: Colors.blueAccent,
                  iconSize: 32,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.code),
                  color: Colors.white,
                  iconSize: 32,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.chat),
                  color: Colors.lightBlueAccent,
                  iconSize: 32,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//
// ─── SCREEN 3: ABOUT ME PAGE ──────────────────────────────────────────────
//
class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Education Section
          const Text(
            'Education',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'B.Sc in Computer Science\nVirtual University of Pakistan',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),

          // Skills Section
          const Text(
            'Skills',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: const [
              Chip(label: Text('Flutter')),
              Chip(label: Text('Dart')),
              Chip(label: Text('UI/UX Design')),
              Chip(label: Text('Firebase')),
              Chip(label: Text('GitHub')),
            ],
          ),
          const SizedBox(height: 20),

          // Hobbies Section
          const Text(
            'Hobbies',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            '🎧 Listening to Music\n💻 Coding\n📸 Photography\n✈️ Traveling',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}
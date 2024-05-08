import 'package:flutter/material.dart';

class Emoj extends StatefulWidget {
  const Emoj({Key? key}) : super(key: key);

  @override
  _EmojState createState() => _EmojState();
}

class _EmojState extends State<Emoj> {
  String _selectedEmoji = '';
  Map<String, DateTime> _lastPressedTimes = {};

  void _showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Message",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bool _canPress() {
    if (_lastPressedTimes.isNotEmpty) {
      // Define the cooldown duration (e.g., 24 hours)
      final cooldownDuration = Duration(hours: 24);
      final now = DateTime.now();
      final lastPressedTime = _lastPressedTimes.values.first;
      return now.difference(lastPressedTime) >= cooldownDuration;
    }
    return true;
  }

  void _updateLastPressedTime(String emoji) {
    _lastPressedTimes[emoji] = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              if (_canPress()) {
                setState(() {
                  _selectedEmoji = 'Happy';
                  _updateLastPressedTime('Happy');
                  _showMessage(context,
                      'Your happiness is like a radiant sun, spreading warmth and joy to everyone around you. Keep shining bright and lighting up the world with your beautiful smile!');
                });
              }
            },
            child: Image.asset(
              'assets/images/happy.png',
              width: 100,
              height: 100,
              color: _selectedEmoji == 'Happy' ? Colors.grey : null,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              if (_canPress()) {
                setState(() {
                  _selectedEmoji = 'Calm';
                  _updateLastPressedTime('Calm');
                  _showMessage(context, "Embrace this tranquility you're feeling, let it wrap around you like a comforting blanket. Take a moment to simply be, to breathe in the stillness, and let any worries gently fade away. Enjoy the peacefulness of this moment, knowing that you're exactly where you need to be.");
                });
              }
            },

            child: Image.asset(
              'assets/images/calm.png',
              width: 100,
              height: 100,
              color: _selectedEmoji == 'Calm' ? Colors.grey : null,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              if (_canPress()) {
                setState(() {
                  _selectedEmoji = 'Relax';
                  _updateLastPressedTime('Relax');
                  _showMessage(context,
                      "Feel the gentle rhythm of relaxation flowing through you, like a soothing breeze on a calm summer day. Allow yourself to sink deeper into this peaceful moment, letting go of any tension or worries. Embrace the tranquility within, for in this serene space, you find solace and rejuvenation. Breathe deeply, exhaling any lingering stress, and embrace the serenity of this tranquil moment.");
                });
              }
            },
            child: Image.asset(
              'assets/images/relax.png',
              width: 100,
              height: 100,
              color: _selectedEmoji == 'Relax' ? Colors.grey : null,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              if (_canPress()) {
                setState(() {
                  _selectedEmoji = 'Focus';
                  _updateLastPressedTime('Focus');
                  _showMessage(context, "Embrace the clarity and focus within you, like a steady flame illuminating your path. Feel the power of your mind as it sharpens its focus, effortlessly navigating through the tasks before you. With each moment of concentration, you are one step closer to achieving your goals. Trust in your abilities, and let your determination propel you forward. You are unstoppable, grounded in the present, and driven by purpose. Stay focused, and watch as your dreams become reality.");
                });
              }
            },
            child: Image.asset(
              'assets/images/focus.png',
              width: 100,
              height: 100,
              color: _selectedEmoji == 'Focus' ? Colors.grey : null,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

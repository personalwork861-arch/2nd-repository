import 'dart:math';
import 'package:flutter/material.dart' as material;

void main() => material.runApp(const GuessNumberApp());



const purple = material.Color(0xFF6A00FF);
const green = material.Color(0xFF0A9A13);
const dark = material.Color(0xFF08051F);

class GuessNumberApp extends material.StatelessWidget {
  const GuessNumberApp({super.key});

  @override
  material.Widget build(material.BuildContext context) {
    return material.MaterialApp(
      title: 'Guess Number',
      debugShowCheckedModeBanner: false,
      theme: material.ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: dark,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends material.StatelessWidget {
  const HomePage({super.key});

  @override
  material.Widget build(material.BuildContext context) {
    return material.Scaffold(
      body: material.Container(
        decoration: const material.BoxDecoration(
          gradient: material.LinearGradient(
            colors: [
              material.Color(0xFF070218),
              material.Color(0xFF16064B),
              material.Color(0xFF070218),
            ],
            begin: material.Alignment.topLeft,
            end: material.Alignment.bottomRight,
          ),
        ),
        child: material.SafeArea(
          child: material.Column(
            children: [
              const material.Spacer(flex: 3),
              const material.Icon(
                material.Icons.sports_esports_rounded,
                size: 155,
                color: material.Color(0xFF9C6CFF),
              ),
              const material.SizedBox(height: 44),
              const material.Text(
                'Guess',
                style: material.TextStyle(
                  color: purple,
                  fontSize: 40,
                  fontWeight: material.FontWeight.bold,
                ),
              ),
              const material.SizedBox(height: 18),
              const material.Text(
                'Number',
                style: material.TextStyle(
                  color: material.Colors.white,
                  fontSize: 40,
                  fontWeight: material.FontWeight.bold,
                ),
              ),
              const material.Spacer(flex: 2),
              material.Padding(
                padding: const material.EdgeInsets.fromLTRB(28, 0, 28, 28),
                child: material.SizedBox(
                  width: double.infinity,
                  height: 78,
                  child: material.ElevatedButton(
                    style: material.ElevatedButton.styleFrom(
                      backgroundColor: purple,
                      foregroundColor: material.Colors.white,
                      shape: material.RoundedRectangleBorder(
                        borderRadius: material.BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      material.Navigator.push(
                        context,
                        material.MaterialPageRoute(
                          builder: (_) => const LevelPage(),
                        ),
                      );
                    },
                    child: const material.Text(
                      'Start to play',
                      style: material.TextStyle(
                        fontSize: 27,
                        fontWeight: material.FontWeight.w600,
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

class LevelPage extends material.StatelessWidget {
  const LevelPage({super.key});

  @override
  material.Widget build(material.BuildContext context) {
    final levels = [
      (1, 'Level 1', 'easy', const material.Color(0xFF26C979)),
      (2, 'Level 2', 'Normal', const material.Color(0xFF273BFF)),
      (3, 'Level 3', 'Hard', const material.Color(0xFFFF3131)),
    ];

    return material.Scaffold(
      backgroundColor: const material.Color(0xFF080722),
      body: material.SafeArea(
        child: material.Center(
          child: material.Container(
            width: double.infinity,
            constraints: const material.BoxConstraints(maxWidth: 420),
            padding: const material.EdgeInsets.symmetric(horizontal: 20),
            child: material.Column(
              children: [
                // Back arrow
                material.Align(
                  alignment: material.Alignment.centerLeft,
                  child: material.IconButton(
                    icon: const material.Icon(
                      material.Icons.arrow_back,
                      color: material.Colors.white,
                      size: 30,
                    ),
                    onPressed: () => material.Navigator.pop(context),
                  ),
                ),

                // Golden spiral illustration
                material.Expanded(
                  flex: 5,
                  child: material.Center(
                    child: material.Image.asset(
                      'assets/golden_spiral.png',
                      width: 210,
                      height: 210,
                      fit: material.BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const material.Icon(
                          material.Icons.all_inclusive_rounded,
                          size: 190,
                          color: material.Color(0xFFFFD04A),
                        );
                      },
                    ),
                  ),
                ),

                // Level buttons
                material.Expanded(
                  flex: 5,
                  child: material.Column(
                    mainAxisAlignment:
                        material.MainAxisAlignment.spaceEvenly,
                    children: levels.map((level) {
                      return material.SizedBox(
                        width: double.infinity,
                        height: 59,
                        child: material.ElevatedButton(
                          style: material.ElevatedButton.styleFrom(
                            backgroundColor:
                                const material.Color(0xFF7800FF),
                            foregroundColor: material.Colors.white,
                            elevation: 0,
                            padding:
                                const material.EdgeInsets.symmetric(
                              horizontal: 18,
                            ),
                            shape: material.RoundedRectangleBorder(
                              borderRadius:
                                  material.BorderRadius.circular(13),
                            ),
                          ),
                          onPressed: () {
                            material.Navigator.push(
                              context,
                              material.MaterialPageRoute(
                                builder: (_) => GamePage(
                                  level: level.$1,
                                  levelName: level.$2,
                                ),
                              ),
                            );
                          },
                          child: material.Row(
                            children: [
                              // Diamond icon
                              material.Container(
                                width: 45,
                                height: 45,
                                decoration: material.BoxDecoration(
                                  color: material.Colors.white,
                                  borderRadius:
                                      material.BorderRadius.circular(9),
                                ),
                                child: material.Icon(
                                  material.Icons.diamond_rounded,
                                  color: level.$4,
                                  size: 39,
                                ),
                              ),

                              const material.SizedBox(width: 17),

                              // Level name and difficulty
                              material.Expanded(
                                child: material.Column(
                                  mainAxisAlignment:
                                      material.MainAxisAlignment.center,
                                  children: [
                                    material.Text(
                                      level.$2,
                                      style: const material.TextStyle(
                                        fontSize: 22,
                                        fontWeight:
                                            material.FontWeight.w600,
                                      ),
                                    ),
                                    material.Text(
                                      level.$3,
                                      style: const material.TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const material.SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GamePage extends material.StatefulWidget {
  final int level;
  final String levelName;

  const GamePage({
    super.key,
    required this.level,
    required this.levelName,
  });

  @override
  material.State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends material.State<GamePage> {
  late int target;
  String entry = '';
  String message = '';
  int score = 240;

  int get maxNumber =>
      widget.level == 1 ? 9 : widget.level == 2 ? 50 : 100;

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  void _newRound() {
    target = Random().nextInt(maxNumber) + 1;
  }

  void _tap(String key) {
    setState(() {
      if (key == 'C') {
        entry = '';
        message = '';
        return;
      }

      if (key == '⌫') {
        if (entry.isNotEmpty) {
          entry = entry.substring(0, entry.length - 1);
        }
        message = '';
        return;
      }

      if (key == 'score') {
        message = 'Score: $score';
        return;
      }

      if (key == 'Check') {
        final guess = int.tryParse(entry);

        if (guess == null) {
          message = 'Enter a number first';
          return;
        }

        if (guess < 1 || guess > maxNumber) {
          message = 'Enter a number between 1 and $maxNumber';
          return;
        }

        if (guess == target) {
          score += 10;
          message = 'Correct! +10 points';
          entry = '';
          _newRound();
        } else {
          score = max(0, score - 5);
          message =
              guess < target ? 'Too low! Try again' : 'Too high! Try again';
        }
        return;
      }

      if (entry.length < 3) {
        entry += key;
        message = '';
      }
    });
  }

  material.Widget _key(
    String label, {
    bool filled = false,
    double width = 34,
    double height = 33,
    material.VoidCallback? onPressed,
  }) {
    return material.SizedBox(
      width: width,
      height: height,
      child: material.OutlinedButton(
        onPressed: onPressed ?? () => _tap(label),
        style: material.OutlinedButton.styleFrom(
          padding: material.EdgeInsets.zero,
          backgroundColor:
              filled ? const material.Color(0xFF079D12) : material.Colors.black,
          foregroundColor: material.Colors.white,
          side: const material.BorderSide(
            color: material.Color(0xFF00D400),
            width: 1.7,
          ),
          shape: material.RoundedRectangleBorder(
            borderRadius: material.BorderRadius.circular(8),
          ),
        ),
        child: material.FittedBox(
          fit: material.BoxFit.scaleDown,
          child: material.Text(
            label,
            style: const material.TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }

  material.Widget _keyRow(List<material.Widget> children) {
    return material.Row(
      mainAxisAlignment: material.MainAxisAlignment.spaceBetween,
      children: children,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Scaffold(
      backgroundColor: material.Colors.black,
      body: material.SafeArea(
        child: material.Center(
          child: material.Container(
            constraints: const material.BoxConstraints(maxWidth: 320),
            padding: const material.EdgeInsets.fromLTRB(12, 12, 12, 10),
            child: material.Column(
              children: [
                material.Row(
                  children: [
                    material.GestureDetector(
                      onTap: () => material.Navigator.pop(context),
                      child: const material.Icon(
                        material.Icons.arrow_back,
                        color: material.Colors.white,
                        size: 19,
                      ),
                    ),
                    material.Expanded(
                      child: material.Text(
                        'between 1 & $maxNumber',
                        textAlign: material.TextAlign.center,
                        style: const material.TextStyle(
                          color: material.Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const material.SizedBox(width: 19),
                  ],
                ),

                const material.SizedBox(height: 42),

                material.Container(
                  width: 112,
                  height: 112,
                  alignment: material.Alignment.center,
                  decoration: material.BoxDecoration(
                    shape: material.BoxShape.circle,
                    color: const material.Color(0xFF078C12),
                    boxShadow: [
                      material.BoxShadow(
                        color: material.Colors.green.withOpacity(0.65),
                        blurRadius: 30,
                        spreadRadius: 8,
                      ),
                      material.BoxShadow(
                        color: material.Colors.green.withOpacity(0.3),
                        blurRadius: 45,
                        spreadRadius: 12,
                      ),
                    ],
                  ),
                  child: material.Text(
                    entry.isEmpty ? '—' : entry,
                    style: const material.TextStyle(
                      color: material.Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),

                const material.Spacer(),

                _keyRow([
                  _key('1'),
                  _key('2'),
                  _key('3'),
                  _key('C'),
                ]),
                const material.SizedBox(height: 10),

                _keyRow([
                  _key('4'),
                  _key('5'),
                  _key('6'),
                  _key('score', filled: true),
                ]),
                const material.SizedBox(height: 10),

                _keyRow([
                  _key('7'),
                  _key('8'),
                  _key('9'),
                  _key(
                    '$score',
                    filled: true,
                    onPressed: () {
                      setState(() => message = 'Score: $score');
                    },
                  ),
                ]),
                const material.SizedBox(height: 10),

                material.Row(
                  children: [
                    _key('0'),
                    const material.SizedBox(width: 16),
                    material.Expanded(
                      child: material.SizedBox(
                        height: 33,
                        child: material.OutlinedButton(
                          onPressed: () => _tap('Check'),
                          style: material.OutlinedButton.styleFrom(
                            padding: material.EdgeInsets.zero,
                            backgroundColor: material.Colors.black,
                            foregroundColor: material.Colors.white,
                            side: const material.BorderSide(
                              color: material.Color(0xFF00D400),
                              width: 1.7,
                            ),
                            shape: material.RoundedRectangleBorder(
                              borderRadius: material.BorderRadius.circular(8),
                            ),
                          ),
                          child: const material.Text(
                            'Check',
                            style: material.TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const material.SizedBox(height: 8),

                material.SizedBox(
                  height: 24,
                  child: material.Center(
                    child: material.Text(
                      message,
                      textAlign: material.TextAlign.center,
                      style: const material.TextStyle(
                        color: material.Colors.greenAccent,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoome_ai/resources/components/round_button.dart';

class ChatPublishScreen extends StatefulWidget {
  @override
  _ChatPublishScreenState createState() => _ChatPublishScreenState();
}

class _ChatPublishScreenState extends State<ChatPublishScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A), // Dark at top
              Color(0xFF5E3F93), // Purple in middle
              Color(0xFF1A1A1A), // Dark at bottom
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Grathok the Furious',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Content Area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Intro Section
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Intro. ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'You are intruding on Grathok\'s territory. Prepare for anger.',
                                    style: TextStyle(
                                      color: Color(0xFFCCCCCC),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Main Content
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'The wind howls through the mountain pass, whipping snow into your face. You pull your cloak tighter, shivering as you trudge through the deepening drifts. Your destination village is still a day away. Suddenly, a guttural roar shatters the silence.',
                                  style: TextStyle(
                                    color: Color(0xFFCCCCCC),
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                ),

                                const SizedBox(height: 16),

                                const Text(
                                  '{{char}}: "WHO DARES TRESPASS ON GRATHOK\'S LAND?! SHOW YOURSELF, WEAKLING!"',
                                  style: TextStyle(
                                    color: Color(0xFFCCCCCC),
                                    fontSize: 16,
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'A towering Orc, muscles rippling beneath mismatched armor, steps into the flickering light of the campfire. His eyes burn with unrestrained fury. What say you to Grathok, puny human? Are you here to die?',
                                  style: TextStyle(
                                    color: Color(0xFFCCCCCC),
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RoundButton(
                  title: 'Publish',
                  onTap: () {},
                  color: const Color(0xFF8B5CF6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

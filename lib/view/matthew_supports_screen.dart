import 'package:flutter/material.dart';
import 'package:yoome_ai/resources/components/gradient_background.dart';

class MatthewSupportsScreen extends StatelessWidget {
  const MatthewSupportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
            child: Column(
              children: [
                // ───────── Fixed header ─────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/arrow_back.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/menu.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Menu clicked')),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ───────── Scrollable content ─────────
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        _infoBlock(
                          height: 395,
                          text1:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.',
                          text2:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.',
                          text3:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.',
                        ),
                        const SizedBox(height: 31),
                        _infoBlock(
                          height: 123,
                          text1:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing elit.',
                        ),

                        // ───────── New pill‑shaped container ─────────
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 91,
                              height: 33,
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade700,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Colors.white24),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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

  // Helper to keep code tidy
  Widget _infoBlock({
    required double height,
    required String text1,
    String? text2,
    String? text3,
  }) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF09001796), Color(0xFF1F0E47)],
        ),
        border: Border.all(color: Color(0xFFB56AFF).withOpacity(.2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bodyText(text1),
          if (text2 != null) ...[
            const SizedBox(height: 10),
            _bodyText(text2, dim: true),
          ],
          if (text3 != null) ...[
            const SizedBox(height: 20),
            _bodyText(text3, dim: true),
          ],
        ],
      ),
    );
  }

  Text _bodyText(String t, {bool dim = false}) => Text(
    t,
    style: TextStyle(
      fontSize: 12,
      color: dim ? Colors.white70 : Colors.white,
      fontWeight: FontWeight.w400,
    ),
  );
}

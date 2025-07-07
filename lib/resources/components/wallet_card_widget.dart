import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key, required this.balance, required this.bonus});

  final String balance; // e.g. "X140000"
  final String bonus; // e.g. "+400"

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // round ONLY the top‑left / top‑right corners
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Stack(
        children: [
          // ----- full‑width background image (no horizontal padding) -----
          Image.asset(
            'assets/images/wallet5.png',
            width: double.infinity,
            fit: BoxFit.cover,
            height: 230, // pick a height that matches your design
          ),

          // ----- foreground content -----
          Padding(
            // give inner widgets breathing room, but NOT left/right padding
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24, // horizontal padding for inner content
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/wallet3.png',
                      width: 56,
                      height: 27,
                    ),
                    const Spacer(),
                    Text(
                      balance,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Image.asset('assets/images/wallet4.png', width: 93, height: 93),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '1st purchase bonus $bonus',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

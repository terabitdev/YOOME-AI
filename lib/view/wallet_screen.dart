import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int selectedPackageIndex = 5; // Last package selected by default

  // Package data
  final List<Map<String, dynamic>> packages = [
    {'bonus': '+40', 'coins': '200', 'price': 'PKR 550'},
    {'bonus': '+40', 'coins': '1000', 'price': 'PKR 2750'},
    {'bonus': '+40', 'coins': '1500', 'price': 'PKR 4150'},
    {'bonus': '+750', 'coins': '1000', 'price': 'PKR 2750'},
    {'bonus': '+1500', 'coins': '1500', 'price': 'PKR 4150'},
    {
      'bonus': '+4000!',
      'coins': '10000',
      'price': 'PKR 27800',
      'isSpecial': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Status Bar
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 20,
              right: 20,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(width: 16.w),
                Text('Wallet', style: SSTextStyle18500),
                const Spacer(),
                Image.asset(
                  'assets/images/wallet1.png',
                  width: 19.w,
                  height: 16.h,
                ),
                SizedBox(width: 8.w),
                Image.asset(
                  'assets/images/wallet2.png',
                  width: 19.w,
                  height: 16.h,
                ),
                SizedBox(width: 8.w),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  /// 🔧 Balance Card
                  Container(
                    width: double.infinity,
                    height: 140.h,
                    margin: EdgeInsets.only(bottom: 24.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/wallet5.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/wallet3.png',
                                  width: 56.w,
                                  height: 27.h,
                                ),
                                SizedBox(width: 6.h),
                              ],
                            ),
                          ),

                          // Top-right: X140000
                          Positioned(
                            top: 0,
                            right: 50,
                            child: Text(
                              'X140000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            right: 180,
                            child: Image.asset(
                              'assets/images/wallet4.png',
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),

                          // Bottom-right: bonus badge
                          Positioned(
                            bottom: 12,
                            right: 50,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '1st purchase bonus +400',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Rest of your content (no change)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: packages.length,
                    itemBuilder: (context, index) {
                      return _buildPackageCard(index);
                    },
                  ),

                  SizedBox(height: 32.h),

                  Column(
                    children: [
                      _buildFeatureItem(
                        'Use advanced models for conversations.',
                      ),
                      _buildFeatureItem('Chat bot continuation'),
                      _buildFeatureItem('Generate chat options when chatting.'),
                      _buildFeatureItem('Listen to voice message'),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  RoundButton(
                    title: 'Get it for PKR 27800',
                    onTap: () {
                      print(
                        'Purchase selected: ${packages[selectedPackageIndex]}',
                      );
                    },
                    color: const Color(0xFFA259FF),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageCard(int index) {
    final package = packages[index];
    final isSelected = selectedPackageIndex == index;
    final isSpecial = package['isSpecial'] ?? false;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPackageIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: isSelected
                  ? [Color(0xFFA259FF), Color.fromARGB(255, 39, 28, 49)]
                  : [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.2),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            width: 2,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bonus text
            Text(
              package['bonus'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSpecial ? Colors.white : const Color(0xFFA259FF),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),

            // Coin icon and amount
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.monetization_on,
                    color: Colors.purple,
                    size: 14,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  package['coins'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            // Price text
            Text(
              package['price'],
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          // Purple square checkbox - exact match to image
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: const Color(0xFF9C4DCC),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 14),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

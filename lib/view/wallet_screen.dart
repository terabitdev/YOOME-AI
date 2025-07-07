import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/components/wallet_card_widget.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
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
                  Text(
                    'Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                    // Balance Card
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ), // outer margin
                      child: WalletCard(balance: 'X140000', bonus: '+400'),
                    ),
                    SizedBox(height: 24.h),

                    // Packages Grid
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

                    // Features List
                    Column(
                      children: [
                        _buildFeatureItem(
                          'Use advanced models for conversations.',
                        ),
                        _buildFeatureItem('Chat bot continuation'),
                        _buildFeatureItem(
                          'Generate chat options when chatting.',
                        ),
                        _buildFeatureItem('Listen to voice message'),
                      ],
                    ),

                    SizedBox(height: 32.h),

                    // Get it button
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFA259FF), Color(0xFF7B2CBF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: () {
                          print(
                            'Purchase selected: ${packages[selectedPackageIndex]}',
                          );
                        },
                        child: Text(
                          'Get it for PKR 27800',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
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
          gradient: isSpecial
              ? const LinearGradient(
                  colors: [Color(0xFFA259FF), Color(0xFF7B2CBF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSpecial ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFA259FF)
                : Colors.white.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bonus text
              Text(
                package['bonus'],
                style: TextStyle(
                  color: isSpecial ? Colors.white : const Color(0xFFA259FF),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8.h),

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
                  SizedBox(width: 4.w),
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

              SizedBox(height: 8.h),

              // Price
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
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: const Color(0xFFA259FF),
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

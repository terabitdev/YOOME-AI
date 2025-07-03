import 'package:flutter/material.dart';
import 'package:yoome_ai/resources/constants/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilter = 'Explore';

  final List<String> filterOptions = [
    'Explore',
    'Novel',
    'Today',
    'Male',
    'Female',
  ];
  final List<String> gridImages = [
    AppImages.grid1,
    AppImages.grid2,
    AppImages.grid3,
    AppImages.grid4,
    AppImages.grid5,
    AppImages.grid6,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 59, // keep the top inset for status‑bar/toolbar
              bottom: 0, // remove bottom space
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'For You',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(Icons.search, color: Colors.white, size: 24),
              ],
            ),
          ),

          SizedBox(height: 20),
          Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: filterOptions.length,
              itemBuilder: (context, index) {
                final option = filterOptions[index];
                final isSelected = selectedFilter == option;

                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(
                      option,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) => setState(() => selectedFilter = option),
                    showCheckmark: false, // ✨ hides tick icon
                    backgroundColor: const Color.fromARGB(
                      87,
                      48,
                      43,
                      82,
                    ), // not‑selected colour
                    selectedColor: const Color(0xFF8B5CF6), // selected colour
                    side: BorderSide(
                      color: isSelected
                          ? const Color(0xFF8B5CF6)
                          : Colors.grey.withOpacity(0.3),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60), // 60 px radius
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
                mainAxisExtent: 206, // square cells
              ),
              itemCount: gridImages.length,
              itemBuilder: (_, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(gridImages[index], fit: BoxFit.cover),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

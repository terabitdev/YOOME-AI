import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:yoome_ai/resources/components/dual_action_button_widget.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/matthew_supports_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? selectedReport;

  final List<Map<String, dynamic>> characterReports = [
    {'title': 'Suicide and self-harm', 'value': 'suicide_self_harm'},
    {
      'title': 'Harassed or intimidated with violence',
      'value': 'harassment_violence',
    },
    {'title': 'Sharing personal information', 'value': 'personal_info'},
    {'title': 'Misinformation', 'value': 'misinformation'},
    {'title': 'Frauds and scams', 'value': 'frauds_scams'},
    {'title': 'Shown sensitive or sexual content', 'value': 'sexual_content'},
    {'title': 'Hate and harassment', 'value': 'hate_harassment'},
    {
      'title': 'Counterfeits and intellectual property',
      'value': 'counterfeits_ip',
    },
  ];

  final List<Map<String, dynamic>> chatReports = [
    {'title': 'Harmful/unsafe', 'value': 'harmful_unsafe'},
    {'title': 'Illogical', 'value': 'illogical'},
    {'title': 'Boring', 'value': 'boring'},
    {'title': 'Not True', 'value': 'not_true'},
    {'title': 'Repetitive', 'value': 'repetitive'},
    {'title': 'Ended Chat Early', 'value': 'ended_early'},
    {'title': 'Out Of Character', 'value': 'out_of_character'},
    {'title': 'Bad Memory', 'value': 'bad_memory'},
    {'title': 'Too Long', 'value': 'too_long'},
    {'title': 'Too Short', 'value': 'too_short'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/rbackimage.png',
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay for better readability
          SizedBox.expand(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          Column(
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
                  children: [
                    Row(
                      children: [
                        // Signal bars
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),

              // Report Content
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      // Report Header
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Report', style: RSTextStyle18500),
                        ),
                      ),

                      // Scrollable report options
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Character section
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Character',
                                  style: RSTextStyle16500,
                                ),
                              ),
                              SizedBox(height: 10),

                              // Character report options
                              ...characterReports
                                  .map(
                                    (report) => _buildReportOption(
                                      report['title'],
                                      report['value'],
                                    ),
                                  )
                                  .toList(),

                              SizedBox(height: 20),

                              // Chat section
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('Chat', style: RSTextStyle16500),
                              ),
                              SizedBox(height: 10),

                              // Chat report options
                              ...chatReports
                                  .map(
                                    (report) => _buildReportOption(
                                      report['title'],
                                      report['value'],
                                    ),
                                  )
                                  .toList(),

                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),

                      // Bottom buttons
                      Container(
                        padding: EdgeInsets.all(20),
                        child: DualActionButtons(
                          leftLabel: 'Cancel',
                          rightLabel: 'Submit',
                          leftIsPrimary: false,
                          onLeftTap: () {
                            print('Cancel tapped');
                            Navigator.pop(context);
                          },
                          onRightTap: () {
                            Get.to(MatthewSupportsScreen());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportOption(String title, String value) {
    bool isSelected = selectedReport == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedReport = value;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.grey[800]!, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            Expanded(child: Text(title, style: RSTextStyle12400)),
            if (isSelected)
              Icon(Icons.check_circle, color: Colors.purple, size: 20),
          ],
        ),
      ),
    );
  }
}

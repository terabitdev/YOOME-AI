// ────────────────── SMALL HELPERS ──────────────────
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class Subtitle extends StatelessWidget {
  const Subtitle(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) => Text(text, style: PSTextStyle14400);
}

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _StatBlock(count: 0, label: 'Chats'),
      SizedBox(width: 52.w),
      _StatBlock(count: 0, label: 'Followers'),
    ],
  );
}

class ActionRow extends StatelessWidget {
  const ActionRow({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _ActionSquare(
        icon: Image.asset('assets/images/yoome.png', height: 30.h, width: 30.w),
        label: 'YOOME+',
      ),
      _ActionSquare(
        icon: Image.asset(
          'assets/images/wallet.png',
          height: 30.h,
          width: 30.w,
        ),
        label: 'Wallet',
      ),
      _ActionSquare(
        icon: Image.asset(
          'assets/images/persona.png',
          height: 30.h,
          width: 30.w,
        ),
        label: 'Persona',
      ),
    ],
  );
}

class _StatBlock extends StatelessWidget {
  const _StatBlock({required this.count, required this.label, super.key});
  final int count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$count', style: PSTextStyle14400),
        SizedBox(height: 4.h),
        Text(label, style: PSTextStyle14400),
      ],
    );
  }
}

class _ActionSquare extends StatelessWidget {
  const _ActionSquare({required this.icon, required this.label, super.key});

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 98.w,
        height: 69.h, // taller → room for the label
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white.withOpacity(.25)),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 6.h),
            Text(label, textAlign: TextAlign.center, style: PSTextStyle14400),
          ],
        ),
      ),
    );
  }
}

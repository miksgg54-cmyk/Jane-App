import 'dartd:math';
import 'package:flutter/material.dart';

/// 1. نظام الدخوليات والخواتم المتحركة ومتجر CP
class AnimatedAssets {
  static final List<Map<String, String>> animatedEntrances = [
    {"id": "dragon", "name": "دخولية التنين الناري", "path": "assets/anim/dragon.json"},
    {"id": "phoenix", "name": "دخولية العنقاء الملكية", "path": "assets/anim/phoenix.json"},
    {"id": "galaxy", "name": "دخولية المجرة الفضائية", "path": "assets/anim/galaxy.json"},
  ];

  static final List<Map<String, dynamic>> animatedStoreRings = [
    {"id": "ring_fire", "name": "خاتم اللهب المتحرك", "priceCoins": 2000000, "color": "Fire_Red"},
    {"id": "ring_ocean", "name": "خاتم أمواج المحيط", "priceCoins": 3500000, "color": "Ocean_Blue"},
    {"id": "ring_diamond", "name": "خاتم الألماس البراق", "priceCoins": 5000000, "color": "Diamond_White"},
  ];
}

/// 2. نظام تفجير الصناديق العشوائية
class ChestExplosionSystem {
  static Map<String, dynamic> openChest() {
    final Random random = Random();
    int chance = random.nextInt(100);

    if (chance < 60) {
      return {"type": "coins", "amount": 500, "message": "ربحت 500 كوينز!"};
    } else if (chance < 90) {
      return {"type": "coins", "amount": 2000, "message": "ربحت 2,000 كوينز!"};
    } else {
      return {"type": "frame", "amount": 1, "message": "حصلت على إطار مؤقت مميز!"};
    }
  }
}

/// 3. محرك الاشتراكات وتسعير SVIP والارستقراطية
class SubscriptionPricingEngine {
  static double getSVIPPriceInUSD(int level) {
    switch (level) {
      case 1: return 0.0;
      case 2: return 2.0;
      case 3: return 4.0;
      case 4: return 6.0;
      case 5: return 8.0;
      case 6: return 12.0;
      default: return 12.0;
    }
  }

  static double getAristocracyPriceInUSD(int level) {
    switch (level) {
      case 1: return 1.0;
      case 2: return 4.0;
      case 3: return 6.0;
      default: return 1.0;
    }
  }
}

/// 4. نظام وكلاء الشحن المعتمدين (Recharge Agency)
class RechargeAgentModel {
  final String agentId;
  final String agentName;
  bool isAuthorizedByOwner;
  double agentCoinsBalance;

  RechargeAgentModel({
    required this.agentId,
    required this.agentName,
    this.isAuthorizedByOwner = true,
    this.agentCoinsBalance = 0.0,
  });

  bool transferCoinsToUser({required double amount, required Function(double) onSuccess}) {
    if (agentCoinsBalance >= amount && isAuthorizedByOwner) {
      agentCoinsBalance -= amount;
      onSuccess(amount);
      return true;
    }
    return false;
  }
}

/// 5. نظام تصويت السوبر أدمن (200 مليون صوت / هاشتاج لمدة شهرين)
class SuperAdminVotingSystem {
  final String candidateUserId;
  final String candidateName;
  double totalVotesCoins;
  final double requiredVotesThreshold = 200000000.0;
  bool isSuperAdminGranted;
  DateTime? hashtagExpirationDate;

  SuperAdminVotingSystem({
    required this.candidateUserId,
    required this.candidateName,
    this.totalVotesCoins = 0.0,
    this.isSuperAdminGranted = false,
  });

  void voteForCandidate(double coinsAmount) {
    if (isSuperAdminGranted) return;
    totalVotesCoins += coinsAmount;

    if (totalVotesCoins >= requiredVotesThreshold) {
      isSuperAdminGranted = true;
      hashtagExpirationDate = DateTime.now().add(const Duration(days: 60));
    }
  }

  bool isHashtagActive() {
    if (hashtagExpirationDate == null) return false;
    return DateTime.now().isBefore(hashtagExpirationDate!);
  }
}

/// 6. نظام الـ CP والتأثيرات والذبذبات
enum CPType { married, bestFriends }

class CPSystem {
  final String partner1Id;
  final String partner2Id;
  final CPType type;
  int cpLevel;
  double cpExp;
  String ringColor;

  CPSystem({
    required this.partner1Id,
    required this.partner2Id,
    required this.type,
    this.cpLevel = 1,
    this.cpExp = 0.0,
    this.ringColor = "Silver",
  });

  void addCPExperience(double amount) {
    if (cpLevel >= 7) return;
    cpExp += amount;
    if (cpExp >= cpLevel * 5000) {
      cpLevel++;
      _updateCPRing();
    }
  }

  void _updateCPRing() {
    List<String> colors = [
      "Silver", "Ruby Red", "Emerald Green", 
      "Sapphire Blue", "Golden Sparkle", "Diamond Violet", "Crown Platinum"
    ];
    ringColor = colors[(cpLevel - 1).clamp(0, 6)];
  }

  Map<String, dynamic> getMicEffects() {
    return {
      "hasMicWaveEffect": true,
      "vibrationIntensity": cpLevel * 10,
      "ringDisplayColor": ringColor,
      "cpTitle": type == CPType.married ? "شريك الحياة 💍" : "صداقة حميمية 🌟",
    };
  }
}

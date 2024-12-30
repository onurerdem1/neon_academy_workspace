import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _interstitialAd?.show();
          _interstitialAd?.fullScreenContentCallback =
              FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              ad.dispose();
            },
          );
        },
        onAdFailedToLoad: (error) {
          print('Failed to load interstitial ad: $error');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class HomePage extends StatelessWidget {
  final BannerAd _bannerAd = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  Widget build(BuildContext context) {
    _bannerAd.load();

    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RewardPage()),
                  );
                },
                child: Text('Go to Premium Feature'),
              ),
            ),
          ),
          if (_bannerAd != null)
            Container(
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
        ],
      ),
    );
  }
}

class RewardPage extends StatefulWidget {
  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _rewardedAd?.show(
            onUserEarnedReward: (ad, reward) {
              print('User earned reward: ${reward.amount} ${reward.type}');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PremiumPage()),
              );
            },
          );
        },
        onAdFailedToLoad: (error) {
          print('Failed to load rewarded ad: $error');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reward Page')),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class PremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Premium Feature')),
      body: Center(
        child: Text('Welcome to the Premium Feature!',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

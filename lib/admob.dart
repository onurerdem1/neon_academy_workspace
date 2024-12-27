import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePageAds extends StatefulWidget {
  const HomePageAds({super.key});

  @override
  State<HomePageAds> createState() => _HomePageAdsState();
}

class _HomePageAdsState extends State<HomePageAds> {
  BannerAd? bannerAd;
  bool isBannerReady = false;

  void initState() {
    super.initState();
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3481233176156397/9593486853",
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isBannerReady = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            print(error);
            ad.dispose();
          },
        ),
        request: AdRequest())
      ..load();
  }

  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (isBannerReady)
            Container(
              height: bannerAd!.size.height.toDouble(),
              width: bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: bannerAd!),
            )
        ],
      ),
    );
  }
}

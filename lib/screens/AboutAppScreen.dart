import 'package:flutter/material.dart';
import 'package:mighty_news/utils/Colors.dart';
import 'package:mighty_news/utils/Common.dart';
import 'package:mighty_news/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';

import '../AppLocalizations.dart';
import '../main.dart';

class AboutAppScreen extends StatelessWidget {
  static String tag = '/AboutAppScreen';

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;

    return SafeArea(
      top: !isIos ? true : false,
      child: Scaffold(
        appBar: appBarWidget(appLocalization.translate('about'), showBack: true, color: getAppBarWidgetBackGroundColor(), textColor: getAppBarWidgetTextColor()),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mAppName, style: primaryTextStyle(size: 30)),
              16.height,
              Container(
                decoration: BoxDecoration(color: colorPrimary, borderRadius: radius(4)),
                height: 4,
                width: 100,
              ),
              16.height,
              Text(appLocalization.translate('version'), style: secondaryTextStyle()),
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    return Text('${snap.data!.version.validate()}', style: primaryTextStyle());
                  }
                  return SizedBox();
                },
              ),
              16.height.visible(getStringAsync(LAST_UPDATE_DATE).isNotEmpty),
              Text('Last Update', style: secondaryTextStyle()).visible(getStringAsync(LAST_UPDATE_DATE).isNotEmpty),
              Text(getStringAsync(LAST_UPDATE_DATE), style: primaryTextStyle()),
              16.height.visible(getStringAsync(LAST_UPDATE_DATE).isNotEmpty),
              Text('Sursa stiri', style: secondaryTextStyle()),
              Text('Legal-easy.ro', style: primaryTextStyle()),
              16.height,
              Text(
                '$mAppName este un proiect al Business Vision Consulting S.R.L. și VP&Partners (Volosevici & Plăcintă - Societate civilă de avocați), care își propune să prezinte informații într-o formă clară, accesibilă non-juriștilor, având ca obiectiv principal promovarea culturii juridice și, prin aceasta, a valorilor democratice.',
                style: primaryTextStyle(size: 14),
                textAlign: TextAlign.justify,
              ),
              16.height,
              /*AppButton(
                color: appStore.isDarkMode ? scaffoldSecondaryDark : colorPrimary,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.contact_support_outlined, color: Colors.white),
                    8.width,
                    Text('Contact Us', style: boldTextStyle(color: white)),
                  ],
                ),
                onTap: () {
                  launchUrl('mailto:${getStringAsync(CONTACT_PREF)}');
                },
              ),
              16.height,*/
              AppButton(
                color: appStore.isDarkMode ? scaffoldSecondaryDark : colorPrimary,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image.asset('assets/purchase.png', height: 24, color: white),
                    // 8.width,
                    Text('Legal-easy.ro', style: boldTextStyle(color: white)),
                  ],
                ),
                onTap: () {
                  launchUrl(codeCanyonURL);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

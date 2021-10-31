import 'package:flutter/material.dart';
import 'package:mighty_news/components/ReadAloudDialog.dart';
import 'package:mighty_news/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';

class ReadAloudScreen extends StatefulWidget {
  final String text;

  ReadAloudScreen(this.text);

  @override
  _ReadAloudScreenState createState() => _ReadAloudScreenState();
}

class _ReadAloudScreenState extends State<ReadAloudScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    setDynamicStatusBarColorDetail(milliseconds: 400);
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Read Aloud',
        color: getAppBarWidgetBackGroundColor(),
        textColor: getAppBarWidgetTextColor(),
      ),
      body: Container(
        width: context.width(),
        height: context.height(),
        child: Column(
          children: [
            ReadAloudDialog(widget.text),
            8.height,
            Divider(),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(widget.text, style: primaryTextStyle()),
            ).expand(),
          ],
        ),
      ),
    );
  }
}

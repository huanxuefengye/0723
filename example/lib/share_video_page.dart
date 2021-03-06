import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';

class ShareVideoPage extends StatefulWidget {
  @override
  _ShareMusicPageState createState() => _ShareMusicPageState();
}

class _ShareMusicPageState extends State<ShareVideoPage> {
  String _videoUrl = "http://www.qq.com";
  String _videoLowBandUrl = "http://www.qq.com";
  String _title = "Beyond";
  String _description = "A Popular Rock Band From China";
  String _thumnail = "images/logo.png";
  WeChatScene scene = WeChatScene.SESSION;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text("ShareVideoPage"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: _share)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: TextEditingController(
                  text:
                      "http://staff2.ustc.edu.cn/~wdw/softdown/index.asp/0042515_05.ANDY.mp3"),
              onChanged: (str) {
                _videoUrl = str;
              },
              decoration: InputDecoration(labelText: "video url"),
            ),
            new TextField(
              controller: TextEditingController(text: "http://www.qq.com"),
              onChanged: (str) {
                _videoLowBandUrl = str;
              },
              decoration: InputDecoration(labelText: "video low band url"),
            ),
            new TextField(
              controller: TextEditingController(text: "Beyond"),
              onChanged: (str) {
                _title = str;
              },
              decoration: InputDecoration(labelText: "title"),
            ),
            new TextField(
              controller:
                  TextEditingController(text: "A Popular Rock Band From China"),
              onChanged: (str) {
                _description = str;
              },
              decoration: InputDecoration(labelText: "description"),
            ),
            new TextField(
              controller: TextEditingController(text: "images/logo.png"),
              onChanged: (str) {
                _thumnail = str;
              },
              decoration: InputDecoration(labelText: "thumbnail"),
            ),
            new Row(
              children: <Widget>[
                const Text("?????????"),
                Row(
                  children: <Widget>[
                    new Radio<WeChatScene>(
                        value: WeChatScene.SESSION,
                        groupValue: scene,
                        onChanged: (v) {
                          if (v != null) handleRadioValueChanged(v);
                        }),
                    const Text("??????")
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio<WeChatScene>(
                        value: WeChatScene.TIMELINE,
                        groupValue: scene,
                        onChanged: (v) {
                          if (v != null) handleRadioValueChanged(v);
                        }),
                    const Text("?????????")
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio<WeChatScene>(
                        value: WeChatScene.FAVORITE,
                        groupValue: scene,
                        onChanged: (v) {
                          if (v != null) handleRadioValueChanged(v);
                        }),
                    const Text("??????")
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _share() {
    var model = new WeChatShareVideoModel(
        videoUrl: _videoUrl,
        videoLowBandUrl: _videoLowBandUrl,
        thumbnail: WeChatImage.network(_thumnail),
        description: _description,
        scene: this.scene,
        title: _title);
    shareToWeChat(model);
  }

  void handleRadioValueChanged(WeChatScene scene) {
    setState(() {
      this.scene = scene;
    });
  }
}

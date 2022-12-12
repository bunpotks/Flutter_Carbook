import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  dynamic id;

  ScreenArguments(this.id);
}

class MessageDetail extends StatelessWidget {
  const MessageDetail({super.key});
  static const routeName = "/message_detail";

  // const MessageDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        // leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Hero(
        tag: args.id['id'].toString(),
        child: Card(
          child: Column(
            children: [
              ListTile(
                // onTap: () {
                //   // Navigator.push(
                //   //     context,
                //   //     MaterialPageR`oute(
                //   //         builder: (context) => MessageDetail()));
                //   Navigator.pushNamed(context, '/message_detail');
                // },
                title: Text(args.id['id'].toString()),
                subtitle: Text('ioasjdioasjoidasiod'),
                trailing: Text('ioasjdioasjoidasiod'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class MessageDetailsArguments {
//   final String id;

//   MessageDetailsArguments({this.id});
// }

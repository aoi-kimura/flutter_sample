import 'package:flutter/material.dart';
import 'package:flutter_sample/model/Item.dart';
import 'package:flutter_sample/page/DetailPage.dart';
import 'package:provider/provider.dart';
import 'HomeRepository.dart';
import 'HomeViewModel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomeViewModel(repo: HomeRepository())),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: HomeTextField(),
                ),
                Divider(height: 1.0),
                Flexible(
                  child: HomeList(),
                ),
              ],
            ),
          )),
    );
  }
}

class HomeTextField extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      onChanged: Provider.of<HomeViewModel>(context).onChanged,
      decoration: InputDecoration.collapsed(hintText: '検索'),
    );
  }
}

class HomeList extends StatelessWidget {
  final TextStyle font = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        final int index = i ~/ 2;

        return _buildRow(
            Provider.of<HomeViewModel>(context).items[index], context);
      },
      itemCount: Provider.of<HomeViewModel>(context).items.length * 2,
    );
  }

  Widget _buildRow(Item item, BuildContext context) {
    return ListTile(
        title: Text(
          item.title,
          style: font,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return DetailPage(item: item);
              },
            ),
          );
        });
  }
}

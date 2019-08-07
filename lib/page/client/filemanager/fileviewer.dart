/*
* Copyright 2018-2019 HoneyBadger9
*
* Licensed under the GNU General Public License v3.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*    https://www.gnu.org/licenses/gpl-3.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pterodactyl_app/page/client/filemanager/fileactions.dart';
import 'package:pterodactyl_app/page/client/filemanager/filemanager.dart';
import 'package:pterodactyl_app/page/client/filemanager/texteditor.dart';
import 'package:pterodactyl_app/page/client/filemanager/widgets/CustomTooltip.dart';
import 'package:pterodactyl_app/page/client/filemanager/widgets/ReusableDialog.dart';
import 'package:pterodactyl_app/page/client/filemanager/widgets/SyntaxHighlighter.dart';

///FileViewer is used by FileManager to show files before editing.
class FileViewer extends StatefulWidget {
  final FileData fileData;
  final FileActions fileActions;

  const FileViewer({
    @required this.fileData,
    @required this.fileActions,
  });

  @override
  _FileViewerState createState() => _FileViewerState();
}

class _FileViewerState extends State<FileViewer> {
  final fileViewerScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: fileViewerScaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomTooltip(
          message: widget.fileData.name,
          child: Text(
            widget.fileData.name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          CustomTooltip(
            message: "Delete this file",
            child: IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: _delete,
            ),
          ),
          if (widget.fileData.type == FileType.Text)
            CustomTooltip(
              message: "Edit this file",
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                ),
                onPressed: _edit,
              ),
            ),
        ],
      ),
      body: widget.fileData.type == FileType.Image ? _showImage() : _showText(),
    );
  }

  void _delete() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => ReusableDialog(
              "Are you sure?",
              "Do you really want to delete this ${widget.fileData.type == FileType.Folder ? "folder" : "file"}: ${widget.fileData.name}",
              button1Text: "NO",
              button1Function: () {},
              button2Text: "Yes, delete it.",
              button2Function: () => Navigator.of(context).pop(true),
              //popping this page with true means the previous page will process functions to delete it. MUST use only when needed.
            ));
  }

  Widget _showImage() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: PhotoView(
        backgroundDecoration: BoxDecoration(color: Colors.grey),
        maxScale: 2.00,
        minScale: 0.3,
        imageProvider: NetworkImage(
            //TODO
            widget.fileActions.getCompleteApiAddress(widget.fileData),
            headers: {
              "Accept": widget.fileData.mime,
              "Authorization": "Bearer ${widget.fileActions.getApiKey()}",
            }),
        enableRotation: false,
      ),
    );
  }

  Widget _showText() {
    return FutureBuilder(
        future: widget.fileActions.getFile(widget.fileData),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Loading file"),
                ],
              ),
            );
          }
          return _textContainer(snapshot.data);
        });
  }

  Widget RichTextForConsole(List<TextSpan> list) {
    List<Widget> richies = [];
    list.forEach((t) {
      richies.add(Row(children: <Widget>[Container(child: RichText(text: t))]));
    });
    return Row(
      children: richies,
    );
  }

  Widget _textContainer(String text) {
    List<String> t = text.split("\n");
    List<TextSpan> res = [];
    SyntaxHighlighter dart = new DartSyntaxHighlighter();
    t.forEach((d) {
      if (d != null) {
        res.add(dart.format(d));
      }
    });
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(10), child: RichTextForConsole(res))),
        ),
      ),
    );
  }

  void _edit() {
    var route = MaterialPageRoute(
        builder: (BuildContext context) => TextEditorPage(
              fileData: widget.fileData,
              fileActions: widget.fileActions,
            ));
    Navigator.of(context).push(route);
  }
}

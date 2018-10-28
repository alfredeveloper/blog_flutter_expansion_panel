import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyApp(), debugShowCheckedModeBanner: true,));

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class Pregunta{
  bool isExpanded;
  String header;
  Widget body;

  Pregunta(this.isExpanded, this.header, this.body);
}


class _State extends State<MyApp>{

  List<Pregunta> _preguntas = new List<Pregunta>();

  @override
  void initState() {
    _preguntas.add(
        new Pregunta(
          false,
          "¿Por que no puedo acceder con mi cuenta?",
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Text('Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)'),
          )
        )
    );

    _preguntas.add(
        new Pregunta(
            false,
            "¿Cómo puedo recuperar mi contraseña?",
            new Container(
              padding: new EdgeInsets.all(10.0),
              child: new Text('Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)'),
            )
        )
    );

    _preguntas.add(
        new Pregunta(
            false,
            "¿Cómo puedo saber el estado de mi pedido?",
            new Container(
              padding: new EdgeInsets.all(10.0),
              child: new Text('Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)'),
            )
        )
    );
  }

  ExpansionPanel _createItem(Pregunta pregunta){
    return new ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded){
          return new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Text('${pregunta.header}'),
          );
        },
        body: pregunta.body,
        isExpanded: pregunta.isExpanded
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Preguntas frecuentes"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded){
                setState(() {
                  _preguntas[index].isExpanded = !_preguntas[index].isExpanded;
                });
              },
              children: _preguntas.map(_createItem).toList(),
            )
          ],
        ),
      ),
    );
  }
}
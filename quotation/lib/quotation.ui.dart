import 'package:flutter/material.dart';
import 'package:quotation/component/input.dart';
import 'package:quotation/quotation.controller.dart';

class HgFinance extends StatefulWidget {
  @override
  _HgFinanceState createState() => _HgFinanceState();
}

class _HgFinanceState extends State<HgFinance> {
  Quotation quotation = new Quotation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("HGFINANCE"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: quotation.clearAll)
        ],
        backgroundColor: Colors.amber,
      ),
      /* O FutureBuilder() serve para apresentar algo enquanto 
      o seu aplicativo esta criando algo ou pegando dados de uma API*/
      body: FutureBuilder<Map>(
          // Diz qual future metodo usar
          future: quotation.getData(),
          // Faz as condicionais para cada callback utilizando ConnectionState
          //Função que irá usar o FutureBuilder
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text(
                    "Carregando Dados...",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              //Em caso de não precisar carregar ele exibira isso
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao Carregar Dados...",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  // Envia a resposta do json para a classe
                  quotation.dolar =
                      snapshot.data["results"]["currencies"]["USD"]["buy"];
                  quotation.euro =
                      snapshot.data["results"]["currencies"]["EUR"]["buy"];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          size: 120,
                          color: Colors.amber,
                        ),
                        buildTextField("Reais", "R", quotation.realController,
                            quotation.realChanged),
                        buildTextField("Dólar", "US", quotation.dolarController,
                            quotation.dolarChanged),
                        buildTextField("Euro", "€", quotation.euroController,
                            quotation.euroChanged),
                      ],
                    )),
                  );
                }
            }
          }),
    );
  }
}

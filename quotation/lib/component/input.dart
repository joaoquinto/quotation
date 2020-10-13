import 'package:flutter/material.dart';

Widget buildTextField(String label, String prefix,
    TextEditingController tController, Function method) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: tController,
      keyboardType: TextInputType.number,
      cursorColor: Colors.amber,
      style: TextStyle(color: Colors.amber),
      decoration: InputDecoration(
        labelText: "$label",
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        // Modifica o prefix dependendo da entrada
        prefixText: "${prefix == "€" ? prefix : "$prefix\$"}",
        prefixIcon: Icon(
          Icons.attach_money,
          color: Colors.amber,
        ),
      ),
      onChanged: method,
    ),
  );
}

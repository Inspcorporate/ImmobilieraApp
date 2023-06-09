import 'package:flutter/material.dart';

class PropertyRelookingRequest {
  String propertyName;
  String propertyAddress;
  String additionalDetails;

  PropertyRelookingRequest({required this.propertyName,required this.propertyAddress,required this.additionalDetails});
}

class RelookingDialog extends StatefulWidget {
  @override
  _RelookingDialogState createState() => _RelookingDialogState();
}

class _RelookingDialogState extends State<RelookingDialog> {
  final _formKey = GlobalKey<FormState>();
  final _relookingRequest = PropertyRelookingRequest(additionalDetails: '', propertyAddress: '', propertyName: '');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Demande de relooking'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nom du bien'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer le nom du bien immobilier.';
                }
                return null;
              },
              onSaved: (value) {
                _relookingRequest.propertyName = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Adresse du bien'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer l\'adresse du bien immobilier.';
                }
                return null;
              },
              onSaved: (value) {
                _relookingRequest.propertyAddress = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Détails supplémentaires'),
              onSaved: (value) {
                _relookingRequest.additionalDetails = value!;
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: Text('Annuler'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Envoyer'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              // Traitez la demande de relooking ici en utilisant les données du formulaire
              // _relookingRequest.propertyName contient le nom du bien immobilier
              // _relookingRequest.propertyAddress contient l'adresse du bien immobilier
              // _relookingRequest.additionalDetails contient les détails supplémentaires

              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
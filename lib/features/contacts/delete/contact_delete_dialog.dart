import 'package:flutter/material.dart';

class ContactDeleteDialog extends AlertDialog {
  ContactDeleteDialog(BuildContext context, {Key? key})
      : super(
          key: key,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text('Deseja excluir o contato?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Nome do contato'),
              Text('E-mail do contato'),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Sim'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Não'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    SnackBar snackbar = SnackBar(
      action: SnackBarAction(label: 'OK', onPressed: () {}),
      content: const Text('Hola mundo'),
      duration: const Duration(milliseconds: 1000),
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Estas seguro?'),
          content: const Text(
              'Culpa aliquip irure excepteur velit labore deserunt consequat officia ex officia tempor fugiat elit. Occaecat officia enim tempor Lorem aute velit tempor reprehenderit fugiat enim aute nostrud do sint. Nostrud deserunt in ut reprehenderit. Eu consequat aute ipsum eu culpa sit adipisicing. Commodo aliqua aliquip velit pariatur id sint anim officia aliquip dolor nisi quis occaecat.'),
          actions: [
            TextButton(
                onPressed: () => context.pop(), child: const Text('Cancelar')),
            FilledButton(
                onPressed: () => context.pop(), child: const Text('Aceptar')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SNACKBAR')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () => showAboutDialog(
                      context: context,
                      children: const [
                        Text(
                            'Laborum sunt ut non et labore do consectetur nostrud sunt. Exercitation reprehenderit ex non excepteur nostrud. Enim laborum excepteur consectetur culpa enim velit minim cillum elit cillum quis. Fugiat ea do consequat enim voluptate culpa aute ea. Proident ipsum enim culpa nulla duis exercitation nisi nulla velit nulla. Pariatur aliquip ad tempor aliquip anim. Non mollit officia laborum veniam voluptate minim amet veniam veniam culpa officia officia.'),
                      ],
                    ),
                child: const Text('Mostrar licensias')),
            FilledButton.tonal(
                onPressed: () => showCustomDialog(context),
                child: const Text('Mostrar diálogos')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('show snackbar'),
        icon: const Icon(Icons.snapchat_rounded),
      ),
    );
  }
}

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/settings/data/terms_of_use.dart';
import 'package:project_marba/src/features/settings/data/privacy_policy.dart'; // Importa o arquivo de política de privacidade

class PrivacyView extends ConsumerWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacidade'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.privacy_tip,
                color: Theme.of(context).colorScheme.primary),
            title: const Text('Política de Privacidade'),
            subtitle: const Text('Saiba como protegemos suas informações'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const PolicyWidget();
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.description,
                color: Theme.of(context).colorScheme.primary),
            title: const Text('Termos de Uso'),
            subtitle: const Text('Leia nossos termos e condições'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const TermsOfUseWidget();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class TermsOfUseWidget extends StatefulWidget {
  const TermsOfUseWidget({
    super.key,
  });

  @override
  TermsOfUseWidgetState createState() => TermsOfUseWidgetState();
}

class TermsOfUseWidgetState extends State<TermsOfUseWidget> {
  late ScrollController _scrollController;
  bool _isAcceptEnabled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isAcceptEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Dialog.fullscreen(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  trackVisibility: true,
                  child: Markdown(
                    controller: _scrollController,
                    data: termsOfUseText,
                  ),
                ),
              ),
            ),
            ButtonBar(
              children: [
                TextButton(
                  onPressed: _isAcceptEnabled ? () {} : null,
                  child: const Text('Aceitar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Fechar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PolicyWidget extends StatefulWidget {
  const PolicyWidget({
    super.key,
  });

  @override
  PolicyWidgetState createState() => PolicyWidgetState();
}

class PolicyWidgetState extends State<PolicyWidget> {
  late ScrollController _scrollController;
  bool _isAcceptEnabled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isAcceptEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Dialog.fullscreen(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  trackVisibility: true,
                  child: Markdown(
                    controller: _scrollController,
                    data: privacyPolicyText,
                  ),
                ),
              ),
            ),
            ButtonBar(
              children: [
                TextButton(
                  onPressed: _isAcceptEnabled ? () {} : null,
                  child: const Text('Aceitar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Fechar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class ButtonsScreens extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screens')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 10,
        alignment: WrapAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
          const ElevatedButton(
              onPressed: null, child: Text('Elevated Disabled')),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarm_rounded),
            label: const Text('Elevated Icon'),
          ),
          FilledButton(onPressed: () {}, child: const Text('Filled')),
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc_sharp),
              label: const Text('Filled Icon')),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_business),
            label: const Text('Outlined Icon'),
          ),
          TextButton(onPressed: () {}, child: const Text('Text Button')),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.alarm_add_sharp),
            label: const Text('Text Button Icon'),
          ),
          const CustomButton(),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.reviews_outlined)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.reviews_outlined),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: const WidgetStatePropertyAll(Colors.white)),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

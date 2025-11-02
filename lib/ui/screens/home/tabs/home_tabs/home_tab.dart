import 'package:evently/ui/screens/home/tabs/home_tabs/widgets/event_card.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
              child:ListView.separated(
                  itemBuilder: (context, index) => EventCard(),
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemCount: 10,
              ),
          ),
        ],
      ),
    );
  }
}

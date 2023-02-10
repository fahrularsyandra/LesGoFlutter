import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/learning/views/active_learning_view.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

import '../controllers/learning_controller.dart';

class LearningView extends GetView<LearningController> {
  const LearningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('LearningView'),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                icon: h5("Active"),
              ),
              Tab(
                icon: h5("History"),
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ActiveLearningView(),
              ),
              Icon(Icons.baby_changing_station)
            ],
          ),
        ),
      ),
    );
  }
}

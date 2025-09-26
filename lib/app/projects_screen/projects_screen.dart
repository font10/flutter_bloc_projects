import 'package:flutter/material.dart';
import 'package:flutter_bloc_projects/app/projects_screen/project_screens_args.dart';
import 'package:flutter_bloc_projects/app/projects_screen/projects_screen_data.dart';
import 'package:flutter_bloc_projects/shared/extensions/widget_extension.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProjectsScreenArgs> items = ProjectsScreenData.items;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: const CustomAppBar(title: 'Bloc Projects'),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(color: const Color(0xFF333333), width: 0.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(items[index].icon, color: Colors.grey.shade500, size: 48),
                const SizedBox(height: 8),
                Text(items[index].title, style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
              ],
            ).onTap(() => context.goNamed(items[index].route)),
          );
        },
      ),
    );
  }
}

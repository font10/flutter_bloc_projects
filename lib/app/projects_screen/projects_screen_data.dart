import 'package:flutter/material.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/app/projects_screen/project_screens_args.dart';

class ProjectsScreenData {
  static final List<ProjectsScreenArgs> items = [
    ProjectsScreenArgs(title: 'Image Picker', icon: Icons.image, route: Routes.imagePickerRoute),
    ProjectsScreenArgs(title: 'Auth supabase', icon: Icons.app_registration_sharp, route: Routes.authSupabaseRoute),
  ];
}

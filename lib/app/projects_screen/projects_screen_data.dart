import 'package:flutter/material.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/app/projects_screen/project_screens_args.dart';

class ProjectsScreenData {
  static final List<ProjectsScreenArgs> items = [
    ProjectsScreenArgs(title: 'Image Picker', icon: Icons.image, route: Routes.imagePickerRoute),
    ProjectsScreenArgs(title: 'Auth supabase', icon: Icons.app_registration_sharp, route: Routes.authSupabaseRoute),
    ProjectsScreenArgs(title: 'Timers wod', icon: Icons.timer_sharp, route: Routes.authSupabaseRoute),
    ProjectsScreenArgs(title: 'Notes app drift', icon: Icons.sticky_note_2_sharp, route: Routes.imagePickerRoute),
    ProjectsScreenArgs(title: 'Cropper + filter image', icon: Icons.filter, route: Routes.imagePickerRoute),
    ProjectsScreenArgs(title: 'QR Scanner', icon: Icons.qr_code_2, route: Routes.imagePickerRoute),
    /*ProjectsScreenArgs(title: 'Audio recorder', icon: Icons.multitrack_audio, route: Routes.imagePickerRoute),
    ProjectsScreenArgs(
        title: 'Notificación push', icon: Icons.notifications_active_outlined, route: Routes.imagePickerRoute),*/
    //ProjectsScreenArgs(title: 'Chat supabase', icon: Icons.sticky_note_2_sharp, route: Routes.imagePickerRoute),
  ];
}

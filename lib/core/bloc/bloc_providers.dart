import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth_mode/auth_mode_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/signup_form/signup_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/data/service/image_picker_service.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_projects/di/injection.dart' as inj;

class BlocProviders {
  static List<BlocProvider> blocs() {
    return <BlocProvider>[
      BlocProvider(
        create: (context) => ImagePickerBloc(ImagePickerService()),
      ),
      BlocProvider<AuthBloc>(
        create: (context) => inj.sl<AuthBloc>(),
      ),
      BlocProvider<AuthModeBloc>(
        create: (context) => inj.sl<AuthModeBloc>(),
      ),
      BlocProvider<LoginFormBloc>(
        create: (context) => inj.sl<LoginFormBloc>(),
      ),
      BlocProvider<SignUpFormBloc>(
        create: (context) => inj.sl<SignUpFormBloc>(),
      ),
    ];
  }
}

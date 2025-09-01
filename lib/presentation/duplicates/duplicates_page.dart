import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora/application/duplicates/duplicates_bloc.dart';
import 'package:sora/injection.dart';
import 'package:sora/presentation/duplicates/duplicates_layout.dart';
import 'package:sora/utils/palette.dart';

@RoutePage()
class DuplicatesPage extends StatelessWidget {
  const DuplicatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: BlocProvider(
        create: (context) => 
            getIt<DuplicatesBloc>()..add(const DuplicatesEvent.init()),
        child: const SafeArea(child: DuplicatesLayout()),
      ),
    );
  }
}

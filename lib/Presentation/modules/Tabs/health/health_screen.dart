import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';

import 'package:newsapp/Presentation/widgets/ArticaleBuilder.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppNewsCubit.get(context).getHealth();
      return BlocBuilder<AppNewsCubit, AppNewsStates>(
        builder: ((context, state) {
          var lsit = AppNewsCubit.get(context).health;
          return ArticalBuilder(list: lsit);
        }),
      );
    });
  }
}

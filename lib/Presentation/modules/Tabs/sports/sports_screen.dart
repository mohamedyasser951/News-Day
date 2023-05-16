import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';

import 'package:newsapp/Presentation/widgets/ArticaleBuilder.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppNewsCubit.get(context).getSports();
      return BlocBuilder<AppNewsCubit, AppNewsStates>(
          builder: ((context, state) {
            var list = AppNewsCubit.get(context).sports;
            return ArticalBuilder(list: list);
          }));
    });
  }
}

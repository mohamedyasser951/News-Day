import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';


import 'package:newsapp/Presentation/widgets/ArticaleBuilder.dart';

class EntertainmenrScreen extends StatelessWidget {
  const EntertainmenrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppNewsCubit.get(context).getEntertainment();
      return BlocBuilder<AppNewsCubit, AppNewsStates>(
          builder: ((context, state) {
            var list = AppNewsCubit.get(context).entertainment;
            return ArticalBuilder(list: list);
          }));
    });
  }
}

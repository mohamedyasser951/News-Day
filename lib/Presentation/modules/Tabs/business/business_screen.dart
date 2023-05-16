import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';

import 'package:newsapp/Presentation/widgets/ArticaleBuilder.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppNewsCubit.get(context).getBusiness();
      return BlocBuilder<AppNewsCubit, AppNewsStates>(
          builder: ((context, state) {
        var list = AppNewsCubit.get(context).business;
        return ScreenTypeLayout(
          breakpoints: const ScreenBreakpoints(
              desktop: 650.0, tablet: 500.0, watch: 300.0),
          mobile: Builder(builder: (context) {
            AppNewsCubit.get(context).setDesktop(false);
            return ArticalBuilder(list: list);
          }),
          desktop: Builder(builder: (context) {
            AppNewsCubit.get(context).setDesktop(true);
            return Row(
              children: [
                Expanded(
                    flex: 2,
                    child: ArticalBuilder(
                      list: list,
                    )),
                if (!list.isEmpty)
                  Expanded(
                      child: Container(
                    color: Colors.grey[200],
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "${list[AppNewsCubit.get(context).selectedItemBusiness]['description']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
              ],
            );
          }),
        );
      }));
    });
  }
}

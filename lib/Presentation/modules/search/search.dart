import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';
import 'package:newsapp/Presentation/widgets/ArticaleBuilder.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    AppNewsCubit.get(context).search = [];
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppNewsCubit, AppNewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: SearchItem(searchController: searchController),
              ),
              body: Column(
                children: [
                  if (state is AppNewsSearchsLoadingState) LoadingBuilder(),
                  Expanded(
                      child: ArticalBuilder(
                    list: AppNewsCubit.get(context).search,
                    isSearch: true,
                  )),
                ],
              ),
            ),
          );
        });
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 56,
        child: Center(
          child: TextFormField(
            style: AppNewsCubit.get(context).isDarkMode
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.black),

            onChanged: (String val) {
              AppNewsCubit.get(context).getSearch(val);
            },
            // onFieldSubmitted: (val) {
            //   AppNewsCubit.get(context).getSearch(val);
            // },
            controller: searchController,
            keyboardType: TextInputType.text,
            autocorrect: true,
            autofocus: true,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.search_outlined),
            ),
          ),
        ),
      ),
    );
  }
}

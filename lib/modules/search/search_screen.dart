import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/components.dart';
import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context ,state) {},
      builder: (context ,state){
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: DefaultField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: ( value){
                      if(value!.isEmpty){
                        return 'search is empty';
                      }
                      return null;
                    },
                    label: 'search',
                    preFix: Icons.search,
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    }
                ),
              ),
              Expanded(
                  child: articleBuilder(list, context , isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}

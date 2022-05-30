

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var list=NewsCubit.get(context).science;
          return articleBuilder(list ,context);

        });
  }
}

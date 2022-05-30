import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../modules/web_view/web_view.dart';

void navigateTo(context , widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>widget,
  ),
);


Widget articleBuilder(list,context, {isSearch =false})=> ConditionalBuilder(
  condition: list.length > 0,
  builder: (context)=>ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>buildArticleItem(list[index],context),
      separatorBuilder: (context,index)=> myDivider(),
      itemCount: 15),
  fallback: (context)=>isSearch ? Container(
    child: Center(child: Text('Nothing To Search YET',style: TextStyle(fontSize: 20,color: Colors.grey),)),
  ) : Center(child: CircularProgressIndicator()),);


Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(
                  '${article['urlToImage']== null ? article['urlToImage'] = 'https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg?fbclid=IwAR1JQjvMOzlpOzIyPzGJIwRXJO1Pjau-Q_jCV08yAVlOidOykfIYOyjPdJc ':article['urlToImage'] =article['urlToImage'] }'
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 4, overflow: TextOverflow.ellipsis,),
                ),
                Text('${article['publishedAt']}',

                  style: TextStyle(color: Colors.grey),)

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

Widget myDivider()=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    width: double.infinity,
    height: 2,
    color: Colors.grey[350],
  ),
);

Widget DefaultField(
    {
      required TextInputType type,
      required TextEditingController controller,
      FormFieldValidator<String>? validate,
      required String label,
      required IconData preFix,
      IconData? sufFix,
      bool redOnly =false,
      GestureTapCallback? onTap,
      ValueChanged<String>? onChange,
      ValueChanged<String>? onSubmitted,
    })=>Container(
  height: 40,
  child: TextFormField(
    controller: controller,
    keyboardType: type,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 20,
      ),
      prefix: Icon(preFix),
      suffix: Icon(sufFix),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(15),
        ),
      ),
    ),
    readOnly:  redOnly ,
    validator: validate,
    onTap: onTap,
    onChanged: onChange,
    onFieldSubmitted: onSubmitted,
  ),
);

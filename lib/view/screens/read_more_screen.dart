
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_and_blogs/view/widgets/single_blog.dart';
import 'package:news_and_blogs/viewModel/common_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/single_blog.dart';

class ReadMore extends StatefulWidget {
  final int id;
  const ReadMore({super.key,required this.id});

  @override
  State<ReadMore> createState() => _ReadMoreState();
}
  

class _ReadMoreState extends State<ReadMore> {
 
  @override
  Widget build(BuildContext context) {
        final vm = Provider.of<CommonViewModel>(context,listen: false);

    return Scaffold(
      appBar: PreferredSize(child: AppBar(
        title: Text("Latest News"),
      ), preferredSize: Size.fromHeight(50)),
      body:vm.BlogList==null? const CircularProgressIndicator(): SingleChildScrollView(
        child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: vm.BlogList.length,
            itemBuilder: (ctx,index){
              return Consumer<CommonViewModel>(
                builder: (context, value, child) {
                   log(vm.BlogList.length.toString());
                   final data = vm.BlogList[index];
                  return   SingleBlog(content: data["content"], title: data["title"], image: data["image"], height: 130);
                }
                
               );
            })
        ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_and_blogs/common/colors.dart';
import 'package:news_and_blogs/view/widgets/single_blog.dart';
import 'package:news_and_blogs/viewModel/common_view_model.dart';
import 'package:provider/provider.dart';

class BlogDetails extends StatefulWidget {
  final int blogId;
   BlogDetails({super.key,required this.blogId});

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Provider.of<CommonViewModel>(context,listen: false).fetchBlogDetailsByBlogId(widget.blogId);
   setState(() {
     
   });
  }
  @override
  Widget build(BuildContext context) {
      final vm = Provider.of<CommonViewModel>(context,listen: false);

    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50), child: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,)),
      body: vm.blogdetails==null?const Center(child:  CircularProgressIndicator(),): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                            
               Consumer<CommonViewModel>(
                builder: (context, value, child) {
                  Map<String,dynamic> data = value.blogdetails!['blog'];
                  return                  SingleBlog(content:data["content"], title: data["title"], image: data['image'], height: 200,updatedAt: data['created_at'],);

                })
            
            
            
        ],),
      ),
    );
  }
}
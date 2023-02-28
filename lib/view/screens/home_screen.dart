
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_and_blogs/common/colors.dart';
import 'package:news_and_blogs/view/screens/blog_details_sreen.dart';
import 'package:news_and_blogs/view/widgets/custom_tab_bar.dart';
import 'package:news_and_blogs/view/widgets/latest_news_container.dart';
import 'package:news_and_blogs/viewModel/common_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/tab_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   
      @override
  void initState() {
    super.initState();
   final vm =  Provider.of<CommonViewModel>(context,listen: false);
   vm.fetchBlogCategory();
  //  addCategoryBlogToTab();
  
  }

     int initPosition = 0;
      // addCategoryBlogToTab(){
      //   log("message");
      // final vm =  Provider.of<CommonViewModel>(context,listen: false);

      //    for (int i = 0; i <vm.blogCategory.length; i++) {
      //     log("working");
      //     log(vm.blogCategory[i]['name']);
      //  // print(model.category[i].name);
      //   MyTab tab = MyTab(
      //     tabName: vm.blogCategory[i]["name"],
      //   );

      //   myTabs.add(tab);
      // }
      // setState(() {
        
      // });
    
      // }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Column(
             
            children:const [
                SizedBox(height: 30,),
              Text("News & Blogs",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ],
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
      ),
      body: Consumer<CommonViewModel>(
        builder: (context, value, child) => 
         CustomTabView(itemCount: value.myTabs.length, tabBuilder: (context, index) => Tab(
              icon: value.myTabs[index],
            ), pageBuilder: (context, index) =>
            
              
              Center(child: Column(
                children: [
                  
                
              //    Text(value.blogCategory[index]["name"],style: TextStyle(color: Colors.black),),
                 
                    Expanded(
          
              child: SafeArea(

                        child:LatestNewsContainer(id: value.blogCategory[index]['id'] ,)
                        //ProductDesign(cat: model.category[index],),


              ))]
              )), onPositionChange: (index) {
              initPosition = index;
            }, 
            onScroll: (position) => log(''),
             initPosition: initPosition)),
      );
    
  }
}
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_and_blogs/services/web_services.dart';

import '../view/widgets/tab_model.dart';

class CommonViewModel extends ChangeNotifier {
  Webservice webservice = Webservice();
  int currentIndex = 0;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  Map<String, dynamic>? catData;
  Map<String, dynamic>? blogData;
  Map<String,dynamic>? blogdetails;

  List blogCategory = [];
  List BlogList =[];
  List<Widget> myTabs = [];

  get blog {
    return catData;
  }

  setCurrentPage(int val) {
    _currentPage = val;
    notifyListeners();
  }

  fetchBlogCategory() async {
    catData = await webservice.fetchBlogCategory();
    if (catData!["status"] == true) {
      blogCategory = catData!["blogs_category"];
      log("Total BlogCategory : ${blogCategory.length}");
      for (int i = 0; i < blogCategory.length; i++) {
        log("working");
        log(blogCategory[i]['name']);
        // print(model.category[i].name);
        MyTab tab = MyTab(
          tabName: blogCategory[i]["name"],
        );

        myTabs.add(tab);
      }
    } else {
      log("error while geting data from server");
    }
    notifyListeners();
  }

  fetchBlogDataByCategory({required int id})async{
   blogData = await webservice.fetchBlogByCategory(id: id);
    if(blogData!=null){
      BlogList = blogData!['results'];
      
    }else{
      log("empty list");
    }
    notifyListeners();
  }

   fetchBlogDetailsByBlogId(int blogId)async{
   blogdetails = await webservice.fetchBlogDetailsById(blogId);
   if(blogdetails!["status"]==true){
       
     return blogdetails;
    }else{
    log("error while fetching blog details");
   }
    notifyListeners();

   }
}

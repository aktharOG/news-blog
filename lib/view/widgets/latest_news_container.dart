
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_and_blogs/common/sample_data.dart';
import 'package:news_and_blogs/view/screens/read_more_screen.dart';
import 'package:news_and_blogs/view/widgets/single_blog.dart';
import 'package:news_and_blogs/viewModel/common_view_model.dart';
import 'package:provider/provider.dart';

import '../screens/blog_details_sreen.dart';

class LatestNewsContainer extends StatefulWidget {
   final int id;
  const LatestNewsContainer({super.key,required this.id});

  @override
  State<LatestNewsContainer> createState() => _LatestNewsContainerState();
}

class _LatestNewsContainerState extends State<LatestNewsContainer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final vm = Provider.of<CommonViewModel>(context,listen: false);
    vm.fetchBlogDataByCategory(id:widget.id );
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CommonViewModel>(context,listen: false);
 
     
     log('blog list: ${vm.BlogList.length}');
    return vm.BlogList==null? const CircularProgressIndicator(): SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            height: 200,
             child: Stack(
               children: [
              
                 PageView.builder(
              onPageChanged: (val) {
                vm.setCurrentPage(val);
              },
              itemCount: caro.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: ClipRRect(
                    child: Hero(
                      tag: index,
                      child: Image.network(
                        
                        caro[index],
                      
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                );
              },
            ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DotsIndicator(
                                  dotsCount: caro.length,
                                  position: vm.currentPage.toDouble(),
                                  decorator:const DotsDecorator(
                                    activeColor: Color.fromARGB(255, 102, 231, 205),
                                    color: Color.fromARGB(255, 207, 207, 207),
                                    size: const Size.square(6.0),
                                    activeSize: const Size(10.0, 6.0),
                                    activeShape: CircleBorder(),
                                  )),
                        ),
                      ),
               ],
             ),
           ),
           Padding(
               padding: const EdgeInsets.all(15.0),
               child: SizedBox(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  const  Text("🔥Latest News",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                    InkWell
                                    (
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ReadMore(id: widget.id,)));
                                      },
                                      child:const Text("Read More",style:  TextStyle(color: Colors.green,fontWeight: FontWeight.bold),))
                                  ],
                                ),
               ),
             ),
           ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: vm.BlogList.length,
            itemBuilder:(ctx,index){
              final data = vm.BlogList[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BlogDetails(blogId: data['id'],)));
                },
                child: SingleBlog(title:data["title"] ,content:data['content'] ,image: data["image"],height: 130,));
            }
           )
            
        ],
      ),
    );
  }
}
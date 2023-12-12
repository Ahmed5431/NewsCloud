import 'package:flutter/material.dart';

import '../screens/web_view_page.dart';

class SliderTile extends StatelessWidget {
  final String image, title,url;
  const SliderTile({super.key, required this.image, required this.title,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WebViewPage(url: url,);
        }));
      
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  height: 250,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 250,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 150),
                decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}

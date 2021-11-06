import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/article.dart';

class News extends StatelessWidget {
  News({
    Key? key,
    required Future<Article> this.newModel,
  }) : super(key: key);

  final Future<Article> newModel;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: _size.height,
      child: FutureBuilder<Article>(
        future: newModel,
        builder: (context, snaphot) {
          if (snaphot.hasData) {
            return ListView.builder(
                itemCount: snaphot.data!.articles.length,
                itemBuilder: (context, index) {
                  var article = snaphot.data!.articles[index];
                  return Container(
                      height: 100,
                      // padding: const EdgeInsets.all(10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.white)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 80,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.white)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: article.urlToImage != ""
                                  ? Image.network(
                                      article.urlToImage,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "assets/images/no-image.png",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${article.title}",
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  "${article.description}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            ),
                          )
                        ],
                      ));
                });
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

import '../colors_const.dart';
import '../widgets/body_news_widget.dart';
import '../widgets/header_news_widget.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleModel news =
        ModalRoute.of(context)!.settings.arguments as ArticleModel;
    bool _validURL = Uri.parse(news.image).isAbsolute;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(news.image, scale: 1.0),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Scaffold(
        backgroundColor: !_validURL ? yankeesBlue : Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: semonBright.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          children: [
            HeaderNewsWidget(),
            BodyNewsWidget(),
          ],
        ),
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    Key? key,
    // required this.article,
  }) : super(key: key);

  // final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                "article.category",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "article.title",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.25,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            "article.subtitle",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CustomTag extends StatelessWidget {
  const CustomTag({
    Key? key,
    required this.backgroundColor,
    required this.children,
  }) : super(key: key);

  final Color backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    Key? key,
    // required this.article,
  }) : super(key: key);

  // final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomTag(
                backgroundColor: Colors.black,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                      "article.authorImageUrl",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "article.author",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  const Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "'{'",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(width: 10),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '{views}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "article.title",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            "article.body sdfgsd gdfg dfg dgdfhgf gfhfg  fgf  gfg  fgffgfg fgf  fgf fg fgfgf hfgh fhjf jfjfg dfgdf gfdg dfgfd gfd dfg dfhgtr otropgjtrgoitrjgltrjgoi;rh rttr ytrt toi htoh e;fke jre gjrg regj  rghrghdlhgdnghkjfdn desfsd f g dgdr ge f gerg trhl; tk h  ltrjhgrflg;mglgktlf glgmfhggh fhg hfghghgf ;flhmtlhgth hfg hgfh dfdgfrg trgtr grg reg rg fgdfh  fgfgtd gtrgtfgtfgtfgdrjkg r jglrgtghjtkh tkh lhltgh ",
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
          ),
          const SizedBox(height: 20),
          // GridView.builder(
          //     shrinkWrap: true,
          //     itemCount: 2,
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       childAspectRatio: 1.25,
          //     ),
          //     itemBuilder: (context, index) {
          //       return Container(
          //         height: 250,
          //         width: MediaQuery.of(context).size.width * 0.42,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           image: DecorationImage(
          //             image: NetworkImage(
          //                 "https://zacjohnson.com/wp-content/uploads/2024/01/most-popular-podcasts.jpg"),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
          //       );
          //     })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/screens/place_detail/widgets/commet_item.dart';
import 'package:travel_app/screens/place_detail/widgets/place_trait_item.dart';
import 'package:travel_app/settings/colors.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  Map<String, String> comments = {};
  List<Widget> commentsHolder = [];
  bool descriptionView = true;

  @override
  void initState() {
    super.initState();
    loadComments();
  }

  void loadComments() {
    Map<String, String> loadedComments = {};
    for (final reviewItem in widget.place.reviews) {
      loadedComments[reviewItem['author']] = reviewItem['comment'];
    }
    setState(() {
      comments = loadedComments;
    });
    for (var comment in comments.entries) {
      commentsHolder
          .add(CommentItem(author: comment.key, comment: comment.value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(widget.place.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Hero(
                    tag: widget.place.name,
                    child: Image.asset(
                      widget.place.image,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.place.name,
                    style: Theme.of(context).textTheme.displaySmall),
                Text(widget.place.location,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                PlaceTraitItem(place: widget.place),
                const SizedBox(height: 40),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (descriptionView) ? secondaryColor : white,
                        shadowColor: secondaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          descriptionView = true;
                        });
                      },
                      child: Text(
                        'Details',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (descriptionView) ? white : secondaryColor,
                        shadowColor: secondaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          descriptionView = false;
                        });
                      },
                      child: Text('Reviews',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: (descriptionView)
                      ? [
                          Text(
                            widget.place.description,
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ]
                      : commentsHolder,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/screens/home/widgets/suggestion_places.dart';
import 'package:travel_app/screens/home/widgets/homepage_places.dart';
import 'package:travel_app/screens/home/widgets/hot_category_item.dart';
import 'package:travel_app/settings/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.availablePlaces, required this.hotCategories});

  final List<Place> availablePlaces;
  final Map<String, String> hotCategories;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? searchPlaceName;
  final _controller = TextEditingController();
  List<Place> filteredPlaces = [];
  List<int> randomValues = [];
  Map<String, String> hotCategories = {};

  void searchFilter(String searchText) {
    setState(() {
      if (searchText.isNotEmpty) {
        searchText = searchText
            .trim()
            .replaceFirst(searchText[0], searchText[0].toUpperCase());

        filteredPlaces = widget.availablePlaces
            .where((element) => element.name.contains(searchText.toString()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let\'s discover the World !',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 25),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          searchFilter(_controller.text);
                        },
                        icon: const Icon(
                          Icons.search_rounded,
                          color: secondaryColor,
                        ),
                      ),
                      filled: true,
                      fillColor: white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onSaved: (newValue) {
                      searchPlaceName = newValue;
                    },
                    onChanged: (value) {
                      searchFilter(value);
                    },
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Explore Places',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Suggestions(),
                HomePagePlaces(
                  availablePlaces: (_controller.text.isEmpty)
                      ? widget.availablePlaces
                      : filteredPlaces,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Hot Categories',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/icons/campfire.png',
                      scale: 16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.hotCategories.length,
                    itemBuilder: (context, index) => HotCategoryItem(
                      category: widget.hotCategories.entries.toList()[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

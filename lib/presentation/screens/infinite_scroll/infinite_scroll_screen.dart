import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> items = [1, 2, 3, 4, 5];
  ScrollController controller = ScrollController();
  bool isLoading = false;

  addMoreItems() {
    var last = items.last;
    items.addAll([1, 2, 3, 4, 5].map((e) => e + last).toList());
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels + 300 >=
          controller.position.maxScrollExtent) {
        loadNextData();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> loadNextData() async {
    if (isLoading) return;
    isLoading = true;
    if (!mounted) return;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addMoreItems();

    isLoading = false;
    if (!mounted) return;
    setState(() {});
    moveScrollInBotton();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    isLoading = false;
    int lastItem = items.last;
    items.clear();
    items.add(lastItem + 1);
    addMoreItems();
    setState(() {});
  }

  moveScrollInBotton() {
    if (controller.position.pixels + 200 <=
        controller.position.maxScrollExtent) {
      return;
    }
    controller.animateTo(
      controller.position.pixels + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          child: ListView.builder(
            controller: controller,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              String imgUrl =
                  'https://picsum.photos/id/${items[index]}/500/300';
              return Padding(
                padding: const EdgeInsets.all(0),
                child: FadeInImage(
                  width: double.infinity,
                  height: 280,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/img/loading.gif'),
                  image: NetworkImage(imgUrl),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
            // addMoreItems();
            // print(items.toString());
          },
          child: (isLoading)
              ? SpinPerfect(
                  infinite: true,
                  child: const Icon(Icons.refresh_rounded),
                )
              : const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
    );
  }
}

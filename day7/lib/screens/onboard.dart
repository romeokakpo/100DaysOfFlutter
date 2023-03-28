import 'package:day7/data/onboard_data.dart';
import 'package:day7/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  late final PageController _controller;

  bool lastPage = false;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var titleStyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: Colors.black, fontWeight: FontWeight.bold);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                alignment: const Alignment(0, 0.88),
                children: [
                  PageView.builder(
                      itemCount: 3,
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          lastPage = (index == 2);
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const Spacer(),
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceInOut,
                              child: Image.asset(onboardData[index].image),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 80.0, bottom: 10),
                              child: Text(
                                onboardData[index].title,
                                style: titleStyle,
                              ),
                            ),
                            Text(
                              onboardData[index].description,
                              style: const TextStyle(fontSize: 17),
                            ),
                            const Spacer(
                              flex: 2,
                            )
                          ],
                        );
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            _controller.jumpToPage(2);
                          },
                          child: const Text("Skip")),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const ExpandingDotsEffect(expansionFactor: 2),
                      ),
                      lastPage
                          ? TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              },
                              child: const Text("Done"))
                          : TextButton(
                              onPressed: () {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut);
                              },
                              child: const Text("Next"))
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_animations/flutter_animations.dart';

class AnimatedCard extends StatefulWidget {
  final int index;

  AnimatedCard(this.index);

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Delay the animation for each card
    Future.delayed(Duration(milliseconds: widget.index * 200), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Card(
        child: Center(
          child: Text('Item ${widget.index + 1}'),
        ),
      ),
    );
  }
}

class AnimatedGridAppBar extends StatefulWidget {
  @override
  _AnimatedGridAppBarState createState() => _AnimatedGridAppBarState();
}

class _AnimatedGridAppBarState extends State<AnimatedGridAppBar> {
  ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = true;
  double _appBarHeight = 200.0; // Set your desired initial height of the app bar

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarExpanded =
            _scrollController.hasClients && _scrollController.offset > 0;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
   return MaterialApp(
      showSemanticsDebugger: false, // Set debugShowCheckedModeBanner to false
      home: Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            
            expandedHeight: _appBarHeight,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: _appBarHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/dot.jpg', // Replace with your image URL
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Opacity(
                  opacity: _isAppBarExpanded ? 1.0 : 0.0,
                  child: Center(
                    child: Text(
                      'App Bar Content',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnimatedCard(index);
                },
                childCount: 12,
              ),
            ),
          ),
        ],
      ),
    )
   );
  }
}

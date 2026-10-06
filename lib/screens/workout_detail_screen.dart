import 'package:flutter/material.dart';
import '../widgets/amenity_card.dart';
import '../widgets/reservation_bar.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final String title;
  final String location;
  final double rating;
  final int reviewsCount;
  final String heroImagePath;

  const WorkoutDetailScreen({
    super.key,
    this.title = "Mid City Gym Training",
    this.location = "California, New York",
    this.rating = 4.5,
    this.reviewsCount = 1232,
    this.heroImagePath = "assets/images/gym_hero.jpg",
  });

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  bool _isDescriptionExpanded = false;

  final String _shortDescription =
      "Lorem ipsum dolor sit amet consectetur. Blandit vitae aliquet eros laoreet quam solicitudin. Duis non eu habitant id vel nisi eget amet tellus...";

  final String _fullDescription =
      "Lorem ipsum dolor sit amet consectetur. Blandit vitae aliquet eros laoreet quam solicitudin. Duis non eu habitant id vel nisi eget amet tellus. Integer egestas tempor imperdiet nec vivamus morbi neque. Ultrices sed arcu in amet proin in ut. Nisi id amet rhoncus tristique leo proin id.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Hero Image Section
                SizedBox(
                  height: 350.0,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          widget.heroImagePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFF232730),
                              child: const Icon(
                                Icons.fitness_center,
                                color: Colors.white30,
                                size: 64,
                              ),
                            );
                          },
                        ),
                      ),

                      // Gradient at top for status bar legibility
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: 100.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black54, Colors.transparent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),

                      // Overlay Controls: Back Button & Menu Button
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Back Button
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  width: 42.0,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.85),
                                    shape: BoxShape.circle,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 6.0,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Color(0xFF121217),
                                    size: 20.0,
                                  ),
                                ),
                              ),

                              // Menu Button
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                  size: 26.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Main Details Card (White Container overlapping slightly)
                Transform.translate(
                  offset: const Offset(0, -20.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 100.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Rating Row
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Color(0xFFFFC107),
                              size: 20.0,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              '${widget.rating}',
                              style: const TextStyle(
                                color: Color(0xFF121217),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              ' (${widget.reviewsCount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} reviews)',
                              style: const TextStyle(
                                color: Color(0xFF9E9E9E),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10.0),

                        // Title
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Color(0xFF121217),
                            fontSize: 22.0,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 6.0),

                        // Location
                        Text(
                          widget.location,
                          style: const TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 18.0),

                        // Thin Divider Line
                        const Divider(
                          color: Color(0xFFEFEFEF),
                          thickness: 1.0,
                          height: 1.0,
                        ),

                        const SizedBox(height: 18.0),

                        // Description
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Color(0xFF757575),
                              fontSize: 13.5,
                              height: 1.55,
                            ),
                            children: [
                              TextSpan(
                                text: _isDescriptionExpanded
                                    ? _fullDescription
                                    : _shortDescription,
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isDescriptionExpanded =
                                          !_isDescriptionExpanded;
                                    });
                                  },
                                  child: Text(
                                    _isDescriptionExpanded
                                        ? ' Show less'
                                        : ' Read more',
                                    style: const TextStyle(
                                      color: Color(0xFF00D95F),
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24.0),

                        // Amenities Section
                        const Text(
                          'Amenities',
                          style: TextStyle(
                            color: Color(0xFF121217),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        const SizedBox(height: 14.0),

                        // Amenities Grid / Row
                        const Row(
                          children: [
                            Expanded(
                              child: AmenityCard(
                                label: 'Showers',
                                icon: Icons.shower_outlined,
                              ),
                            ),
                            SizedBox(width: 14.0),
                            Expanded(
                              child: AmenityCard(
                                label: 'Lockers',
                                icon: Icons.sensor_door_outlined,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Fixed Bottom Reservation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ReservationBar(
              price: '\$69.00',
              period: '/week',
              onReservePressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Reservation successful!'),
                    backgroundColor: const Color(0xFF00D95F),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

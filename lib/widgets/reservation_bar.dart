import 'package:flutter/material.dart';

class ReservationBar extends StatelessWidget {
  final String price;
  final String period;
  final VoidCallback onReservePressed;

  const ReservationBar({
    super.key,
    this.price = '\$69.00',
    this.period = '/week',
    required this.onReservePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 14.0,
        bottom: MediaQuery.of(context).padding.bottom + 14.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 16.0,
            offset: Offset(0, -4),
          ),
        ],
        border: const Border(
          top: BorderSide(
            color: Color(0xFFEFEFEF),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Total price info
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 2.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      color: Color(0xFF121217),
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    ' $period',
                    style: const TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Reserve Button
          ElevatedButton(
            onPressed: onReservePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D95F),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 38.0,
                vertical: 16.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            child: const Text(
              'Reserve',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

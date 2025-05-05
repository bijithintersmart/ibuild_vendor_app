import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';
import 'package:ibuild_vendor/features/equipments/data/models/subcategory_model.dart';
import 'package:ibuild_vendor/features/equipments/presentation/pages/equipments.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BookingOptionWidget extends StatefulWidget {
  final List<SubcategoryModel> equipments;
  const BookingOptionWidget({super.key, required this.equipments});

  @override
  State<BookingOptionWidget> createState() => _BookingOptionWidgetState();
}

class _BookingOptionWidgetState extends State<BookingOptionWidget>
    with TickerProviderStateMixin {
  bool _isHalfDay = true;
  List<String> _selectedTimeSlots = [];

  // Animation controllers
  late AnimationController _halfDayAnimController;
  late AnimationController _fullDayAnimController;

  @override
  void initState() {
    _halfDayAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1.0,
    );

    _fullDayAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 0.0,
    );
    super.initState();
  }

  // Method to toggle allowing multiple time slots
  void setAllowMultipleSlots(bool allow) {
    setState(() {
      if (!allow && _selectedTimeSlots.length > 1) {
        // If switching to single selection, keep only the first selected slot
        _selectedTimeSlots = [_selectedTimeSlots.first];
      }
    });
  }

  final List<String> _halfDayTimeSlots = [
    '09 AM to 01 PM',
    '02 PM to 06 PM',
    '06 PM to 10 PM',
    '10 PM to 02 AM'
  ];

  final List<String> _fullDayTimeSlots = [
    '09 AM to 01 PM',
    '02 PM to 06 PM',
  ];
  
  void addButtonPress() {
    if (_selectedTimeSlots.isNotEmpty) {
      pushWithNavBar(
          context,
          MaterialPageRoute(
              builder: (context) => EquipmentScreen(
                    equipments: widget.equipments,
                  )));
    } else {
      scaffoldToast("Please select a slot");
    }
  }

  Widget _buildTimeSlots(List<String> timeSlots, bool allowMultipleSlots) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   childAspectRatio: 3,
      //   crossAxisSpacing: 12,
      //   mainAxisSpacing: 12,
      // ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        final timeSlot = timeSlots[index];
        final isSelected = _selectedTimeSlots.contains(timeSlot);

        return GestureDetector(
            onTap: () {
              setState(() {
                if (allowMultipleSlots) {
                  // Toggle selection
                  if (isSelected) {
                    _selectedTimeSlots.remove(timeSlot);
                  } else {
                    _selectedTimeSlots.add(timeSlot);
                  }
                } else {
                  // Single selection mode
                  _selectedTimeSlots = [timeSlot];
                }
                // if (allowMultipleSlots) {
                //   _isHalfDay = true;
                //   if (_isHalfDay == false) {
                //     _fullDayAnimController.reverse();
                //     _halfDayAnimController.forward();
                //     _isHalfDay = true;
                //   }
                // }
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Time Slot",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${widget.equipments.length} Available",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.orange : Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    timeSlot,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Half Day Option
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  setState(() {
                    if (!_isHalfDay) {
                      _isHalfDay = true;
                      _selectedTimeSlots.clear();
                      _halfDayAnimController.forward();
                      _fullDayAnimController.reverse();
                    }
                  });
                },
                leading: Container(
                  decoration: BoxDecoration(
                    color: _isHalfDay ? Colors.orange : Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.check,
                    size: 16,
                    color: _isHalfDay ? Colors.white : Colors.grey[200],
                  ),
                ),
                title: const Text(
                  'Half Day',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
                trailing: const Text(
                  'KWD 180.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
              ),
              // Animated container for time slots
              SizeTransition(
                sizeFactor: _halfDayAnimController,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTimeSlots(_halfDayTimeSlots, true),
                      const SizedBox(height: 16),
                      const Text(
                        'Lorem ipsum is simply dummy text of the printing and typesetting industry.',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: addButtonPress,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'ADD',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Full Day Option
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  setState(() {
                    if (_isHalfDay) {
                      _isHalfDay = false;
                      _selectedTimeSlots.clear();
                      _fullDayAnimController.forward();
                      _halfDayAnimController.reverse();
                    }
                  });
                },
                leading: Container(
                  decoration: BoxDecoration(
                    color: !_isHalfDay ? Colors.orange : Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.check,
                    size: 16,
                    color: !_isHalfDay ? Colors.white : Colors.grey[200],
                  ),
                ),
                title: const Text(
                  'Full Day',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
                trailing: const Text(
                  'KWD 320.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
              ),
              // Animated container for full day options
              SizeTransition(
                sizeFactor: _fullDayAnimController,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTimeSlots(_fullDayTimeSlots, false),
                      const SizedBox(height: 16),
                      const Text(
                        'Full day booking gives you access from 9 AM to 10 PM.',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: addButtonPress,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'ADD',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

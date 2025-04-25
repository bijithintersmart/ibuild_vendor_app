// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ibuild_vendor/core/router/go_route.dart';
// import 'package:ibuild_vendor/core/theme/app_colors.dart';
// import 'package:ibuild_vendor/features/equipments/data/models/equipment_model.dart';

// class EquipmentGridItem extends StatelessWidget {
//   const EquipmentGridItem({
//     super.key,
//     required this.animation,
//     required this.equipment, required this.index,
//   });

//   final Animation<double> animation;final int index;
//   final Equipment equipment;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         GoRouter.of(context).push(Routes.BOOKING);
//       },
//       child: AnimatedBuilder(
//         animation: animation,
//         builder: (context, child) {
//           double startX = index % 2 == 0 ? -100 : 100;
//           double startY = 100;
//           double xOffset = (1 - animation.value) * startX;
//           double yOffset = (1 - animation.value) * startY;
//           return Transform.translate(
//             offset: Offset(xOffset, yOffset),
//             child: Opacity(opacity: animation.value, child: child),
//           );
//         },
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: 150,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 decoration: BoxDecoration(
//                   color: AppColors.cardGrey,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             equipment.name,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Row(
//                             children: [
//                               Text(
//                                 'KWD ',
//                                 style: TextStyle(
//                                   color: Colors.grey[800],
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               Text(
//                                 '${equipment.price}',
//                                 style: const TextStyle(
//                                   color: Color(0xFFFFA726),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               Text(
//                                 ' Per Day',
//                                 style: TextStyle(
//                                   color: Colors.grey[600],
//                                   fontSize: 10,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 18,
//               left: -7,
//               right: -7,
//               child: Container(
//                 clipBehavior: Clip.antiAlias,
//                 height: 120,
//                 decoration: BoxDecoration(
//                     color: AppColors.secondary,
//                     borderRadius: BorderRadius.circular(10)),
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                 child: Stack(
//                   children: [
//                     Center(
//                       child: Image.asset(
//                         equipment.imageUrl,
//                         height: 120,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     if (!equipment.isAvailable)
//                       Positioned.fill(
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 8,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             color: AppColors.greyLight.withOpacity(.5),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Center(
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 15, vertical: 10),
//                               decoration: BoxDecoration(
//                                   color: AppColors.secondary,
//                                   borderRadius: BorderRadius.circular(6)),
//                               child: const Text(
//                                 'NOT AVAILABLE',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 10,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

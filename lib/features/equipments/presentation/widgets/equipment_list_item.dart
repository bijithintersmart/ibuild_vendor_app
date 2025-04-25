// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'package:ibuild_vendor/core/router/go_route.dart';
// import 'package:ibuild_vendor/core/theme/app_colors.dart';
// import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
// import 'package:ibuild_vendor/features/equipments/data/models/equipment_model.dart';

// class EquipmentListItem extends StatelessWidget {
//   const EquipmentListItem({
//     super.key,
//     required this.animation,
//     required this.index,
//     required this.equipment,
//   });

//   final Animation<double> animation;
//   final int index;
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
//           double yOffset = animation.value * 100;
//           double xOffset = animation.value * (index % 2 == 0 ? -100 : 100);
//           return Transform.translate(
//             offset: Offset(xOffset, yOffset),
//             child: child,
//           );
//         },
//         child: Opacity(
//           opacity: 1 - animation.value,
//           child: Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: AppColors.cardGrey,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   height: 180,
//                   decoration: BoxDecoration(
//                     color: equipment.backgroundColor,
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       topRight: Radius.circular(12),
//                     ),
//                     image: DecorationImage(
//                       image: AssetImage(
//                         equipment.imageUrl,
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: equipment.isAvailable
//                       ? null
//                       : Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             color: AppColors.greyLight.withOpacity(.3),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(12),
//                               topRight: Radius.circular(12),
//                             ),
//                           ),
//                           child: Center(
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 15, vertical: 10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: AppColors.secondary,
//                               ),
//                               child: const NormalText(
//                                 text: 'NOT AVAILABLE',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                   // Stack(
//                   //   children: [
//                   //     // Image.asset(
//                   //     //   height: 180,
//                   //     //   width: double.maxFinite,
//                   //     //   fit: BoxFit.cover,
//                   //     // ),
//                   //     if (!equipment.isAvailable)
//                   //       Positioned.fill(
//                   //         child: Container(
//                   //           padding: const EdgeInsets.symmetric(
//                   //             horizontal: 10,
//                   //             vertical: 4,
//                   //           ),
//                   //           decoration: BoxDecoration(
//                   //             color:
//                   //                 AppColors.greyLight.withOpacity(.3),
//                   //             borderRadius: const BorderRadius.only(
//                   //               topLeft: Radius.circular(12),
//                   //               topRight: Radius.circular(12),
//                   //             ),
//                   //           ),
//                   //           child: Center(
//                   //             child: Container(
//                   //               padding: const EdgeInsets.symmetric(
//                   //                   horizontal: 15, vertical: 10),
//                   //               decoration: BoxDecoration(
//                   //                 borderRadius:
//                   //                     BorderRadius.circular(5),
//                   //                 color: AppColors.secondary,
//                   //               ),
//                   //               child: const NormalText(
//                   //                 text: 'NOT AVAILABLE',
//                   //                 style: TextStyle(
//                   //                   color: Colors.white,
//                   //                   fontWeight: FontWeight.bold,
//                   //                   fontSize: 12,
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //   ],
//                   // ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             equipment.name,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             'Capacity: ${equipment.capacity} tons',
//                             style: const TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: 'KWD ',
//                                   style: TextStyle(
//                                     color: Colors.grey[800],
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: '${equipment.price}',
//                                   style: const TextStyle(
//                                     color: Color(0xFFFFA726),
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Text(
//                             'Per Day',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

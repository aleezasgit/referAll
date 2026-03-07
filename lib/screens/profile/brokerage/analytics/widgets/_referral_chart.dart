// part of '../analytics.dart';

// class ReferralChartContainer extends StatefulWidget {
//   const ReferralChartContainer({super.key});

//   @override
//   State<ReferralChartContainer> createState() => _ReferralChartContainerState();
// }

// class _ReferralChartContainerState extends State<ReferralChartContainer> {
//   String selectedValue = "Weekly";

//   final List<String> dropdownItems = ["Weekly", "Monthly", "Yearly"];

//   /// Dummy Data
//   List<double> weeklyData = [29, 8, 0, 12, 34, 15, 28];
//   List<double> monthlyData = [29, 8, 13, 34, 31, 28];
//   List<double> yearlyData = [29, 8, 13, 34, 31, 28];

//   List<double> get currentData {
//     switch (selectedValue) {
//       case "Monthly":
//         return monthlyData;
//       case "Yearly":
//         return yearlyData;
//       default:
//         return weeklyData;
//     }
//   }

//   List<String> get bottomTitles {
//     switch (selectedValue) {
//       case "Monthly":
//         return ["1-4", "5-9", "10-14", "15-19", "20-24", "25-29"];
//       case "Yearly":
//         return [
//           "Jan-Feb",
//           "Mar-Apr",
//           "May-Jun",
//           "July-Aug",
//           "Sep-Oct",
//           "Nov-Dec",
//         ];
//       default:
//         return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: Space.all(16),
//       decoration: BoxDecoration(
//         color: AppTheme.c.white,
//         borderRadius: UIProps.radiusL,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// Header Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("$selectedValue Referrals", style: AppText.h5bm),
//                   Space.yf(8),
//                   Text(
//                     '26 April- 31 April',
//                     style: AppText.l1bm!.cl(AppTheme.c.text.main!),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 105.w,
//                 child: ChartDropdown(
//                   items: dropdownItems,
//                   value: selectedValue,
//                   onChanged: (val) {
//                     setState(() {
//                       selectedValue = val!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),

//           Space.yf(16),

//           /// Chart
//           SizedBox(
//             height: 220.h,
//             child: LineChart(
//               LineChartData(
//                 minY: 0,
//                 maxY: 50,
//                 gridData: FlGridData(show: false),
//                 borderData: FlBorderData(show: false),

//                 /// Bottom Titles
//                 titlesData: FlTitlesData(
//                   leftTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 30.w,
//                       interval: 10,
//                       getTitlesWidget: (value, meta) {
//                         return Text(
//                           value.toInt().toString(),
//                           style: AppText.l2bm!
//                               .s(9.sp)
//                               .copyWith(color: AppTheme.c.text.main),
//                         );
//                       },
//                     ),
//                   ),
//                   rightTitles: AxisTitles(
//                     sideTitles: SideTitles(showTitles: false),
//                   ),
//                   topTitles: AxisTitles(
//                     sideTitles: SideTitles(showTitles: false),
//                   ),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       interval: 1, // 👈 Add this
//                       getTitlesWidget: (value, meta) {
//                         int index = value.toInt();
//                         if (index >= bottomTitles.length) {
//                           return const SizedBox();
//                         }
//                         return Padding(
//                           padding: EdgeInsets.only(top: 8.h),
//                           child: Text(
//                             bottomTitles[index],
//                             style: AppText.l2bm!
//                                 .s(9.sp)
//                                 .cl(AppTheme.c.text.main!),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),

//                 /// Tooltip
//                 lineTouchData: LineTouchData(
//                   touchTooltipData: LineTouchTooltipData(
//                     getTooltipColor: (value) => AppTheme.c.secondary.main!,

//                     getTooltipItems: (touchedSpots) {
//                       return touchedSpots.map((spot) {
//                         return LineTooltipItem(
//                           spot.y.toInt().toString(),
//                           AppText.b1bm!,
//                         );
//                       }).toList();
//                     },
//                   ),
//                 ),

//                 /// Line
//                 lineBarsData: [
//                   LineChartBarData(
//                     isCurved: true,
//                     color: AppTheme.c.secondary.main,
//                     barWidth: 1.w,
//                     isStrokeCapRound: true,
//                     dotData: FlDotData(
//                       show: true,
//                       getDotPainter: (spot, percent, barData, index) =>
//                           FlDotCirclePainter(
//                             radius: 2.r,
//                             color: AppTheme.c.primary.main!,
//                             strokeWidth: 0,
//                           ),
//                     ),
//                     belowBarData: BarAreaData(show: false),
//                     spots: List.generate(
//                       currentData.length,
//                       (index) => FlSpot(index.toDouble(), currentData[index]),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

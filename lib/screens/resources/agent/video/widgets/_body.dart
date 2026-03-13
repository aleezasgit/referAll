// // 


// part of '../video.dart';

// class _Body extends StatelessWidget {
//   const _Body();

//   @override
//   Widget build(BuildContext context) {
//     App.init(context);
//     final state = context.watch<_ScreenState>();

//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           /// BACKGROUND
//           Image.asset(
//             'assets/pngs/b0b1cf0c367d0e6d07d582bd230587cbb251d37e.png',
//             fit: BoxFit.cover,
//           ),

//           /// LEFT SIDE CONTROLS
//           Positioned(
//             left: 16.w,
//             top: 0,
//             bottom: 0,
//             child: SizedBox(
//               width: 120.w,
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [

//                   /// TITLE + DURATION STRIP (BACKGROUND LAYER)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Space.yf(40),

//                       /// TITLE
//                       RotatedBox(
//                         quarterTurns: 1,
//                         child: Text(
//                           'The Rise of Architecture',
//                           style: AppText.l2b?.cl(AppTheme.c.white!),
//                         ),
//                       ),

//                       /// TOTAL DURATION
//                       RotatedBox(
//                         quarterTurns: 1,
//                         child: Text(
//                           '${state.formatDuration(state.position)} / ${state.formatDuration(state.totalDuration)}',
//                           style: AppText.l2?.cl(AppTheme.c.white!),
//                         ),
//                       ),

//                       Space.yf(40),
//                     ],
//                   ),

//                   /// PROGRESS BAR (TOP LAYER)
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: _VerticalProgressBar(
//                       progress: state.progress,
//                       currentTime: state.formatDuration(state.position),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           /// TOP RIGHT BUTTON
//           Positioned(
//             top: 32.h,
//             right: 16.w,
//             child: SvgPicture.asset(
//               "assets/svgs/Button.svg",
//               width: 32.w,
//               height: 32.w,
//             ),
//           ),

//           /// BOTTOM RIGHT BUTTONS
//           Positioned(
//             right: 16.w,
//             bottom: 24.h,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _CircleButton(
//                   onTap: () {},
//                   child: SvgPicture.asset(
//                     "assets/svgs/expand.svg",
//                     width: 16.w,
//                     height: 16.w,
//                     colorFilter: ColorFilter.mode(
//                       AppTheme.c.white!,
//                       BlendMode.srcIn,
//                     ),
//                   ),
//                 ),
//                 Space.yf(10),
//                 _CircleButton(
//                   onTap: () {},
//                   child: SvgPicture.asset("assets/svgs/vdots.svg"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _VerticalProgressBar extends StatelessWidget {
//   final double progress;
//   final String currentTime;

//   const _VerticalProgressBar({
//     required this.progress,
//     required this.currentTime,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 60.w,
//       height: 1.sh - 32.h,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final height = constraints.maxHeight;
//           final thumbTop = height * (1 - progress);

//           return Stack(
//             clipBehavior: Clip.none,
//             children: [

//               /// TRACK
//               Positioned(
//                 left: 12.w,
//                 child: Container(
//                   width: 2.w,
//                   height: height,
//                   color: Colors.white.withOpacity(0.35),
//                 ),
//               ),

//               /// PROGRESS
//               Positioned(
//                 left: 12.w,
//                 bottom: 0,
//                 child: Container(
//                   width: 2.w,
//                   height: height * progress,
//                   color: Colors.white,
//                 ),
//               ),

//               /// DOT + CHIP
//               Positioned(
//                 top: thumbTop - 6,
//                 left: 6.w,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     /// DOT
//                     Container(
//                       width: 12.w,
//                       height: 12.w,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                     ),

//                     Space.xf(6),

//                     /// TIME CHIP
//                     Transform.rotate(
//                       angle: pi / 2,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 8.w,
//                           vertical: 3.h,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.6),
//                           borderRadius: BorderRadius.circular(6.r),
//                         ),
//                         child: Text(
//                           currentTime,
//                           style: AppText.l2b?.cl(AppTheme.c.white!),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// /// CIRCLE BUTTON
// class _CircleButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final Widget child;

//   const _CircleButton({
//     required this.onTap,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 40.w,
//         height: 40.w,
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.4),
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: Colors.white.withOpacity(0.2),
//             width: 1.w,
//           ),
//         ),
//         child: Center(child: child),
//       ),
//     );
//   }
// }

part of '../video.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// BACKGROUND
          Image.asset(
            'assets/pngs/b0b1cf0c367d0e6d07d582bd230587cbb251d37e.png',
            fit: BoxFit.cover,
          ),

          /// LEFT SIDE CONTROLS
          Positioned(
            left: 16.w,
            top: 0,
            bottom: 0,
            child: SizedBox(
              width: 150.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [

                  /// BASE LAYOUT
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      /// PROGRESS BAR
                      _VerticalProgressBar(
                        progress: state.progress,
                        currentTime:
                            state.formatDuration(state.position),
                      ),

                      Space.xf(11.54),

                      /// TITLE + DURATION STRIP
                      SizedBox(
                        height: double.infinity,
                        child: Padding(
                          padding: Space.vf(30),
                          child: Column(
                            
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          
                            children: [
                          
                              
                          
                              /// TITLE
                              RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  'The Rise of Architecture',
                                  style: AppText.h5!.w(6).s(13.47.sp).cl(AppTheme.c.white!),
                                ),
                              ),
                          
                              /// TOTAL DURATION
                              RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  '${state.formatDuration(state.position)} / ${state.formatDuration(state.totalDuration)}',
                                  style: AppText.l1!.w(3).s(13.47.sp).cl(AppTheme.c.white!),
                                ),
                              ),
                          
                           
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// TOP RIGHT BUTTON
          Positioned(
            top: 32.h,
            right: 16.w,
            child: SvgPicture.asset(
              "assets/svgs/Button.svg",
              width: 32.w,
              height: 32.h,
            ),
          ),

          /// BOTTOM RIGHT BUTTONS
          Positioned(
            right: 16.w,
            bottom: 24.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _CircleButton(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/svgs/expand.svg",
                    width: 23.w,
                    height: 23.h,
                 
                  ),
                ),
                Space.yf(7.7),
                _CircleButton(
                  onTap: () {},
                  child: SvgPicture.asset("assets/svgs/vdots.svg",width: 23.w,
                    height: 23.h,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalProgressBar extends StatelessWidget {
  final double progress;
  final String currentTime;

  const _VerticalProgressBar({
    required this.progress,
    required this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10.w,
      height: 1.sh - 32.h,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final thumbTop = height * (1 - progress);

          return Stack(
            clipBehavior: Clip.none,
            children: [

              /// TRACK
              Positioned(
                left: 12.w,
                child: Container(
                  width: 2.w,
                  height: height,
                  color: Colors.white.withOpacity(0.35),
                ),
              ),

              /// PROGRESS
              Positioned(
                left: 12.w,
                bottom: 0,
                child: Container(
                  width: 2.w,
                  height: height * progress,
                  color: Colors.white,
                ),
              ),

              /// DOT + CHIP
              Positioned(
                top: thumbTop - 6,
                left: 6.w,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    /// DOT
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),

                    Space.xf(10),

                    /// TIME CHIP
                    Transform.rotate(
                      angle: pi / 2,
                      child: Container(
                        padding: Space.all(11.54,7.7),
                        
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(7.7.r),
                        ),
                        child: Text(
                          currentTime,
                          style: AppText.l1!.s(13.47.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// CIRCLE BUTTON
class _CircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const _CircleButton({
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46.w,
        height: 46.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.w,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
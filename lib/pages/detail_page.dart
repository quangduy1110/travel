import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_buttons.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selextedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detailState = state as DetailState;
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://mark.bslmeiyu.com/uploads/${detailState.places.img}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 330,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: detailState.places.name),
                            AppLargeText(
                              text: '\$ ${detailState.places.price}',
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detailState.places.location,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(Icons.star,
                                    color: index < detailState.places.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: '(${detailState.places.stars}.0)',
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        AppLargeText(text: "People"),
                        const SizedBox(height: 5),
                        AppText(
                          text: 'Number of people in your group',
                          color: AppColors.mainColor,
                        ),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => InkWell(
                              onTap: () => setState(() {
                                selextedIndex = index;
                              }),
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 10, top: 10),
                                child: AppButtons(
                                  text: (1 + index).toString(),
                                  size: 50,
                                  color: selextedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selextedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderColor: selextedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const SizedBox(height: 20),
                        AppText(
                          text: detailState.places.description,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        color: AppColors.textColor1,
                        size: 60,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        icon: Icons.favorite_border,
                        isIcon: true,
                      ),
                      const SizedBox(width: 20),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

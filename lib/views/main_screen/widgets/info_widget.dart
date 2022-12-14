import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:office_geeks/data/models/hotel_model.dart';
import 'package:office_geeks/user_cubit/user_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget({Key? key}) : super(key: key);
  final PageController _upController = PageController();
  final PageController _downController = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = UserCubit.get(context);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.hotel.propertyType!,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.date_range),
                                const SizedBox(width: 10),
                                const Text(
                                  'Hotel',
                                  style: TextStyle(
                                      color: Colors.amberAccent,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                buildStars(cubit.hotel.rating!),
                                const SizedBox(width: 10),
                                Text(cubit.hotel.rating!.toString())
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  PageView.builder(
                                    controller: _upController,
                                    itemBuilder: (context, index) =>
                                        Image.network(
                                      cubit.hotel.featuredImage!,
                                      fit: BoxFit.cover,
                                    ),
                                    itemCount: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: SmoothPageIndicator(
                                      controller: _upController,
                                      count: 3,
                                      effect: WormEffect(
                                          activeDotColor:
                                              Theme.of(context).primaryColor,
                                          dotColor: Colors.white,
                                          radius: 16,
                                          dotHeight: 10,
                                          dotWidth: 10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text('Facilities',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 161, 159, 159),
                                        fontWeight: FontWeight.normal)),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 156,
                              child: PageView.builder(
                                controller: _downController,
                                itemBuilder: (context, index) {
                                  var featureList =
                                      cubit.hotel.features![index];
                                  return Column(
                                    children: List.generate(
                                        2,
                                        (i) => Expanded(
                                              child: Row(
                                                children: List.generate(5, (j) {
                                                  var c = i == 0 ? 0 : 5;
                                                  return Expanded(
                                                      child: Column(
                                                    children: [
                                                      featureList[c + j]
                                                              .image!
                                                              .endsWith('.svg')
                                                          ? SvgPicture.network(
                                                              featureList[c + j]
                                                                  .image!,
                                                              width: 30,
                                                              height: 30,
                                                              color: featureList[
                                                                          c + j]
                                                                      .isActive!
                                                                  ? Colors.amber
                                                                  : const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      199,
                                                                      194,
                                                                      194),
                                                            )
                                                          : Image.network(
                                                              featureList[c + j]
                                                                  .image!,
                                                              width: 30,
                                                              height: 30,
                                                            ),
                                                      const SizedBox(height: 3),
                                                      Text(
                                                        featureList[c + j]
                                                            .description!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption,
                                                      )
                                                    ],
                                                  ));
                                                }),
                                              ),
                                            )),
                                  );
                                },
                                itemCount: 3,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: SmoothPageIndicator(
                                controller: _downController,
                                count: 3,
                                effect: WormEffect(
                                    activeDotColor:
                                        Theme.of(context).primaryColor,
                                    dotColor: const Color.fromARGB(
                                        255, 199, 194, 194),
                                    radius: 16,
                                    dotHeight: 10,
                                    dotWidth: 10),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('Hotel Description',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 161, 159, 159),
                                        fontWeight: FontWeight.normal)),
                            const SizedBox(height: 10),
                            Text(cubit.hotel.description!,
                                maxLines: cubit.maxLines,
                                style: Theme.of(context).textTheme.bodyText1!),
                            Center(
                              child: TextButton(
                                  onPressed: () {
                                    cubit.seeDetails();
                                  },
                                  child: Text(
                                    cubit.maxLines == 2
                                        ? 'see Deatails'
                                        : 'show Less',
                                    style: Theme.of(context).textTheme.caption,
                                  )),
                            ),
                            const Divider(
                              height: 2,
                              thickness: 1.5,
                            ),
                            const SizedBox(height: 10),
                            Text('Location',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 161, 159, 159),
                                        fontWeight: FontWeight.normal)),
                            const SizedBox(height: 10),
                            Text(cubit.hotel.address!,
                                maxLines: cubit.maxLines,
                                style: Theme.of(context).textTheme.bodyText1!),
                            const SizedBox(height: 10),
                            Container(
                              height: 200,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GoogleMap(
                                  markers: {
                                    Marker(
                                        markerId: const MarkerId('1'),
                                        position: LatLng(
                                            cubit.hotel.mapSection!.latitude!,
                                            cubit.hotel.mapSection!.longitude!))
                                  },
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                        cubit.hotel.mapSection!.latitude!,
                                        cubit.hotel.mapSection!.longitude!,
                                      ),
                                      zoom: 6),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 40,
                            ),
                            Text('Important Information',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 161, 159, 159),
                                        fontWeight: FontWeight.normal)),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Max numbers of guests',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 97, 96, 96)),
                                ),
                                const Spacer(),
                                Text(
                                  cubit
                                      .hotel
                                      .informationSection!
                                      .subSections![0]
                                      .subSectionRows![0]
                                      .value!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 97, 96, 96)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Number of rooms',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 97, 96, 96)),
                                ),
                                const Spacer(),
                                Text(
                                  '2',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 97, 96, 96)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Daily Use',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          255, 97, 96, 96)),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Check in from',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  255, 97, 96, 96)),
                                    ),
                                    Text(
                                      cubit.hotel.checkInDayUse!,
                                      style:
                                          Theme.of(context).textTheme.caption!,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Check out from',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  255, 97, 96, 96)),
                                    ),
                                    Text(
                                      cubit.hotel.checkInDayUse!,
                                      style:
                                          Theme.of(context).textTheme.caption!,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Overnight',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          255, 97, 96, 96)),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Check in from',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  255, 97, 96, 96)),
                                    ),
                                    Text(
                                      cubit.hotel.checkInOvernightUse!,
                                      style:
                                          Theme.of(context).textTheme.caption!,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Check out from',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  255, 97, 96, 96)),
                                    ),
                                    Text(
                                      cubit.hotel.checkOutOvernightUse!,
                                      style:
                                          Theme.of(context).textTheme.caption!,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Similar Properties',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: const Color.fromARGB(255, 97, 96, 96),
                          letterSpacing: 1.1),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Check out these properties too',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: const Color.fromARGB(255, 97, 96, 96),
                          fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return HotelItem(
                                item: cubit.hotel.relatedSection!
                                    .relatedProperties![index + 1]);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemCount: cubit.hotel.relatedSection!
                                  .relatedProperties!.length -
                              1),
                    ),
                    const SizedBox(height: 10),
                  ]),
            ),
          ),
        ),
        Container(
          height: 80,
          margin: const EdgeInsets.only(top: 10),
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.amberAccent,
            ),
            onPressed: () {},
            child: const Center(
              child: Text(
                'Reserve',
                style: TextStyle(color: Colors.grey, fontSize: 24),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class HotelItem extends StatelessWidget {
  const HotelItem({Key? key, required this.item}) : super(key: key);
  final RelatedProperties item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 170,
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.featuredImage!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 140,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 10,
                color: Colors.orange,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  item.title!,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 97, 96, 96),
                      ),
                ),
              ),
            ],
          ),
          Text(
            item.type!,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: const Color.fromARGB(255, 97, 96, 96),
                letterSpacing: 1.1),
          ),
          Row(
            children: [
              buildStars(item.rating!),
              const Spacer(),
              Text(
                '${item.reviews!} reviews',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 97, 96, 96),
                    ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            item.price!,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.amberAccent, letterSpacing: 1.1),
          ),
        ],
      ),
    );
  }
}

Widget buildStars(int starsNo) {
  return Row(
    children: List.generate(
      5,
      (index) => Icon(
        Icons.star,
        size: 20,
        color: starsNo >= index + 1 ? Colors.amberAccent : Colors.grey,
      ),
    ),
  );
}

part of '_widgets.dart';

class BigMoviezCard extends StatelessWidget {
  const BigMoviezCard({
    Key? key,
    required this.moviezModel,
  }) : super(key: key);

  final MoviezModel moviezModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(21)),
          child: SizedBox(
            height: 200,
            width: 300,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                color: BaseColors.gray,
              ),
              imageBuilder: (context, imageProvider) => Container(
                width: 100,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              imageUrl: moviezModel.image,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  moviezModel.title,
                  style: FontThemes.avenir20w500nightBlue(),
                ),
                Row(
                  children: moviezModel.genres
                      .map(
                        (genre) => Text(
                          moviezModel.genres.first == genre
                              ? genre
                              : ', $genre',
                          style: FontThemes.avenir16w400gray(),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            const SizedBox(
              width: 88,
            ),
            StarRating(
              rating: moviezModel.rating,
            ),
          ],
        )
      ],
    );
  }
}

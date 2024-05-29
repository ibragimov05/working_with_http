import 'package:flutter/material.dart';

class CustomGridViewBuilder extends StatelessWidget {
  final List<dynamic> objectList;
  final bool isSelected;

  const CustomGridViewBuilder({
    super.key,
    required this.objectList,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: isSelected ? 3 : objectList.length - 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment:
              isSelected ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Image.network(
              isSelected
                  ? objectList[index].userAvatar
                  : objectList[index].image,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }
              },
            ),
            Text(
                isSelected
                    ? objectList[index].userEmail
                    : objectList[index].name,
                ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  const RecipeCard({
    Key? key,
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: _buildCardDecoration(),
      child: Stack(
        children: [
          _buildBackgroundImage(),
          _buildRecipeTitle(),
          _buildRecipeInfo(),
        ],
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.6),
          offset: const Offset(0.0, 10.0),
          blurRadius: 10.0,
          spreadRadius: -6.0,
        ),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.network(
        thumbnailUrl,
        fit: BoxFit.cover,
        color: Colors.black.withOpacity(0.35),
        colorBlendMode: BlendMode.multiply,
      ),
    );
  }

  Widget _buildRecipeTitle() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildRecipeInfo() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoContainer(
            icon: Icons.star,
            label: rating,
          ),
          _buildInfoContainer(
            icon: Icons.schedule,
            label: cookTime,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.yellow,
            size: 18,
          ),
          const SizedBox(width: 7),
          Text(
            label, 
            style: const TextStyle(
                color: Colors.white,
              ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PersonWidget extends StatefulWidget {
  final String? img;
  final String? name;
  final String? university;

  final Function()? onTap;

  const PersonWidget({
    super.key,
    this.img = "",
    this.name = "",
    this.university = "",
    this.onTap,
  });

  @override
  State<PersonWidget> createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: widget.img != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.img!,
                      ),
                    )
                  : const CircleAvatar(
                      backgroundColor: Color(0xFFFAFAFA),
                      child: Icon(
                        Icons.person,
                        color: Color(0xFF898989),
                        size: 45,
                      ),
                    ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name ?? "",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Visibility(
                  visible: widget.university != null,
                  child: Text(
                    widget.university ?? "",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

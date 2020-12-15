import 'package:flutter/material.dart';

class ItemField extends StatelessWidget {
  final Function onTap;

  final String label;
  final String value;
  final IconData icon;

  const ItemField({
    Key key,
    @required this.onTap,
    @required this.label,
    this.value,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                          ),
                          child: Text(
                            label.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        Text(
                          value ?? '',
                          maxLines: 3,
                          style: TextStyle(
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      onPressed: onTap,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Divider(
                  color: Color(0xff21618C).withOpacity(0.21),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart' hide FormState;

class WordLabel extends StatelessWidget {
  final String _word;
  final bool _isHighlighted;
  final bool _isExtended;

  const WordLabel({
    required String word,
    required bool isHighlighted,
    required bool isExtended,
    Key? key,
  })  : _isExtended = isExtended,
        _isHighlighted = isHighlighted,
        _word = word,
        super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              _word,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: _isHighlighted && !_isExtended
                    ? Theme.of(context).primaryColor
                    : null,
              ),
            ),
          ),
          if (_isExtended)
            Text(
              _word.length.toString(),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
        ],
      );
}

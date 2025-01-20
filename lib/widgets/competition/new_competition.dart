import 'package:flutter/material.dart';
import 'package:trophy_holder/models/competition.dart';

class NewCompetition extends StatefulWidget {
  const NewCompetition({super.key, required this.onAddCompetition});

  final void Function(Competition competition) onAddCompetition;

  @override
  State<NewCompetition> createState() {
    return _NewCompetitionState();
  }
}

class _NewCompetitionState extends State<NewCompetition> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _competitorController = TextEditingController();
  final TextEditingController _rivalController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  Category _selectedCategory = Category.squash;
  bool _trophyAcquiredChecked = false;

  void _selectCategory(Category? category) {
    if (category != null) {
      setState(() {
        _selectedCategory = category;
      });
    }
  }

  void _toggleTrophyAcquired(bool? checked) {
    if (checked != null) {
      setState(() {
        _trophyAcquiredChecked = checked;
      });
    }
  }

  void _showDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: now,
        initialDate: now);
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitCompetitionData() {
    final enteredTitle = _titleController.text.trim();
    final titleIsInvalid = enteredTitle.isEmpty;

    final enteredCompetitor = _competitorController.text.trim();
    final competitorIsInvalid = enteredCompetitor.isEmpty;

    final enteredRival = _rivalController.text.trim();
    final rivalIsInvalid = enteredRival.isEmpty;

    if (titleIsInvalid || competitorIsInvalid || rivalIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, competitor and rival fields were entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Got it!'),
            )
          ],
        ),
      );
      return;
    }

    widget.onAddCompetition(Competition(
        title: enteredTitle,
        competitor: enteredCompetitor,
        rival: enteredRival,
        creationDate: _selectedDate,
        category: _selectedCategory,
        isTrophyAcquired: _trophyAcquiredChecked));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _competitorController.dispose();
    _rivalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _competitorController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Competitor'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: _rivalController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Rival'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: _selectCategory,
              ),
              const Spacer(),
              Expanded(
                child: Row(
                  children: [
                    Text(dateFormatter.format(_selectedDate)),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text('Trophy already acquired?'),
              value: _trophyAcquiredChecked,
              onChanged: _toggleTrophyAcquired,
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: _submitCompetitionData,
                child: const Text('Save competition'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

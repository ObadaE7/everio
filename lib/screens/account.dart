import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:everio/widgets/input_field.dart';
import 'package:everio/data/dummy_data.dart';
import 'package:iconly/iconly.dart';
import 'package:hugeicons/hugeicons.dart';

class Account extends StatefulWidget {
  final GlobalKey<FormState> _accountFormKey = GlobalKey<FormState>();
  Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isEditing = false;

  final List<String> fields = [
    'Name',
    'Email',
    'Date of Birth',
    'Address',
  ];

  final List<IconData> fieldsIcon = [
    IconlyLight.profile,
    IconlyLight.message,
    IconlyLight.calendar,
    IconlyLight.location,
  ];

  final Map<String, String> initialValues = {
    'Name': dummyUser[0].name,
    'Email': dummyUser[0].email,
    'Date of Birth':
        dummyUser[0].dateOfBirth.toIso8601String().split('T').first,
    'Address': dummyUser[0].address,
  };

  static String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  static String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? _dobValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date of Birth cannot be empty';
    }
    try {
      final dob = DateTime.parse(value);
      final today = DateTime.now();
      final age = today.year -
          dob.year -
          ((today.month < dob.month ||
                  (today.month == dob.month && today.day < dob.day))
              ? 1
              : 0);
      if (age < 18) {
        return 'You must be at least 18 years old';
      }
    } catch (e) {
      return 'Enter a valid date in YYYY-MM-DD format';
    }
    return null;
  }

  static String? _addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address cannot be empty';
    } else if (value.length < 10) {
      return 'Address must be at least 10 characters';
    }
    return null;
  }

  final Map<String, FormFieldValidator<String>> fieldValidators = {
    'Name': _nameValidator,
    'Email': _emailValidator,
    'Date of Birth': _dobValidator,
    'Address': _addressValidator,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            HugeIcons.strokeRoundedArrowLeft04,
            size: 30.0,
          ),
          tooltip: 'Back',
        ),
        title: const Text('Account'),
        centerTitle: true,
        actions: [
          isEditing == true
              ? IconButton(
                  onPressed: () {
                    if (widget._accountFormKey.currentState!.validate()) {
                      // Only save if validation passes
                      widget._accountFormKey.currentState!.save();
                      setState(() {
                        isEditing = false;
                      });
                      const snackBar = SnackBar(
                        content: Row(
                          children: [
                            Icon(
                              HugeIcons.strokeRoundedCheckmarkCircle03,
                              color: Colors.white,
                            ),
                            SizedBox(width: AppSizes.kPaddingSmall),
                            Text(
                              'Your account has been updated',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: AppColors.primaryGreen,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  icon: const Icon(
                    HugeIcons.strokeRoundedFloppyDisk,
                    color: AppColors.primaryGreen,
                  ),
                  tooltip: 'Save',
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                  icon: const Icon(IconlyLight.edit_square),
                  tooltip: 'Edit',
                ),
        ],
        backgroundColor: AppColors.lightBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.kPaddingNormal),
        child: Form(
          key: widget._accountFormKey,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/avatars/avatar-1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10.0,
                    right: -10.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconlyLight.camera,
                          color: AppColors.primaryGreen,
                          size: 25.0,
                        ),
                        tooltip: 'Change avatar',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.kPaddingNormal),
              ListView.builder(
                itemCount: fields.length,
                shrinkWrap: true,
                itemExtent: 80.0,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final field = fields[index];
                  return InputField(
                    field: fields[index],
                    initialValue: initialValues[field] ?? '',
                    hintText: 'Enter your ${field.toLowerCase()}',
                    prefixIcon: fieldsIcon[index],
                    disabled: !isEditing,
                    validator: fieldValidators[field],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.lightBackgroundColor,
    );
  }
}

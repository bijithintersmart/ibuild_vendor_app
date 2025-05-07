import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/validator.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/input_field_widget.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:ibuild_vendor/features/register_equipment/presentation/widgets/image_picker_textfield.dart';
import 'package:ibuild_vendor/features/register_equipment/presentation/widgets/vehicle_type_widget.dart';

class AddEquipmentScreen extends StatefulWidget {
  final VoidCallback? onSubmit;
  const AddEquipmentScreen({super.key, this.onSubmit});

  @override
  State<AddEquipmentScreen> createState() => _AddEquipmentScreenState();
}

class _AddEquipmentScreenState extends State<AddEquipmentScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (GoRouter.of(context).canPop()) {
                GoRouter.of(context).pop();
              }
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        centerTitle: true,
        title: NormalText(
          text: "Register Your Equipment",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const CategoryDropdown(),
              const SizedBox(
                height: 10,
              ),
              InputField(
                borderColor: AppColors.borderGrey,
                title: "Vehicle Details & capacity",
                labelText: "",
                hintText: "Enter Vehicle Type",
                validator: (value) =>
                    Validator.validateNotEmpty(value, "Vehicle Type"),
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                borderColor: AppColors.borderGrey,
                labelText: "",
                title: "Vehicle ID/License Plate Number",
                hintText: "Enter Vehicle ID/License Plate Number",
                validator: (value) => Validator.validateNotEmpty(
                    value, "Vehicle ID/License Plate Number"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Vehicle License",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 12,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      borderColor: AppColors.borderGrey,
                      labelText: "",
                      title: "",
                      hintText: "Start Date",
                      validator: (value) =>
                          Validator.validateNotEmpty(value, "Start Date"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InputField(
                      borderColor: AppColors.borderGrey,
                      labelText: "",
                      title: "",
                      hintText: "End Date",
                      validator: (value) => Validator.validateNotEmpty(
                        value,
                        "End Date",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                borderColor: AppColors.borderGrey,
                labelText: "",
                title: "Year of Manufacture",
                hintText: "Enter Year of Manufacture",
                validator: (value) => Validator.validateNotEmpty(
                  value,
                  "Year",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Rental Price per Half day/Full Day/Week/Month",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 12,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: InputField(
                    borderColor: AppColors.borderGrey,
                    labelText: "",
                    hintText: "Half Day",
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InputField(
                          borderColor: AppColors.borderGrey,
                          labelText: "",
                          hintText: "Full Day")),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InputField(
                          borderColor: AppColors.borderGrey,
                          labelText: "",
                          hintText: "Week")),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InputField(
                          borderColor: AppColors.borderGrey,
                          labelText: "",
                          hintText: "Month")),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                borderColor: AppColors.borderGrey,
                labelText: "",
                title: "Insurance Coverage",
                hintText: "Enter Insurance Coverage",
                validator: (value) => Validator.validateNotEmpty(
                  value,
                  "Insurance Coverage",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                borderColor: AppColors.borderGrey,
                labelText: "",
                title: "Location",
                hintText: "Enter your location",
                validator: (value) => Validator.validateNotEmpty(
                  value,
                  "Location",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PhotoUploader(
                validator: (images) {
                  if (images == null || images.isEmpty) {
                    return 'Please upload at least one photo.';
                  }
                  return null;
                },
                onSaved: (images) {
                  debugPrint(images.toString());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                borderColor: AppColors.borderGrey,
                labelText: "",
                maxLine: 4,
                title: "Vehicle Description",
                hintText: "Enter Vehicle Description",
                validator: (value) => Validator.validateNotEmpty(
                  value,
                  "Vehicle Description",
                ),
              ),
              const SizedBox(
                height: kBottomNavigationBarHeight,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40)),
            onPressed: widget.onSubmit ??
                () {
                  if (formKey.currentState!.validate()) {
                    GoRouter.of(context).push(
                      Routes.SKELETON,
                    );
                  }
                },
            child: Text(
              "Submit",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            )),
      ),
    );
  }
}

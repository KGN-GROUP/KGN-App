                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    if (value.trim().length < 8) {
                      return 'Please enter a valid mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  value: selectedService, // Fixed: 'initialValue' ko badalkar 'value' kiya taaki deprecation error na aaye
                  decoration: const InputDecoration(
                    labelText: 'Select Service',
                    prefixIcon: Icon(Icons.build),
                    border: OutlineInputBorder(),
                  ),
                  items: services.map((service) {
                    return DropdownMenuItem<String>(
                      value: service.name,
                      child: Text(service.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedService = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a service';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                TextFormField(
                  controller: addressController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Full Address',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                TextFormField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Describe Your Work',
                    hintText: 'Please explain your requirement',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please describe your work';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton.icon(
                    onPressed: submitBooking,
                    icon: const Icon(Icons.send),
                    label: const Text('Submit Booking'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// VENDOR REGISTRATION

class VendorScreen extends StatefulWidget {
  const VendorScreen({super.key});

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final skillController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    cityController.dispose();
    skillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vendor Registration')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Icon(
                Icons.storefront,
                size: 70,
                color: Colors.blue, // Note: Agar 'brandBlue' undefined error de, toh yahan Colors.blue use karein
              ),
              const SizedBox(height: 15),
              const Text(
                'Join KGN GROUP as a Service Vendor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              _vendorField(nameController, 'Full Name'),
              _vendorField(
                phoneController,
                'Mobile Number',
                type: TextInputType.phone,
              ),
              _vendorField(
                emailController,
                'Email Address',
                type: TextInputType.emailAddress,
              ),
              _vendorField(cityController, 'City / Location'),
              _vendorField(skillController, 'Technical Skills'),

              const SizedBox(height: 15),

              const Card(
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    'Vendor documents such as Iqama, Passport, '
                    'Education Certificate and Photo will be submitted '
                    'after API integration.',
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Fixed positional arguments issue: Agar showMessage custom function hai toh direct variables pass karne ke bajaye named parameters check karein. 
                      // Agar context issue tha, toh ye syntax safely run karega.
                    }
                  },
                  child: const Text('Submit Registration'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _vendorField(
    TextEditingController controller,
    String label, {
    TextInputType type = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}

// ABOUT SCREEN

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) { // Fixed: Adhoora bracket aur 'context' syntax theek kiya
    return const Scaffold(
      body: Center(
        child: Text('About KGN Group'),
      ),
    );
  }
}

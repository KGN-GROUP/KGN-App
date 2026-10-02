
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
                  initialValue: selectedService,
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
                color: brandBlue,
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
                      showMessage(
                        context,
                        'Registration',
                        'Vendor registration form completed. '
                        'Server submission and OTP verification '
                        'are not connected yet.',
                      );
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About KGN GROUP')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.business,
                size: 90,
                color: brandBlue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'KGN GROUP',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: brandBlue,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your Trusted Technical Service Partner',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'KGN GROUP provides professional technical services '
              'for residential, commercial and industrial customers. '
              'Our services include electrical work, electronics, '
              'air conditioning, CCTV, networking, telecommunication, '
              'door phone systems and maintenance solutions.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Commitment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: brandBlue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We aim to provide professional installation, '
              'repair and maintenance services with a focus on '
              'customer satisfaction and reliable technical support.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.location_on, color: brandBlue),
              title: Text('Location'),
              subtitle: Text('Al Qassim / Unaizah, Saudi Arabia'),
            ),
            const ListTile(
              leading: Icon(Icons.email, color: brandBlue),
              title: Text('Email'),
              subtitle: Text('kgngroupinfo@gmail.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone, color: brandBlue),
              title: Text('Inquiry'),
              subtitle: Text('+966 568778195'),
            ),
          ],
        ),
      ),
    );
  }
}

// FEEDBACK SCREEN

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final nameController = TextEditingController();
  final feedbackController = TextEditingController();
  int rating = 5;

  @override
  void dispose() {
    nameController.dispose();
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Feedback')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Share Your Experience',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: brandBlue,
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Your Rating',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                  icon: Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 32,
                  ),
                );
              }),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Your Feedback',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton.icon(
                onPressed: () {
                  if (nameController.text.trim().isEmpty ||
                      feedbackController.text.trim().isEmpty) {
                    showMessage(
                      context,
                      'Missing Information',
                      'Please enter your name and feedback.',
                    );
                    return;
                  }

                  showMessage(
                    context,
                    'Thank You',
                    'Your feedback has been recorded in this demo. '
                    'Server submission is not connected yet.',
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text('Submit Feedback'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SEARCH SCREEN

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredServices = services.where((service) {
      return service.name.toLowerCase().contains(
            searchText.toLowerCase(),
          );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Services')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search services...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredServices.isEmpty
                ? const Center(
                    child: Text('No services found'),
                  )
                : ListView.builder(
                    itemCount: filteredServices.length,
                    itemBuilder: (context, index) {
                      final service = filteredServices[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: Icon(
                            service.icon,
                            color: brandBlue,
                          ),
                          title: Text(service.name),
                          subtitle: Text(service.description),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ServiceScreen(
                                  service: service,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// CUSTOMER REQUESTS

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookings = AppData.bookings;

    return Scaffold(
      appBar: AppBar(title: const Text('My Requests')),
      body: bookings.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long,
                    size: 70,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No requests yet',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE5EEF8),
                      child: Icon(
                        Icons.receipt_long,
                        color: brandBlue,
                      ),
                    ),
                    title: Text(booking.service),
                    subtitle: Text(
                      'Name: ${booking.name}\n'
                      'Phone: ${booking.phone}\n'
                      'Address: ${booking.address}\n'
                      'Work: ${booking.description}',
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}

// MESSAGE DIALOG

void showMessage(
  BuildContext context,
  String title,
  String message,
) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

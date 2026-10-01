
import 'package:flutter/material.dart';

void main() {
  runApp(const KGNGroupApp());
}

const Color brandBlue = Color(0xFF123B70);
const Color brandGold = Color(0xFFFFB900);

class KGNGroupApp extends StatelessWidget {
  const KGNGroupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KGN GROUP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: brandBlue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandBlue,
          primary: brandBlue,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: brandBlue,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// SERVICE DATA

class ServiceData {
  final String name;
  final String arabic;
  final String description;
  final IconData icon;

  const ServiceData({
    required this.name,
    required this.arabic,
    required this.description,
    required this.icon,
  });
}

const List<ServiceData> services = [
  ServiceData(
    name: 'Electrical Services',
    arabic: 'الخدمات الكهربائية',
    description: 'Electrical installation, repair and maintenance.',
    icon: Icons.electrical_services,
  ),
  ServiceData(
    name: 'Electronics Services',
    arabic: 'خدمات الإلكترونيات',
    description: 'Electronic equipment repair and maintenance.',
    icon: Icons.devices,
  ),
  ServiceData(
    name: 'AC & HVAC Services',
    arabic: 'خدمات التكييف',
    description: 'AC installation, servicing and HVAC maintenance.',
    icon: Icons.ac_unit,
  ),
  ServiceData(
    name: 'CCTV & Security',
    arabic: 'كاميرات المراقبة والأمن',
    description: 'CCTV installation and security system services.',
    icon: Icons.videocam,
  ),
  ServiceData(
    name: 'Preventive Maintenance',
    arabic: 'الصيانة الوقائية',
    description: 'Scheduled preventive maintenance solutions.',
    icon: Icons.build_circle,
  ),
  ServiceData(
    name: 'Emergency Maintenance',
    arabic: 'الصيانة الطارئة',
    description: 'Emergency technical maintenance services.',
    icon: Icons.emergency,
  ),
  ServiceData(
    name: 'Telecommunication',
    arabic: 'الاتصالات',
    description: 'Telecommunication installation and support.',
    icon: Icons.phone_in_talk,
  ),
  ServiceData(
    name: 'Networking',
    arabic: 'الشبكات',
    description: 'Network installation, configuration and repair.',
    icon: Icons.wifi,
  ),
  ServiceData(
    name: 'Video Door Phone',
    arabic: 'الإنتركم المرئي',
    description: 'Video door phone installation and maintenance.',
    icon: Icons.doorbell,
  ),
  ServiceData(
    name: 'Audio Door Phone',
    arabic: 'الإنتركم الصوتي',
    description: 'Audio door phone installation and repair.',
    icon: Icons.phone,
  ),
];

// LOCAL REQUEST STORAGE

class BookingData {
  final String name;
  final String phone;
  final String service;
  final String address;
  final String description;

  BookingData({
    required this.name,
    required this.phone,
    required this.service,
    required this.address,
    required this.description,
  });
}

class AppData {
  static final List<BookingData> bookings = [];
}

// HOME SCREEN

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'KGN GROUP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              showMessage(
                context,
                'Notifications',
                'Notifications will be connected through the API.',
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BANNER

            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    brandBlue,
                    Color(0xFF2765A5),
                  ],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'KGN GROUP',
                    style: TextStyle(
                      color: brandGold,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your Trusted Technical Service Partner',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Professional Installation, Repair & Maintenance',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 18),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: brandGold,
                      foregroundColor: brandBlue,
                    ),
                    onPressed: () => openPage(
                      const BookingScreen(),
                    ),
                    child: const Text('Book a Service'),
                  ),
                ],
              ),
            ),

            // SERVICES

            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Text(
                'Our Services',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: brandBlue,
                ),
              ),
            ),

            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.12,
              ),
              itemBuilder: (context, i) {
                final service = services[i];

                return Card(
                  elevation: 2,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      openPage(
                        ServiceScreen(service: service),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            service.icon,
                            color: brandBlue,
                            size: 34,
                          ),
                          const SizedBox(height: 9),
                          Text(
                            service.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            service.arabic,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // VENDOR AND COMPANY

            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'Vendor & Company',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: brandBlue,
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.storefront,
                  color: brandBlue,
                ),
                title: const Text('Vendor Registration / Login'),
                subtitle: const Text(
                  'OTP, email and document submission',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => openPage(const VendorScreen()),
              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.info_outline,
                  color: brandBlue,
                ),
                title: const Text('About KGN GROUP'),
                subtitle: const Text('About our company'),
                onTap: () => openPage(const AboutScreen()),
              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: brandBlue,
                ),
                title: const Text('Gallery'),
                subtitle: const Text('Worksite photos and videos'),
                onTap: () => showMessage(
                  context,
                  'Gallery',
                  'Connect the approved KGN GROUP gallery through the API.',
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.feedback,
                  color: brandBlue,
                ),
                title: const Text('Feedback'),
                subtitle: const Text('Share your service experience'),
                onTap: () => openPage(const FeedbackScreen()),
              ),
            ),

            // CONTACT

            Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact KGN GROUP',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Al Qassim / Unaizah, Saudi Arabia',
                      ),
                      const SizedBox(height: 5),
                      const Text('kgngroupinfo@gmail.com'),
                      const SizedBox(height: 12),
                      const Text('Inquiry: +966 568778195'),
                      const Text('Support: +966 541337646'),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          FilledButton.icon(
                            onPressed: () => showMessage(
                              context,
                              'Inquiry',
                              'Call: +966 568778195',
                            ),
                            icon: const Icon(Icons.call),
                            label: const Text('Inquiry'),
                          ),
                          FilledButton.icon(
                            onPressed: () => showMessage(
                              context,
                              'Support',
                              'Call: +966 541337646',
                            ),
                            icon: const Icon(Icons.support_agent),
                            label: const Text('Support'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => showMessage(
                              context,
                              'WhatsApp',
                              'WhatsApp number: +966 568778195',
                            ),
                            icon: const Icon(Icons.chat),
                            label: const Text('WhatsApp'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // BOTTOM NAVIGATION

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: brandBlue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            selectedIndex = i;
          });

          if (i == 0) {
            return;
          }

          if (i == 1) {
            openPage(const SearchScreen());
          }

          if (i == 2) {
            openPage(const RequestsScreen());
          }

          if (i == 3) {
            openPage(const VendorScreen());
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// SERVICE DETAILS

class ServiceScreen extends StatelessWidget {
  final ServiceData service;

  const ServiceScreen({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(service.name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                service.icon,
                size: 85,
                color: brandBlue,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              service.name,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: brandBlue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              service.arabic,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15),
            Text(
              service.description,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(
                        serviceName: service.name,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.calendar_month),
                label: const Text('Book This Service'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CUSTOMER BOOKING

class BookingScreen extends StatefulWidget {
  final String? serviceName;

  const BookingScreen({
    super.key,
    this.serviceName,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

  String? selectedService;

  @override
  void initState() {
    super.initState();
    selectedService = widget.serviceName;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void submitBooking() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedService == null) {
      showMessage(
        context,
        'Select Service',
        'Please select a service.',
      );
      return;
    }

    AppData.bookings.add(
      BookingData(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        service: selectedService!,
        address: addressController.text.trim(),
        description: descriptionController.text.trim(),
      ),
    );

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Booking Submitted'),
        content: const Text(
          'Your booking has been saved on this device. '
          'API submission is not connected yet.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Booking')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(
                Icons.home_repair_service,
                size: 65,
                color: brandBlue,
              ),
              const SizedBox(height: 20),

              TextFormField(
   

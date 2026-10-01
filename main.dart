import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const KGNApp());

const brandBlue = Color(0xFF0D47A1);
const accentOrange = Color(0xFFFF8F00);

const services = <Map<String, String>>[
  {'name':'Electronics','description':'Electronics installation, repair, troubleshooting and maintenance.'},
  {'name':'CCTV & Security System','description':'CCTV installation, security system setup, remote monitoring and maintenance.'},
  {'name':'Networking & Internet','description':'Network planning, Wi-Fi setup, structured cabling and troubleshooting.'},
  {'name':'Telecommunication','description':'Telecommunication installation, repair and maintenance.'},
  {'name':'EPBAX','description':'EPABX/PBX installation, programming, configuration and support.'},
  {'name':'Video Door Phone','description':'Video door phone installation, repair and maintenance.'},
  {'name':'Audio Door Phone','description':'Audio door phone installation and maintenance.'},
  {'name':'Automation','description':'Building and equipment automation solutions.'},
  {'name':'Smart Home','description':'Smart home devices, controls and integration.'},
  {'name':'Electrical','description':'Electrical installation, inspection, repair and maintenance.'},
  {'name':'AC & HVAC','description':'AC installation, repair, preventive maintenance and HVAC solutions.'},
  {'name':'Home Appliances','description':'Home appliance installation, repair and maintenance.'},
  {'name':'Preventive Maintenance','description':'Scheduled inspections and preventive maintenance plans.'},
  {'name':'Emergency Maintenance','description':'Urgent maintenance request and response coordination.'},
  {'name':'Renovation','description':'Residential, commercial and industrial renovation services.'},
];

class KGNApp extends StatefulWidget {
  const KGNApp({super.key});
  @override State<KGNApp> createState() => _KGNAppState();
}
class _KGNAppState extends State<KGNApp> {
  String language = 'English';
  @override Widget build(BuildContext context) => MaterialApp(
    title: 'KGN GROUP',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3:true, colorScheme:ColorScheme.fromSeed(seedColor:brandBlue),
      scaffoldBackgroundColor:const Color(0xFFF5F7FA)),
    home: HomeScreen(language:language,onLanguage:(v)=>setState(()=>language=v)),
  );
}

class HomeScreen extends StatelessWidget {
  final String language;
  final ValueChanged<String> onLanguage;
  const HomeScreen({super.key,required this.language,required this.onLanguage});

  Future<void> _open(String uri) async {
    final u=Uri.parse(uri);
    if (await canLaunchUrl(u)) { await launchUrl(u, mode:LaunchMode.externalApplication); }
  }

  @override Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(
      backgroundColor:brandBlue,foregroundColor:Colors.white,
      title:const Text('KGN GROUP',style:TextStyle(fontWeight:FontWeight.bold)),
      actions:[
        PopupMenuButton<String>(
          tooltip:'Language',
          onSelected:onLanguage,
          itemBuilder:(_)=>['English','العربية','हिन्दी','বাংলা']
            .map((x)=>PopupMenuItem(value:x,child:Text(x))).toList(),
          child:Padding(padding:const EdgeInsets.symmetric(horizontal:14),child:Center(child:Text(language))),
        )
      ],
    ),
    body:ListView(
      padding:const EdgeInsets.only(bottom:24),
      children:[
        Container(
          margin:const EdgeInsets.all(12),padding:const EdgeInsets.all(22),
          decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(20),
            gradient:const LinearGradient(colors:[brandBlue,Color(0xFF1565C0)])),
          child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
            const Text('Find Trusted Professionals',style:TextStyle(color:Colors.white,fontSize:26,fontWeight:FontWeight.bold)),
            const SizedBox(height:8),
            const Text('Professional service solutions for home, office and commercial needs.',
              style:TextStyle(color:Colors.white70,fontSize:15)),
            const SizedBox(height:18),
            const TextField(decoration:InputDecoration(
              hintText:'Search services...',filled:true,fillColor:Colors.white,
              prefixIcon:Icon(Icons.search),border:OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(12)),borderSide:BorderSide.none))),
            const SizedBox(height:14),
            FilledButton(
              style:FilledButton.styleFrom(backgroundColor:accentOrange,foregroundColor:Colors.white),
              onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const QuoteScreen())),
              child:const Text('Get Quotation')),
          ]),
        ),
        const Padding(padding:EdgeInsets.fromLTRB(16,10,16,8),
          child:Text('Our Service Categories',style:TextStyle(fontSize:21,fontWeight:FontWeight.bold,color:brandBlue))),
        GridView.builder(
          shrinkWrap:true,physics:const NeverScrollableScrollPhysics(),
          padding:const EdgeInsets.symmetric(horizontal:12),
          itemCount:services.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,childAspectRatio:1.18,crossAxisSpacing:10,mainAxisSpacing:10),
          itemBuilder:(context,i){
            final s=services[i];
            return Card(child:InkWell(
              borderRadius:BorderRadius.circular(14),
              onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>ServiceScreen(
                name:s['name']!,description:s['description']!))),
              child:Padding(padding:const EdgeInsets.all(14),child:Column(
                mainAxisAlignment:MainAxisAlignment.center,children:[
                  const Icon(Icons.home_repair_service,color:brandBlue,size:34),
                  const SizedBox(height:10),
                  Text(s['name']!,textAlign:TextAlign.center,style:const TextStyle(fontWeight:FontWeight.bold)),
                  const SizedBox(height:5),
                  const Icon(Icons.arrow_forward,size:18),
                ])),
            ));
          },
        ),
        onst Padding(
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
          child: ListTile(
            leading: const Icon(Icons.storefront, color: brandBlue),
            title: const Text('Vendor Registration / Login'),
            subtitle: const Text('OTP, email and document submission'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VendorScreen(),
              ),
            ),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.info_outline, color: brandBlue),
            title: const Text('About KGN GROUP'),
            subtitle: const Text(
              'Your trusted service partner in Al Qassim / Unaizah',
            ),
            onTap: () => _show(
              context,
              'About Us',
              'KGN GROUP provides professional service, installation, repair and maintenance solutions.',
            ),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.photo_library, color: brandBlue),
            title: const Text('Gallery'),
            subtitle: const Text('Worksite photos and videos'),
            onTap: () => _show(
              context,
              'Gallery',
              'Connect the approved KGN GROUP gallery through the admin panel.',
            ),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.feedback, color: brandBlue),
            title: const Text('Feedback'),
            subtitle: const Text('Share your service experience'),
            onTap: () => _show(
              context,
              'Feedback',
              'Feedback submission will be connected to the API.',
            ),
          ),
        ),

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
                  const SizedBox(height: 8),
                  const Text('Al Qassim / Unaizah, Saudi Arabia'),
                  const Text('kgngroupinfo@gmail.com'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilledButton.icon(
                        onPressed: () => _open('tel:+966568778195'),
                        icon: const Icon(Icons.call),
                        label: const Text('Inquiry'),
                      ),
                      FilledButton.icon(
                        onPressed: () => _open('tel:+966541337646'),
                        icon: const Icon(Icons.support_agent),
                        label: const Text('Support'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => _open('https://wa.me/966568778195'),
                        icon: const Icon(Icons.chat),
                        label: const Text('WhatsApp'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => _open(
                          'https://www.google.com/maps/search/?api=1&query=Unaizah%2C%20Al%20Qassim%2C%20Saudi%20Arabia',
                        ),
                        icon: const Icon(Icons.location_on),
                        label: const Text('Google Location'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    bottomNavigationBar: BottomNavigationBar(
  selectedItemColor: brandBlue,
  type: BottomNavigationBarType.fixed,
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
  onTap: (i) {
    if (i == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const RequestsScreen(),
        ),
      );
    }
    if (i == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const VendorScreen(),
        ),
      );
    }
  },
),

  void _show(BuildContext c,String title,String message)=>showDialog(context:c,builder:(_)=>AlertDialog(
    title:Text(title),content:Text(message),actions:[TextButton(onPressed:()=>Navigator.pop(c),child:const Text('OK'))]));
}

class ServiceScreen extends StatelessWidget {
  final String name,description;
  const ServiceScreen({super.key,required this.name,required this.description});
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:Text(name),backgroundColor:brandBlue,foregroundColor:Colors.white),
    body:ListView(padding:const EdgeInsets.all(16),children:[
      Container(height:170,decoration:BoxDecoration(color:const Color(0xFFE3F2FD),borderRadius:BorderRadius.circular(18)),
        child:const Icon(Icons.home_repair_service,size:80,color:brandBlue)),
      const SizedBox(height:18),
      Text(name,style:const TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:brandBlue)),
      const SizedBox(height:10),Text(description,style:const TextStyle(fontSize:16,height:1.5)),
      const SizedBox(height:18),const Text('Service Options',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
      for(final item in ['Installation','Repair','Maintenance','Inspection & Troubleshooting'])
        ListTile(leading:const Icon(Icons.check_circle,color:Colors.green),title:Text(item)),
      FilledButton(onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const QuoteScreen())),
        child:const Text('Get Quotation')),
    ]),
  );
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});
  @override State<QuoteScreen> createState()=>_QuoteScreenState();
}
class _QuoteScreenState extends State<QuoteScreen>{
  String selected=services.first['name']!;
  final description=TextEditingController(),name=TextEditingController(),phone=TextEditingController(),address=TextEditingController();
  @override void dispose(){description.dispose();name.dispose();phone.dispose();address.dispose();super.dispose();}
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:const Text('Get Quotation'),backgroundColor:brandBlue,foregroundColor:Colors.white),
    body:ListView(padding:const EdgeInsets.all(16),children:[
      DropdownButtonFormField<String>(initialValue: selected,decoration:const InputDecoration(labelText:'Service Category',border:OutlineInputBorder()),
        items:services.map((s)=>DropdownMenuItem(value:s['name'],child:Text(s['name']!))).toList(),
        onChanged:(v)=>setState(()=>selected=v!)),
      const SizedBox(height:12),
      TextField(controller:description,maxLines:4,decoration:const InputDecoration(labelText:'Describe the required work',border:OutlineInputBorder())),
      const SizedBox(height:12),
      TextField(controller:name,decoration:const InputDecoration(labelText:'Customer name',border:OutlineInputBorder())),
      const SizedBox(height:12),
      TextField(controller:phone,keyboardType:TextInputType.phone,decoration:const InputDecoration(labelText:'Phone number',border:OutlineInputBorder())),
      const SizedBox(height:12),
      TextField(controller:address,maxLines:2,decoration:const InputDecoration(labelText:'Address / location',border:OutlineInputBorder())),
      const SizedBox(height:18),
      FilledButton(onPressed:(){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('UI demo: connect API to save request securely.')));
      },child:const Text('Submit Request')),
    ]),
  );
}

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key});
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:const Text('Vendor Registration & Login'),backgroundColor:brandBlue,foregroundColor:Colors.white),
    body:ListView(padding:const EdgeInsets.all(16),children:[
      const Text('Vendor Access',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:brandBlue)),
      const SizedBox(height:8),const Text('Registration and authentication connect to the secure API after provider setup.'),
      const SizedBox(height:16),const TextField(decoration:InputDecoration(labelText:'Mobile number',border:OutlineInputBorder())),
      const SizedBox(height:10),FilledButton(onPressed:(){},child:const Text('Send OTP')),
      const SizedBox(height:10),const TextField(decoration:InputDecoration(labelText:'Email',border:OutlineInputBorder())),
      const SizedBox(height:18),const Text('Required Documents',style:TextStyle(fontSize:19,fontWeight:FontWeight.bold)),
      for(final d in ['Iqama','Passport','Education Certificate','Photo'])
        ListTile(leading:const Icon(Icons.upload_file),title:Text(d),trailing:OutlinedButton(onPressed:(){},child:const Text('Upload'))),
      const SizedBox(height:12),const Text('Vendor Terms & Conditions',style:TextStyle(fontWeight:FontWeight.bold,fontSize:18)),
      const Text('Vendors must complete identity and document verification, follow customer privacy rules, pay the lead fee before customer contact details are unlocked, and submit photo evidence for company review when requesting job completion.'),
    ]),
  );
}

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});
  @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('My Requests')),
    body:const Center(child:Text('Sign in to view your live requests.')));
}

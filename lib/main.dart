import 'package:flutter/material.dart';

Map<String, Map<String, String>> accountStorage = {};
String? loggedInEmail;
int ticketCount = 0;
int totalPrice = 0;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

// MainPage Start
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  late List<Widget> _pages;

  int _selectedIndex = 1;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
    _pages = [
      const MyTicketPage(),
      HomePage(pageController: _pageController),
      const AccountPage(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Tiket Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun Saya',
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
    );
  }
}
// MainPage End

// HomePage Start
class HomePage extends StatelessWidget {
  final PageController pageController;
  const HomePage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 60),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  child: const Center(
                    child: Text(
                      'Pantai Marina',
                      style: TextStyle(fontSize: 40, color: Colors.black54),
                    ),
                  ),
                ),
              ),

              // Photos
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhotosPage(),
                        )
                    );
                  },
                  child: Container(
                    width: 380,
                    height: 350,
                    margin: const EdgeInsets.only(bottom: 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        // Full-width Image
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12.0),
                          ),
                          child: Image.asset(
                            'assets/images/senja.jpeg',
                            width: double.infinity,
                            height: 280,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Text
                        const Text(
                          'Mengenal Lebih Dekat',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Action Buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.0),
                        onTap: () {
                          if (loggedInEmail == null) {
                            pageController.animateToPage(
                              2,
                              duration: const Duration(microseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReservePage(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 180,
                          height: 120,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3)
                              )
                            ],
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.airplane_ticket, size: 50, color: Colors.black54),
                              SizedBox(height: 4),
                              Text(
                                'Beli Tiket',
                                style: TextStyle(fontSize: 20, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.0),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReviewPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          height: 120,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.chat, size: 50, color: Colors.black54),
                              SizedBox(height: 4),
                              Text(
                                'Apa Kata Orang?',
                                style: TextStyle(fontSize: 20, color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// HomePage End

// MyTicketPage Start
class MyTicketPage extends StatelessWidget {
  const MyTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Saya'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail Tiket Anda',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Jumlah Tiket: $ticketCount',
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Total Harga: Rp$totalPrice',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ticketCount > 0
                  ? ListView.builder(
                itemCount: ticketCount,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tiket ${index + 1}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Detail di sini',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : const Center(
                child: Text(
                  'Belum ada tiket.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// MyTicketPage End

// AccountPage Start
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // If Not Logged In
    if (loggedInEmail == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Kamu Belum Login',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: screenWidth * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ).then((_) => setState(() {}));
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 24),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Masuk'),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: screenWidth * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 24),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Buat Akun'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // If Logged In
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 50),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${accountStorage[loggedInEmail!]?['name']}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$loggedInEmail',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Ubah Password
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fitur Ubah Password belum tersedia')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: const Text('Ubah Password'),
            ),

            const SizedBox(height: 16),

            // Logout
            ElevatedButton(
              onPressed: () {
                setState(() {
                  loggedInEmail = null;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                backgroundColor: Colors.red,
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

// LoginPage Start
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (accountStorage[email]?['password'] == password) {
      setState(() {
        loggedInEmail = email;
      });
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email atau password salah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
// LoginPage End

// RegisterPage Start
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final name = _nameController.text;

      if (accountStorage.containsKey(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email sudah terdaftar!')),
        );
      } else {
        accountStorage[email] = {
          'name': name,
          'password': password,
        };
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registrasi berhasil!')),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) => value!.isEmpty ? 'Nama tidak boleh kosong!' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? 'Email tidak boleh kosong!' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Password tidak boleh kosong!' : null,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Konfirmasi Password'),
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Password tidak sama!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _register, child: const Text('Daftar')),
            ],
          ),
        ),
      ),
    );
  }
}
// RegisterPage End
// AccountPage End

// PhotosPage Start
class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  Widget _buildCard(String imagePath, String imageName) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              imageName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mengenal Lebih Dekat'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCard('assets/images/laut.jpeg', 'Pinggiran Laut 1'),
          const SizedBox(height: 16),
          _buildCard('assets/images/laut2.jpeg', 'Pinggiran Laut 2'),
          const SizedBox(height: 16),
          _buildCard('assets/images/perahu.jpeg', 'Sewa Perahu'),
          const SizedBox(height: 16),
          _buildCard('assets/images/spotFoto.jpeg', 'Spot Foto'),
          const SizedBox(height: 16),
          _buildCard('assets/images/spotMancing.jpeg', 'Spot Mancing'),
          const SizedBox(height: 16),
          _buildCard('assets/images/tempatAnak.jpeg', 'Tempat Bermain Anak'),
          const SizedBox(height: 16),
          _buildCard('assets/images/kandangRusa.jpeg', 'Kandang Rusa'),
          const SizedBox(height: 16),
          _buildCard('assets/images/pedagangKakiLima.jpeg', 'Spot Pedagang Kaki Lima'),
          const SizedBox(height: 16),
          _buildCard('assets/images/mushola.jpeg', 'Mushola'),
          const SizedBox(height: 16),
          _buildCard('assets/images/toiletTempatBilas.jpeg', 'Toilet dan Tempat Bilas'),
        ],
      ),
    );
  }
}
// PhotosPage End

// ReservePage Start
class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  final int _ticketPrice = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Tiket'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Tiket Masuk',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp$_ticketPrice',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: ticketCount > 0 ? () {
                              setState(() {
                                ticketCount--;
                                totalPrice = ticketCount * _ticketPrice;
                              });
                            } : null,
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            ticketCount.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                ticketCount++;
                                totalPrice = ticketCount * _ticketPrice;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        'Rp$totalPrice',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentPage()
                        ),
                      );
                    },
                    child: const Text('Bayar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ReservePage End

// PaymentPage Start
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedPaymentMethod;

  final List<Map<String, dynamic>> _paymentMethods = [
    {"name": "Gopay", "logo": Icons.payment},
    {"name": "Shopeepay", "logo": Icons.shopping_bag},
    {"name": "Dana", "logo": Icons.wallet},
    {"name": "OVO", "logo": Icons.phone_android},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Metode Pembayaran"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _paymentMethods.length,
              itemBuilder: (context, index) {
                final method = _paymentMethods[index];
                return RadioListTile<String>(
                  value: method["name"],
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                  title: Text(method["name"]),
                  secondary: Icon(method["logo"], size: 40),
                );
              },
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      'Rp$totalPrice',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: _selectedPaymentMethod != null ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReceiptPage(),
                      ),
                    );
                  } : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 12.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Bayar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// PaymentPage End

// ReceiptPage Start
class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran Berhasil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Pembelian Berhasil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tiket Masuk',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'x $ticketCount',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rp$totalPrice',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 12.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Kembali ke Beranda',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ReceiptPage End

// ReviewPage Start
class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Review 1
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Content
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name
                          Text(
                            'Nama 1',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          // Rating
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star_border, color: Colors.grey, size: 18),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Review Text
                          Text(
                            'Ini adalah placeholder untuk review singkat. Deskripsi dapat ditambahkan di sini.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Review 2
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Content
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name
                          Text(
                            'Nama 2',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          // Rating
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Review Text
                          Text(
                            'Review kedua ini memberikan gambaran yang lebih mendetail tentang pengalaman pengguna.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Review 3
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Content
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name
                          Text(
                            'Nama 3',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          // Rating
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star_border, color: Colors.grey, size: 18),
                              Icon(Icons.star_border, color: Colors.grey, size: 18),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Review Text
                          Text(
                            'Review ketiga adalah contoh dengan rating yang lebih rendah.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Review 4
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Content
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name
                          Text(
                            'Nama 4',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          // Rating
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star_border, color: Colors.grey, size: 18),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Review Text
                          Text(
                            'Review terakhir memberikan kesimpulan dari pengalaman pengguna.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ReviewPage End

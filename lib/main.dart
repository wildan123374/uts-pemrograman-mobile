import 'package:flutter/material.dart';

void main() {
  runApp(MyHerbalShop());
}

class MyHerbalShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Herbal Shop",
      home: HomeScreen(),
    );
  }
}

// ========================= HOME SCREEN ==============================

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      "name": "Teh Herbal",
      "icon": Icons.local_cafe,
      "color": Colors.green,
    },
    {
      "name": "Madu & Royal Jelly",
      "icon": Icons.energy_savings_leaf,
      "color": Colors.amber,
    },
    {
      "name": "Jamu Tradisional",
      "icon": Icons.local_florist,
      "color": Colors.brown,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text("Herbal Shop"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Kategori Herbal",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          // Row 3 kategori
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: categories.map((cat) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductListScreen(category: cat["name"]),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Container(
                    width: 110,
                    height: 130,
                    decoration: BoxDecoration(
                      color: cat["color"].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(cat["icon"], size: 45, color: cat["color"]),
                        SizedBox(height: 10),
                        Text(
                          cat["name"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

// ========================= DATA PRODUK (HERBAL) ==============================

Map<String, List<Map<String, dynamic>>> productData = {
  "Teh Herbal": [
    {"name": "Teh Jahe Merah", "price": 15000, "icon": Icons.local_cafe},
    {"name": "Teh Rosella", "price": 18000, "icon": Icons.local_cafe},
    {"name": "Teh Kunyit Asam", "price": 20000, "icon": Icons.local_cafe},
    {"name": "Teh Daun Sirsak", "price": 22000, "icon": Icons.local_cafe},
    {"name": "Teh Daun Mint", "price": 17000, "icon": Icons.local_cafe},
    {"name": "Teh Bunga Telang", "price": 25000, "icon": Icons.local_cafe},
  ],

  "Madu & Royal Jelly": [
    {"name": "Madu Murni Hutan", "price": 45000, "icon": Icons.energy_savings_leaf},
    {"name": "Royal Jelly Premium", "price": 65000, "icon": Icons.energy_savings_leaf},
    {"name": "Madu Randu", "price": 40000, "icon": Icons.energy_savings_leaf},
    {"name": "Madu Kelulut", "price": 75000, "icon": Icons.energy_savings_leaf},
    {"name": "Madu Baduy", "price": 55000, "icon": Icons.energy_savings_leaf},
    {"name": "Madu Kurma Mix", "price": 60000, "icon": Icons.energy_savings_leaf},
  ],

  "Jamu Tradisional": [
    {"name": "Jamu Kunyit Asam", "price": 12000, "icon": Icons.local_florist},
    {"name": "Jamu Beras Kencur", "price": 12000, "icon": Icons.local_florist},
    {"name": "Jamu Pegagan", "price": 15000, "icon": Icons.local_florist},
    {"name": "Jamu Brotowali", "price": 17000, "icon": Icons.local_florist},
    {"name": "Jamu Temulawak", "price": 13000, "icon": Icons.local_florist},
    {"name": "Jamu Sirih", "price": 14000, "icon": Icons.local_florist},
  ],
};

// ========================= PRODUCT LIST SCREEN ==============================

class ProductListScreen extends StatelessWidget {
  final String category;

  ProductListScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final products = productData[category]!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text(category),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Daftar Produk $category",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3 / 4,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: item),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item["icon"],
                          size: 60,
                          color: Colors.green.shade700,
                        ),
                        SizedBox(height: 10),
                        Text(
                          item["name"],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Rp ${item['price']}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// ========================= PRODUCT DETAIL SCREEN ==============================

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text(product["name"]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(product["icon"], size: 100, color: Colors.green.shade700),
            SizedBox(height: 20),
            Text(
              product["name"],
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Harga: Rp ${product["price"]}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

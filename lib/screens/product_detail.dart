import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopious_mobile/models/add_item.dart';
import 'package:shopious_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ItemDetailPage extends StatefulWidget {
  final String itemID; // ID item yang diterima untuk fetch data
  const ItemDetailPage({super.key, required this.itemID});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  Future<AddItem> fetchItemDetail(CookieRequest request) async {
    // Mengambil data detail item berdasarkan ID
    final response =
        await request.get('http://127.0.0.1:8000/json/${widget.itemID}/');

    // Parse response menjadi objek AddItem
    var data = response;
    var item = AddItem.fromJson(data[0]);
    return item;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchItemDetail(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error loading item details.',
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'Item not found.',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            );
          } else {
            final item = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar produk
                        if (item.fields.photoUrl.isNotEmpty)
                          Center(
                            child: Image.network(
                              item.fields.photoUrl,
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 100),
                            ),
                          )
                        else
                          Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 100,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        const SizedBox(height: 16),

                        // Nama produk
                        Text(
                          item.fields.name,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Harga
                        Text(
                          "Harga: Rp${item.fields.price}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Deskripsi
                        Text(
                          "Deskripsi:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(item.fields.description),
                        const SizedBox(height: 20),

                        // Tombol kembali
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Kembali'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

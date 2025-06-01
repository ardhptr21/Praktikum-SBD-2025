// 1.

db.produk.insertMany([
  {
    nama_produk: "Indomie Goreng Spesial",
    kategori: "Makanan Instan",
    harga_beli: 2500,
    harga_jual: 3000,
    stok: 100,
    satuan: "pcs",
    tanggal_masuk: ISODate("2025-05-01"),
  },
  {
    nama_produk: "Sabun Mandi Lifebuoy Total 10",
    kategori: "Perawatan Diri",
    harga_beli: 3000,
    harga_jual: 4000,
    stok: 75,
    satuan: "pcs",
    tanggal_masuk: ISODate("2025-05-01"),
  },
  {
    nama_produk: "Kopi Kapal Api Special Mix",
    kategori: "Minuman",
    harga_beli: 1000,
    harga_jual: 1500,
    stok: 200,
    satuan: "sachet",
    tanggal_masuk: ISODate("2025-04-20"),
  },
  {
    nama_produk: "Beras Rojolele Super",
    kategori: "Bahan Pokok",
    harga_beli: 60000,
    harga_jual: 65000,
    stok: 30,
    satuan: "karung 5kg",
    tanggal_masuk: ISODate("2025-05-10"),
  },
  {
    nama_produk: "Susu UHT Cokelat 250ml",
    kategori: "Minuman",
    harga_beli: 4500,
    harga_jual: 5500,
    stok: 8,
    satuan: "kotak",
    tanggal_masuk: ISODate("2025-05-15"),
  },
  {
    nama_produk: "Deterjen Bubuk Attack",
    kategori: "Perlengkapan Rumah",
    harga_beli: 15000,
    harga_jual: 17500,
    stok: 40,
    satuan: "pack 800gr",
    tanggal_masuk: ISODate("2025-04-25"),
  },
  {
    nama_produk: "Permen X",
    kategori: "Camilan",
    harga_beli: 500,
    harga_jual: 1000,
    stok: 3,
    satuan: "pcs",
    tanggal_masuk: ISODate("2025-03-01"),
  },
]);

db.pelanggan.insertMany([
  {
    nama_pelanggan: "Siti Aminah",
    nomor_telepon: "081234567890",
    alamat: "Jl. Merpati No. 1, Surabaya",
    poin_loyalitas: 50,
    tanggal_bergabung: ISODate("2023-11-15"),
  },
  {
    nama_pelanggan: "Budi Hartono",
    nomor_telepon: "087654321098",
    alamat: "Jl. Elang No. 22, Surabaya",
    poin_loyalitas: 120,
    tanggal_bergabung: ISODate("2024-01-20"),
  },
  {
    nama_pelanggan: "Retno Wulandari",
    nomor_telepon: "085550001111",
    alamat: "Jl. Kenari Indah Blok C3, Sidoarjo",
    poin_loyalitas: 75,
    tanggal_bergabung: ISODate("2024-03-01"),
  },
]);

db.transaksi.insertMany([
  {
    nama_pelanggan: "Siti Aminah",
    tanggal_transaksi: ISODate("2025-05-20T17:00:00"),
    nama_produk: "Indomie Goreng Spesial",
    harga: 3000,
    jumlah: 5,
    total: 30000,
    metode_pembayaran: "Tunai",
    status: "Selesai",
  },
  {
    nama_pelanggan: "Siti Aminah",
    tanggal_transaksi: ISODate("2025-05-20T17:00:00"),
    nama_produk: "Kopi Kapal Api Special Mix",
    harga: 1500,
    jumlah: 10,
    total: 30000,
    metode_pembayaran: "Tunai",
    status: "Selesai",
  },
  {
    nama_pelanggan: "Budi Hartono",
    tanggal_transaksi: ISODate("2025-05-21T21:30:00"),
    nama_produk: "Beras Rojolele Super",
    harga: 65000,
    jumlah: 1,
    total: 73000,
    metode_pembayaran: "QRIS",
    status: "Selesai",
  },
  {
    nama_pelanggan: "Budi Hartono",
    tanggal_transaksi: ISODate("2025-05-21T21:30:00"),
    nama_produk: "Sabun Mandi Lifebuoy Total 10",
    harga: 4000,
    jumlah: 2,
    total: 73000,
    metode_pembayaran: "QRIS",
    status: "Selesai",
  },
  {
    nama_pelanggan: "Siti Aminah",
    tanggal_transaksi: ISODate("2025-05-22T16:15:00"),
    nama_produk: "Susu UHT Cokelat 250ml",
    harga: 5500,
    jumlah: 4,
    total: 22000,
    metode_pembayaran: "Debit",
    status: "Selesai",
  },
  {
    nama_pelanggan: null,
    tanggal_transaksi: ISODate("2025-05-22T18:00:00"),
    nama_produk: "Indomie Goreng Spesial",
    harga: 3000,
    jumlah: 2,
    total: 6000,
    metode_pembayaran: "Tunai",
    status: "Selesai",
  },
  {
    nama_pelanggan: "Retno Wulandari",
    tanggal_transaksi: ISODate("2022-12-01T23:45:00"),
    nama_produk: "Permen X",
    harga: 1000,
    jumlah: 10,
    total: 10000,
    metode_pembayaran: "Tunai",
    status: "Selesai",
  },
]);

// 2
db.produk.find({ kategori: "Minuman", stok: { $lt: 10 } });

// 3
db.pelanggan.findOne({ nama_pelanggan: "Siti Aminah" });

// 4
db.transaksi.find(
  {
    tanggal_transaksi: {
      $gte: ISODate("2025-05-22"),
      $lt: ISODate("2025-05-23"),
    },
  },
  {
    _id: 0,
    tanggal_transaksi: 1,
    total: 1,
    metode_pembayaran: 1,
  }
);

// 5
db.produk.distinct("kategori");

// 6
db.pelanggan.countDocuments();

// 7
db.produk.updateOne(
  { nama_produk: "Indomie Goreng Spesial" },
  {
    $inc: { stok: 50 },
    $set: { harga_beli: 2800 },
  }
);

// 8
db.pelanggan.updateMany(
  {
    tanggal_bergabung: { $lt: ISODate("2024-01-01") },
  },
  {
    $inc: { poin_loyalitas: 10 },
  }
);

// 9
db.pelanggan.updateOne(
  {
    nama_pelanggan: "Budi Hartono",
  },
  {
    $set: { alamat: "Jl. Cendrawasih No. 5, Gresik" },
  }
);

// 10
db.produk.deleteOne({ nama_produk: "Permen X" });

// 11
db.transaksi.deleteMany({
  metode_pembayaran: "Tunai",
  tanggal_transaksi: { $lt: ISODate("2023-01-01") },
});

// 12
db.transaksi.aggregate([
  {
    $group: {
      _id: "$metode_pembayaran",
      total_pendapatan: { $sum: "$total" },
    },
  },
  {
    $sort: { total_pendapatan: -1 },
  },
  {
    $project: {
      _id: 0,
      metode_pembayaran: "$_id",
      total_pendapatan: 1,
    },
  },
]);

// 13
db.transaksi.aggregate([
  {
    $group: {
      _id: "$nama_pelanggan",
      jumlah_kunjungan: { $sum: 1 },
    },
  },
  {
    $sort: { jumlah_kunjungan: -1 },
  },
  {
    $limit: 3,
  },
  {
    $project: {
      _id: 0,
      nama_pelanggan: "$_id",
      jumlah_kunjungan: 1,
    },
  },
]);

// 14
db.produk
  .find(
    { stok: { $lt: 5 } },
    {
      _id: 0,
      nama_produk: 1,
      kategori: 1,
      stok: 1,
    }
  )
  .sort({ stok: 1 });

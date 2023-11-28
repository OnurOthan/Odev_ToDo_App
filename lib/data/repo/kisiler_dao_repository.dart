class KisilerDaoRepository {
  Future<void> kaydet(String kisi_ad,String kisi_tel) async {
    print("Kişi Kaydet : $kisi_ad - $kisi_tel");
  }

  Future<void> guncelle (int kisi_id,String kisi_ad,String kisi_tel) async {
    print("Kişi Güncelle : $kisi_id - $kisi_ad - $kisi_tel");
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var db = await VeritabaniYardimcisi.veritabanıErisim();
    List<Map<String,dynamic>> satirlar = wait db.rawQuery("SELECT * FROM kisiler");

    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var kisi_id = satir["kisi_id"];
      var kisi_ad = satir["kisi_ad"];
      var kisi_tel = satir["kisi_tel"];

      return Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel);

    });
  }


}
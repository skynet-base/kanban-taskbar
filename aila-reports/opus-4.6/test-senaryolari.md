# Aila MVP — Test Senaryoları & Çözüm Metrikleri Analizi

> **Tarih:** 2026-02-08 | **Versiyon:** 1.0 | **Platform:** iOS (React Native + Supabase)

---

## İçindekiler
1. [Fonksiyonel Test Senaryoları](#1-fonksiyonel-test-senaryoları)
2. [Entegrasyon Test Senaryoları](#2-entegrasyon-test-senaryoları)
3. [Edge Case / Negatif Senaryolar](#3-edge-case--negatif-senaryolar)
4. [Performans Test Senaryoları](#4-performans-test-senaryoları)
5. [UX/Kullanılabilirlik Test Senaryoları](#5-uxkullanılabilirlik-test-senaryoları)
6. [Başarı Metrikleri ve KPI'lar](#6-başarı-metrikleri-ve-kpılar)
7. [Risk Matrisi ve Çözüm Önerileri](#7-risk-matrisi-ve-çözüm-önerileri)
8. [Test Önceliklendirme (P0/P1/P2)](#8-test-önceliklendirme)

---

## 1. Fonksiyonel Test Senaryoları

### 1.1 KYC Onboarding

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| KYC-001 | İlk açılış onboarding akışı | Yeni kullanıcı uygulamayı ilk kez açtığında KYC akışının başlaması | Uygulama yeni yüklenmiş, hesap yok | 1. Uygulamayı aç 2. Kayıt ol 3. KYC ekranının göründüğünü doğrula | KYC akışı otomatik başlar, adımlar sıralı gösterilir | P0 | Fonksiyonel |
| KYC-002 | Alerji bilgisi girişi | Kullanıcının gıda alerjilerini seçebilmesi | KYC akışı başlamış | 1. Alerji adımına gel 2. "Gluten", "Fıstık" seç 3. İleri'ye bas | Seçimler kaydedilir, profilde görünür | P0 | Fonksiyonel |
| KYC-003 | Tercih seçimi | Yemek, müzik, aktivite tercihlerinin girilmesi | KYC akışı başlamış | 1. Tercih adımına gel 2. Kategorilerden seçim yap 3. İleri'ye bas | Tercihler Supabase'e kaydedilir | P0 | Fonksiyonel |
| KYC-004 | İlgi alanları seçimi | Kullanıcının ilgi alanlarını belirlemesi | KYC akışı başlamış | 1. İlgi alanları adımına gel 2. En az 3 alan seç 3. Tamamla | Profil oluşturulur, ana ekrana yönlendirilir | P0 | Fonksiyonel |
| KYC-005 | KYC'yi atlama | Kullanıcının KYC'yi atlamak istemesi | KYC akışı başlamış | 1. "Sonra tamamla" / "Atla" butonuna bas | Varsayılan profil ile ana ekrana yönlendirilir, hatırlatma planlanır | P1 | Fonksiyonel |
| KYC-006 | KYC güncelleme | Mevcut kullanıcının profil bilgilerini güncellemesi | KYC tamamlanmış | 1. Profil > Tercihlerimi Düzenle 2. Alerji ekle/çıkar 3. Kaydet | Güncel tercihler kaydedilir, öneriler güncellenir | P1 | Fonksiyonel |
| KYC-007 | 6 kullanıcı tipinden birine atanma | KYC sonrası kullanıcının segmente atanması | KYC tamamlanmış | 1. KYC'yi tamamla 2. Profil sayfasında segment etiketini kontrol et | Kullanıcı 6 tipten birine atanır | P0 | Fonksiyonel |

### 1.2 Benim Ailam Feed

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| FEED-001 | Kişiselleştirilmiş feed yükleme | Feed'in kullanıcı tipine göre içerik göstermesi | KYC tamamlanmış, kullanıcı tip atanmış | 1. Benim Ailam sekmesine git 2. İçerikleri incele | Kullanıcı tipine uygun içerikler listelenir | P0 | Fonksiyonel |
| FEED-002 | Feed scroll ve lazy load | Aşağı kaydırıldıkça yeni içerik yüklenmesi | Feed açık | 1. Feed'de aşağı kaydır 2. Listenin sonuna gel | Yeni içerikler yüklenir (infinite scroll / pagination) | P1 | Fonksiyonel |
| FEED-003 | Feed içerik detay | Bir içeriğe tıklanınca detay sayfasına gitmesi | Feed açık, içerik var | 1. Bir karta tıkla 2. Detay sayfasını incele | Detay sayfası açılır, geri dönüş çalışır | P1 | Fonksiyonel |
| FEED-004 | Boş feed durumu | Hiç içerik yoksa uygun mesaj gösterimi | Yeni kullanıcı, henüz içerik üretilmemiş | 1. Feed'e git | "Henüz içerik yok" mesajı veya placeholder gösterilir | P1 | Fonksiyonel |
| FEED-005 | 6 farklı tip için farklı feed | Her kullanıcı tipinin farklı içerik görmesi | 6 test hesabı (her tip 1) | 1. Her hesapla giriş yap 2. Feed içeriklerini karşılaştır | Her tip farklı / önceliklendirilmiş içerik görür | P0 | Fonksiyonel |

### 1.3 AI Asistan (Ana Ekran)

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| AI-001 | Yazılı soru sorma | Kullanıcının metin ile asistana soru sorması | Giriş yapılmış | 1. Ana ekranda mesaj kutusuna yaz 2. Gönder | AI anlamlı yanıt döner, 5sn içinde | P0 | Fonksiyonel |
| AI-002 | Sesli soru sorma | Mikrofon ile sesli komut verme | Giriş yapılmış, mikrofon izni verilmiş | 1. Mikrofon butonuna bas 2. Konuş 3. Bırak | Ses metne çevrilir, AI yanıt verir (sesli + yazılı) | P0 | Fonksiyonel |
| AI-003 | Bağlam analizi — tercih bazlı | AI'ın kullanıcı profilini dikkate alması | KYC tamamlanmış, tercihlerde "vegan" | 1. "Akşam yemeği için yer öner" yaz | Vegan dostu restoran önerileri gelir | P0 | Fonksiyonel |
| AI-004 | Bağlam analizi — alerji bazlı | AI'ın alerji bilgisini dikkate alması | KYC'de "fıstık alerjisi" seçili | 1. "Tatlı öner" yaz | Fıstık içermeyen tatlılar / mekanlar önerilir | P0 | Fonksiyonel |
| AI-005 | Çoklu dönüş konuşması | Aynı oturumda takip soruları sorma | AI ile konuşma başlamış | 1. "Kadıköy'de restoran öner" 2. "Bunlardan hangisi deniz kenarı?" | AI bağlamı korur, doğru filtreler | P0 | Fonksiyonel |
| AI-006 | Sesli yanıt dinleme | AI yanıtının sesli okunması | Sesli mod açık | 1. Soru sor 2. Yanıtı dinle | Yanıt sesli okunur, duraklatılabilir | P1 | Fonksiyonel |
| AI-007 | Kapsam dışı soru | Aila'nın kapsamı dışında soru sorulması | Giriş yapılmış | 1. "Kuantum fiziği anlat" yaz | Nazik yönlendirme: "Bu konuda yardımcı olamıyorum, sosyal yaşam önerileri için buradayım" | P1 | Fonksiyonel |

### 1.4 Akıllı Öneri Sistemi

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| ONERI-001 | Kişiye özel restoran önerisi | Tercih ve alerjiye göre filtrelenmiş öneri | Profil dolu | 1. "Restoran öner" 2. Sonuçları incele | Profil ile uyumlu mekanlar listelenir | P0 | Fonksiyonel |
| ONERI-002 | Konum bazlı öneri | Kullanıcının konumuna yakın öneriler | Konum izni verilmiş | 1. Konum servisi açık 2. Öneri iste | Yakın mesafedeki mekanlar öncelikli | P1 | Fonksiyonel |
| ONERI-003 | Grup önerisi | Birden fazla kişi için ortak öneri | Profil dolu, grup bilgisi girilmiş | 1. "3 kişiyiz, biri vegan, biri gluten hassas" yaz | Her iki kısıtlamayı karşılayan mekanlar önerilir | P0 | Fonksiyonel |
| ONERI-004 | Alternatif isteme | Kullanıcının beğenmeyip alternatif istemesi | Öneri alınmış | 1. "Bunları beğenmedim, başka öner" | Yeni ve farklı öneriler gelir | P1 | Fonksiyonel |

### 1.5 Rezervasyon

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| REZ-001 | Sesli rezervasyon akışı | AI asistan ile sesli rezervasyon yapma | Giriş yapılmış, mikrofon izni var | 1. "Akşam 8'e 4 kişilik rezervasyon yap" de 2. Mekan önerisini onayla 3. Onayla | Rezervasyon oluşturulur, onay mesajı gelir | P0 | Fonksiyonel |
| REZ-002 | Yazılı rezervasyon akışı | Metin ile rezervasyon yapma | Giriş yapılmış | 1. Mekan adı + tarih + kişi sayısı yaz 2. Onayla | Rezervasyon kaydedilir, Yörüngem'de görünür | P0 | Fonksiyonel |
| REZ-003 | Rezervasyon iptal | Mevcut rezervasyonu iptal etme | Aktif rezervasyon var | 1. "Rezervasyonumu iptal et" yaz/söyle 2. Onayla | Rezervasyon iptal edilir, bildirim gönderilir | P0 | Fonksiyonel |
| REZ-004 | Rezervasyon değişikliği | Tarih/saat/kişi sayısı değiştirme | Aktif rezervasyon var | 1. "Rezervasyonumu 9'a al" 2. Onayla | Güncellenir, takvimde yansır | P1 | Fonksiyonel |
| REZ-005 | Alerji uyarısı ile rezervasyon | Fıstık alerjili kullanıcı için mekan seçimi | Profilde alerji var | 1. Rezervasyon iste | AI: "Bu mekanda fıstık içeren menü var, uyarıyorum" şeklinde bilgi verir | P0 | Fonksiyonel |

### 1.6 Ulaşım Bilgisi

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| ULASIM-001 | Toplu taşıma bilgisi | A noktasından B noktasına ulaşım bilgisi | Pilot bölge içinde | 1. "Kadıköy'den Taksim'e nasıl giderim?" | Toplu taşıma seçenekleri listelenir | P1 | Fonksiyonel |
| ULASIM-002 | Tahmini süre bilgisi | Varış süresi tahmini | Pilot bölge içinde | 1. Rota sor | Tahmini süre gösterilir | P1 | Fonksiyonel |
| ULASIM-003 | Pilot bölge dışı sorgu | Desteklenmeyen bölge sorgusu | Pilot bölge dışında | 1. Desteklenmeyen bölge için ulaşım sor | "Bu bölge henüz desteklenmiyor" mesajı | P2 | Fonksiyonel |

### 1.7 Yörüngem Sayfası

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| YOR-001 | Plan listesi görüntüleme | Aktif planların listelenmesi | En az 1 plan/rezervasyon var | 1. Yörüngem sekmesine git | Planlar kronolojik sırada listelenir | P0 | Fonksiyonel |
| YOR-002 | Plan detay görüntüleme | Bir planın detaylarına erişim | Plan var | 1. Bir plana tıkla | Detaylar (mekan, saat, kişi sayısı vb.) gösterilir | P1 | Fonksiyonel |
| YOR-003 | Boş yörüngem durumu | Hiç plan yokken gösterim | Plan yok | 1. Yörüngem'e git | "Henüz planınız yok" + aksiyon butonu | P1 | Fonksiyonel |
| YOR-004 | Plan silme | Mevcut planı kaldırma | Plan var | 1. Planı sil 2. Onayla | Plan listeden kaldırılır, takvimden silinir | P1 | Fonksiyonel |

### 1.8 Takvim Sayfası

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| TAK-001 | Gün bazlı görüntüleme | Seçili günün planlarını görme | Plan/rezervasyon var | 1. Takvim sekmesine git 2. Bir gün seç | O güne ait planlar listelenir | P0 | Fonksiyonel |
| TAK-002 | Ay görünümü navigasyonu | Aylar arası geçiş | Takvim açık | 1. İleri/geri ok ile ay değiştir | Doğru ay gösterilir, planlı günler işaretli | P1 | Fonksiyonel |
| TAK-003 | Planlı gün işaretleme | Planı olan günlerin görsel olarak belirtilmesi | Farklı günlerde planlar var | 1. Takvim'e git | Planlı günler nokta/renk ile işaretli | P1 | Fonksiyonel |
| TAK-004 | Boş gün seçimi | Planı olmayan bir gün seçme | Takvim açık | 1. Plansız güne tıkla | "Bu gün için planınız yok" + "Plan oluştur" butonu | P2 | Fonksiyonel |

---

## 2. Entegrasyon Test Senaryoları

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| ENT-001 | KYC → Feed entegrasyonu | KYC tamamlandığında feed'in kişiselleşmesi | Yeni kullanıcı | 1. KYC'yi tamamla 2. Feed'e git | Feed, seçilen ilgi alanlarına göre kişiselleşmiş | P0 | Entegrasyon |
| ENT-002 | KYC → AI Asistan entegrasyonu | AI'ın KYC bilgilerini kullanması | KYC tamamlanmış | 1. AI'a "Bana uygun mekan öner" yaz | KYC tercihlerine uygun öneriler gelir | P0 | Entegrasyon |
| ENT-003 | AI Asistan → Rezervasyon → Yörüngem | Asistan ile yapılan rezervasyonun Yörüngem'de görünmesi | Giriş yapılmış | 1. AI ile rezervasyon yap 2. Yörüngem'e git | Yeni rezervasyon Yörüngem listesinde var | P0 | Entegrasyon |
| ENT-004 | Rezervasyon → Takvim | Rezervasyonun takvimde görünmesi | Rezervasyon yapılmış | 1. Takvim'e git 2. Rezervasyon tarihini seç | Rezervasyon o günde listelenir | P0 | Entegrasyon |
| ENT-005 | Rezervasyon iptal → Yörüngem + Takvim | İptal sonrası her iki yerde güncellenmesi | Aktif rezervasyon var | 1. Rezervasyonu iptal et 2. Yörüngem kontrol et 3. Takvim kontrol et | Her iki yerden de kaldırılır | P0 | Entegrasyon |
| ENT-006 | AI Asistan → Ulaşım → Yörüngem | Ulaşım bilgisinin plana eklenmesi | Rezervasyon + pilot bölge | 1. "Rezervasyonuma nasıl giderim?" 2. Ulaşım bilgisi al | Rota bilgisi gösterilir, isteğe bağlı plana eklenir | P1 | Entegrasyon |
| ENT-007 | Profil güncelleme → Feed yenilenmesi | Tercih değişikliğinin feed'e yansıması | Profil mevcut | 1. Profilde tercihleri değiştir 2. Feed'e git | Feed yeni tercihlere göre güncellenir | P1 | Entegrasyon |
| ENT-008 | Profil güncelleme → AI bağlam güncelleme | Tercih değişikliğinin AI yanıtlarına yansıması | Profil mevcut | 1. Tercihleri güncelle (vegan → etçil) 2. AI'a "Yemek öner" de | Yeni tercihlere göre öneriler gelir | P1 | Entegrasyon |
| ENT-009 | Supabase oturum yönetimi | Token yenileme ve auth akışı | Giriş yapılmış, token süresi dolmak üzere | 1. Uygulamayı uzun süre açık tut 2. İşlem yap | Token otomatik yenilenir, oturum kesilmez | P0 | Entegrasyon |

---

## 3. Edge Case / Negatif Senaryolar

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| NEG-001 | İnternet bağlantısı kesilmesi | Offline durumda uygulama davranışı | Giriş yapılmış | 1. İnterneti kapat 2. İşlem yap | Uygun hata mesajı, çökme yok | P0 | Edge Case |
| NEG-002 | KYC'de hiçbir şey seçmeden ilerleme | Boş tercihlerle devam etmeye çalışma | KYC başlamış | 1. Hiç seçim yapmadan "İleri" bas | Validasyon uyarısı veya varsayılan atama | P1 | Edge Case |
| NEG-003 | Çok uzun metin girişi | AI asistana 5000+ karakter mesaj gönderme | Giriş yapılmış | 1. Çok uzun metin yaz 2. Gönder | Karakter limiti uyarısı veya düzgün işleme | P2 | Edge Case |
| NEG-004 | Eşzamanlı çoklu rezervasyon | Aynı saat/tarihe 2 rezervasyon yapma | Giriş yapılmış | 1. 20:00'a rezervasyon yap 2. Aynı saate başka rezervasyon yap | Çakışma uyarısı gösterilir | P1 | Edge Case |
| NEG-005 | Geçmiş tarihe rezervasyon | Geçmiş bir tarih için rezervasyon denemesi | Giriş yapılmış | 1. "Dün akşam 8'e rezervasyon yap" | AI: "Geçmiş tarihe rezervasyon yapılamaz" | P1 | Edge Case |
| NEG-006 | Mikrofon izni reddedilmiş | Sesli asistan kullanımı izinsiz | Mikrofon izni reddedilmiş | 1. Mikrofon butonuna bas | İzin isteme diyaloğu veya ayarlara yönlendirme | P0 | Edge Case |
| NEG-007 | Konum izni reddedilmiş | Konum bazlı öneriler izinsiz | Konum izni reddedilmiş | 1. Konum bazlı öneri iste | Manuel konum girişi istenir veya genel öneriler sunulur | P1 | Edge Case |
| NEG-008 | Supabase bağlantı hatası | Backend erişilemiyor | Supabase down | 1. Herhangi bir işlem yap | "Bağlantı hatası, tekrar deneyin" mesajı, çökme yok | P0 | Edge Case |
| NEG-009 | Boş/anlamsız sesli komut | Gürültü veya anlamsız ses girişi | Mikrofon açık | 1. Mikrofonu aç 2. Anlamsız ses çıkar | "Anlayamadım, tekrar eder misiniz?" yanıtı | P1 | Edge Case |
| NEG-010 | Özel karakter / emoji girişi | SQL injection / XSS denemesi | Giriş yapılmış | 1. `<script>alert('x')</script>` yaz | Input sanitize edilir, güvenlik açığı yok | P0 | Edge Case |
| NEG-011 | Birden fazla alerji çakışması | Çelişen alerjiler / tercihler | KYC'de "vegan" + "et sever" seçili | 1. Çelişen tercihler seç 2. Öneri iste | AI çelişkiyi fark eder, netleştirme sorar | P2 | Edge Case |
| NEG-012 | Arka planda uzun süre kalma | Uygulama arka plana alınıp geri dönme | Uygulama arka planda 30+ dk | 1. Uygulamaya geri dön | Oturum korunur veya sessiz yenileme yapılır | P1 | Edge Case |
| NEG-013 | Hızlı art arda buton tıklama | Double-tap / spam tıklama | Herhangi bir ekran | 1. Butona hızlıca 5+ kez bas | Tek işlem gerçekleşir, duplicate oluşmaz | P1 | Edge Case |
| NEG-014 | Farklı dilde soru sorma | İngilizce / Almanca soru | Giriş yapılmış | 1. İngilizce soru yaz | Türkçe veya sorunun dilinde yanıt, çökme yok | P2 | Edge Case |

---

## 4. Performans Test Senaryoları

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| PERF-001 | Uygulama açılış süresi | Cold start performansı | Uygulama kapalı | 1. Uygulamayı aç 2. Süreyi ölç | ≤ 3 saniye içinde ana ekran yüklenir | P0 | Performans |
| PERF-002 | AI yanıt süresi | İlk token'a kadar süre | Giriş yapılmış | 1. Soru sor 2. Süreyi ölç | İlk yanıt ≤ 3sn, tam yanıt ≤ 8sn | P0 | Performans |
| PERF-003 | Feed yükleme süresi | İlk feed içeriklerinin yüklenmesi | Giriş yapılmış | 1. Feed sekmesine git 2. Süreyi ölç | İlk içerikler ≤ 2 saniye | P1 | Performans |
| PERF-004 | Bellek kullanımı | Uzun kullanımda bellek sızıntısı kontrolü | Uygulama açık | 1. 30 dk boyunca kullan 2. Bellek kullanımını izle | Bellek sürekli artmaz, ≤ 200MB | P1 | Performans |
| PERF-005 | Pil tüketimi | 1 saatlik aktif kullanımda pil tüketimi | Tam şarj | 1. 1 saat aktif kullan 2. Pil düşüşünü ölç | ≤ %10 pil tüketimi | P2 | Performans |
| PERF-006 | Eşzamanlı kullanıcı (backend) | Supabase yük testi | Test ortamı | 1. 100 eşzamanlı istek gönder | p95 yanıt süresi ≤ 2sn, hata oranı < %1 | P1 | Performans |
| PERF-007 | Sesli komut işleme süresi | STT + AI + TTS toplam süre | Mikrofon açık | 1. Sesli komut ver 2. Sesli yanıtı ölç | Toplam ≤ 6 saniye | P0 | Performans |

---

## 5. UX/Kullanılabilirlik Test Senaryoları

| ID | Başlık | Açıklama | Ön Koşullar | Adımlar | Beklenen Sonuç | Öncelik | Kategori |
|---|---|---|---|---|---|---|---|
| UX-001 | KYC akış anlaşılırlığı | İlk kullanıcının yardımsız KYC'yi tamamlayabilmesi | Yeni kullanıcı | 1. KYC'ye başla 2. Yardım almadan tamamla | %90+ kullanıcı 2 dk içinde tamamlar | P0 | UX |
| UX-002 | Ana ekran navigasyonu | Tab bar / bottom nav anlaşılırlığı | Giriş yapılmış | 1. Sekmeleri incele 2. Her birine tıkla | Her sekme ne işe yaradığı anlaşılır, ikonlar sezgisel | P0 | UX |
| UX-003 | AI asistan erişilebilirliği | Asistanın kolayca bulunması ve kullanılması | Giriş yapılmış | 1. Ana ekranı aç | Asistan alanı belirgin, mikrofon/metin giriş alanı net | P0 | UX |
| UX-004 | Hata mesajları anlaşılırlığı | Hata durumlarında kullanıcı dostu mesajlar | Hata oluşmuş | 1. Hata tetikle 2. Mesajı oku | Teknik jargon yok, aksiyon önerisi var | P1 | UX |
| UX-005 | Yükleme göstergeleri | Bekleme anlarında spinner/skeleton gösterimi | Veri yükleniyor | 1. Feed'e git 2. Yükleme anını gözlemle | Skeleton veya spinner gösterilir, boş ekran yok | P1 | UX |
| UX-006 | Erişilebilirlik (a11y) | VoiceOver uyumluluğu | VoiceOver açık | 1. VoiceOver ile uygulamayı kullan | Tüm elementler okunur, navigasyon mümkün | P2 | UX |
| UX-007 | Dark Mode desteği | Karanlık mod görünümü | Dark mode açık (iOS) | 1. Dark mode aktifken uygulamayı aç | Tüm ekranlar okunabilir, kontrast yeterli | P2 | UX |
| UX-008 | Küçük ekran uyumu | iPhone SE boyutunda kullanım | iPhone SE cihaz/sim | 1. Her ekranı incele | İçerik kesilmez, butonlar tıklanabilir | P1 | UX |

---

## 6. Başarı Metrikleri ve KPI'lar

### 6.1 Kullanıcı Edinme & Aktivasyon

| Metrik | Hedef (MVP İlk 3 Ay) | Ölçüm Yöntemi |
|---|---|---|
| KYC Tamamlama Oranı | ≥ %75 | (KYC tamamlayan / uygulamayı açan) × 100 |
| Onboarding Süresi | ≤ 2 dakika | Ortalama KYC akış süresi |
| D1 Retention (1. gün geri dönüş) | ≥ %40 | İlk günden sonra geri dönen kullanıcı oranı |
| D7 Retention | ≥ %20 | 7. günde aktif kullanıcı oranı |
| D30 Retention | ≥ %10 | 30. günde aktif kullanıcı oranı |

### 6.2 Etkileşim & Kullanım

| Metrik | Hedef | Ölçüm Yöntemi |
|---|---|---|
| Günlük Aktif Kullanıcı (DAU) | MVP: 500+ | Günlük benzersiz oturum |
| Ortalama Oturum Süresi | ≥ 4 dakika | Session analytics |
| AI Asistana Günlük Soru Sayısı | ≥ 3 soru/kullanıcı | AI interaction count |
| Feed Etkileşim Oranı | ≥ %30 | (Tıklanan içerik / gösterilen içerik) × 100 |
| Sesli Komut Kullanım Oranı | ≥ %20 | Sesli / toplam AI etkileşim |

### 6.3 Core Özellik Başarısı

| Metrik | Hedef | Ölçüm Yöntemi |
|---|---|---|
| Öneri Memnuniyeti (thumbs up/down) | ≥ %70 pozitif | Kullanıcı geri bildirimi |
| Rezervasyon Tamamlama Oranı | ≥ %60 | (Tamamlanan / başlatılan) × 100 |
| Alerji Uyarısı Doğruluk Oranı | %100 | Hatalı öneri sayısı = 0 |
| AI Yanıt Doğruluğu | ≥ %85 | Manuel örnekleme (haftalık 50 yanıt) |
| Ulaşım Bilgisi Doğruluğu | ≥ %80 | Gerçek verilerle karşılaştırma |

### 6.4 Teknik KPI'lar

| Metrik | Hedef | Ölçüm Yöntemi |
|---|---|---|
| Çökme Oranı (Crash Rate) | < %1 | Crashlytics / Sentry |
| API Hata Oranı | < %2 | Backend monitoring |
| Ortalama API Yanıt Süresi | ≤ 500ms | p50 latency |
| Uygulama Boyutu | ≤ 80MB | App Store bilgisi |
| App Store Puanı | ≥ 4.0 | App Store rating |

---

## 7. Risk Matrisi ve Çözüm Önerileri

| Risk ID | Risk | Olasılık | Etki | Seviye | Çözüm Önerisi |
|---|---|---|---|---|---|
| R-001 | AI halüsinasyonu — yanlış mekan/bilgi önerme | Yüksek | Yüksek | 🔴 Kritik | RAG ile doğrulanmış veri tabanı kullan; güven skoru düşükse "emin değilim" uyarısı ekle |
| R-002 | Alerji uyarısında hata — sağlık riski | Orta | Çok Yüksek | 🔴 Kritik | Alerji filtrelemeyi rule-based yap (AI'a bırakma); her öneri öncesi zorunlu kontrol; sorumluluk reddi beyanı |
| R-003 | Supabase down / rate limit | Düşük | Yüksek | 🟡 Orta | Retry mekanizması, offline cache, kullanıcıya bilgilendirme |
| R-004 | Sesli komut yanlış algılama (STT hatası) | Yüksek | Orta | 🟡 Orta | Onay adımı ekle ("X'i mi demek istediniz?"); düzeltme imkanı sun |
| R-005 | Modül entegrasyon hataları | Yüksek | Yüksek | 🔴 Kritik | Her modülü entegrasyon öncesi contract test ile doğrula; CI/CD pipeline |
| R-006 | Kişisel veri sızıntısı (KVKK) | Düşük | Çok Yüksek | 🔴 Kritik | Verileri şifrele; KVKK uyum danışmanı; aydınlatma metni; data minimization |
| R-007 | Düşük retention — kullanıcı geri dönmüyor | Orta | Yüksek | 🟡 Orta | Push notification stratejisi; günlük öneri; gamification elementleri |
| R-008 | Pilot bölge dışı ulaşım sorguları | Yüksek | Düşük | 🟢 Düşük | Net "desteklenmiyor" mesajı; bekleme listesi; genişleme planı |
| R-009 | iOS izin yönetimi (mikrofon/konum) | Orta | Orta | 🟡 Orta | İzin öncesi açıklama ekranı; reddedilirse graceful degradation |
| R-010 | API maliyet patlaması (AI çağrıları) | Orta | Yüksek | 🟡 Orta | Rate limiting per user; yanıt caching; model tier optimizasyonu |

---

## 8. Test Önceliklendirme

### P0 — Lansmanı Engelleyen (Mutlaka Geçmeli)

| Alan | Test ID'leri | Açıklama |
|---|---|---|
| KYC | KYC-001, KYC-002, KYC-003, KYC-004, KYC-007 | Onboarding akışı çalışmazsa kullanıcı uygulamayı kullanamaz |
| AI Asistan | AI-001, AI-002, AI-003, AI-004, AI-005 | Core value proposition |
| Öneri | ONERI-001, ONERI-003 | Doğru öneri = ürünün varlık sebebi |
| Rezervasyon | REZ-001, REZ-002, REZ-003, REZ-005 | Para/güven kaybı riski |
| Feed | FEED-001, FEED-005 | Kişiselleştirme temel özellik |
| Yörüngem | YOR-001 | Plan takibi core akış |
| Takvim | TAK-001 | Gün bazlı görüntüleme core akış |
| Entegrasyon | ENT-001 → ENT-005, ENT-009 | Modüller arası veri akışı |
| Edge Case | NEG-001, NEG-006, NEG-008, NEG-010 | Güvenlik ve stabilite |
| Performans | PERF-001, PERF-002, PERF-007 | Kullanıcı deneyimi eşik değerleri |
| UX | UX-001, UX-002, UX-003 | İlk izlenim |

### P1 — Lansman Sonrası İlk Hafta

| Alan | Test ID'leri |
|---|---|
| KYC | KYC-005, KYC-006 |
| Feed | FEED-002, FEED-003, FEED-004 |
| AI | AI-006, AI-007 |
| Öneri | ONERI-002, ONERI-004 |
| Rezervasyon | REZ-004 |
| Ulaşım | ULASIM-001, ULASIM-002 |
| Yörüngem | YOR-002, YOR-003, YOR-004 |
| Takvim | TAK-002, TAK-003 |
| Entegrasyon | ENT-006, ENT-007, ENT-008 |
| Edge Case | NEG-002, NEG-004, NEG-005, NEG-007, NEG-009, NEG-012, NEG-013 |
| Performans | PERF-003, PERF-004, PERF-006 |
| UX | UX-004, UX-005, UX-008 |

### P2 — İlk Ay İçinde

| Alan | Test ID'leri |
|---|---|
| Ulaşım | ULASIM-003 |
| Takvim | TAK-004 |
| Edge Case | NEG-003, NEG-011, NEG-014 |
| Performans | PERF-005 |
| UX | UX-006, UX-007 |

---

## Özet Dashboard

| Kategori | Toplam Senaryo | P0 | P1 | P2 |
|---|---|---|---|---|
| Fonksiyonel | 35 | 20 | 12 | 3 |
| Entegrasyon | 9 | 6 | 3 | 0 |
| Edge Case | 14 | 4 | 7 | 3 |
| Performans | 7 | 3 | 3 | 1 |
| UX | 8 | 3 | 3 | 2 |
| **TOPLAM** | **73** | **36** | **28** | **9** |

> **Tavsiye:** MVP lansmanı öncesi **36 P0 senaryonun tamamı** geçmelidir. P1 senaryolardan **kritik** olanlar (özellikle NEG-004, NEG-005) de lansman öncesi tamamlanmalıdır. Alerji ile ilgili tüm senaryolar (REZ-005, ONERI-003, R-002) **sıfır hata toleransı** ile test edilmelidir.

---

*Hazırlayan: Aila Test & QA Analizi | Tarih: 2026-02-08 | Versiyon: 1.0*

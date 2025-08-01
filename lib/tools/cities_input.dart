class Cities {
  static const List<String> cities = [
    "Adana",
    "Adıyaman",
    "Afyonkarahisar",
    "Ağrı",
    "Aksaray",
    "Amasya",
    "Ankara",
    "Antalya",
    "Ardahan",
    "Artvin",
    "Aydın",
    "Balıkesir",
    "Bartın",
    "Batman",
    "Bayburt",
    "Bilecik",
    "Bingöl",
    "Bitlis",
    "Bolu",
    "Burdur",
    "Bursa",
    "Çanakkale",
    "Çankırı",
    "Çorum",
    "Denizli",
    "Diyarbakır",
    "Düzce",
    "Edirne",
    "Elazığ",
    "Erzincan",
    "Erzurum",
    "Eskişehir",
    "Gaziantep",
    "Giresun",
    "Gümüşhane",
    "Hakkâri",
    "Hatay",
    "Iğdır",
    "Isparta",
    "İstanbul",
    "İzmir",
    "Kahramanmaraş",
    "Karabük",
    "Karaman",
    "Kars",
    "Kastamonu",
    "Kayseri",
    "Kırıkkale",
    "Kırklareli",
    "Kırşehir",
    "Kilis",
    "Kocaeli",
    "Konya",
    "Kütahya",
    "Malatya",
    "Manisa",
    "Mardin",
    "Mersin",
    "Muğla",
    "Muş",
    "Nevşehir",
    "Niğde",
    "Ordu",
    "Osmaniye",
    "Rize",
    "Sakarya",
    "Samsun",
    "Şanlıurfa",
    "Siirt",
    "Sinop",
    "Şırnak",
    "Sivas",
    "Tekirdağ",
    "Tokat",
    "Trabzon",
    "Tunceli",
    "Uşak",
    "Van",
    "Yalova",
    "Yozgat",
    "Zonguldak"
  ];

  static const district ={
    "Adana": ["Aladağ","Ceyhan","Feke","İmamoğlu","Karaisalı","Karataş","Kozan","Pozantı","Saimbeyli","Sarıçam","Seyhan","Tufanbeyli","Yumurtalık","Yüreğir"],
    "Adıyaman": ["Besni","Çelikhan","Gerger","Gölbaşı","Kahta","Merkez","Samsat","Sincik","Tut"],
    "Afyonkarahisar": ["Başmakçı","Bayat","Bolvadin","Çay","Çobanlar","Dazkırı","Dinar","Emirdağ","Evciler","Hocalar","İhsaniye","İscehisar","Kızılören","Merkez","Sandıklı","Sinanpaşa","Sultandağı","Şuhut"],
    "Ağrı": ["Diyadin","Doğubayazıt","Eleşkirt","Hamur","Merkez","Patnos","Taşlıçay","Tutak"],
    "Aksaray": ["Ağaçören","Eskil","Gülağaç","Güzelyurt","Merkez","Ortaköy","Sarıyahşi"],
    "Amasya": ["Göynücek","Gümüşhacıköy","Hamamözü","Merkez","Merzifon","Suluova","Taşova"],
    "Ankara": ["Altındağ","Ayaş","Bala","Beypazarı","Çamlıdere","Çankaya","Çubuk","Elmadağ","Etimesgut","Evren","Gölbaşı","Güdül","Haymana","Kalecik","Kahramankazan","Keçiören","Kızılcahamam","Mamak","Nallıhan","Polatlı","Pursaklar","Sincan","Şereflikoçhisar","Yenimahalle"],
    "Antalya": ["Akseki","Aksu","Alanya","Demre","Döşemealtı","Elmalı","Finike","Gazipaşa","Gündoğmuş","İbradı","Kaş","Kemer","Konyaaltı","Korkuteli","Kumluca","Manavgat","Muratpaşa","Serik"],
    "Ardahan": ["Çıldır","Damal","Göle","Merkez","Posof"],
    "Artvin": ["Arhavi","Borçka","Hopa","Kemalpaşa","Murgul","Merkez","Şavşat","Yusufeli"],
    "Aydın": ["Bozdoğan","Çine","Didim","Efeler","Germencik","İncirliova","Karacasu","Karpuzlu","Koçarlı","Köşk","Kuşadası","Kuyucak","Nazilli","Söke","Söke","Sultanhisar","Yenipazar"],
    "Balıkesir": ["Altıeylül","Ayvalık","Balya","Bandırma","Bigadiç","Burhaniye","Dursunbey","Edremit","Erdek","Gönen","Güney","Havran","İvrindi","Karesi","Kepsut","Manyas","Marmara","Savaştepe","Sındırgı","Susurluk"],
    "Bilecik": ["Bozüyük","Gölpazarı","İnhisar","Merkez","Osmaneli","Pazaryeri","Söğüt","Yenipazar"],
    "Bingöl": ["Adaklı","Genç","Karlıova","Kiğı","Merkez","Solhan","Yayladere","Yedisu"],
    "Bitlis": ["Adilcevaz","Ahlat","Güroymak","Hizan","Merkez","Tatvan","Mutki"],
    "Bolu": ["Dörtdivan","Gerede","Göynük","Kıbrıscık","Mengen","Merkez","Mudurnu","Seben","Yeniçağa"],
    "Burdur": ["Ağlasun","Bucak","Çavdır","Çeltikçi","Gölhisar","Karamanlı","Kemer","Merkez","Tefenni","Yeşilova"],
    "Bursa": ["Gemlik","Gürsu","Harmancık","İnegöl","İznik","Karacabey","Keles","Mudanya","Nilüfer","Orhaneli","Orhangazi","Osmangazi","Yenişehir","Yıldırım"],
    "Çanakkale": ["Ayvacık","Bayramiç","Biga","Bozcaada","Çan","Çanakkale Merkez","Eceabat","Ezine","Gelibolu","Gökçeada","Lapseki","Yenice"],
    "Çankırı": ["Atkaracalar","Bayramören","Çankırı Merkez","Çerkeş","Eldivan","Ilgaz","Kızılırmak","Korgun","Kurşunlu","Orta","Şabanözü","Yapraklı"],
    "Çorum": ["Alaca","Bayat","Boğazkale","Çorum Merkez","İskilip","Kargı","Mecitözü","Oğuzlar","Ortaköy","Osmancık","Sungurlu","Uğurludağ"],
    "Denizli": ["Acıpayam","Babadağ","Baklan","Bekilli","Buldan","Çal","Çameli","Çardak","Çivril","Honaz","Kale","Merkezefendi","Pamukkale","Sarayköy","Tavas"],
    "Diyarbakır": ["Bağlar","Bismil","Çermik","Çınar","Çüngüş","Dicle","Eğil","Ergani","Hani","Hazro","Kayapınar","Kocaköy","Kulp","Lice","Silvan","Sur","Yenişehir"],
    "Düzce": ["Akçakoca","Cumayeri","Çilimli","Düzce Merkez","Gölyaka","Gümüşova","Kaynaşlı","Yığılca"],
    "Edirne": ["Edirne Merkez","Enez","Havsa","İpsala","Keşan","Lalapaşa","Meriç","Süloğlu"],
    "Elazığ": ["Ağın","Alacakaya","Arıcak","Baskil","Karakoçan","Keban","Kovancılar","Maden","Merkez","Palu","Sivrice"],
    "Erzincan": ["Çayırlı","İliç","Kemah","Kemaliye","Merkez","Otlukbeli","Refahiye","Tercan","Üzümlü"],
    "Erzurum": ["Aşkale","Çat","Hınıs","Horasan","İspir","Karaçoban","Karayazı","Köprüköy","Narman","Oltu","Olur","Pazaryolu","Şenkaya","Tekman","Tortum","Uzundere","Erzurum Merkez"],
    "Eskişehir": ["Alpu","Beylikova","Çifteler","Günyüzü","Han","İnönü","Mahmudiye","Mihalgazi","Mihalıççık","Odunpazarı","Sarıcakaya","Seyitgazi","Sivrihisar","Tepebaşı"],
    "Gaziantep": ["Araban","İslahiye","Karkamış","Nizip","Nurdağı","Oğuzeli","Şahinbey","Şehitkamil","Yavuzeli"],
    "Giresun": ["Alucra","Bulancak","Dereli","Doğankent","Espiye","Eynesil","Giresun Merkez","Görele","Keşap","Piraziz","Şebinkarahisar","Tirebolu","Yağlıdere"],
    "Gümüşhane": ["Kelkit","Kürtün","Merkez","Şiran","Torul"],
    "Hakkâri": ["Çukurca","Merkez","Şemdinli","Yüksekova"],
    "Hatay": ["Antakya","Arsuz","Defne","Dörtyol","Erzin","Hassa","İskenderun","Kırıkhan","Kumlu","Payas","Reyhanlı","Samandağ","Yayladağı"],
    "Iğdır": ["Aralık","Karakoyunlu","Merkez","Tuzluca"],
    "Isparta": ["Aksu","Atabey","Eğirdir","Gelendost","Gönen","Keçiborlu","Merkez","Senirkent","Sütçüler","Şarkikaraağaç","Uluborlu","Yalvaç","Yenişarbademli"],
    "İstanbul": ["Adalar","Arnavutköy","Ataşehir","Avcılar","Bağcılar","Bahçelievler","Bakırköy","Başakşehir","Bayrampaşa","Beşiktaş","Beykoz","Beylikdüzü","Beyoğlu","Büyükçekmece","Çatalca","Eyüpsultan","Fatih","Gaziosmanpaşa","Güngören","Kadıköy","Kağıthane","Kartal","Küçükçekmece","Maltepe","Pendik","Sancaktepe","Sarıyer","Silivri","Sultanbeyli","Sultangazi","Şile","Şişli","Tuzla","Ümraniye","Üsküdar","Zeytinburnu"],
    "İzmir": ["Aliağa","Balçova","Bayındır","Bayraklı","Bergama","Bornova","Buca","Çeşme","Çiğli","Dikili","Foça","Gaziemir","Güzelbahçe","Karabağlar","Karaburun","Karşıyaka","Kemalpaşa","Kiraz","Konak","Menderes","Menemen","Narlıdere","Ödemiş","Seferihisar","Selçuk","Tire","Torbalı","Urla"],
    "Kahramanmaraş": ["Afşin","Andırın","Çağlayancerit","Dulkadiroğlu","Ekinözü","Elbistan","Göksun","Nurhak","Onikişubat","Pazarcık","Türkoğlu"],
    "Karabük": ["Eflani","Eskipazar","Merkez","Ovacık","Safranbolu","Yenice"],
    "Karaman": ["Ayrancı","Başyayla","Ermenek","Merkez","Sarıveliler"],
    "Kars": ["Akyaka","Arpaçay","Digor","Kağızman","Merkez","Sarıkamış","Selim","Susuz"],
    "Kastamonu": ["Abana","Araç","Azdavay","Bozkurt","Cide","Çatalzeytin","Çerkeş","Devrekani","Daday","Doğanyurt","Hanönü","İnebolu","İhsangazi","Merkez","Küre","Pınarbaşı","Şenpazar","Seydiler","Taşköprü","Tosya"],
    "Kayseri": ["Ahırlı","Akkışla","Aktif","Bünyan","Develi","Felahiye","İncesu","Kocasinan","Melikgazi","Öğretmen","Sarız","Sarıoğlan","Tomarza","Talas","TüKam","Yahyalı","Yeşilhisar"],
    "Kırıkkale": ["Bahşılı","Balışeyh","Çerikli","Delice","Keskin","Merkez","Sulakyurt","Yahşihan"],
    "Kırklareli": ["Babaeski","Demirköy","Dereköy","Kırklareli Merkez","Kofçaz","Lüleburgaz","Pehlivanköy","Pınarhisar","Vize"],
    "Kırşehir": ["Akpınar","Akçakent","Boztepe","Çiçekdağı","Kaman","Kırşehir Merkez","Mucur"],
    "Kilis": ["Merkez","Musabeyli","Elbeyli","Polateli"],
    "Kocaeli": ["Gebze","Gölcük","Kandıra","Kartepe","Körfez","Derince","Başiskele","Çayırova","Darıca","Dilovası","İzmit"],
    "Konya": ["Ahırlı","Akşehir","Altınekin","Beyşehir","Bozkır","Cihanbeyli","Çeltik","Çumra","Doğanhisar","Emirgani","Ereğli","Güneysınır","Hadim","Ilgın","Kadınhanı","Karapınar","Karatay","Kulu","Meram","Sarayönü","Selçuklu","Seydişehir","Taşkent","Tuzlukçu","Yalıhüyük","Yunak"],
    "Kütahya": ["Altıntaş","Aslanapa","Çavdarhisar","Domaniç","Dumlupınar","Emet","Gediz","Hisarcık","Merkez","Pazarlar","Şaphane","Simav","Şükrüpaşa","Tavşanlı"],
    "Malatya": ["Akçadağ","Arapgir","Arguvan","Battalgazi","Darende","Doğanşehir","Hekimhan","Kale","Kuluncak","Pütürge","Yazıhan","Yeşilyurt","Merkez"],
    "Manisa": ["Ahmetli","Akhisar","Alaşehir","Demirci","Gölmarmara","Gördes","Kırkağaç","Köprübaşı","Kula","Salihli","Sarıgöl","Saruhanlı","Selendi","Soma","Şehzadeler","Turgutlu","Yunusemre"],
    "Mardin": ["Artuklu","Dargecit","Derik","Kızıltepe","Mazıdağı","Midyat","Nusaybin","Ömerli","Savur","Yeşilli"],
    "Mersin": ["Akdeniz","Anamur","Aydıncık","Bozyazı","Çamlıyayla","Erdemli","Gülnar","Mezitli","Mut","Silifke","Tarsus","Toroslar","Yenişehir"],
    "Muğla": ["Bodrum","Dalaman","Datça","Fethiye","Köyceğiz","Marmaris","Milas","Ortaca","Menteşe","Ula","Yatağan"],
    "Muş": ["Bulanık","Hasköy","Korkut","Malazgirt","Merkez","Varto"],
    "Nevşehir": ["Acıgöl","Avanos","Derinkuyu","Gülşehir","Hacıbektaş","Kozaklı","Merkez","Ürgüp"],
    "Niğde": ["Altunhisar","Bor","Çamardı","Çiftlik","Merkez","Ulukışla"],
    "Ordu": ["Akkuş","Aybastı","Fatsa","Gölköy","Gülyalı","Gürgentepe","İkizce","Kabadüz","Kabataş","Korgan","Kumru","Mesudiye","Perşembe","Ulubey","Ünye","Ordu Merkez"],
    "Osmaniye": ["Bahçe","Düziçi","Hasanbeyli","Kadirli","Merkez","Sumbas","Toprakkale"],
    "Rize": ["Ardeşen","Çamlıhemşin","Çayeli","Derepazarı","Fındıklı","İyidere","Kalkandere","Pazar","Rize Merkez"],
    "Sakarya": ["Adapazarı","Akyazı","Arifiye","Erenler","Ferizli","Geyve","Hendek","Karapürçek","Karasu","Kaynarca","Kocaali","Pamukova","Sapanca","Serdivan","Söğütlü","Taraklı"],
    "Samsun": ["Alaçam","Asarcık","Atakum","Ayvacık","Bafra","Canik","Çarşamba","Havza","İlkadım","Kavak","Ladik","Salıpazarı","Tekkeköy","Terme","Vezirköprü","Yakakent","Samsun Merkez"],
    "Siirt": ["Baykan","Eruh","Kurtalan","Pervari","Şirvan","Siirt Merkez","Tillo"],
    "Sinop": ["Ayancık","Boyabat","Dikmen","Durağan","Erfelek","Gerze","Saraydüzü","Türkeli","Sinop Merkez"],
    "Sivas": ["Akıncılar","Altınyayla","Divriği","Doğanşar","Gölova","Gürün","Hafik","İmranlı","Kangal","Kebani","Koyulhisar","Merkez","Sarıoğlan","Sivas Merkez","Şarkışla","Suşehri","Ulaş","Yıldızeli","Zara"],
    "Şanlıurfa": ["Akçakale","Birecik","Bozova","Ceylanpınar","Eyyübiye","Halfeti","Hilvan","Karaköprü","Siverek","Suruç","Viranşehir","Şanlıurfa Merkez"],
    "Şırnak": ["Beytüşşebap","Cizre","Güçlükonak","İdil","Silopi","Şırnak Merkez","Uludere"],
    "Tekirdağ": ["Çerkezköy","Çorlu","Ergene","Hayrabolu","Malkara","Marmaraereğlisi","Muratlı","Saray","Süleymanpaşa","Şarköy"],
    "Tokat": ["Almus","Artova","Başçiftlik","Erbaa","Niksar","Pazar","Reşadiye","Sulusaray","Tokat Merkez","Turhal","Yeşilyurt","Zile"],
    "Trabzon": ["Akçaabat","Araklı","Arsin","Beşikdüzü","Çarşıbaşı","Çaykara","Dernekpazarı","Düzköy","Hayrat","Köprübaşı","Maçka","Of","Ortahisar","Sürmene","Şalpazarı","Tonya","Vakfıkebir","Yomra"],
    "Tunceli": ["Çemişgezek","Hozat","Mazgirt","Nazımiye","Ovacık","Pertek","Pülümür","Tunceli Merkez"],
    "Uşak": ["Banaz","Eşme","Karahallı","Sivaslı","Ulubey","Uşak Merkez"],
    "Van": ["Başkale","Çatak","Erciş","Gevaş","Gürpınar","İpekyolu","Muradiye","Özalp","Tuşba","Van Merkez"],
    "Yalova": ["Altınova","Armutlu","Çınarcık","Çiftlikköy","Merkez","Termal"],
    "Yozgat": ["Akdağmadeni","Aydıncık","Boğazlıyan","Çandır","Çayıralan","Çekerek","Kadışehri","Merkez","Sarıkaya","Saraykent","Sorgun","Şefaatli","Yenifakılı","Yerköy"],
    "Zonguldak": ["Alaplı","Çaycuma","Devrek","Ereğli","Gökçebey"]
  };


}

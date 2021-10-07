class Product {
  String productID;
  String shortDescription;
  String name;
  String supplierID;
  String weightUnit;
  String category;
  String categoryName;
  String currencyCode;
  String dimensionUnit;
  String longDescription;
  String image;
  List<Stock> stock;

  Product(
      this.productID,
      this.shortDescription,
      this.name,
      this.supplierID,
      this.weightUnit,
      this.category,
      this.categoryName,
      this.currencyCode,
      this.dimensionUnit,
      this.longDescription,
      this.image,
      this.stock);
}

class Stock {
  String plantCode_;
  String stockDDF_;
  String deletionDDF_;
  String crossPlantDDF_;
  String stockDFC_;
  String deletionDFC_;
  String crossPlantDFC_;

  Stock(this.plantCode_, this.stockDDF_, this.deletionDDF_, this.crossPlantDDF_,
      this.stockDFC_, this.deletionDFC_, this.crossPlantDFC_);
}

class Store {
  List<String> productIDs = [];

  List<String> getStore() {
    return this.productIDs;
  }

  bool isFavorite(String id) {
    return this.productIDs.any((element) => element == id);
  }

  void add(String id) {
    this.productIDs.add(id);
  }

  void remove(String id) {
    this.productIDs.remove(id);
  }

  List<Product> getProducts(List<String> list) {
    List<Product> response = [];
    if (list != null && list.length > 0) {
      var allProducts = Dummy().dummyProductData();
      for (var i = 0; i < list.length; i++) {
        allProducts.forEach((element) {
          if (element.productID.compareTo(list[i]) == 0) {
            response.add(element);
          }
        });
      }
    }
    return response;
  }

  Store._privateConstructor();
  static final Store _instance = Store._privateConstructor();
  factory Store() {
    return _instance;
  }
}

class Dummy {
  List<Product> dummyProductData() {
    return [
      Product(
          '91371300',
          'DUAL STRAINER,C/W BASKET 1.6MM',
          'SPX PLENTY FILTRATION',
          '0000707052',
          'OWS125SBSPV',
          '1.25IN (32MM)',
          'C/W BASKET 1.6 MM',
          'DUAL STRAINER',
          'MILLING',
          '1.25IN (32MM), C/W BASKET 1.6 MM, DUAL STRAINER, MILLING',
          'assets/91371300.jpg', [
        Stock('8001', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('8101', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('8102', '2.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('8100', '1.000', '1.000', '1.000', '1.000', '0.000', '0.000')
      ]),
      Product(
          '91371301',
          'ENCLOSURE,ELECT,200HX300WX120DMM,304SS',
          'MERCURY',
          '0000708119',
          'XGB00002284',
          '200HX300WX120D MM',
          '304SS',
          'ENCLOSURE,ELECT',
          'MILLING',
          '200HX300WX120D MM, 304SS, ENCLOSURE,ELECT, MILLING',
          'assets/91371301.jpg', [
        Stock('8001', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('8101', '2.000', '1.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('8303', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371302',
          'BREAKER,CIRCUIT,SPECTRA,1200 A,600 V',
          'GEN ELECTR',
          '0000700164',
          'SKPC3612L3XX',
          'INTERRUPTING RATING: 100 KVA',
          'CB CURRENT RATING: C/W BASKET 1.6 MM',
          'SPECTRA',
          'N/A',
          '200HX300WX120D MM, 304SS, ENCLOSURE,ELECT, MILLING',
          'assets/91371302.jpg', [
        Stock('8001', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('8101', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('8105', '2.000', '2.000', '0.000', '0.000', '0.000', '0.000')
        ]),
      Product(
          '91371303',
          'LEVEL,BUBBLE,200MM',
          'ACHA,HERRAMIENTAS PRECISIÓN',
          '0000709048',
          '18001',
          'N/A',
          'SIZE: 200 MM',
          'BUBBLE',
          'N/A',
          '200 MM, BUBBLE',
          'assets/91371303.jpg', [
        Stock('8001', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371308',
          'VLV,BTRFLY,WAFER,10IN,150 CLASS',
          'CAMERON VALVES',
          '0000706130',
          'WKM10B512002F021300',
          'BUTTERFLY VALVE SIZE: 10 IN, PRESSURE RATING: 150, VALVE CLASS: 150',
          'VALVE STEM MATERIAL: 17-4PH SS, VALVE BODY MATERIAL: 316SS, VALVE DISC MATERIAL: 316SS, ACTUATED: NOT ACTUATED',
          'BFLY SEAT TYPE: RS',
          'REFINING',
          '10 IN, 150, 150, 17-4PH SS, 316SS, 316SS, NOT ACTUATED, REFINING, RPTFE, RS',
          'assets/91371308.jpg', [
        Stock('6005', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('6006', '1.000', '1.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371309',
          'BEARING,LINEAR,30MM ID,47MM OD,68MM W',
          'BEARING LINEAR',
          '0000707052',
          'OWS125SBSPV',
          'BEARING INSIDE DIAMETER: 30 MM, BEARING OUTER DIAMETER: 47 MM',
          'BEARING WIDTH: 68 MM, LINEAR BRG CLOSURE TYPE: OPEN',
          'BEARING TYPE: SUPER LINEAR BUSHING',
          'PACKAGING SPARE PARTS',
          '30 MM, 47 MM, 68 MM, OPEN, PACKAGING SPARE PARTS, SUPER LINEAR BUSHING',
          'assets/91371309.jpg', [
        Stock('8101', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('8201', '1.000', '1.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371313',
          'GASKET,COVER,FEEDER',
          'ISHIDA CO LTD (2315ZB)',
          '0000700515',
          '041004718',
          'COVER',
          'FEEDER',
          'GASKET',
          'N/A',
          'N/A',
          'assets/91371313.jpg', [
        Stock('6200', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('6201', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371314',
          'BUSHING,FLANGED,QD,SK,1-3/16IN ID',
          'MARTIN SPROCKET & GEAR INC',
          '0000700206',
          'SK1316',
          'BUSHING LENGTH: 1-1/8 IN, BUSHING INNER DIAMETER: 1-3/16 IN',
          'KEYWAYS SIZE: 1/4X1/8 IN, BUSHING OUTER DIAMETER: 3-7/8 IN, BUSHING MATERIAL: CI',
          'BUSHING TYPE: FLANGED,QD',
          'OTHER',
          '1-1/8 IN, 1-3/16 IN, 1/4X1/8 IN, 3-7/8 IN, CI, FLANGED,QD, OTHER, SK',
          'assets/91371314.jpg', [
        Stock('6700', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('6701', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371340',
          'HEX KEY,3MM,L,1 QTY/CS',
          'WERA TOOLS INC',
          '0000702945',
          '5022703001',
          'QUANTITY PER CASE: 1, SHAPE/HANDLESHAPE: L',
          'KEY TYPE: HEX KEY',
          '3MM',
          'OTHER',
          '1, 3MM, HEX KEY, L, OTHER',
          'assets/91371340.jpg', [
        Stock('6018', '2.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('8001', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371341',
          'SEAL,RAD SHFT,OIL SEAL,7IN ID,8IN OD',
          'SKF USA INC (311700)',
          '0000700324',
          '70016',
          'SEAL WIDTH (IN): .63 IN, SEAL INSIDE DIA (IN): 7 IN, SEAL OUTSIDE DIA (IN): 8 IN',
          'LIP MATERIAL: NITRILE, SEAL DESIGNATION: OIL SEAL',
          'RAD SHFT, SGL LIP SPRG LOADED',
          'N/A',
          '63 IN, 7 IN, 8 IN, ? MM, ? MM, ? MM, NITRILE, OIL SEAL, RAD SHFT, SGL LIP SPRG LOADED',
          'assets/91371341.jpg', [
        Stock('6700', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('6722', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371342',
          'CYL,PNEU,DOUBLE ACTING,REAR TANG',
          'ARO INGERSOLL RAND FLUID PRODTS',
          '0000700180',
          '24301089070',
          'ROD DIAMETER: 0.75 IN, MAX OPERATING PRES: 200 PSI, BORE: 3 IN',
          'STROKE: 7 IN, REAR TANG',
          'DOUBLE ACTING',
          'MILLING',
          '0.75 IN, 200 PSI, 3 IN, 7 IN, DOUBLE ACTING, MILLING, REAR TANG',
          'assets/91371342.jpg', [
        Stock('6J10', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
        Stock('AEBZ', '1.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371343',
          'BATTERY,RECHARGEABLE,NIMH,3.6 V,V150H',
          'VARTA',
          '0000702221',
          '55615603940',
          'VOLTAGE RATING: 3.6',
          'BATTERY GROUP SIZE DESIGNATION: V150H',
          'NIMH',
          'MILLING',
          '3.6, NIMH, V150H',
          'assets/91371343.jpg', [
        Stock('6018', '2.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371344',
          'CLAMP,BASE,UNIVERSAL,SMALL',
          'REECE SAFETY PRODTS LTD',
          '0000707611',
          'BS13',
          'MAXIMUM DIAMETER: ?',
          'CLAMP MATERIAL: ?',
          'BASE,UNIVERSAL,SMALL',
          'N/A',
          '?, ?, BASE,UNIVERSAL,SMALL',
          'assets/91371344.jpg', [
        Stock('6018', '2.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371345',
          'ARM,LINK,BLOCKING,SMALL',
          'REECE SAFETY PRODTS LTD',
          '0000707611',
          'BS13',
          'N/A',
          'N/A',
          'BLOCKING,SMALL',
          'REFINING',
          'BLOCKING,SMALL, REFINING',
          'assets/91371345.jpg', [
        Stock('6018', '2.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371346',
          'CAPACITOR,ELECTROLYTIC,330#F,40V',
          'VISHAY BC COMPONENTS',
          '0000707157',
          '672D337F040ET5D',
          'OPERATING VOLTAGE RATING: 40 V',
          'CAPACITANCE: 330 #F',
          'ELECTROLYTIC',
          'N/A',
          '330 #F, 40 V, ELECTROLYTIC',
          'assets/91371346.jpg', [
        Stock('6018', '2.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371347',
          'CABLE ATTACHMENT,2.44M LG,3.25MM DIA',
          'REECE SAFETY PRODTS LTD',
          '0000707611',
          'BS15',
          '3.25 MM DIA',
          '2.44 M LG',
          'CABLE ATTACHMENT',
          'REFINING',
          '2.44 M LG, 3.25 MM DIA, CABLE ATTACHMENT, REFINING',
          'assets/91371347.jpg', [
        Stock('6018', '2.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371348',
          'TERMINAL,ELEC,RING,12-10AWG,YELLOW',
          'THOMAS & BETTS CORP',
          '0000700375',
          '10RC38X',
          'VOLTAGE RATING: 600, COLOR: YELLOW',
          'WIRE SIZE: 12-10 AWG, BOLT SIZE: 3/8 IN',
          'RING',
          'MILLING',
          '12-10 AWG, 3/8 IN, 600, MILLING, RING, YELLOW',
          'assets/91371348.jpg', [
        Stock('6018', '2.000', '0.000', '0.000', '0.000', '0.000', '0.000')
      ]),
      Product(
          '91371349',
          'BOLT,CARRIAGE,3/8IN,1-1/2IN LG,16,18-8SS',
          'FASTENAL (311600)',
          '0000704057',
          '1174438',
          'BOLT LENGTH: 1-1/2 IN',
          'NOMINAL DIAMETER: 3/8 IN, MATERIAL 1: 18-8SS',
          'THREAD TYPE: 16, HEAD TYPE: ROUND',
          'MILLING',
          '1-1/2 IN, 16, 18-8SS, 3/8 IN, MILLING, ROUND',
          'assets/91371349.jpg',
          [Stock('6018', '2.000', '0.000', '0.000', '0.000', '0.000', '0.000')])
    ];
  }
}

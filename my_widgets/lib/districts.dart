enum City { Taichung, Taipei }

const taipei_districts = [
  "中正區",
  "大同區",
  "中山區",
  "松山區",
  "大安區",
  "萬華區",
  "信義區",
  "士林區",
  "北投區",
  "內湖區",
  "南港區",
];

const taichung_districts = [
  "西屯區",
  "中區",
  "東區",
  "西區",
  "南區",
  "北區",
  "北屯區",
  "豐原區",
  "大里區",
  "太平區",
  "清水區",
  "沙鹿區",
  "大甲區",
  "東勢區",
  "梧棲區",
  "烏日區",
  "神岡區",
  "大肚區",
  "大雅區",
  "后里區",
  "霧峰區",
  "潭子區",
  "龍井區",
  "外埔區",
  "和平區",
  "石岡區",
  "大安區",
  "新社區"
];

getDistricts(City city) {
  switch (city) {
    case City.Taipei:
      return taipei_districts;
    case City.Taichung:
      return taichung_districts;
    default:
      throw UnimplementedError();
  }
}

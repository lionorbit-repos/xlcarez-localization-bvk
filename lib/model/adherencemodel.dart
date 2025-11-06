class AdherenceModel {
	int? hivId;
	int? userId;
	String? hiv1;
	String? hiv2;
	String? hiv3;
	String? hiv4;
	String? hiv5;
	String? hiv6;
	String? hiv7;
	String? hiv8;
	String? hiv9;
	String? hiv10;
	String? hiv11;
	String? hiv12;
	String? hivtotal;
	String? hivinteragration;
	String? hivperseverencescore;
	int? createdBy;
	String? createdDate;

	AdherenceModel({this.hivId, this.userId, this.hiv1, this.hiv2, this.hiv3, this.hiv4, this.hiv5, this.hiv6, this.hiv7, this.hiv8, this.hiv9, this.hiv10, this.hiv11, this.hiv12, this.hivtotal, this.hivinteragration, this.hivperseverencescore, this.createdBy, this.createdDate});

	AdherenceModel.fromJson(Map<String, dynamic> json) {
		hivId = json['hivId'];
		userId = json['userId'];
		hiv1 = json['hiv1'];
		hiv2 = json['hiv2'];
		hiv3 = json['hiv3'];
		hiv4 = json['hiv4'];
		hiv5 = json['hiv5'];
		hiv6 = json['hiv6'];
		hiv7 = json['hiv7'];
		hiv8 = json['hiv8'];
		hiv9 = json['hiv9'];
		hiv10 = json['hiv10'];
		hiv11 = json['hiv11'];
		hiv12 = json['hiv12'];
		hivtotal = json['hivtotal'];
		hivinteragration = json['hivinteragration'];
		hivperseverencescore = json['hivperseverencescore'];
		createdBy = json['createdBy'];
		createdDate = json['createdDate'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['hivId'] = hivId;
		data['userId'] = userId;
		data['hiv1'] = hiv1;
		data['hiv2'] = hiv2;
		data['hiv3'] = hiv3;
		data['hiv4'] = hiv4;
		data['hiv5'] = hiv5;
		data['hiv6'] = hiv6;
		data['hiv7'] = hiv7;
		data['hiv8'] = hiv8;
		data['hiv9'] = hiv9;
		data['hiv10'] = hiv10;
		data['hiv11'] = hiv11;
		data['hiv12'] = hiv12;
		data['hivtotal'] = hivtotal;
		data['hivinteragration'] = hivinteragration;
		data['hivperseverencescore'] = hivperseverencescore;
		data['createdBy'] = createdBy;
		data['createdDate'] = createdDate;
		return data;
	}
}
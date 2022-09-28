class Hotel {
  int? id;
  String? owner;
  List<UnavailableDates>? unavailableDates;
  bool? overNightUse;
  bool? dayUse;
  bool? nightUse;
  String? date;
  String? title;
  String? description;
  String? featuredImage;
  // List<Null>? images;
  String? address;
  int? rating;
  int? commentsCount;
  String? propertyType;
  List<List<Feature>>? features;
  DescriptionSection? descriptionSection;
  MapSection? mapSection;
  InformationSection? informationSection;
  RelatedSection? relatedSection;
  String? checkInDayUse;
  String? checkOutDayUse;
  String? checkInNightUse;
  String? checkOutNightUse;
  String? checkInOvernightUse;
  String? checkOutOvernightUse;

  Hotel(
      {this.id,
      this.owner,
      this.unavailableDates,
      this.overNightUse,
      this.dayUse,
      this.nightUse,
      this.date,
      this.title,
      this.description,
      this.featuredImage,
      this.address,
      this.rating,
      this.commentsCount,
      this.propertyType,
      this.features,
      this.descriptionSection,
      this.mapSection,
      this.informationSection,
      this.relatedSection,
      this.checkInDayUse,
      this.checkOutDayUse,
      this.checkInNightUse,
      this.checkOutNightUse,
      this.checkInOvernightUse,
      this.checkOutOvernightUse});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    if (json['unavailable_dates'] != null) {
      unavailableDates = <UnavailableDates>[];
      json['unavailable_dates'].forEach((v) {
        unavailableDates!.add(UnavailableDates.fromJson(v));
      });
    }
    overNightUse = json['over_night_use'];
    dayUse = json['day_use'];
    nightUse = json['night_use'];
    date = json['date'];
    title = json['title'];
    description = json['description'];
    featuredImage = json['featured_image'];
    // if (json['images'] != null) {
    // 	images = <Null>[];
    // 	json['images'].forEach((v) { images!.add(new Null.fromJson(v)); });
    // }
    address = json['address'];
    rating = json['rating'];
    commentsCount = json['comments_count'];
    propertyType = json['property_type'];
    if (json['features'] != null) {
      features = <List<Feature>>[];
      var subFeature = <Feature>[];
      for (var i in json['features']) {
        for (var c in i) {
          subFeature.add(Feature.fromJson(c));
        }
        features!.add(subFeature);
        subFeature = [];
        // print('#######');
        // print(features!.length);
        // print('#######');
      }
    }
    descriptionSection = json['description_section'] != null
        ? DescriptionSection.fromJson(json['description_section'])
        : null;
    mapSection = json['map_section'] != null
        ? MapSection.fromJson(json['map_section'])
        : null;
    informationSection = json['information_section'] != null
        ? InformationSection.fromJson(json['information_section'])
        : null;
    relatedSection = json['related_section'] != null
        ? RelatedSection.fromJson(json['related_section'])
        : null;
    checkInDayUse = json['check_in_day_use'];
    checkOutDayUse = json['check_out_day_use'];
    checkInNightUse = json['check_in_night_use'];
    checkOutNightUse = json['check_out_night_use'];
    checkInOvernightUse = json['check_in_overnight_use'];
    checkOutOvernightUse = json['check_out_overnight_use'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['owner'] = owner;
    if (unavailableDates != null) {
      data['unavailable_dates'] =
          unavailableDates!.map((v) => v.toJson()).toList();
    }
    data['over_night_use'] = overNightUse;
    data['day_use'] = dayUse;
    data['night_use'] = nightUse;
    data['date'] = date;
    data['title'] = title;
    data['description'] = description;
    data['featured_image'] = featuredImage;
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    data['address'] = address;
    data['rating'] = rating;
    data['comments_count'] = commentsCount;
    data['property_type'] = propertyType;
    // if (features != null) {
    //   data['features'] = features!.map((v) => v.toJson()).toList();
    // }
    if (descriptionSection != null) {
      data['description_section'] = descriptionSection!.toJson();
    }
    if (mapSection != null) {
      data['map_section'] = mapSection!.toJson();
    }
    if (informationSection != null) {
      data['information_section'] = informationSection!.toJson();
    }
    if (relatedSection != null) {
      data['related_section'] = relatedSection!.toJson();
    }
    data['check_in_day_use'] = checkInDayUse;
    data['check_out_day_use'] = checkOutDayUse;
    data['check_in_night_use'] = checkInNightUse;
    data['check_out_night_use'] = checkOutNightUse;
    data['check_in_overnight_use'] = checkInOvernightUse;
    data['check_out_overnight_use'] = checkOutOvernightUse;
    return data;
  }
}

class UnavailableDates {
  String? from;
  String? to;

  UnavailableDates({this.from, this.to});

  UnavailableDates.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}

class Feature {
  int? id;
  String? description;
  bool? isActive;
  String? image;

  Feature({this.id, this.description, this.isActive, this.image});

  Feature.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    isActive = json['is_active'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['is_active'] = isActive;
    data['image'] = image;
    return data;
  }
}

class DescriptionSection {
  String? title;
  String? subtitle;
  String? description;

  DescriptionSection({this.title, this.subtitle, this.description});

  DescriptionSection.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['description'] = description;
    return data;
  }
}

class MapSection {
  String? title;
  String? subtitle;
  String? address;
  double? longitude;
  double? latitude;
  String? url;

  MapSection(
      {this.title,
      this.subtitle,
      this.address,
      this.longitude,
      this.latitude,
      this.url});

  MapSection.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['url'] = url;
    return data;
  }
}

class InformationSection {
  String? title;
  String? subtitle;
  List<SubSections>? subSections;

  InformationSection({this.title, this.subtitle, this.subSections});

  InformationSection.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    if (json['sub_sections'] != null) {
      subSections = <SubSections>[];
      json['sub_sections'].forEach((v) {
        subSections!.add(SubSections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    if (subSections != null) {
      data['sub_sections'] = subSections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubSections {
  String? subSectionTitle;
  List<SubSectionRows>? subSectionRows;

  SubSections({this.subSectionTitle, this.subSectionRows});

  SubSections.fromJson(Map<String, dynamic> json) {
    subSectionTitle = json['sub_section_title'];
    if (json['sub_section_rows'] != null) {
      subSectionRows = <SubSectionRows>[];
      json['sub_section_rows'].forEach((v) {
        subSectionRows!.add(SubSectionRows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_section_title'] = subSectionTitle;
    if (subSectionRows != null) {
      data['sub_section_rows'] =
          subSectionRows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubSectionRows {
  String? title;
  String? value;

  SubSectionRows({this.title, this.value});

  SubSectionRows.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    return data;
  }
}

class RelatedSection {
  String? title;
  String? subtitle;
  List<RelatedProperties>? relatedProperties;

  RelatedSection({this.title, this.subtitle, this.relatedProperties});

  RelatedSection.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    if (json['related_properties'] != null) {
      relatedProperties = <RelatedProperties>[];
      json['related_properties'].forEach((v) {
        relatedProperties!.add(RelatedProperties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    if (relatedProperties != null) {
      data['related_properties'] =
          relatedProperties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RelatedProperties {
  int? id;
  String? title;
  String? type;
  String? price;
  int? rating;
  int? reviews;
  String? featuredImage;
  int? isSaved;

  RelatedProperties(
      {this.id,
      this.title,
      this.type,
      this.price,
      this.rating,
      this.reviews,
      this.featuredImage,
      this.isSaved});

  RelatedProperties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    price = json['price'];
    rating = json['rating'];
    reviews = json['reviews'];
    featuredImage = json['featured_image'];
    isSaved = json['is_saved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['price'] = price;
    data['rating'] = rating;
    data['reviews'] = reviews;
    data['featured_image'] = featuredImage;
    data['is_saved'] = isSaved;
    return data;
  }
}

// To parse this JSON data, do
//
//     final version = versionFromMap(jsonString);

import 'dart:convert';

Version versionFromMap(String str) => Version.fromMap(json.decode(str));

String versionToMap(Version data) => json.encode(data.toMap());

class Version {
    Version({
        this.latestVersion,
        this.hasUpdate,
        this.isRequired,
        this.storeUrl,
    });

    String latestVersion;
    bool hasUpdate;
    bool isRequired;
    String storeUrl;

    factory Version.fromMap(Map<String, dynamic> json) => Version(
        latestVersion: json["latestVersion"] == null ? null : json["latestVersion"],
        hasUpdate: json["hasUpdate"] == null ? null : json["hasUpdate"],
        isRequired: json["isRequired"] == null ? null : json["isRequired"],
        storeUrl: json["storeUrl"] == null ? null : json["storeUrl"],
    );

    Map<String, dynamic> toMap() => {
        "latestVersion": latestVersion == null ? null : latestVersion,
        "hasUpdate": hasUpdate == null ? null : hasUpdate,
        "isRequired": isRequired == null ? null : isRequired,
        "storeUrl": storeUrl == null ? null : storeUrl,
    };
}

```python
# pip install exifread

import exifread

with open("xxx","rb") as img:
	tags = exifread.process_file(img)

```
## tags.keys
```bash
['Image ImageDescription', 'Image Make', 'Image Model', 'Image Orientation', 'Image XResolution', 'Image YResolution', 'Image ResolutionUnit', 'Image Software', 'Image DateTime', 'Image YCbCrPositioning', 'Image ExifOffset', 'GPS GPSVersionID', 'GPS GPSLatitudeRef', 'GPS GPSLatitude', 'GPS GPSLongitudeRef', 'GPS GPSLongitude', 'GPS GPSAltitudeRef', 'GPS GPSAltitude', 'GPS GPSStatus', 'GPS GPSMapDatum', 'Image GPSInfo', 'Image XPComment', 'Image XPKeywords', 'Thumbnail Compression', 'Thumbnail XResolution', 'Thumbnail YResolution', 'Thumbnail ResolutionUnit', 'Thumbnail JPEGInterchangeFormat', 'Thumbnail JPEGInterchangeFormatLength', 'EXIF ExposureTime', 'EXIF FNumber', 'EXIF ExposureProgram', 'EXIF ISOSpeedRatings', 'EXIF SensitivityType', 'EXIF ExifVersion', 'EXIF DateTimeOriginal', 'EXIF DateTimeDigitized', 'EXIF ComponentsConfiguration', 'EXIF ShutterSpeedValue', 'EXIF ApertureValue', 'EXIF ExposureBiasValue', 'EXIF MaxApertureValue', 'EXIF SubjectDistance', 'EXIF MeteringMode', 'EXIF LightSource', 'EXIF Flash', 'EXIF FocalLength', 'EXIF MakerNote', 'EXIF FlashPixVersion', 'EXIF ColorSpace', 'EXIF ExifImageWidth', 'EXIF ExifImageLength', 'Interoperability InteroperabilityIndex', 'Interoperability InteroperabilityVersion', 'EXIF InteroperabilityOffset', 'EXIF FileSource', 'EXIF SceneType', 'EXIF CustomRendered', 'EXIF ExposureMode', 'EXIF WhiteBalance', 'EXIF DigitalZoomRatio', 'EXIF FocalLengthIn35mmFilm', 'EXIF SceneCaptureType', 'EXIF GainControl', 'EXIF Contrast', 'EXIF Saturation', 'EXIF Sharpness', 'EXIF DeviceSettingDescription', 'EXIF BodySerialNumber', 'EXIF LensSpecification', 'EXIF Tag 0xC614', 'JPEGThumbnail']
```
### Image ImageDescription

> (0x010E) ASCII=default @ 908
###  Image Make

> (0x010F) ASCII=Hasselblad @ 916

### Image Model

> (0x0110) ASCII=L2D-20c @ 928

### Image DateTime  采集时间

> (0x0132) ASCII=2024:04:25 14:54:55 @ 964

### 
# Green2Get Shared Modules

แพ็คเกจกลางสำหรับแชร์โมดูลระหว่าแอปในกลุ่ม Green2Get เริ่มต้นจากฟีเจอร์แอปฮีโร่ และเว็บแอปโลมาแอดมิน

## โครงสร้างโมดูลสำหรับการจัดการ

ออกแบบไว้ให้สอดคล้องกับไลบราลี Getx ที่ใช้ภายในแอปต่างๆ ในกลุ่ม Green2Get โดยใช้โครงสร้างแอปดังต่อไปนี้

```
modules
    + a_module <ชื่อโมดูล>
        + controllers
            + mixins (ส่วนเพิ่มเติมสำหรับคลาส Controller)
                - a_module_controller_mixin.dart
        + views
            + widgets (วิดเจ็ด)
        + models
        + services
middleware
shared
```

ภายในไฟล์ของแต่ละโมดูล จะเน้นใช้คลาสที่ฟลัตเตอร์เตรียมไว้เป็นหลัก หลีกเลี่ยงการใช้โค้ดจากไลบราลี

แต่ละส่วนจะมีรูปแบบโค้ดและหน้าที่ดังต่อไปนี้

### Controllers

ในขณะนี้จะมีแค่โฟลเดอร์ mixins เท่านั้น ซึ่งภายในจะมีไฟล์ mixin(ส่วนเพิ่มเติมสำหรับคลาสต่างๆ) อยู่ ที่เลือกใช้รูปโค้ดแบบนี้ เพราะมันสามารถใช้คู่กับคลาส GetxController ได้ โดยไม่ต้องกังวลเรื่องเวอร์ชันไลบราลีที่แตกต่างกันของแต่ละแอปฯ

- controllers/mixins/a_module_controller_mixin.dart

```dart
mixin AModuleMixin {
    /// เมดธอดและตัวแปรใช้ภายในคลาส
}

```

- การนำไปใช้ใน GetxController

```dart
class AppController extends GetxController with AModuleMixin {
    /// Controller นี้สามารถถ่ายทอดและใช้งานเมดธอดของ AModuleMixin ได้
}

```

### Views

ในขณะนี้ จะมีแค่โฟลเดอร์ widgets เท่านั้น ซึ่งภายในจะมีไฟล์วิดเจ็ดไว้ใช้สำหรับแสดงผลบนแอปฯ

### Models

โฟลเดอร์สำหรับแสดงตัวเป็นโมเดลข้อมูล

### Services

โฟลเดอร์สำหรับแสดงตัวเป็นเซอร์วิสที่ใช้ภายในโมดูล หรืออนุญาตให้แอปฯ ของ Green2Get ยืมใช้คลาสดังกล่าวได้

### Middlewares

โค้ดส่วนกลางที่ทำหน้าเชื่อมต่อกับฟีเจอร์ที่มีการติดต่อระหว่างการทำงานในขอบเขตของเฟรมเวิร์คและระบบปฏิบัติการภายในอุปกรณ์ อาทิ การเชื่อมต่อ API server ของ Green2Get ผ่านระบบเครือข่ายอินเทอร์เน็ต (ไลบราลี dio) หรือการทำรายการ logging ผ่านฟีเจอร์ดังกล่าวในระบบปฏิบัติการ (ไลบราลี logger)

### Shared

โค้ดจิปาถะไว้แชร์ใช้กันในแอปฯ ของ Green2Get อาทิ enums หรือ  utility classesที่ใช้กันภายในแอปฯ เป็นต้น
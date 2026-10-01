# KGN GROUP — Flutter + API Build Kit

यह ZIP **source project** है, compiled APK/AAB/IPA नहीं। इसे GitHub Actions या Flutter environment में build किया जा सकता है।

## इसमें क्या है
- Flutter starter app (Android, iOS और Web के लिए)
- KGN GROUP की 15 service categories
- Customer quotation request UI
- Vendor registration UI
- English/Arabic/Hindi/Bengali language selector scaffold
- Contact buttons
- Node.js/Express API starter (`api/`)
- GitHub Actions Android APK और AAB build workflow
- iOS build workflow (macOS runner; Apple signing/TestFlight/App Store के लिए credentials अलग से चाहिए)

## Android build
```bash
flutter pub get
flutter build apk --release
flutter build appbundle --release
```

## iOS build
macOS पर:
```bash
flutter pub get
cd ios && pod install && cd ..
flutter build ios --release
```
IPA export/signing के लिए Apple Developer account, certificates/provisioning profile और Xcode configuration आवश्यक हैं। GitHub-hosted macOS runner पर भी ये secrets configure करने होंगे।

## API चलाना
```bash
cd api
cp .env.example .env
npm install
npm start
```
Health check: `GET /api/health`

## जरूरी
यह buildable starter है; live launch से पहले Firebase/Auth/OTP, database, secure file storage, payment gateway, Maps, notifications और audio/video provider के credentials/configuration जोड़ने होंगे। API starter in-memory demo data रखता है और production database/auth/payment integration का विकल्प नहीं है। ग्राहक का फोन/पता/लोकेशन केवल verified payment के बाद server-side unlock होना चाहिए; production में authentication, role checks और assigned-vendor authorization जोड़ें।

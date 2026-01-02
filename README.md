## Simple Platform App (SwiftUI)

A SwiftUI-based platform-style iOS application built with scalability and real-world release in mind.
This project demonstrates modern SwiftUI architecture, clean UI composition, and extensible data modeling suitable for marketplace or intermediary services.

This repository currently uses mock data for demonstration purposes.
Integration with Firebase (Auth, Firestore, Storage, Cloud Function) is planned as the next step.

⸻
## Overview

Simple Platform is an iOS app prototype designed to simulate a lightweight intermediary platform where users can browse vendors, view details, and interact with core platform features such as likes, lists, profiles, and localization.

The project focuses on:
	•	Clear separation of concerns (MVVM)
	•	Reusable UI components
	•	Practical app architecture suitable for production
	•	Smooth migration path from mock data to cloud-based backend (Firebase)

## Screenshots
<p align="center">
### Home / Vendor List
<img width="300" alt="1" src="https://github.com/user-attachments/assets/9eb93cd5-15df-403e-a1e7-3820386282a0" />

### Filter / Order
<img width="300" alt="2" src="https://github.com/user-attachments/assets/d4d86a54-78a6-4182-aa4a-1e13391187fe" />

### Vendor Detail
<img width="300" alt="3" src="https://github.com/user-attachments/assets/ea06bad5-3c11-4f1d-8442-e3a96dcdf853" />
</p>

<p align="center">
### Favorite List
<img width="300" alt="4" src="https://github.com/user-attachments/assets/c2702838-6ffb-4727-a81f-abbb052c350e" />

### Profile
<img width="300" alt="5" src="https://github.com/user-attachments/assets/67e0ce25-ff4a-4096-ab72-62273f07a9ed" />
</p>


⸻
## Tech Stack
	•	SwiftUI (iOS 17+)
	•	MVVM Architecture
	•	Observable / ViewModel-driven state management
	•	Localization (Multi-language support)
	•	Mock Data Layer (Firebase-ready structure)
	•	Git / GitHub

⸻
## MVP1 – Implemented Features (Current)

### Vendor List
	•	Vendor list view with clean, scalable UI
	•	Category-based filtering (e.g. Studio, Dress, Hair & Make)
	•	Sorting options (e.g. Likes / Alphabetical)

### Like (Favorite) System
	•	Users can mark vendors they like
	•	Like count displayed per vendor
	•	Designed to support future server-side aggregation (Cloud Function)

### Vendor Detail Page
	•	Vendor images
	•	Location information
	•	Like count display
	•	UI structure designed for future product and review expansion

### Profile
	•	User profile view
	•	Editable user information
	•	Prepared for authentication-based user data

### App Language Switching
	•	In-app language selection
	•	Localization using Localizable.strings

⸻
## MVP2 – Planned Features
	•	Vendor Chat: Real-time messaging between users and vendors
	•	Push Notifications
	•	Vendor Product / Service Details: price and description display

⸻
## Architecture Highlights
	•	MVVM-first design
Business logic is handled in ViewModels, keeping Views lightweight and composable.
	•	Component-based UI
Reusable components (buttons, headers, cards, loaders) are separated for scalability.
	•	Backend-ready Models
Data models are structured to seamlessly migrate from mock data to Firebase.

⸻
## Firebase Integration (Planned)

The project is designed to support:
	•	Firebase Authentication (User accounts)
	•	Cloud Firestore (Vendors, Likes, Chats)
  •	Firebase Storage (Vendor Images)
	•	Firebase Cloud Function (Likes integration to Vendor data)

Mock data is currently used to keep the repository self-contained and easy to review.

⸻
## Screens & UI
	•	Clean, platform-style UI
	•	Modern SwiftUI layout practices
	•	Designed to scale across feature growth


⸻
## License

This project is licensed under the MIT License.
See the [LICENSE](https://github.com/esowooo/Simple-Platform/blob/main/LICENSE)￼ file for details.


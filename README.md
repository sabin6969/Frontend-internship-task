# Frontend-internship-task

## Overview

This is a Flutter application that manages a list of items with Create, Read, Delete operations. The app fetches data from a backend, displays the items in a list view, and allows users to add and delete items. 

State management in the app is handled using **GetX**, which ensures reactive and efficient state updates across the application.

## Features

1. **List View**  
   - Fetches a list of items from the backend and displays them in a scrollable list.
   - Each item is displayed with its details and a delete button.
   
2. **Add Item**  
   - A form allows users to input new item details.
   - When the form is submitted, the app sends a request to the backend to add the new item.

3. **Delete Item**  
   - Each item in the list has a delete button.
   - When clicked, the app sends a request to the backend to delete the item, and the list updates accordingly.

## Technologies Used

- **Flutter**: For the mobile app development.
- **GetX**: For state management and dependency injection.
- **http**: For handling HTTP requests to the backend.
- **Backend**: A REST API (written in Node Js, Express Js)

## Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/sabin6969/Frontend-internship-task
   cd Frontend-internship-task
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

# Tasca S2.01 - Database Modeling with MySQL

📄 **Description - Exercise Statement**

This repository contains exercises for database modeling using MySQL. The tasks are divided into three levels of complexity and are designed to represent real-world scenarios from various industries and domains. Each task involves designing the structure of a relational database, defining relationships, and managing data efficiently.

### **Exercises**

#### **Level 1**:

- **Exercise 1 - Optics Management**  
  The project involves creating a database structure for an optics store named "Cul d'Ampolla". The database must store information about suppliers, glasses brands, customers, and sales staff. Specific details such as customer referrals, lens details, and employee participation in sales are required.

- **Exercise 2 - Pizzeria Delivery System**  
  Design a database for a web-based food delivery application. The database must handle customers, addresses (with locality and province relationships), orders, and product details like pizzas, hamburgers, and drinks. It also includes the management of stores, employees, and delivery assignments.

#### **Level 2**:

- **Exercise 1 - YouTube Database Model**  
  Create a simplified model for a YouTube-like platform. It includes user data, video uploads (with likes, dislikes, and tags), channels, subscriptions, playlists, and comments. The focus is on capturing user interactions and metadata related to videos and playlists.

#### **Level 3**:

- **Exercise 1 - Spotify Database Model**  
  Develop a database model for Spotify. It should differentiate between free and premium users, manage playlists, songs, albums, and artists. The database will track user subscriptions, payments, and playback statistics. It also supports features like storing deleted playlists, shared playlists, and similar artist relationships.

---

💻 **Technologies Used**

- MySQL - Relational Database Management System
- SQL - Structured Query Language
- Tools for database design like MySQL Workbench
- Git - Version Control System
- Markdown for documentation

---

📋 **Requirements**

To run the scripts provided in this repository, ensure the following requirements are met:

- **MySQL**:
  - Version: 8.0 or higher
- **MySQL Workbench** (optional for visualization and design):
  - Version: 8.0 or higher
- **Operating System**: Compatible with Windows, macOS, or Linux
- **Git**:
  - Installed and configured for version control

---

🛠️ **Installation**

1. Clone this repository:
   ```bash
   git clone https://github.com/Pablo2203/Tasca-S2.01.-Estructura-de-datos---MySQL.git
   ```

2. Navigate to the repository:
   ```bash
   cd Tasca-S2.01.-Estructura-de-datos---MySQL
   ```

3. Open the MySQL client or MySQL Workbench.

4. Import the SQL scripts:
   - Use the `.sql` files provided for each exercise to set up the database.

---

▶️ **Execution**

1. Open your MySQL client or any preferred SQL terminal.
2. Ensure the database is running.
3. Execute the SQL scripts in the following order:
    - Level 1: 
      - `optics_management.sql`
      - `pizzeria_delivery.sql`
    - Level 2:
      - `youtube_database.sql`
    - Level 3:
      - `spotify_database.sql`
4. Verify the data and relationships using SQL queries or MySQL Workbench.

---

🌐 **Deployment**

This repository does not include deployment-specific scripts. However, the database can be deployed on any environment supporting MySQL, such as:

- Local environments through MySQL Server.
- Cloud databases like Amazon RDS, Google Cloud SQL, or Azure Database for MySQL.
- Containerized environments using Docker with a MySQL image:
  ```bash
  docker run --name mysql-db -e MYSQL_ROOT_PASSWORD=password -d mysql:8.0
  ```

---

🤝 **Contributions**

Contributions to this repository are welcome. Please follow the steps below:

1. Fork the repository.
2. Create a branch for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes with a descriptive message:
   ```bash
   git commit -m "Add new feature or fix description"
   ```
4. Push to your branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Create a pull request. Ensure it includes a clear description of the changes made.

For significant changes, please open an issue first to discuss the improvement or feature.

---

📬 **Contact**

If you encounter any issues or have questions about exercising the projects within this repository, feel free to reach out via the repository's [Issues](https://github.com/Pablo2203/Tasca-S2.01.-Estructura-de-datos---MySQL/issues) tab.

---

Happy coding! 🎉

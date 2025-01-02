<h4 align="center">Online Forum SQL</h4>

<div align="center">
  <span style="display: inline-block; margin-right: 10px;">
    <img src="https://img.shields.io/badge/Database-MySQL-blue" alt="MYSQL">
  </span>
  <span style="display: inline-block; margin-right: 10px;">
    <img src="https://img.shields.io/badge/Database-MariaDB-blue" alt="MariaDB">
  </span>
</div>

<p align="center">
  <a href="#overview">Overview / Project Description</a> •
  <a href="#structure">Database Structure</a> •
  <a href="#installation">Installation / Setup Instructions</a> 
</p>

<div align="center">
  <img src="https://github.com/NURSENAKTAS/db-1/blob/main/diagram.png" alt="screenshot1">
</div>


<h2 id="overview">Project Description</h2>

This forum system is a powerful and flexible platform designed to facilitate discussions, content sharing, and community interaction. It is built to support a wide range of user activities, including posting discussions, commenting, liking content, managing forums, and assigning roles.

The system allows for structured categorization of topics, enabling users to create and participate in discussions under specific categories and forums. Each user can have personalized settings, upload content, and manage their profiles with avatars, bios, and other customizable features.

The platform is designed with flexibility in mind, offering roles and permissions that allow administrators and moderators to manage forums, discussions, users, and content efficiently. Security features such as email verification and activity logging ensure the safety and integrity of the user experience.

Key features of the forum system include:
- **Forum Management:** Create, edit, and organize forums and categories.
- **Discussion Threads:** Users can post discussions, comment on them, and interact with other users.
- **User Profiles:** Personalize profiles with user information, bio, avatar, and more.
- **Roles and Permissions:** Flexible role management for admins, moderators, and users.
- **Content Moderation:** Reports, likes, and content filtering help maintain the quality of discussions.
- **Notifications:** Real-time notifications for user interactions and updates on followed discussions.
- **File Uploads:** Users can share files within discussions.
- **Activity Logging:** Track and monitor user activities for security and transparency.

The system is built on a relational database that allows for efficient data management and retrieval, ensuring fast response times and scalability as the user base grows.

This project is ideal for communities of all sizes looking to build a space for open discussions, content sharing, and collaboration, providing a solid foundation for both public and private forums.


<h2 id="structure">Database Schema Documentation</h2>

This document provides a detailed explanation of the database schema used in the forum system.

---

### 1. **Categories** (Table)
Stores information about different categories for forums.

| Column Name      | Type              | Description                                               |
|------------------|-------------------|-----------------------------------------------------------|
| **id**           | bigint unsigned   | Unique identifier for the category (Primary Key).         |
| **category_name**| varchar(255)       | Name of the category (Required).                          |
| **category_icon**| varchar(255)       | Optional icon for the category (Nullable).                |

---

### 2. **Forums** (Table)
Defines various forums.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the forum (Primary Key).            |
| **forum_name** | varchar(255)       | Name of the forum (Required).                             |
| **description**| text              | Description of the forum (Required).                      |

---

### 3. **Forum Categories** (Table)
Establishes the relationship between forums and categories.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the relationship (Primary Key).     |
| **forum_id**   | bigint unsigned   | Foreign key referring to `forums(id)` (Required).         |
| **category_id**| bigint unsigned   | Foreign key referring to `categories(id)` (Required).     |

---

### 4. **Forum Settings** (Table)
Stores various settings for each forum.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the setting (Primary Key).          |
| **setting_key**| varchar(255)       | Key of the setting (Required).                            |
| **setting_value**| varchar(255)     | Value of the setting (Required).                          |
| **forum_id**   | bigint unsigned   | Foreign key referring to `forums(id)` (Required).         |

---

### 5. **Pages** (Table)
Defines static pages for the forum.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the page (Primary Key).             |
| **page_name**  | varchar(255)       | Name of the page (Required).                              |
| **page_slug**  | varchar(255)       | Unique slug for the page, must be unique (Required).      |

---

### 6. **Roles** (Table)
Defines the user roles in the forum.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the role (Primary Key).             |
| **role_name**  | varchar(255)       | Name of the role (Required).                               |

---

### 7. **Role-Category Assignments** (Table)
Assigns roles to categories.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the assignment (Primary Key).       |
| **role_id**    | bigint unsigned   | Foreign key referring to `roles(id)` (Required).          |
| **category_id**| bigint unsigned   | Foreign key referring to `categories(id)` (Required).     |

---

### 8. **Role-Forum** (Table)
Assigns roles to forums.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the assignment (Primary Key).       |
| **role_id**    | bigint unsigned   | Foreign key referring to `roles(id)` (Required).          |
| **forum_id**   | bigint unsigned   | Foreign key referring to `forums(id)` (Required).         |

---

### 9. **Tags** (Table)
Defines tags for discussions.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the tag (Primary Key).              |
| **tag_name**   | varchar(255)       | Name of the tag (Required).                               |

---

### 10. **Users** (Table)
Stores user information.

| Column Name      | Type              | Description                                               |
|------------------|-------------------|-----------------------------------------------------------|
| **id**           | bigint unsigned   | Unique identifier for the user (Primary Key).             |
| **user_name**    | varchar(255)       | Username of the user (Unique, Required).                  |
| **email**        | varchar(255)       | Email address of the user (Unique, Required).             |
| **email_verified**| timestamp         | Timestamp when the email was verified (Nullable).         |
| **password**     | varchar(255)       | Password for the user (Required).                         |
| **join_date**    | datetime          | Date and time when the user joined (Default current time).|
| **is_active**    | tinyint(1)         | Status of the user account (Default is active).           |
| **bio**          | text              | Short bio of the user (Nullable).                         |
| **avatar_url**   | varchar(255)       | URL to the user's profile picture (Nullable).             |
| **location**     | varchar(255)       | Location of the user (Nullable).                          |
| **website**      | varchar(255)       | URL to the user's website (Nullable).                     |
| **remember_token**| varchar(100)      | Token used for remembering the user session (Nullable).   |

---

### 11. **Discussions** (Table)
Defines discussion threads within forums.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the discussion (Primary Key).       |
| **title**      | varchar(255)       | Title of the discussion (Required).                       |
| **slug**       | varchar(255)       | Unique URL-friendly identifier for the discussion (Required).|
| **content**    | text              | Content of the discussion (Required).                     |
| **created_date**| datetime          | Timestamp of when the discussion was created (Default current time).|
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |
| **forum_id**   | bigint unsigned   | Foreign key referring to `forums(id)` (Required).         |

---

### 12. **Comments** (Table)
Stores comments on discussions.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the comment (Primary Key).          |
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |
| **discussion_id**| bigint unsigned | Foreign key referring to `discussions(id)` (Required).    |
| **comment_text**| varchar(255)      | The text of the comment (Required).                        |

---

### 13. **Discussion Tags** (Table)
Links discussions with tags.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the discussion-tag relationship (Primary Key). |
| **discussion_id**| bigint unsigned | Foreign key referring to `discussions(id)` (Required).    |
| **tag_id**     | bigint unsigned   | Foreign key referring to `tags(id)` (Required).           |

---

### 14. **Email Verifications** (Table)
Stores email verification information for users.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the verification (Primary Key).     |
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |
| **verification_date**| datetime    | Timestamp when the email verification occurred (Default current time).|

---

### 15. **Likes** (Table)
Tracks likes on comments and discussions.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the like (Primary Key).             |
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |
| **discussion_id**| bigint unsigned | Foreign key referring to `discussions(id)` (Required).    |
| **comment_id** | bigint unsigned   | Foreign key referring to `comments(id)` (Required).       |

---

### 16. **Moderators** (Table)
Stores information about forum moderators.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the moderator (Primary Key).        |
| **assigned_date**| datetime        | Date when the moderator was assigned (Default current time).|
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |

---

### 17. **Discussion Moderators** (Table)
Links moderators to specific discussions.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the discussion-moderator relationship (Primary Key).|
| **discussion_id**| bigint unsigned | Foreign key referring to `discussions(id)` (Required).    |
| **moderator_id**| bigint unsigned  | Foreign key referring to `moderators(id)` (Required).     |

---

### 18. **Forum Moderators** (Table)
Links moderators to specific forums.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the forum-moderator relationship (Primary Key).|
| **forum_id**   | bigint unsigned   | Foreign key referring to `forums(id)` (Required).         |
| **moderator_id**| bigint unsigned  | Foreign key referring to `moderators(id)` (Required).     |

---

### 19. **Reports** (Table)
Tracks reports for discussions and comments.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the report (Primary Key).           |
| **report_reason**| text            | Reason for the report (Nullable).                         |
| **report_date**| datetime          | Timestamp when the report was created (Default current time).|
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |
| **comment_id** | bigint unsigned   | Foreign key referring to `comments(id)` (Required).       |
| **discussion_id**| bigint unsigned | Foreign key referring to `discussions(id)` (Required).    |

---

### 20. **Notifications** (Table)
Stores notifications related to comments, discussions, likes, and reports.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the notification (Primary Key).     |
| **content**    | text              | Content of the notification (Required).                   |
| **created_date**| datetime         | Timestamp when the notification was created (Default current time).|
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |
| **discussion_id**| bigint unsigned | Foreign key referring to `discussions(id)` (Required).    |
| **like_id**    | bigint unsigned   | Foreign key referring to `likes(id)` (Required).          |
| **report_id**  | bigint unsigned   | Foreign key referring to `reports(id)` (Required).        |
| **comment_id** | bigint unsigned   | Foreign key referring to `comments(id)` (Required).       |

---

### 21. **Uploads** (Table)
Tracks file uploads associated with discussions.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the upload (Primary Key).           |
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |
| **discussion_id**| bigint unsigned | Foreign key referring to `discussions(id)` (Required).    |
| **file_path**  | varchar(255)       | Path to the uploaded file (Required).                     |
| **upload_date**| datetime          | Timestamp when the file was uploaded (Default current time).|

---

### 22. **User Activity Logs** (Table)
Logs user activities.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the activity log (Primary Key).     |
| **activity_date**| datetime        | Date and time when the activity occurred (Default current time).|
| **activity_type**| varchar(255)     | Type of activity performed by the user (Required).        |
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |

---

### 23. **User-Forums** (Table)
Defines the forums that a user is part of.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the user-forum relationship (Primary Key).|
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |
| **forum_id**   | bigint unsigned   | Foreign key referring to `forums(id)` (Required).         |

---

### 24. **User Role Assignments** (Table)
Assigns roles to users.

| Column Name    | Type              | Description                                               |
|----------------|-------------------|-----------------------------------------------------------|
| **id**         | bigint unsigned   | Unique identifier for the role assignment (Primary Key).  |
| **role_id**    | bigint unsigned   | Foreign key referring to `roles(id)` (Required).          |
| **user_id**    | bigint unsigned   | Foreign key referring to `users(id)` (Required).          |

---



<h2 id="installation">Installation / Setup Instructions</h2>

To clone and run this Laravel application, you'll need Git and Composer (for PHP dependencies) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/NURSENAKTAS/db-1

# Go into the project directory (if applicable)
$ cd your-repository

# Set up the database
# First, ensure you have MySQL or MariaDB installed and running

# Log into MySQL (replace 'your_db_username' with your MySQL username)
$ mysql -u your_db_username -p

# Create a new database (for example 'online_forum')
$ CREATE DATABASE online_forum;

# Exit MySQL
$ exit

# Import the SQL dump into your database (ensure you're in the directory where schema.sql is located)
$ mysql -u your_db_username -p online_forum < schema.sql

# Import the SQL dump into your database (ensure you're in the directory where schema.sql is located)
$ source /path/to/your/schema.sql;

# After importing the dump, you can list the tables to verify everything was imported correctly
$ SHOW TABLES;


```

> **Note**
> If you're using Linux Bash for Windows, [see this guide](https://www.howtogeek.com/261575/how-to-run-graphical-linux-desktop-applications-from-windows-10s-bash-shell/) or use `node` from the command prompt.


---


> GitHub https://github.com/NURSENAKTAS &nbsp;&middot;&nbsp;
> Linked https://www.linkedin.com/in/nurşen-aktaş-329193303/


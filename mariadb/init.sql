-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS my_database;

-- 특정 사용자 생성 및 권한 부여
CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED BY 'wordpress';
GRANT ALL PRIVILEGES ON my_database.* TO 'wordpress'@'%';

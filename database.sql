CREATE DATABASE EBOOK_WEB

use EBOOK_WEB



CREATE TABLE dbo.users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(45) NULL,
    email NVARCHAR(45) NULL,
    phno NVARCHAR(45) NULL,
    [password] NVARCHAR(45) NULL,
    address NVARCHAR(45) NULL,
    landmark NVARCHAR(45) NULL,
    city NVARCHAR(45) NULL,
    state NVARCHAR(45) NULL,
    pincode NVARCHAR(45) NULL
);
GO


INSERT INTO dbo.users (name, email, phno, [password])
VALUES
    (N'Đức Duy', 'lehoangducduykt@gmail.com', '0338124175', '1'),
    (N'Tấn Khang', 'khang@gmail.com', '0112233445', '1');
GO


CREATE TABLE dbo.book_dtls (
    bookId INT IDENTITY(1,1) PRIMARY KEY,
    bookname NVARCHAR(45) NULL,
    author NVARCHAR(45) NULL,
    price NVARCHAR(45) NULL,
    bookCategory NVARCHAR(45) NULL,
    status NVARCHAR(45) NULL,
    photo NVARCHAR(45) NULL,
    email NVARCHAR(45) NULL
);
GO

INSERT INTO book_dtls (bookname, author, price, bookCategory, status, photo,email)
VALUES
(N'ASP.NET', 'NXBVN', 10, 'New Book', 'Active', 'asp_net.jpg', 'admin'),
(N'ASP.NET MVC', 'NXBVN', 12, 'New Book', 'Active', 'asp_net_mvc4.jpg', 'admin'),
(N'Axit và Kiềm', 'NXBVN', 5, 'New Book', 'Active', 'axit-va-kiem.jpg', 'admin'),
(N'Beginer Java', 'NXBVN', 6, 'New Book', 'Active', 'beginer_java.jpg', 'admin'),
(N'Block Chain', 'NXBVN', 8, 'New Book', 'Active', 'block_chain.jpg', 'admin'),
(N'Giải Thuật và Lập Trình', 'NXBVN', 12, 'New Book', 'Active', 'gt_lt.jpg', 'admin'),
(N'Linux', 'NXBVN', 5, 'New Book', 'Active', 'linux.jpg', 'admin'),
(N'Machine Learning', 'NXBVN', 12, 'New Book', 'Active', 'machine_learning.jpg', 'admin'),
(N'PHP MySQL', 'NXBVN', 10, 'New Book', 'Active', 'php_mysql.jpg', 'admin'),
(N'Learning Vue.js', 'NXBVN', 10, 'New Book', 'Active', 'vue_js.jpg', 'admin'),
(N'TORIKO', 'NXBVN', 3, 'Old', 'Active', 'nhasachmienphi-toriko.jpg', 'lehoangducduykt@gmail.com'),
(N'OnePiece', 'NXBVN', 3, 'Old', 'Active', 'nhasachmienphi-one-piece-dao-hai-tac.jpg', 'lehoangducduykt@gmail.com'),
(N'Conan', 'NXBVN', 3, 'Old', 'Active', 'conan.jpg', 'lehoangducduykt@gmail.com'),
(N'Thánh Kinh Dương Da', 'NXBVN', 4, 'Old', 'Active', 'Thanh-Kinh-Duong-Da.jpg', 'khang@gmail.com'),
(N'Chăm Sóc Răng Miệng', 'NXBVN', 3, 'Old', 'Active', 'csrm.jpg', 'khang@gmail.com'),
(N'Chữa Lành Gương Mặt', 'NXBVN', 5, 'Old', 'Active', 'Chua-lanh-guong-mat.jpg', 'khang@gmail.com');
GO


CREATE TABLE dbo.book_order (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id NVARCHAR(45) NULL,
    user_name NVARCHAR(45) NULL,
    email NVARCHAR(45) NULL,
    address NVARCHAR(500) NULL,
    phno NVARCHAR(45) NULL,
    book_name NVARCHAR(45) NULL,
    author NVARCHAR(45) NULL,
    price NVARCHAR(45) NULL,
    payment NVARCHAR(45) NULL,
	date date NULL
);
GO


CREATE TABLE dbo.cart (
    cid INT IDENTITY(1,1) PRIMARY KEY,
    bid INT NULL,
    uid INT NULL,
    bookName NVARCHAR(45) NULL,
    author NVARCHAR(45) NULL,
    price FLOAT NULL,
    total_price FLOAT NULL,
    photo NVARCHAR(45) NULL
);
GO

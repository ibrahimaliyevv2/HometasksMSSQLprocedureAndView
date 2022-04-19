# HometasksMSSQLprocedureAndView

Tapsiriq:


1. MS SQL-fə cutstom functionları araşdırırsınız və procedurla fərqlərinə baxırsınız, cross join araşdırırsınız

2.Kitabxana database-i qurursunuz


Books:
 - Id
 - Name - max 100, min 2
 - AuthorId
 - PageCount - min 10


Authors:
 - Id
 - Name
 - Surname


Books ve Authors table-larınız olsun
 (one to many realtion) Id,Name,PageCount ve
 AuthorFullName columnlarının valuelarını
qaytaran bir view yaradın


Göndərilmiş axtarış dəyərinə görə həmin axtarış
 dəyəri name və ya authorFullName-lərində olan Book-ları
 Id,Name,PageCount,AuthorFullName columnları şəklində
 göstərən procedure yazın


Authors table-nın insert,update və deleti üçün (hər biri üçün ayrıca) procedure yaradın

Birinci dbdesigner-də sturukturu qurub onun şəklini atırsınız, sonra queryler
Authors-ları Id,FullName,BooksCount,MaxPageCount şəklində qaytaran view yaradırsınız
Id-author id-si
FullName - Name ve Surname birləşməsi
BooksCount - Həmin authorun əlaqəli olduğu kitabların sayı
MaxPageCount - həmin authorun əlaqəli olduğu kitabların içərisindəki max pagecount dəyəri

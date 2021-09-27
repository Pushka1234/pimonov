program Laba1;
Uses Crt;
Uses System.IO;

const 
  ProductsFileName = 'D:\Programs\PABCWork.NET\Laba1\products.dat';
  OrdersFileName = 'D:\Programs\PABCWork.NET\Laba1\orders.dat';
  
Type Product = Record
  id  : integer;
  brand : String[20];
  price : real;
  category : String[20];
  available : integer;
end;

Type Order = Record
  id  : integer;
  surname : String[20];
  name : String[20];
  geting : string[20];
  amount : integer;
  end_data : string[8];
end;

var p: Product;
var o: Order;
Var fileOfProduct : File Of Product;
Var fileOfOrder : File Of Order;
var Fv: File Of String[100]; 
var f: text;
Var i: Integer; {Переменная цикла для вывода строк}
Var tmpp : Product;
Var tmpo : Order;
var input : string;
var input2 : integer;
var a :string;
label q;

{Процедуры}

procedure menu;
var i:integer;
Const MEN: Array[1..8] Of String=
('1. Добавление товара',
'2. Удаление товара',
'3. Вывести список товаров',
'4. Найти нужный продукт',
'5. Добавить заказ',
'6. Вывести список заказов',
'9. Удалить всю базу данных',
'10. Выход');
begin
  for i := low(MEN) to high(MEN) do begin
    writeln(MEN[i]);
  end;
end;

function countLines(f: file of product; fn: string):integer;
var fi:text;
    s:string;
    k:integer;
begin

assign(fi,fn);
reset(fi);
k:=0;
while not eof(fi) do
 begin
  readln(fi,s);
  k:=k+1;
 end;
countLines := k;
close(fi);
end;

//ADD NEW PRODUCT
procedure addNewProduct;
var id : string;
var brand : string;
var price : string;
var category : string;
var available : string;

var K:integer;
var Name:String;
var N:string;
var fi: text;
var tmp: Product;
var i: integer; 
begin  
  ReSet(fileOfProduct);  
  Seek(fileOfProduct, FileSize(fileOfProduct));
  if  (fileSize(fileOfProduct)=0) then
  begin
    writeln('Введите id');
    readln(id);
  end
  else
    begin
  Reset(fileOfProduct);
  while (not EoF(fileOfProduct)) do
  begin
    Read(fileOfProduct, tmp);   
    k:=k+1;
  end;
  close(fileOfProduct);

     end;
     
  id:=inttostr(k+1);
  writeln('Введите brand');
  readln(brand);
  writeln('Введите price');
  readln(price);
  writeln('Введите category');
  readln(category);
  writeln('Введите available');
  readln(available);
  
  p.id := strtoint(id);
  p.brand := brand;
  p.price := strtoreal(price);
  p.category := category;
  p.available := strtoint(available);
  Reset(fileOfProduct);
  Seek(fileOfProduct, FileSize(fileOfProduct));
  write(fileOfProduct, p);
  Close(fileOfProduct);
end;
//REMOVE PRODUCT
procedure removeProduct;
var id : integer;
var tmp:product;
Var
 f:text;
 f2:file of product;
 i,n:integer;
 s:string;
 fi:file of product;
 
begin
  Assign(fi, ProductsFileName);
  writeln('Укажите id того товара, который хотите удалить');
  readln(id);
  reset(fi);
  Assign(f2,'D:\Programs\PABCWork.NET\Laba1\2.dat');
  rewrite(f2);
  i:=0;
  while (not eof(fi)) do
  begin
   i:=i+1;
   read(fi,tmp);
   if (i<>id) then
   write(f2,tmp);
  end;
  Close(fi);
  Close(f2);
  Erase(fi);
  rename(f2,ProductsFileName);
end;
//LIST ALL PRODUCT
procedure listAllProduct;
var tmp: Product;
var i: integer; 
begin
  writeln('id   |   Brand   |   Price   |   Category  |  Available  |');
  Reset(fileOfProduct);
  while (not EoF(fileOfProduct)) do
  begin
    Read(fileOfProduct, tmp);   
    writeln(inttostr(tmp.id) + '      '+tmp.brand+ '       ' + tmp.price + '       ' + tmp.category+ '      ' + inttostr(tmp.available));
  end;
  close(fileOfProduct);
end;

//SEARCH PRODUCT
procedure searchProduct;
Const Men2: Array[1..2] Of String=
  ('1. по id',
  '2. по названию');
  var
    i:integer;
    input:string;
begin
  writeln('Выберите поиск');
  for i:=low(Men2) to high(Men2) do
  begin
    writeln(Men2[i]);
  end;
  readln(input);
  
end;

//ADD NEW Order
procedure addNewOrder;
var id : string;
var surname : string;
var geting : string;
var amount : string;
var end_data : string;

var K:integer;
var Name:String;
var N:string;
var fi: text;
var tmp: Order;
var i: integer; 
begin  
  ReSet(fileOfOrder);  
  Seek(fileOfOrder, FileSize(fileOfOrder));
  if  (fileSize(fileOfOrder)=0) then
  begin
    writeln('Введите id');
    readln(id);
  end
  else
    begin
    Reset(fileOfOrder);
    while (not EoF(fileOfOrder)) do
    begin
      Read(fileOfOrder, tmp);   
      k:=k+1;
    end;
    close(fileOfOrder);
    end;
     
  id:=inttostr(k+1);
  writeln('Введите surname');
  readln(surname);
  writeln('Введите geting');
  readln(geting);
  writeln('Введите amount');
  readln(amount);
  writeln('Введите end_data');
  readln(end_data);
  
  o.id := strtoint(id);
  o.surname := surname;
  o.geting := geting;
  o.amount := strtoint(amount);
  o.end_data := end_data;
  Reset(fileOfOrder);
  Seek(fileOfOrder, FileSize(fileOfOrder));
  write(fileOfOrder, o);
  Close(fileOfOrder);  
end;

//LIST ALL ORDER
procedure listAllOrder;
var tmp: Order;
var i: integer; 
begin
  writeln('id   |   Surname   |   Geting   |   Amount  |  End_data  |');
  Reset(fileOfOrder);
  while (not EoF(fileOfOrder)) do
  begin
    Read(fileOfOrder, tmp);   
    writeln(inttostr(tmp.id) + '      '+tmp.surname+ '       ' + tmp.geting + '       ' + tmp.amount+ '      ' + tmp.end_data);
  end;
  close(fileOfOrder);
end;

//DELETE DB
procedure deleteDB;
begin
  Erase(fileOfProduct);
  Erase(fileOfOrder);
end;

procedure exitFile;
begin
  writeln('Выход');
  exit;
end;

procedure openDB;
var i :integer;
begin
  assign(fileOfProduct, ProductsFileName);
  assign(fileOfOrder, OrdersFileName);
  var files := Directory.GetFiles('D:\Programs\PABCWork.NET\Laba1\','*.dat');
  if (files.Length = 2) then
    begin
      reset(fileOfProduct);
      reset(fileOfOrder);
      close(fileOfProduct);
      close(fileOfOrder);
    end
    else
    begin
      rewrite(fileOfProduct);
      close(fileOfProduct);

      rewrite(fileOfOrder);
      close(fileOfOrder);
    end;

end;

begin
 
  menu();
  openDB();
  q:
  writeln('Выберите цифру: ');
  readln(input);

  
  if (input in ['1','2','3','4','5','6','7','8','9','10'])  then
  begin
      case strtoint(input) of
      1:addNewProduct();
      2:removeProduct();
      3:listAllProduct();
      4:searchProduct();
      5:addNewOrder();
      6:listAllOrder();
      9:deleteDB();
  
    end;
    if (strtoint(input) = 10) then
    begin   
      exitFile();
      end
    else
    begin
      
      goto q;
    end
  end
  else
     begin 
       writeln('Ошибка ввода');
       goto q;
     end; 
  end.
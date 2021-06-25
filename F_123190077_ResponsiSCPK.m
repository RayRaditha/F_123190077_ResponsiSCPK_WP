%Metode WP
clc;clear; %clear command window

%tahap pertama
%Meng Import Data
%Mengambil data house age, distance to the nearest MRT station,number of convenience stores
data = xlsread('Real estate valuation data set.xlsx','C2:E51');
%Mengambil data house price of unit area.
harga = xlsread('Real estate valuation data set.xlsx','H2:H51'); 
x =[data harga];

%atribut tiap kriteria dengan 1 = benefit, 0 = cost
k=[1,0,1,0];
%bobot nilai
w = [3,5,4,1];

[m n]=size(x);
w=w./sum(w);

%tahap kedua
for j=1:n,
    if k(j)==0,
        w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%tahap terakhir melakukan perankingan
data = S/sum(S);
Descend = sort(data,'descend')

%Menampilkan nilai tertinggi sebagai rekomendasi
%real estate terbaik
Real_Estate_Terbaik = max(data) 
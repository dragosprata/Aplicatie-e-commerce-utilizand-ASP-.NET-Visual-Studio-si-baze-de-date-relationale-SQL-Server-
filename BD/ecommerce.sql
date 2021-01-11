use ecommerce
create table tbl_admin
(
ad_id int identity primary key,
ad_email nvarchar(50) not null unique,
ad_password nvarchar(50) not null,
ad_phone nvarchar(50) not null unique
)

create table tbl_product_category
(
cat_id int identity primary key,
cat_name nvarchar(50) not null unique
)

create table tbl_product_items
(
pro_id int identity primary key,
pro_name nvarchar(50) not null,
pro_posted_date date,
pro_price float,
pro_status int default 0,
pro_image nvarchar(max),
pro_fk_ad int foreign key references tbl_admin(ad_id),
pro_fk_cat int foreign key references tbl_product_category(cat_id)
)

insert into tbl_product_category values ('Mobile')
insert into tbl_product_category values ('Home Appliance')
insert into tbl_product_category values ('Vehicles')
insert into tbl_product_category values ('Kids')
insert into tbl_product_category values ('Services')
insert into tbl_product_category values ('Animals')
insert into tbl_product_category values ('Property')
insert into tbl_product_category values ('Fashion')

select * from tbl_admin
select * from tbl_product_category
select * from tbl_product_items

/************************************************
store procedure
************************************************/
GO
create proc spinsert_admin(
@ad_email nvarchar(50),
@ad_password nvarchar(50),
@ad_phone nvarchar(50),
@id int out
)
as
begin
insert into tbl_admin
values(@ad_email ,@ad_password,@ad_phone);

select @id=SCOPE_IDENTITY()

end

select count(ad_id)
from tbl_admin
where ad_email='pratadragos96@yahoo.com'

/************************************************
store procedure
************************************************/

GO
create proc sp_insert_product
(
@pro_name nvarchar(50),
@pro_posted_date date ,
@pro_price float,
@pro_image nvarchar(max),
@pro_fk_ad int,
@pro_fk_cat int,
@pro_id int out
)
as
begin 

insert into tbl_product_items(pro_name,pro_posted_date,pro_price,pro_status,pro_image,pro_fk_ad,pro_fk_cat)
values(
@pro_name ,
@pro_posted_date ,
@pro_price ,1,
@pro_image ,
@pro_fk_ad ,
@pro_fk_cat
)

select @pro_id=SCOPE_IDENTITY()

end

select * 
from tbl_product_items i 
inner join tbl_product_category c on c.cat_id=i.pro_fk_cat

delete from tbl_product_items

/************************************************
store procedure
************************************************/
GO
CREATE PROCEDURE GetproductsPageWise
      @pro_fk_cat int,
      @PageIndex INT = 1,
	  @PageSize INT = 10,
      @RecordCount INT OUTPUT
AS
BEGIN
      SET NOCOUNT ON;
      SELECT ROW_NUMBER() OVER
      (
            ORDER BY pro_id desc
      )AS RowNumber,

      pro_name,
      pro_price,
	  pro_image,
	  pro_id
	
     INTO #Results
     FROM tbl_product_items
	 where pro_fk_cat=@pro_fk_cat and pro_status=1
     
     SELECT @RecordCount = COUNT(*)
     FROM #Results
           
     SELECT * FROM #Results
     WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
     
      DROP TABLE #Results
END
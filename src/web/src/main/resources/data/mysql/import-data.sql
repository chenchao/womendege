create or replace view activity_product_view as
SELECT
ap.activity_id as activityId,
ap.product_id as productId,
p.product_sub_code as productCode,
p.product_sub_name as productName,
i.picture_url as productImg,
p.product_price as price,
p.product_unit as unit,
a.discount as discount,
a.activity_type as activityType
from activity_product ap, activity a,product_detail p,product_picture i
where ap.activity_id=a.id and ap.product_id=p.id and ap.product_id=i.id and p.product_shelves=1
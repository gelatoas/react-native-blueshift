export interface CheckoutCartParams {
  products: Product[];
  revenue: number;
  discount: number;
  coupon: string;
  details?: Object;
}

export interface Product {
  sku: string;
  quantity: number;
  price: number;
}

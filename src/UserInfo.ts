export interface DateOfBirth {
  birth_day: number;
  birth_month: number;
  birth_year: number;
}

export interface UserInfo {
  email?: string;
  retailer_customer_id?: string;
  name?: string;
  firstname?: string;
  lastname?: string;
  gender?: string;
  joined_at?: number;
  facebook_id?: string;
  education?: string;
  unsubscribed?: boolean;
  details?: Object;
  dateOfBirth?: DateOfBirth;
}

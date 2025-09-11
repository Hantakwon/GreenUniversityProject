package dto.collegelife;

public class MealDTO {

	private int meal_id;
	private String meal_date;
	private String meal_type;
	private String meal_name;
	private String meal_price;
	private String created_at;
	public int getMeal_id() {
		return meal_id;
	}
	public void setMeal_id(int meal_id) {
		this.meal_id = meal_id;
	}
	public String getMeal_date() {
		return meal_date;
	}
	public void setMeal_date(String meal_date) {
		this.meal_date = meal_date;
	}
	public String getMeal_type() {
		return meal_type;
	}
	public void setMeal_type(String meal_type) {
		this.meal_type = meal_type;
	}
	public String getMeal_name() {
		return meal_name;
	}
	public void setMeal_name(String meal_name) {
		this.meal_name = meal_name;
	}
	public String getMeal_price() {
		return meal_price;
	}
	public void setMeal_price(String meal_price) {
		this.meal_price = meal_price;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	@Override
	public String toString() {
		return "MealDTO [meal_id=" + meal_id + ", meal_date=" + meal_date + ", meal_type=" + meal_type + ", meal_name="
				+ meal_name + ", meal_price=" + meal_price + ", created_at=" + created_at + "]";
	}
	
}

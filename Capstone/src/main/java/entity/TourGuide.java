package entity;

public class TourGuide {
	private int id;
	private String guideName;
	private String location;
	private String imgName;
	
	public TourGuide() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TourGuide(int id, String guideName, String location, String imgName) {
		super();
		this.id = id;
		this.guideName = guideName;
		this.location = location;
		this.imgName = imgName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuideName() {
		return guideName;
	}

	public void setGuideName(String guideName) {
		this.guideName = guideName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	
}



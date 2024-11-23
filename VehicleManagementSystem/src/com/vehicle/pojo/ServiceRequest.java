package com.vehicle.pojo;

public class ServiceRequest {
	
	private int requestId;
	private String requestedBy;
	private String requestedForDate;
	private String vehicleType;
	private String vehicleName;
	private String vehicleNo;
	private String status;
	private String isFeedbackGiven;
	private String feedbackText;
	private String rating;
	private String serviceDetails;
	public ServiceRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ServiceRequest(int requestId, String requestedBy, String requestedForDate, String vehicleType,
			String vehicleName, String vehicleNo, String status, String isFeedbackGiven, String feedbackText,
			String rating, String serviceDetails) {
		super();
		this.requestId = requestId;
		this.requestedBy = requestedBy;
		this.requestedForDate = requestedForDate;
		this.vehicleType = vehicleType;
		this.vehicleName = vehicleName;
		this.vehicleNo = vehicleNo;
		this.status = status;
		this.isFeedbackGiven = isFeedbackGiven;
		this.feedbackText = feedbackText;
		this.rating = rating;
		this.serviceDetails = serviceDetails;
	}
	public int getRequestId() {
		return requestId;
	}
	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}
	public String getRequestedBy() {
		return requestedBy;
	}
	public void setRequestedBy(String requestedBy) {
		this.requestedBy = requestedBy;
	}
	public String getRequestedForDate() {
		return requestedForDate;
	}
	public void setRequestedForDate(String requestedForDate) {
		this.requestedForDate = requestedForDate;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIsFeedbackGiven() {
		return isFeedbackGiven;
	}
	public void setIsFeedbackGiven(String isFeedbackGiven) {
		this.isFeedbackGiven = isFeedbackGiven;
	}
	public String getFeedbackText() {
		return feedbackText;
	}
	public void setFeedbackText(String feedbackText) {
		this.feedbackText = feedbackText;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getServiceDetails() {
		return serviceDetails;
	}
	public void setServiceDetails(String serviceDetails) {
		this.serviceDetails = serviceDetails;
	}
	@Override
	public String toString() {
		return "ServiceRequest [requestId=" + requestId + ", requestedBy=" + requestedBy + ", requestedForDate="
				+ requestedForDate + ", vehicleType=" + vehicleType + ", vehicleName=" + vehicleName + ", vehicleNo="
				+ vehicleNo + ", status=" + status + ", isFeedbackGiven=" + isFeedbackGiven + ", feedbackText="
				+ feedbackText + ", rating=" + rating + ", serviceDetails=" + serviceDetails + "]";
	}

}

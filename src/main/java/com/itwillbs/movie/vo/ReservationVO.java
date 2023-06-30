package com.itwillbs.movie.vo;

public class ReservationVO {
	private String resCode;
	private String schCd;
	private String MovieCd;
	private String ScreenCd;
	private String CinemaCd;
	private String MovieDate;
	private String MovieNm;
	private String CinemaNm;
	private String totalCnt;
	private String totalAmt;
	private String resPayment;
	private String buyerTel;
	private String resPayDone;
	private String seatLine;
	private String seatNum;
	private String seatNm;
	
	
	private String ScreenTime;
	private String HidMovieUrl;
	private String HidRating;
	private String showDate;
	private String genre;
	private String ScreenNm;
	private String NormalCnt;
	private String OldCnt;
	private String YoungCnt;
	private String TicketAmt;
	private String NormalPrice;
	private String OldPrice;
	private String YoungPrice;
	private String resPay;
	private String Point;
	
	
	
	
	
	public ReservationVO() {
	}





	public ReservationVO(String resCode, String schCd, String movieCd, String screenCd, String cinemaCd,
			String movieDate, String movieNm, String cinemaNm, String totalCnt, String totalAmt, String resPayment,
			String buyerTel, String resPayDone, String seatLine, String seatNum, String seatNm, String screenTime,
			String hidMovieUrl, String hidRating, String showDate, String genre, String screenNm, String normalCnt,
			String oldCnt, String youngCnt, String ticketAmt, String normalPrice, String oldPrice, String youngPrice,
			String resPay, String point) {
		super();
		this.resCode = resCode;
		this.schCd = schCd;
		MovieCd = movieCd;
		ScreenCd = screenCd;
		CinemaCd = cinemaCd;
		MovieDate = movieDate;
		MovieNm = movieNm;
		CinemaNm = cinemaNm;
		this.totalCnt = totalCnt;
		this.totalAmt = totalAmt;
		this.resPayment = resPayment;
		this.buyerTel = buyerTel;
		this.resPayDone = resPayDone;
		this.seatLine = seatLine;
		this.seatNum = seatNum;
		this.seatNm = seatNm;
		ScreenTime = screenTime;
		HidMovieUrl = hidMovieUrl;
		HidRating = hidRating;
		this.showDate = showDate;
		this.genre = genre;
		ScreenNm = screenNm;
		NormalCnt = normalCnt;
		OldCnt = oldCnt;
		YoungCnt = youngCnt;
		TicketAmt = ticketAmt;
		NormalPrice = normalPrice;
		OldPrice = oldPrice;
		YoungPrice = youngPrice;
		this.resPay = resPay;
		Point = point;
	}





	public String getResCode() {
		return resCode;
	}





	public void setResCode(String resCode) {
		this.resCode = resCode;
	}





	public String getSchCd() {
		return schCd;
	}





	public void setSchCd(String schCd) {
		this.schCd = schCd;
	}





	public String getMovieCd() {
		return MovieCd;
	}





	public void setMovieCd(String movieCd) {
		MovieCd = movieCd;
	}





	public String getScreenCd() {
		return ScreenCd;
	}





	public void setScreenCd(String screenCd) {
		ScreenCd = screenCd;
	}





	public String getCinemaCd() {
		return CinemaCd;
	}





	public void setCinemaCd(String cinemaCd) {
		CinemaCd = cinemaCd;
	}





	public String getMovieDate() {
		return MovieDate;
	}





	public void setMovieDate(String movieDate) {
		MovieDate = movieDate;
	}





	public String getMovieNm() {
		return MovieNm;
	}





	public void setMovieNm(String movieNm) {
		MovieNm = movieNm;
	}





	public String getCinemaNm() {
		return CinemaNm;
	}





	public void setCinemaNm(String cinemaNm) {
		CinemaNm = cinemaNm;
	}





	public String getTotalCnt() {
		return totalCnt;
	}





	public void setTotalCnt(String totalCnt) {
		this.totalCnt = totalCnt;
	}





	public String getTotalAmt() {
		return totalAmt;
	}





	public void setTotalAmt(String totalAmt) {
		this.totalAmt = totalAmt;
	}





	public String getResPayment() {
		return resPayment;
	}





	public void setResPayment(String resPayment) {
		this.resPayment = resPayment;
	}





	public String getBuyerTel() {
		return buyerTel;
	}





	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
	}





	public String getResPayDone() {
		return resPayDone;
	}





	public void setResPayDone(String resPayDone) {
		this.resPayDone = resPayDone;
	}





	public String getSeatLine() {
		return seatLine;
	}





	public void setSeatLine(String seatLine) {
		this.seatLine = seatLine;
	}





	public String getSeatNum() {
		return seatNum;
	}





	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}





	public String getSeatNm() {
		return seatNm;
	}





	public void setSeatNm(String seatNm) {
		this.seatNm = seatNm;
	}





	public String getScreenTime() {
		return ScreenTime;
	}





	public void setScreenTime(String screenTime) {
		ScreenTime = screenTime;
	}





	public String getHidMovieUrl() {
		return HidMovieUrl;
	}





	public void setHidMovieUrl(String hidMovieUrl) {
		HidMovieUrl = hidMovieUrl;
	}





	public String getHidRating() {
		return HidRating;
	}





	public void setHidRating(String hidRating) {
		HidRating = hidRating;
	}





	public String getShowDate() {
		return showDate;
	}





	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}





	public String getGenre() {
		return genre;
	}





	public void setGenre(String genre) {
		this.genre = genre;
	}





	public String getScreenNm() {
		return ScreenNm;
	}





	public void setScreenNm(String screenNm) {
		ScreenNm = screenNm;
	}





	public String getNormalCnt() {
		return NormalCnt;
	}





	public void setNormalCnt(String normalCnt) {
		NormalCnt = normalCnt;
	}





	public String getOldCnt() {
		return OldCnt;
	}





	public void setOldCnt(String oldCnt) {
		OldCnt = oldCnt;
	}





	public String getYoungCnt() {
		return YoungCnt;
	}





	public void setYoungCnt(String youngCnt) {
		YoungCnt = youngCnt;
	}





	public String getTicketAmt() {
		return TicketAmt;
	}





	public void setTicketAmt(String ticketAmt) {
		TicketAmt = ticketAmt;
	}





	public String getNormalPrice() {
		return NormalPrice;
	}





	public void setNormalPrice(String normalPrice) {
		NormalPrice = normalPrice;
	}





	public String getOldPrice() {
		return OldPrice;
	}





	public void setOldPrice(String oldPrice) {
		OldPrice = oldPrice;
	}





	public String getYoungPrice() {
		return YoungPrice;
	}





	public void setYoungPrice(String youngPrice) {
		YoungPrice = youngPrice;
	}





	public String getResPay() {
		return resPay;
	}





	public void setResPay(String resPay) {
		this.resPay = resPay;
	}





	public String getPoint() {
		return Point;
	}





	public void setPoint(String point) {
		Point = point;
	}





	@Override
	public String toString() {
		return "ReservationVO [resCode=" + resCode + ", schCd=" + schCd + ", MovieCd=" + MovieCd + ", ScreenCd="
				+ ScreenCd + ", CinemaCd=" + CinemaCd + ", MovieDate=" + MovieDate + ", MovieNm=" + MovieNm
				+ ", CinemaNm=" + CinemaNm + ", totalCnt=" + totalCnt + ", totalAmt=" + totalAmt + ", resPayment="
				+ resPayment + ", buyerTel=" + buyerTel + ", resPayDone=" + resPayDone + ", seatLine=" + seatLine
				+ ", seatNum=" + seatNum + ", seatNm=" + seatNm + ", ScreenTime=" + ScreenTime + ", HidMovieUrl="
				+ HidMovieUrl + ", HidRating=" + HidRating + ", showDate=" + showDate + ", genre=" + genre
				+ ", ScreenNm=" + ScreenNm + ", NormalCnt=" + NormalCnt + ", OldCnt=" + OldCnt + ", YoungCnt="
				+ YoungCnt + ", TicketAmt=" + TicketAmt + ", NormalPrice=" + NormalPrice + ", OldPrice=" + OldPrice
				+ ", YoungPrice=" + YoungPrice + ", resPay=" + resPay + ", Point=" + Point + "]";
	}




	

		
}

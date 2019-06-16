package cn.edu.imnu.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import cn.edu.imnu.itoffer.bean.ResumeBasicinfo;
import cn.edu.imnu.itoffer.servlet.ResumeBasicinfoServlet;
import cn.edu.imnu.itoffer.util.DBUtil;

public class ResumeDAO {

	public int add(ResumeBasicinfo basicinfo, int applicantID) {
		// TODO Auto-generated method stub
		int basicinfoID = 0;
		String sql = "INSERT INTO tb_resume_basicinfo("+"basicinfo_id,realname,gender,birthday,current_loc,"+"resident_loc,telephone,email,job_intension,job_experience,head_shot,applicant_id)"+"VALUES(SEQ_ITOFFER_RESUMEBASICINFO.NEXTVAL,?,?,?,?,?,?,?,?)";
	
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, basicinfo.getServletName());
			pstmt.setString(2, basicinfo.getGender());
			pstmt.setTimestamp(3, basicinfo.getBirthday() == null ? null : new Timestamp(basicinfo.getBirthday().getTime()));
			pstmt.setString(4, basicinfo.CurrentLoc());
			pstmt.setString(5, basicinfo.ResidentLoc());
			pstmt.setString(6, basicinfo.getTelephone());
			pstmt.setString(7, basicinfo.getEmail());
			pstmt.setString(8, basicinfo.getJobIntension());
			pstmt.setString(9, basicinfo.getJobExperience());
			pstmt.setString(10, basicinfo.getHeadShot());
			pstmt.setInt(11, applicantID);
			pstmt.executeUpdate();
			String sql2 = "SELECT SEQ_ITOFFER_RESUMEBASICINFO.CURRVAL FROM dual";
			pstmt = conn.prepareStatement(sql2);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				basicinfoID = rs.getInt(1);
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return basicinfoID;
	}

}

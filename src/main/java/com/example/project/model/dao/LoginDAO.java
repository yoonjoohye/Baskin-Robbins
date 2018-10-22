package com.example.project.model.dao;

import javax.servlet.http.HttpSession;
import com.example.project.model.dto.MemberVO;
 
public interface LoginDAO {
    // 01_01. ȸ�� �α��� üũ
    public boolean loginCheck(MemberVO vo);
    // 01_02. ȸ�� �α��� ����
    public MemberVO viewMember(MemberVO vo);
    // 02. ȸ�� �α׾ƿ�
    public void logout(HttpSession session);
}

package com.example.project.model.dao;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.dto.MemberVO;

@Repository // ���� Ŭ������ ���������� �����ϴ� dao bean���� ���
public class LoginDAOImpl implements LoginDAO {
   // SqlSession ��ü�� �����ο��� �����Ͽ� ����
   // �������� ����(Dependency Injection), ������ ����
   @Inject
   SqlSession sqlSession; // mybatis ���� ��ü
   
   // 01_01. ȸ�� �α���üũ
   @Override
   public boolean loginCheck(MemberVO vo) {
       String name = sqlSession.selectOne("login.loginCheck", vo);
       return (name == null) ? false : true;
   }
   // 01_02. ȸ�� �α��� ����
   @Override
   public MemberVO viewMember(MemberVO vo) {
       return sqlSession.selectOne("login.viewMember", vo);
   }
   // 02. ȸ�� �α׾ƿ�
   @Override
   public void logout(HttpSession sessin) {
   }
}

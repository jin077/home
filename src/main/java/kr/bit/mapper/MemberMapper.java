package kr.bit.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.bit.entity.Member;

@Mapper //- Mybatis API
public interface MemberMapper {	 
	public Member memberDbCheck(String memberId);

}

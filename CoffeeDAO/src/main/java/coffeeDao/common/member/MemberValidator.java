package coffeeDao.common.member;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.ValidationUtils;

import coffeeDao.model.MemberBean;

public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		MemberBean member = (MemberBean)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_ID", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_PWD", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_NAME", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_EMAIL", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_ADDR1", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_ADDR2", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_ZP", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_PHONE", "required");
		
		if(member.getMEM_ZP().length()<5) {
			errors.rejectValue("MEM_ZP", "length");
		}
	}

}

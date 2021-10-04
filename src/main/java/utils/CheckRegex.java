package utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckRegex {
    public static boolean validateName(String regex) {
        String REGEX = "^([AÀẢÃÁẠĂẰẮẲẴẶÂẤẦẨẪẬBCDĐEÈÉẺẼẸÊỀẾỂỄỆFGHIÍÌỈĨỊJKLMNOÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢPQRSTUÙÚỦŨỤƯỪỨỬỮỰVWXYÝỲỶỸỴZ]" +
                "[aàảãáạăằẳẵắặâầẩẫấậbcdđeèẻẽéẹêềểễếệfghiìỉĩíịjklmnoòỏõóọôồổỗốộơờởỡớợpqrstuùủũúụưừửữứựvwxyỳỷỹýỵz]+[ ]*)+$";
        Pattern pattern = Pattern.compile(REGEX);
        Matcher matcher = pattern.matcher(regex);
        return matcher.matches();
    }

    public static boolean validateMail(String regex) {
        String REGEX = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
        Pattern pattern = Pattern.compile(REGEX);
        Matcher  matcher = pattern.matcher(regex);
        return matcher.matches();
    }

    public static boolean validatePhone(String regex) {
//        String REGEX = "^(\\+\\d{1,3}( )?)?((\\(\\d{3}\\))|\\d{3})[- .]?\\d{3}[- .]?\\d{4}$";
        String REGEX = "(84|0[3|5|7|8|9])+([0-9]{8})\\b";
        Pattern pattern = Pattern.compile(REGEX);
        Matcher  matcher = pattern.matcher(regex);
        return matcher.matches();
    }

    public static boolean isNumeric(String strNum) {
        if (strNum == null) {
            return false;
        }
        try {
            float d = Float.parseFloat(strNum);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }
}

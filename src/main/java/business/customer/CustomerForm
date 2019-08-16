package business.customer;

import java.util.Calendar;
import java.util.Date;

public class CustomerForm {

    private String name;
    private String address;
    private String phone;
    private String email;
    private String creditCard;
    private Date ccExpDate;
    private String ccMonth;
    private String ccYear;

    private boolean hasNameError;
    private boolean hasAddressError;
    private boolean hasPhoneError;
    private boolean hasEmailError;
    private boolean hasCreditCardError;
    private boolean hasCcMonthError;

    public CustomerForm() {
        this("", "", "", "", "", String.valueOf(Calendar.getInstance().get(Calendar.MONTH)), String.valueOf(Calendar.getInstance().get(Calendar.YEAR)));
    }

    public CustomerForm(String name, String address, String phone, String email, String creditCard, String ccMonth, String ccYear) {
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.creditCard = creditCard;
        this.ccMonth = ccMonth;
        this.ccYear = ccYear;
        ccExpDate = getCcExpDate(ccMonth, ccYear);
        validate();
    }

    // Get methods for fields

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getCreditCard() {
        return creditCard;
    }

    public String getCcMonth() {
        return ccMonth;
    }

    public String getCcYear() {
        return ccYear;
    }

    public Date getCcExpDate() {
        return ccExpDate;
    }

    // hasError methods for fields

    public boolean getHasNameError() {
        return hasNameError;
    }

    public boolean getHasAddressError() {
        return hasAddressError;
    }

    public boolean getHasPhoneError() {
        return hasPhoneError;
    }

    public boolean getHasEmailError() {
        return hasEmailError;
    }

    public boolean getHasCreditCardError() {
        return hasCreditCardError;
    }

    public boolean getHasCcMonthError() {
        return hasCcMonthError;
    }

    public boolean getHasFieldError() {
        return hasNameError || hasAddressError || hasPhoneError || hasEmailError || hasCreditCardError || hasCcMonthError;
    }

    // error messages for fields

    public String getNameErrorMessage() {
        return "Valid name required (ex: Johnny Mnemonic)";
    }

    public String getAddressErrorMessage() {
        return "Valid address required (ex: 123 Abc Street)";
    }

    public String getPhoneErrorMessage() {
        return "Valid US phone number has 10 digits";
    }

    public String getEmailErrorMessage() {
        return "Valid email required (ex: johnny@mnemonic.com)";
    }

    public String getCreditCardErrorMessage() {
        return "Valid credit card number is between 14 to 16 digits";
    }

    public String getCcMonthErrorMessage() {
        return "Valid credit card expiration month is after current month";
    }

    private void validate() {
        if (name == null || name.equals("") || name.length() > 45) {
            hasNameError = true;
        }

        boolean phoneIsInvalid = false;
        boolean emailIsInvalid = false;
        boolean creditCardIsInvalid = false;
        boolean ccMonthIsInvalid = false;

        // strip all digits from phone String
        // String phoneDigits = phone.replaceAll("\\D", "");

        // address check:
        if (address == null || address.equals("")) {
            hasAddressError = true;
        }

        // phone number check:
        // get rid of all spaces, parens, and dashes
        String phoneDigits = phone.replaceAll("-", "");
        String phoneDigitsPlus = phoneDigits.replaceAll("[()]", "");
        if (phone == null || phone.equals("")) {
            phoneIsInvalid = true;
        }
        if (!phoneDigitsPlus.matches("\\d+")) {
            phoneIsInvalid = true;
        }
        if (phoneDigitsPlus.length() != 10) {
            phoneIsInvalid = true;
        }

        // email check:
        if (email == null || email.equals("")) {
            emailIsInvalid = true;
        }
        if (!email.contains("\\@") && email.contains(" ") && !email.endsWith("\\.")) {
            emailIsInvalid = true;
        }

        // credit card check:
        // get rid of all characters except digits
        String creditCardDigits = creditCard.replaceAll("\\D", "");
        if (creditCard == null || creditCard.equals("")) {
            creditCardIsInvalid = true;
        }
        if (!creditCardDigits.matches("\\d+")) {
            creditCardIsInvalid = true;
        }
        if (creditCardDigits.length() <= 13 || creditCardDigits.length() >= 17) {
            creditCardIsInvalid = true;
        }

        // credit card exp date check:
        if (ccExpDate == null || creditCard.equals("")) {
            creditCardIsInvalid = true;
        }
        Calendar cal = Calendar.getInstance();
        //cal.set(Calendar.MONTH, + 1);
        Date date = cal.getTime();
        if (ccExpDate.before(date)) {
            ccMonthIsInvalid = true;
        }

        // isInvalid checks
        if (phoneIsInvalid) {
            hasPhoneError = true;
        }
        if (emailIsInvalid) {
            hasEmailError = true;
        }
        if (creditCardIsInvalid) {
            hasCreditCardError = true;
        }
        if (ccMonthIsInvalid) {
            hasCcMonthError = true;
        }
    }

    // Returns a Java date object with the specified month and year
    private Date getCcExpDate(String monthString, String yearString) {
        int ccMonth = Integer.parseInt(monthString);
        int ccYear = Integer.parseInt(yearString);
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.MONTH, ccMonth - 1);
        cal.set(Calendar.YEAR, ccYear);
        Date expDate = cal.getTime();
        return expDate;
    }
}

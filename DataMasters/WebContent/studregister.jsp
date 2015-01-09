<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Student Registration</title>
<script>
	function validate(fname, lname,email,street, city, state, country,zipcode,username,pwd,cpwd) {
		if (fname == null || fname == "") {
			alert("Please enter First Name");
			return false;
		}
		if (lname == null || lname == "") {
			alert("Please enter Last Name");
			return false;
		}
		if (email == null || email == "") {
			alert("Please enter Email ID");
			return false;
		}
		if (street == null || street == "") {
			alert("Please enter Street Address");
			return false;
		}
		if (city == null || city == "") {
			alert("Please enter City");
			return false;
		}
		if (state == null || state == "") {
			alert("Please enter State");
			return false;
		}
		if (country == null || country == "") {
			alert("Please enter Country");
			return false;
		}
		if (zipcode == null || zipcode == "") {
			alert("Please enter Zipcode");
			return false;
		}
		if (username == null || username == "") {
			alert("Please enter User Name");
			return false;
		}
		if (pwd == null || pwd == "") {
			alert("Please enter Password");
			return false;
		}
		if (cpwd == null || cpwd == "") {
			alert("Please enter Confirm Password");
			return false;
		}
		if (pwd!= cpwd ) {
			alert("Password and Confirm Password should match");
			return false;
		}

		return true;
	}
	function isNumberKey(evt)
    {
       var charCode = (evt.which) ? evt.which : evt.keyCode;
       if (charCode != 46 && charCode > 31 
         && (charCode < 48 || charCode > 57))
          return false;

       return true;
    }
</script>
</head>

<body>
	<form action="loginsuccessful" method="post" 
	onsubmit="return validate(this.fname.value, this.lname.value,this.email.value,this.street.value, this.city.value, this.state.value, this.country.value,this.zipcode.value,this.username.value, this.pwd.value, this.cpwd.value);">
		<h2 align="center">Student Registration</h2>
		<table cellpadding="10" cellspacing="10" border="2" rules="none"
			frame="box" align="center">
			<tr>
				<td><div align="right">First Name :</div></td>
				<td width="253" colspan="2"><div align="left">
						<input name="fname" type="text" id="fname" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Last Name :</div></td>
				<td colspan="2"><div align="left">
						<input name="lname" type="text" id="lname" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Description :</div></td>
				<td colspan="2"><div align="left">
						<textarea name="desc"></textarea>
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Gender :</div></td>
				<td colspan="2"><div align="left">
						<input name="gender" type="radio" value="Male" checked="checked" />
						Male <input name="gender" type="radio" value="Female" /> Female
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Email :</div></td>
				<td colspan="2"><div align="left">
						<input name="email" type="text" id="email" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">GPA :</div></td>
				<td colspan="2"><div align="left">
						<input name="gpa" type="text" id="gpa" onkeypress="return isNumberKey(event)"/>
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Street :</div></td>
				<td colspan="2"><div align="left">
						<input name="street" type="text" id="street" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">City :</div></td>
				<td colspan="2"><div align="left">
						<input name="city" type="text" id="city" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">State :</div></td>
				<td colspan="2"><div align="left">
						<input name="state" type="text" id="state" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Country :</div></td>
				<td colspan="2"><div align="left">
						<input name="country" type="text" id="country" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Zip Code :</div></td>
				<td colspan="2"><div align="left">
						<input name="zipcode" type="text" id="zipcode" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Major :</div></td>
				<td colspan="2"><div align="left">
						<input name="major" type="text" id="major" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Minor :</div></td>
				<td colspan="2"><div align="left">
						<input name="minor" type="text" id="minor" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Username :</div></td>
				<td colspan="2"><div align="left">
						<input name="username" type="text" id="username" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Password :</div></td>
				<td colspan="2"><div align="left">
						<input name="pwd" type="password" id="pwd" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right">Confirm Password :</div></td>
				<td colspan="2"><div align="left">
						<input name="cpwd" type="password" id="cpwd" />
					</div></td>
			</tr>
			<tr>
				<td><div align="right"></div></td>
				<td><input type="submit" name="Submit" value="Submit" /> <input
					type="reset" name="Submit2" value="Reset" /></td>

			</tr>
		</table>
		<input type="hidden" name="FromPage" value="AddStudent" />
	</form>
</body>
</html>
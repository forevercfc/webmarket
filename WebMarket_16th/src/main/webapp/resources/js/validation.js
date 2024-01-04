/**
 * validation
 */

function checkAddProduct() {
	let productId = document.getElementById("productId");
	let name = document.getElementById("name");
	let unitPrice = document.getElementById("unitPrice");
	let unitsInStock = document.getElementById("unitsInStock");
	let image = document.newProduct.productImage;

	/*
	[1]상품 아이디 productId : 첫글자를 반드시 P로 시작하고 숫자를 조합해서 5-12자리까지 입력
	[2]상품명 name : 최소 4-50자리까지 입력
	[3]상품 가격 unitPrice : 숫자만 입력 , 음수 입력 X , 소숫점 입력한다면 둘째 자리까지만 입력
	[4]재고수 unitsInStock : 숫자만 입력
	[5]이미지 productImage : 이미지 등록 안하면 submit 제출 등록안됨
	*/

	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		} else {
			alert(msg);
			e.select();
			e.focus();
			return false;
		}
	}
	//상품 아이디 체크	
	if (!check(/^P[0-9]{4,11}$/, productId, "[상품 코드]\nP와 숫자를 조합해서 5-12자리까지 입력하세요. \n 첫 글자는 반드시 P로 시작하세요.")) return false;

	//상품명 체크
	if (name.value.length < 4 || name.value.length > 50) {
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}

	//상품 가격 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[상품 가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	
	if (unitPrice.value < 0) {
		alert("[상품 가격]\n음수를 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]{0}?)$/, unitPrice, "[상품 가격]\n소수점 자리수는 입력 안됩니다.")) {
		return false;
	}

	//재고수 체크
	if (unitsInStock.value.length == 0 || isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}

	//이미지 유무 체크
	if (!(image.value)) {
		alert("제품의 이미지를 첨부해주세요.");
		return false;
	}

	document.newProduct.submit();
}












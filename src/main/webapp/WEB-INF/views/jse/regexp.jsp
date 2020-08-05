<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- ===================== Basic Setting ===================== -->
<div id="regexp">
    <div class="" id="header">
        <div class="container">
            <div class="row">
                <!-- 정규식 입력  -->
                <div class="col-4">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" class="reg">Reg</span>
                        </div>
                        <input type="text" class="form-control h-txt" id="regExp" placeholder="정규식">
                    </div>
                </div>
                <!-- 검증 텍스트 입력 -->
                <div class="col">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                        <span class="input-group-text">Text</span>
                        </div>
                        <input type="text" class="form-control h-txt" id="text" placeholder="텍스트">
                    </div>
                </div>
                <div class="col-3">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                        <span class="input-group-text">Rep</span>
                        </div>
                        <input type="text" class="form-control h-txt" id="rep" placeholder="치환">
                        <input type="text" class="form-control h-txt" id="flag" placeholder="Flag">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">

                </div>
            </div>
            <!-- 결과 출력 -->
            <div class="row">
                <div class="col">
                    <div class="alert alert-dark text-center" role="alert">
                        <span id="result" class="h-txt">
                            Result
                        </span>
                    </div>
                </div>
                <div class="col-3">
                    <div class="alert alert-info text-center" role="alert">
                        <span id="regText" class="h-txt">
                            표현식
                        </span>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- 정규식 테이블 -->
    <div class="container" style="margin-bottom: 200px;">
        <table class="table table-bordered">
            <tbody></tbody>
        </table>
    </div>
</div>

<script>
$(()=>{

    const regExp = $('#regExp');
    const $regText = $('#regText');
    const text = $('#text');
    const output = $('#result');
    const $result_bar = $('#result').parent();
    const $rep = $('#rep');
    const $flag = $('#flag');

    // 정규식 검증
    $(text).keyup(regTest);
    $rep.keyup(regTest);
    $(regExp).keyup(regTest);
    $flag.keyup(regTest);

    function regTest(){

        if($(text).val().length == 0)
            return;

        if($flag.val() != null && $flag.val().length != 0){
            var reg = new RegExp($(regExp).val(), $flag.val());
        }
        else{
            var reg = new RegExp($(regExp).val());
        }

        $result_bar.removeClass('alert-danger')
                    .removeClass('alert-success')
                    .removeClass('alert-dark')
                    .removeClass('alert-primary');
        
        // 정규식 문자 치환
        if($rep.val() != null && $rep.val().length != 0){

            var result = $(text).val().replace(reg,$rep.val());

            $result_bar.addClass('alert-primary');
            $(output).html(result);
        }
        // 정규식 검증
        else{
            var result = reg.test($(text).val());

            if(result === true){
                $result_bar.addClass('alert-success');
                $(output).html('True');
            }
            else{
                $result_bar.addClass('alert-danger');
                $(output).html('False');
            }
        }

        $regText.text(reg);
    }

});

$(()=>{

    const tbody = $("tbody");
    let html = '';

    // 정규식 테이블 출력
    dataArr.forEach(obj => {
        
        if(obj.dec != null && obj.dec.length != 0){
            html += '<tr><td class="reg text-primary">';
            html += obj.reg.replace('<','&lt').replace('>','&gt');
            html += '</td><td class="text-dark">';
            html += obj.dec.replace('<','&lt').replace('>','&gt');
            html += '</td></tr>';
        }
        else{
            html += '<tr class="table-info"><td colspan="2" class="title-s">';
            html += obj.reg.replace('<','&lt').replace('>','&gt');
            html += '</td></tr>';
        }

    });
    
    $(tbody).html(html);

});

var dataArr = [
    { "reg": "Anchors — ^ and $"}
    ,{
        "reg": "^The",
        "dec": "The 로 시작하는 모든 문자열을 매칭"
    } 
    ,{
        "reg": "end$",
        "dec": "end로 끝나는 문자열과 매칭"
    }
    ,{
        "reg": "^The end$",
        "dec": "The end와 정확하게 일치하는 문자열을 매칭"
    }
    ,{
        "reg": "roar",
        "dec": "roar가 들어있는 모든 문자열과 매칭"
    }
    ,{
        "reg": "Quantifiers — *+? and {}"
    }
    ,{
        "reg": "abc*",
        "dec": "ab 그리고 0개 이상의 c 를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "abc+",
        "dec": "ab 그리고 1개 이상의 c 를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "abc?",
        "dec": "ab 그리고 0개 또는 1개의 c 를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "abc{2}",
        "dec": "ab 그리고 2개의 c 를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "abc{2,}",
        "dec": "ab 그리고 2개 이상의 c 를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "abc{2,5}",
        "dec": "ab 그리고 2개 이상 5개 이하의 c 를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "a(bc)*",
        "dec": "a 그리고 0개 이상의 bc를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "a(bc){2,5}",
        "dec": "a 그리고 2개 이상 5개 이하의 bc를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "OR operator — | or []"
    }
    ,{
        "reg": "a(b|c)",
        "dec": "a 그리고 b 또는 c를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "a[bc]",
        "dec": "위와 동일"
    }
    ,{
        "reg": "Character classes — \\d \\w \\s and ."
    }
    ,{
        "reg": "\\d",
        "dec": "숫자 하나와 매칭"
    }
    ,{
        "reg": "\\w",
        "dec": "문자(숫자, 영문, 언더바) 하나와 매칭"
    }
    ,{
        "reg": "\\s",
        "dec": "공백문자(탭, 줄바꿈, 스페이스) 하나와 매칭"
    }
    ,{
        "reg": ".",
        "dec": "모든 문자 하나와 매칭"
    }
    ,{
        "reg": "\\D",
        "dec": "숫자가 아닌 문자열 하나와 매칭"
    }
    ,{
        "reg": "\\$\\d",
        "dec": "$ 문자 그리고 숫자 하나와 매칭"
    }
    ,{
        "reg": "Flags"
    }
    ,{
        "reg": "g(global)",
        "dec": "문자열에서 첫번째 매칭 후, 끝나지 않고 매칭되는 모든 항목을 찾습니다"
    }
    ,{
        "reg": "m(multi-line)",
        "dec": "anchor(^ 또는 $)가 문자열 전체가 아닌, 줄 각각에 매칭하여 줄별로 정규식 패턴을 매칭시킬 수 있습니다"
    }
    ,{
        "reg": "i(insensitive)",
        "dec": "대소문자 구분을 무시하고 매칭합니다(예를 들어, /aBc/i는 AbC를 매칭합니다"
    }
    ,{
        "reg": "Grouping and capturing — ()"
    }
    ,{
        "reg": "a(bc)",
        "dec": "소괄호는 캡쳐 그룹을 생성합니"
    }
    ,{
        "reg": "a(?:bc)*",
        "dec": "?: 는 캡쳐 그룹생성을 무시합니다"
    }
    ,{
        "reg": "a(?<foo>bc)",
        "dec": "?<foo> 는 캡쳐 그룹에 이름을 지정합니다"
    }
    ,{
        "reg": "Bracket expressions — []"
    }
    ,{
        "reg": "[abc]",
        "dec": "a 또는 b 또는 c 를 포함하는 문자열과 매칭, a|b|c와 동일"
    }
    ,{
        "reg": "[a-c]",
        "dec": "위와 동일"
    }
    ,{
        "reg": "[a-fA-F0-9]",
        "dec": "16진수의 문자 하나와 매칭하고 대소문자를 구분하지 않습니다"
    }
    ,{
        "reg": "[0-9]%",
        "dec": "0이상 9이하 숫자 그리고 %문자를 포함한 문자열과 매칭"
    }
    ,{
        "reg": "[^a-zA-Z]",
        "dec": "영문이 아닌 문자와 매칭합니다 ^는 부정표현으로 사용"
    }
    ,{
        "reg": "Greedy and Lazy match"
    }
    ,{
        "reg": "<.+?>",
        "dec": "< 와 > 사이에 하나 이상의 문자와 매칭하고, 가능한 짧게 매칭"
    }
    ,{
        "reg": "<[^<>]+>",
        "dec": "< 와 > 사이에 <,>가 아닌 모든 문자가 하나 이상인 문자와 매칭"
    }
    ,{
        "reg": "Boundaries — \\b and \\B"
    }
    ,{
        "reg": "\\babc\\b",
        "dec": "abc와 동일한 문자를 매칭"
    }
    ,{
        "reg": "\\Babc\\B",
        "dec": "패턴이 단어로 완전히 둘러싸인 경우 매칭"
    }
    ,{
        "reg": "Back-references — \\1"
    }
    ,{
        "reg": "([abc])\\1",
        "dec": "\\1은 첫번째 캡쳐그룹과 동일한 패턴을 의미합니다"
    }
    ,{
        "reg": "([abc])([de])\\2\\1",
        "dec": "\\2는 두번째 캡쳐그룹과 동일한 패턴을 의미합니다([abc])([de])([de])([abc])와 동일합니다(\\3, 4 ... 매칭된 그룹을 의미합니다)"
    }
    ,{
        "reg": "(?<foo>[abc])\\k<foo>",
        "dec": "\\k<foo>는 foo이름으로 지정한 그룹을 참조합니다 결과는 첫번째와 동일합니다"
    }
    ,{
        "reg": "Look-ahead and Look-behind — (?=) and (?<=)"
    }
    ,{
        "reg": "d(?=r)",
        "dec": "r이 바로 뒤에 있는 d를 매칭합니다. 중요한 것은 r은 포함되지 않습니다."
    }
    ,{
        "reg": "(?<=r)d",
        "dec": "r이 바로 앞에 있는 d를 매칭합니다. 중요한 것은 r은 포함되지 않습니다."
    }
    ,{
        "reg": "d(?!r)",
        "dec": "r이 바로 뒤에 없는 d를 매칭합니다. 중요한 것은 r은 포함되지 않습니다."
    }
    ,{
        "reg": "(?<!r)d",
        "dec": "r이 바로 앞에 없는 d를 매칭합니다. 중요한 것은 r은 포함되지 않습니다."
    }
];

</script>

<!-- ===================== Basic Setting ===================== -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
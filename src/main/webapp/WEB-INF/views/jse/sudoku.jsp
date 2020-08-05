<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- ===================== Basic Setting ===================== -->
<div id="sudoku">

    <div class="row" style="margin-top: 200px;">
        <div class="col-5">
            <div id="inputTable" class="sudokuTable">

            </div>
        </div>
        <div class="col-2">
            <div id="run">
                <button class="btn btn-block btn-outline-danger" id="btnRun">Solution</button>
            </div>
        </div>
        <div class="col-5">
            <div id="outputTable" class="sudokuTable">

            </div>
        </div>
    </div>

</div>

<script>
$(() => {

    const tempSudoku = [
        // [8,0,1,0,0,3,9,0,6],
        // [0,0,9,0,0,7,8,5,0],
        // [2,5,0,1,0,0,4,7,0],
        // [5,0,0,0,6,1,7,0,4],
        // [7,6,0,8,3,0,0,0,0],
        // [0,3,2,0,0,0,0,0,0],
        // [0,2,0,0,1,9,5,0,0],
        // [0,0,5,0,0,0,3,0,2],
        // [0,0,0,4,5,2,1,9,7]

        // [9,5,8,2,0,0,7,0,0],
        // [0,0,0,9,0,4,6,0,0],
        // [0,7,0,8,0,0,0,1,0],
        // [0,4,7,0,1,9,0,6,8],
        // [0,0,5,0,8,0,0,0,0],
        // [0,6,0,0,5,0,0,0,0],
        // [5,0,0,0,9,8,0,0,3],
        // [0,8,1,0,0,0,9,0,0],
        // [0,0,0,6,2,0,0,0,0]

        [0, 6, 0, 0, 8, 0, 0, 0, 0],
        [1, 8, 0, 4, 0, 0, 0, 0, 7],
        [0, 0, 0, 5, 0, 0, 0, 2, 9],
        [0, 0, 6, 0, 0, 0, 0, 5, 0],
        [0, 5, 3, 0, 6, 9, 4, 0, 2],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 8, 0, 0, 6],
        [0, 0, 9, 2, 7, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 4, 0]
    ]
    var $inputTable = $("#inputTable");
    var $outputTable = $("#outputTable");
    var $run = $("#btnRun");

    function createTable(readOnly) {
        let html = '<table>';

        for (var i = 0; i < 9; i++) {
            html += '<tr>';
            for (var j = 0; j < 9; j++) {
                html += '<td>';
                html += '<input type="text" class="cell" maxlength="1" value="" style="';
                if (j % 3 == 2) {
                    html += 'margin-right:2px;';
                }
                if (i % 3 == 2) {
                    html += ' margin-bottom:2px;';
                }
                if (readOnly) {
                    html += '" readonly></td>';
                }
                else {
                    html += '"></td>';
                }
            }
            html += '</tr>';
        }

        html += '</table>';
        return html;
    }

    $inputTable.html(createTable(false));
    $outputTable.html(createTable(true));

    function setTempData(sudoku) {
        var $cell = $("#inputTable .cell");
        var cnt = 0;

        for (var i = 0; i < 9; i++) {
            for (var j = 0; j < 9; j++) {
                $cell.eq(cnt++).val(sudoku[i][j]);
            }
        }
    }

    // setTempData(tempSudoku);

    function getData() {
        var $cell = $("#inputTable .cell");
        var result = new Array();
        var cnt = 0;

        for (var i = 0; i < 9; i++) {
            result.push(new Array());
            for (var j = 0; j < 9; j++) {
                result[i][j] = (Number)($cell.eq(cnt++).val());
            }
        }

        return result;
    }


    // 행 단위에서 숫자 중복 체크
    function rowCheck(sudoku, row, num) {
        for (var i = 0; i < 9; i++) {
            if (sudoku[row][i] == num)
                return false;
        }
        return true;
    }


    // 열 단위에서 숫자 중복 체크
    function colCheck(sudoku, col, num) {
        for (var i = 0; i < 9; i++) {
            if (sudoku[i][col] == num)
                return false;
        }
        return true;
    }


    // 박스 단위에서 숫자 중복 체크
    function boxCheck(sudoku, xy, num) {
        for (var i = 0; i < 3; i++) {
            for (var j = 0; j < 3; j++) {
                if (sudoku[i + xy[1] * 3][j + xy[0] * 3] == num)
                    return false;
            }
        }
        return true;
    }


    // 행,열,박스 최종 숫자 중복 체크
    function checkAll(sudoku, x, y, num) {
        if (sudoku[y][x] != 0) {
            return false;
        }
        var xy = [Math.floor(x / 3), Math.floor(y / 3)];
        if (colCheck(sudoku, x, num) && rowCheck(sudoku, y, num) && boxCheck(sudoku, xy, num)) {
            return true;
        }
        return false;
    }


    function setUnique(sudoku) {
        var isValid = false;
        var temp = 0;
        for (var i = 0; i < 9; i++) {
            col: for (var j = 0; j < 9; j++) {
                if (sudoku[i][j] == 0) {
                    for (var k = 1; k <= 9; k++) {
                        if (!isValid && checkAll(sudoku, j, i, k)) {
                            temp = k;
                            isValid = true;
                        } else if (isValid && checkAll(sudoku, j, i, k)) {
                            isValid = false;
                            continue col;
                        }
                    }
                    if (isValid) {
                        sudoku[i][j] = temp;
                        isValid = false;
                    }
                }
            }
        }
    }
    // 깊은 탐색

    function rowValid(validList, row, n) {
        var cnt = 0;

        for (var i = 0; i < 9; i++) {
            if (validList[row][i] != null && validList[row][i].includes(n)) {
                cnt++;
            }
        }
        if (cnt == 1)
            return true;
        return false;
    }

    function colValid(validList, col, n) {
        var cnt = 0;

        for (var i = 0; i < 9; i++) {
            if (validList[i][col] != null && validList[i][col].includes(n)) {
                cnt++;
            }
        }
        if (cnt == 1)
            return true;
        return false;
    }

    function boxValid(validList, xy, n) {
        var cnt = 0;
        var temp;

        for (var i = 0; i < 3; i++) {
            for (var j = 0; j < 3; j++) {
                temp = validList[i + xy[1] * 3][j + xy[0] * 3];
                if (temp != null && temp.includes(n))
                    cnt++;
            }
        }
        if (cnt == 1)
            return true;
        return false;
    }

    function validAll(validList, x, y, n) {
        if (validList[y][x] == null || !(validList[y][x].includes(n)))
            return false;

        var xy = [Math.floor(x / 3), Math.floor(y / 3)];
        if (colValid(validList, x, n) || rowValid(validList, y, n) || boxValid(validList, xy, n)) {
            return true;
        }
        return false;
    }

    function getValidNumberList(sudoku) {
        var validList = new Array();
        for (var i = 0; i < 9; i++) {
            validList[i] = new Array();
        }
        for (var i = 0; i < 9; i++) {
            for (var j = 0; j < 9; j++) {
                for (var k = 1; k <= 9; k++) {
                    if (checkAll(sudoku, j, i, k)) {
                        if (validList[i][j] === undefined) {
                            validList[i][j] = (String)(k);
                        }
                        else {
                            validList[i][j] += (String)(k);
                        }
                    }
                }
            }
        }
        return validList;
    }

    function deepCheck(sudoku) {
        var validList = getValidNumberList(sudoku);
        for (var i = 0; i < 9; i++) {
            for (var j = 0; j < 9; j++) {
                for (var k = 1; k <= 9; k++) {
                    if (validAll(validList, j, i, k)) {
                        sudoku[i][j] = k;
                        break;
                    }
                }
            }
        }
    }

    function countEmpty(sudoku) {
        var cnt = 0;
        for (var i = 0; i < 9; i++) {
            for (var j = 0; j < 9; j++) {
                if (sudoku[i][j] == 0)
                    cnt++;
            }
        }
        return cnt;
    }

    function setData(sudoku) {
        var $cell = $("#outputTable .cell");
        var cnt = 0;
        for (var i = 0; i < 9; i++) {
            for (var j = 0; j < 9; j++) {
                $cell.eq(cnt++).val(sudoku[i][j]);
            }
        }
    }

    function isValidNumber(sudoku, x, y, num) {
        var xy = [Math.floor(x / 3), Math.floor(y / 3)];
        if (colCheck(sudoku, x, num) && rowCheck(sudoku, y, num) && boxCheck(sudoku, xy, num)) {
            return true;
        }
        return false;
    }

    function deepCopy(sudoku) {
        var copy = new Array();

        for (var i = 0; i < 9; i++) {
            copy[i] = new Array();
            for (var j = 0; j < 9; j++) {
                copy[i][j] = sudoku[i][j];
            }
        }

        return copy;
    }

    function solveStart(sudoku) {
        var step = 0;
        var temp = -1;
        var cnt = 0;
        var sw = false;

        while (true) {

            if (!sw)
                setUnique(sudoku);
            else
                deepCheck(sudoku);

            cnt = countEmpty(sudoku);

            if (sw && temp == cnt)
                break;

            if (temp == cnt)
                sw = true;

            temp = cnt;

            if (cnt == 0)
                break;
            if (step++ > 100)
                break;

            console.log(sw, step, cnt)
        }
    }

    $run.click(() => {
        var sudoku = getData();
        solveStart(sudoku);
        setData(sudoku);

        if (countEmpty(sudoku) != 0) {

            var save = deepCopy(sudoku);
            console.log("Allround Search");

            for (var i = 0; i < 9; i++) {
                for (var j = 0; j < 9; j++) {

                    if (sudoku[i][j] != 0)
                        continue;

                    for (var n = 1; n <= 9; n++) {
                        if (isValidNumber(sudoku, i, j, n)) {
                            sudoku[i][j] = n;
                            solveStart(sudoku);

                            if (countEmpty(sudoku) == 0) {
                                setData(sudoku);
                                return;
                            }
                            else {
                                sudoku = deepCopy(tempSudoku);
                            }
                        }
                    }
                }
            }
        }
    });

});
</script>
<!-- ===================== Basic Setting ===================== -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
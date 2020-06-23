<%@ page import="com.javaex.vo.PersonVo" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
     List<PersonVo> personList = (List<PersonVo>) request.getAttribute("pList");
%>

<html>
<head>
    <title>Phonebook02</title>
    <style>
        table {
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        input[type="text"], input[type="text"]:focus {
            border: 0;
            outline: none;
            font-size: 16px;
            width: 168px;
        }

        .show-write-form {
            width: 490px;
            border: 1px solid #000;
            height: 65px;
            background-color: transparent;
            font-size: 24px;
            line-height: 65px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="wrapper" style="margin:50px;">
        <h1>전화번호 리스트</h1>
        <p>입력한 정보 내역입니다</p>

        <%for(PersonVo p : personList) {%>
        <table border="2">
            <colgroup>
                <col style="width: 120px;">
                <col style="width: 170px;">
                <col style="width: 100px">
                <col style="width: 100px">
            </colgroup>
            <tr>
                <td>이름(name)</td>
                <td><%=p.getName()%>
                </td>
                <td rowspan="3" style="text-align: center">
                    <button type="submit"
                            style="color: blue;font-size: 16px;border: 0;background-color: transparent;cursor: pointer" onclick="showUpdateForm($(this))">수정</button>
                </td>
                <td rowspan="3" style="text-align: center">
                    <a href="./delete.jsp?personId=" style="text-decoration: none;color: red">삭제</a>
                </td>
            </tr>
            <tr>
                <td>핸드폰(hp)</td>
                <td><%=p.getHp()%>
                </td>
            </tr>
            <tr>
                <td>회사(company)</td>
                <td><%=p.getCompany()%>
                </td>
            </tr>
        </table>
        <form action="./update.jsp" method="post" style="display:none;">
            <input type="hidden" name="personId" value="">
            <table border="2">
                <colgroup>
                    <col style="width: 120px;">
                    <col style="width: 170px;">
                    <col style="width: 100px">
                    <col style="width: 100px">
                </colgroup>
                <tr>
                    <td>이름(name)</td>
                    <td><input type="text" name="name" value="<%=p.getName()%>">
                    </td>
                    <td rowspan="3" style="text-align: center">
                        <button type="submit"
                                style="color: green;font-size: 16px;border: 0;background-color: transparent;cursor: pointer">저장</button>
                    </td>
                    <td rowspan="3" style="text-align: center">
                        <button type="button"
                                style="color: coral;font-size: 16px;border: 0;background-color: transparent;cursor: pointer" onclick="hideUpdateForm($(this))">취소</button>
                    </td>
                </tr>
                <tr>
                    <td>핸드폰(hp)</td>
                    <td>
                        <input type="text" name="hp" value="<%=p.getHp()%>">
                    </td>
                </tr>
                <tr>
                    <td>회사(company)</td>
                    <td>
                        <input type="text" name="company" value="<%=p.getCompany()%>">
                    </td>
                </tr>
            </table>
        </form>
        <%}%>
        <button type="button" class="show-write-form" onclick="showWriteForm($(this))">새 번호 등록하기</button>
        <form action="/pb2/pbc" method="get" style="display: none" class="write-form">
            <input type="hidden" name="action" value="insert">
            <table border="2">
                <col style="width: 120px;">
                <col style="width: 170px;">
                <col style="width: 200px;">
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" placeholder="이름을 입력하세요"></td>
                    <td rowspan="3" style="text-align: center">
                        <button type="submit"
                                style="color: green;font-size: 16px;border: 0;background-color: transparent;cursor: pointer">
                            등록
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>전화번호(hp)</td>
                    <td><input type="text" name="hp" placeholder="전화번호를 입력하세요"></td>
                </tr>
                <tr>
                    <td>회사(company)</td>
                    <td><input type="text" name="company" placeholder="회사번호를 입력하세요"></td>
                </tr>
            </table>
        </form>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        function showWriteForm(target) {
            target.hide();
            $(".write-form").show();
        }
        function showUpdateForm(target) {
            var table = target.parents('table');
            var form = table.next('form');

            table.hide();
            form.show();
        }
        function hideUpdateForm(target) {
            var form = target.parents('form');
            var table = form.prev('table');

            form.hide();
            table.show();
        }
    </script>
</body>
</html>

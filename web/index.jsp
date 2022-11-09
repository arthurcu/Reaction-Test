<!--
Created by IntelliJ IDEA.
Date: 2022/11/01
Time: 14:18
To change this template use File | Settings | File Templates.
-->
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="UTF-8">

  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="css/util.css">
  <link rel="stylesheet" type="text/css" href="css/index.css">
  <!--===============================================================================================-->

</head>
<body>

<div class="limiter">
  <div class="container-login100">
    <div class="wrap-login100">
      <form action="home.jsp" class="login100-form validate-form" method="post">
                <span class="login100-form-title p-b-26">
                    Reaction Test
                </span>

        <span class="login100-form-title p-b-48">
						<i>start</i>
					</span>

        <div class="wrap-input100 validate-input" data-validate = "Please type your username">
          <input class="input100" type="text" name="name">
          <span class="focus-input100" data-placeholder="name"></span>
        </div>

        <div class="container-login100-form-btn">
          <div class="wrap-login100-form-btn">
            <div class="login100-form-bgbtn"></div>
            <button class="login100-form-btn">
              start
            </button>

          </div>
        </div>

        <div class="text-center p-t-115">
						<span class="txt1">
							HCI design
						</span>
        </div>
      </form>
    </div>
  </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="js/jquery/jquery-3.6.1.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</body>
</html>
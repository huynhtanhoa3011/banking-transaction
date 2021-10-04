    <%--
      Created by IntelliJ IDEA.
      User: DELL
      Date: 9/28/2021
      Time: 5:24 PM
      To change this template use File | Settings | File Templates.
    --%>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!-- Begin page -->
        <div id="wrapper">
        <!-- Topbar Start -->
        <div class="navbar-custom">
        <ul class="list-unstyled topnav-menu float-right mb-0">

        <li class="dropdown d-none d-lg-block">
        <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
        aria-expanded="false">
        <img src="assets\images\flags\us.jpg" alt="user-image" class="mr-2" height="12"> <span
        class="align-middle">VietNam <i class="mdi mdi-chevron-down"></i> </span>
        </a>
        <div class="dropdown-menu dropdown-menu-right">
        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <img src="assets\images\flags\spain.jpg" alt="user-image" class="mr-2" height="12"> <span
        class="align-middle">Spanish</span>
        </a>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <img src="assets\images\flags\italy.jpg" alt="user-image" class="mr-2" height="12"> <span
        class="align-middle">Italian</span>
        </a>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <img src="assets\images\flags\french.jpg" alt="user-image" class="mr-2" height="12"> <span
        class="align-middle">French</span>
        </a>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <img src="assets\images\flags\russia.jpg" alt="user-image" class="mr-2" height="12"> <span
        class="align-middle">Russian</span>
        </a>
        </div>
        </li>

        <li class="dropdown notification-list">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
        aria-expanded="false">
        <i class="mdi mdi-bell noti-icon"></i>
        <span class="badge badge-danger rounded-circle noti-icon-badge">4</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-lg">

        <!-- item-->
        <div class="dropdown-item noti-title">
        <h5 class="font-16 m-0">
        <span class="float-right">
        <a href="" class="text-dark">
        <small>Clear All</small>
        </a>
        </span>Notification
        </h5>
        </div>

        <div class="slimscroll noti-scroll">

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <div class="notify-icon bg-success"><i class="mdi mdi-comment-account-outline"></i></div>
        <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">1 min ago</small></p>
        </a>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <div class="notify-icon bg-info"><i class="mdi mdi-account-plus"></i></div>
        <p class="notify-details">New user registered.<small class="text-muted">5 hours ago</small></p>
        </a>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <div class="notify-icon bg-danger"><i class="mdi mdi-heart"></i></div>
        <p class="notify-details">Carlos Crouch liked <b>Admin</b><small class="text-muted">3 days ago</small></p>
        </a>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <div class="notify-icon bg-warning"><i class="mdi mdi-comment-account-outline"></i></div>
        <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">4 days ago</small></p>
        </a>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <div class="notify-icon bg-primary">
        <i class="mdi mdi-heart"></i>
        </div>
        <p class="notify-details">Carlos Crouch liked <b>Admin</b>
        <small class="text-muted">13 days ago</small>
        </p>
        </a>
        </div>

        <!-- All-->
        <a href="javascript:void(0);" class="dropdown-item text-primary text-center notify-item notify-all ">
        View all
        <i class="fi-arrow-right"></i>
        </a>

        </div>
        </li>

        <li class="dropdown notification-list">
        <a class="nav-link dropdown-toggle nav-user mr-0" data-toggle="dropdown" href="#" role="button"
        aria-haspopup="false" aria-expanded="false">
        <img src="assets\images\users\avatar-1.jpg" alt="user-image" class="rounded-circle">
        <span class="pro-user-name ml-1">
        Maxine K <i class="mdi mdi-chevron-down"></i>
        </span>
        </a>
        <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
        <!-- item-->
        <div class="dropdown-header noti-title">
        <h6 class="text-overflow m-0">Welcome !</h6>
        </div>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <i class="mdi mdi-account-outline"></i>
        <span>Profile</span>
        </a>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <i class="mdi mdi-settings-outline"></i>
        <span>Settings</span>
        </a>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <i class="mdi mdi-lock-outline"></i>
        <span>Lock Screen</span>
        </a>

        <div class="dropdown-divider"></div>

        <!-- item-->
        <a href="javascript:void(0);" class="dropdown-item notify-item">
        <i class="mdi mdi-logout-variant"></i>
        <span>Logout</span>
        </a>

        </div>
        </li>

        <li class="dropdown notification-list">
        <a href="javascript:void(0);" class="nav-link right-bar-toggle">
        <i class="mdi mdi-settings-outline noti-icon"></i>
        </a>
        </li>


        </ul>

        <!-- LOGO -->
        <div class="logo-box">
        <a href="index.html" class="logo text-center logo-dark">
        <span class="logo-lg">
        <img src="assets\images\logo-dark.png" alt="" height="26">
        <!-- <span class="logo-lg-text-dark">Simple</span> -->
        </span>
        <span class="logo-sm">
        <!-- <span class="logo-lg-text-dark">S</span> -->
        <img src="assets\images\logo-sm.png" alt="" height="22">
        </span>
        </a>

        <a href="index.html" class="logo text-center logo-light">
        <span class="logo-lg">
        <img src="assets\images\logo-light.png" alt="" height="26">
        <!-- <span class="logo-lg-text-light">Simple</span> -->
        </span>
        <span class="logo-sm">
        <!-- <span class="logo-lg-text-light">S</span> -->
        <img src="assets\images\logo-sm.png" alt="" height="22">
        </span>
        </a>
        </div>

        <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
        <li>
        <button class="button-menu-mobile">
        <i class="mdi mdi-menu"></i>
        </button>
        </li>

        <li class="d-none d-sm-block">
        <form class="app-search">
        <div class="app-search-box">
        <div class="input-group">
        <input type="text" class="form-control" placeholder="Search...">
        <div class="input-group-append">
        <button class="btn" type="submit">
        <i class="fas fa-search"></i>
        </button>
        </div>
        </div>
        </div>
        </form>
        </li>
        </ul>
        </div>
        <!-- end Topbar --> <!-- ========== Left Sidebar Start ========== -->
        <div class="left-side-menu">


        <div class="user-box">
        <div class="float-left">
        <img src="assets\images\users\avatar-1.jpg" alt="" class="avatar-md rounded-circle">
        </div>
        <div class="user-info">
        <a href="#">Stanley Jones</a>
        <p class="text-muted m-0">Administrator</p>
        </div>
        </div>

        <!--- Sidemenu -->
        <div id="sidebar-menu">

        <ul class="metismenu" id="side-menu">

        <li class="menu-title">Navigation</li>

        <li>
        <a href="index.html">
        <i class="ti-home"></i>
        <span> Dashboard </span>
        </a>
        </li>

        <li>
        <a href="ui-elements.html">
        <i class="ti-paint-bucket"></i>
        <span> UI Elements </span>
        <span class="badge badge-primary float-right">11</span>
        </a>
        </li>

        <li>
        <a href="javascript: void(0);">
        <i class="ti-light-bulb"></i>
        <span> Components </span>
        <span class="menu-arrow"></span>
        </a>
        <ul class="nav-second-level" aria-expanded="false">
        <li><a href="components-range-slider.html">Range Slider</a></li>
        <li><a href="components-alerts.html">Alerts</a></li>
        <li><a href="components-icons.html">Icons</a></li>
        <li><a href="components-widgets.html">Widgets</a></li>
        </ul>
        </li>

        <li>
        <a href="typography.html">
        <i class="ti-spray"></i>
        <span> Typography </span>
        </a>
        </li>

        <li>
        <a href="javascript: void(0);">
        <i class="ti-pencil-alt"></i>
        <span> Forms </span>
        <span class="menu-arrow"></span>
        </a>
        <ul class="nav-second-level" aria-expanded="false">
        <li><a href="forms-general.html">General Elements</a></li>
        <li><a href="forms-advanced.html">Advanced Form</a></li>
        </ul>
        </li>

        <li>
        <a href="javascript: void(0);">
        <i class="ti-menu-alt"></i>
        <span> Tables </span>
        <span class="menu-arrow"></span>
        </a>
        <ul class="nav-second-level" aria-expanded="false">
        <li><a href="tables-basic.html">Basic Tables</a></li>
        <li><a href="tables-advanced.html">Advanced Tables</a></li>
        </ul>
        </li>

        <!-- <li>
        <a href="charts.html">
        <i class="ti-pie-chart"></i>
        <span> Charts </span>
        <span class="badge badge-primary float-right">5</span>
        </a>
        </li>

        <li>
        <a href="maps.html">
        <i class="ti-location-pin"></i>
        <span> Maps </span>
        </a>
        </li>

        <li>
        <a href="javascript: void(0);">
        <i class="ti-files"></i>
        <span> Pages </span>
        <span class="menu-arrow"></span>
        </a>
        <ul class="nav-second-level" aria-expanded="false">
        <li><a href="pages-login.html">Login</a></li>
        <li><a href="pages-register.html">Register</a></li>
        <li><a href="pages-forget-password.html">Forget Password</a></li>
        <li><a href="pages-lock-screen.html">Lock-screen</a></li>
        <li><a href="pages-blank.html">Blank page</a></li>
        <li><a href="pages-404.html">Error 404</a></li>
        <li><a href="pages-confirm-mail.html">Confirm Mail</a></li>
        <li><a href="pages-session-expired.html">Session Expired</a></li>
        </ul>
        </li>

        <li>
        <a href="javascript: void(0);">
        <i class="ti-widget"></i>
        <span> Extra Pages </span>
        <span class="menu-arrow"></span>
        </a>
        <ul class="nav-second-level" aria-expanded="false">

        <li><a href="extras-timeline.html">Timeline</a></li>
        <li><a href="extras-invoice.html">Invoice</a></li>
        <li><a href="extras-profile.html">Profile</a></li>
        <li><a href="extras-calendar.html">Calendar</a></li>
        <li><a href="extras-faqs.html">FAQs</a></li>
        <li><a href="extras-pricing.html">Pricing</a></li>
        <li><a href="extras-contacts.html">Contacts</a></li>
        </ul>
        </li>

        <li>
        <a href="javascript: void(0);">
        <i class="ti-layout"></i>
        <span> Layouts </span>
        <span class="badge badge-danger badge-pill float-right">New</span>
        </a>
        <ul class="nav-second-level" aria-expanded="false">
        <li><a href="layouts-horizontal.html">Horizontal</a></li>
        <li><a href="layouts-dark-sidebar.html">Dark Sidebar</a></li>
        <li><a href="layouts-small-sidebar.html">Small Sidebar</a></li>
        <li><a href="layouts-sidebar-collapsed.html">Sidebar Collapsed</a></li>
        </ul>
        </li>

        <li>
        <a href="javascript: void(0);">
        <i class="ti-share"></i>
        <span> Multi Level </span>
        <span class="menu-arrow"></span>
        </a>
        <ul class="nav-second-level nav" aria-expanded="false">
        <li>
        <a href="javascript: void(0);">Level 1.1</a>
        </li>
        <li>
        <a href="javascript: void(0);" aria-expanded="false">Level 1.2
        <span class="menu-arrow"></span>
        </a>
        <ul class="nav-third-level nav" aria-expanded="false">
        <li>
        <a href="javascript: void(0);">Level 2.1</a>
        </li>
        <li>
        <a href="javascript: void(0);">Level 2.2</a>
        </li>
        </ul>
        </li>
        </ul>
        </li> -->
        </ul>

        </div>
        <!-- End Sidebar -->

        <div class="clearfix"></div>


        </div>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

        <div class="content-page">
        <!-- -->
        <!-- end content -->
        <div class="container">
        <div class="table-title">
        <div class="row">
        <%--        <div class="col-sm-5" style="color: red ">--%>
        <%--        <h2><i class="fa fa-university" aria-hidden="true"></i>BANKING MANAGER</h2>--%>
        <%--        </div>--%>
        <div class="col-sm-7">
        <a href="/customers?action=create" class="btn btn-success"><i class="fa fa-plus-square-o"
        aria-hidden="true"></i> <span>Add New Customer</span></a>
        <a href="/transfers" class="btn btn-success"><i class="fa fa-history" aria-hidden="true"></i> <span>Transfer
        money Information</span></a>
        </div>
        </div>
        </div>
        <table class="table table-striped table-hover table-light">
        <thead>
        <tr>
        <th class="table-warning">Id</th>
        <th class="table-warning">Name</th>
        <th class="table-warning">Email</th>
        <th class="table-warning">Phone</th>
        <th class="table-warning">Address</th>
        <th class="table-warning">Balance</th>
        <th colspan="5" class="table-warning" style="text-align: center">Action</th>
        </tr>
        </thead>

        <c:forEach var="user" items="${listCustomer}">
            <tr>
            <td><c:out value="${user.getId()}"/></td>
            <td><c:out value="${user.getName()}"/></td>
            <td><c:out value="${user.getEmail()}"/></td>
            <td><c:out value="${user.getPhone()}"/></td>
            <td><c:out value="${user.getAddress()}"/></td>
            <td><c:out value="${user.getBalance()}"/></td>
            <td><a class="btn btn-success" href="/customers?action=deposits&id=${user.id}" title="Deposit">
            <i class="fa fa-plus" aria-hidden="true"></i>
            </a></td>
            <td><a class="btn btn-warning" href="/customers?action=withdraws&id=${user.id}" title="Withdraw">
            <i class="fa fa-minus" aria-hidden="true"></i>
            </a></td>
            <td><a class="btn btn-primary" href="/customers?action=transfer&id=${user.id}" title="Transfer">
            <i class="fa fa-exchange" aria-hidden="true"></i>
            </a></td>
            <td><a class="btn btn-info" href="/customers?action=edit&id=${user.id}" title="Edit">
            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
            </a></td>
            <td><a class="btn btn-danger" id="deleteAll" href="/customers?action=delete&id=${user.id}"
            title="Delete">
            <i class="fa fa-trash-o" aria-hidden="true"></i>
            </a></td>
            </tr>
        </c:forEach>
        </table>
        </div>


        </div>
        <!-- END content-page -->

        </div>
        <!-- END wrapper -->

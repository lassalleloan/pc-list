<%--
 - author Loan Lassalle (loan.lassalle@heig-vd.ch)
 - author Jérémie Zanone (jeremie.zanone@heig-vd.ch)
 - since 13.09.2017
 --%>

<%@include file="includes/header.jsp" %>

<!-- Page Header -->
<header class="masthead text-center" style="background-image: url('static/img/list-bg.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="page-heading">
                    <h1>${pageTitle}</h1>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- List Content -->
<article class="text-center">

    <!-- Links for all things -->
    <div class="container">
        <div class="row">
            <div class="mx-auto">
                <table class="table" id="menu">
                    <thead class="tab-header-area">
                    <tr>
                        <th><a class="nav-link" href="<c:url value="/list"/>">All</a></th>
                        <th><a class="nav-link" href="<c:url value="/list?product=pc"/>">PC</a></th>
                        <th><a class="nav-link" href="<c:url value="/list?product=cpu"/>">Processor</a></th>
                        <th><a class="nav-link" href="<c:url value="/list?product=ram"/>">Memory</a></th>
                        <th><a class="nav-link" href="<c:url value="/list?product=gpu"/>">Graphic</a></th>
                    </tr>
                    </thead>
                </table>
                <br>
            </div>
        </div>
    </div>

    <!-- Information message during an action -->
    <c:if test="${!allList && informationMessage != null}">
        <div class="container">
            <div class="row">
                <div class="mx-auto">
                    <p class="p-3" style="color:red">${informationMessage}</p><br>
                </div>
            </div>
        </div>
    </c:if>

    <!-- List of pc -->
    <c:if test="${allList || pcList != null}">
        <div class="container">
            <div class="row">
                <div class="mx-auto">
                    <a class="nav-link" href="<c:url value="/list?product=pc"/>"><h3>PC</h3></a>
                    <br>
                    <table class="table" id="table">
                        <thead class="tab-header-area">
                        <tr>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=pc&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=brand&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Brand</a>
                            </th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=pc&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=cpuBrand&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Processor</a>
                            </th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=pc&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=cpuCores&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Number
                                of Cores</a></th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=pc&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=cpuFrequency&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Frequency</a>
                            </th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=pc&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=ramBrand&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Memory</a>
                            </th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=pc&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=ramSize&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Memory
                                Size</a></th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=pc&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=gpuBrand&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Graphic</a>
                            </th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=pc&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=price&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Price</a>
                            </th>
                            <c:if test="${!allList}">
                                <th colspan="2"><a class="nav-link"
                                                   href="<c:url value="/create?product=pc#menu"/>">Add</a>
                                </th>
                            </c:if>
                        </tr>
                        </thead>
                        <c:forEach items="${pcList}" var="pc">
                            <tr>
                                <td>${pc.brand}</td>
                                <td>${pc.cpu.brand}</td>
                                <td>${pc.cpu.cores}</td>
                                <td>${pc.cpu.frequency}GHz</td>
                                <td>${pc.ram.brand}</td>
                                <td>${pc.ram.size}GB</td>
                                <td>${pc.gpu.brand}</td>
                                <td>${pc.price}.-</td>
                                <c:if test="${!allList}">
                                    <td><a class="nav-link"
                                           href="<c:url value="/edit?product=pc&id=${pc.idPc}#menu"/>">Edit</a></td>
                                    <td><a class="nav-link"
                                           href="<c:url value="/delete?product=pc&id=${pc.idPc}#menu"/>">Delete</a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <c:if test="${allList}">
                            <tr>
                                <td colspan="8"><a class="nav-link" href="<c:url value="/list?product=pc"/>">...</a>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                    <br>
                </div>
            </div>
        </div>
    </c:if>

    <!-- List of cpu -->
    <c:if test="${allList || cpuList != null}">
        <div class="container">
            <div class="row">
                <div class="mx-auto">
                    <a class="nav-link" href="<c:url value="/list?product=cpu"/>"><h3>Processor</h3></a>
                    <br>
                    <table class="table" id="table">
                        <thead class="tab-header-area">
                        <tr>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=cpu&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=brand&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Brand</a>
                            </th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=cpu&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=cores&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Number
                                of Cores</a></th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=cpu&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=frequency&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Frequency</a>
                            </th>
                            <c:if test="${!allList}">
                                <th colspan="2"><a class="nav-link"
                                                   href="<c:url value="/create?product=cpu#menu"/>">Add</a>
                                </th>
                            </c:if>
                        </tr>
                        </thead>
                        <c:forEach items="${cpuList}" var="cpu">
                            <tr>
                                <td>${cpu.brand}</td>
                                <td>${cpu.cores}</td>
                                <td>${cpu.frequency}GHz</td>
                                <c:if test="${!allList}">
                                    <td><a class="nav-link"
                                           href="<c:url value="/edit?product=cpu&id=${cpu.idCpu}#menu"/>">Edit</a>
                                    </td>
                                    <td><a class="nav-link"
                                           href="<c:url value="/delete?product=cpu&id=${cpu.idCpu}#menu"/>">Delete</a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <c:if test="${allList}">
                            <tr>
                                <td colspan="3"><a class="nav-link" href="<c:url value="/list?product=cpu"/>">...</a>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                    <br>
                </div>
            </div>
        </div>
    </c:if>

    <!-- List of ram -->
    <c:if test="${allList || ramList != null}">
        <div class="container">
            <div class="row">
                <div class="mx-auto">
                    <a class="nav-link" href="<c:url value="/list?product=ram"/>"><h3>Memory</h3></a>
                    <br>
                    <table class="table" id="table">
                        <thead class="tab-header-area">
                        <tr>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=ram&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=brand&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Brand</a>
                            </th>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=ram&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=size&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Size</a>
                            </th>
                            <c:if test="${!allList}">
                                <th colspan="2"><a class="nav-link"
                                                   href="<c:url value="/create?product=ram#menu"/>">Add</a>
                                </th>
                            </c:if>
                        </tr>
                        </thead>
                        <c:forEach items="${ramList}" var="ram">
                            <tr>
                                <td>${ram.brand}</td>
                                <td>${ram.size}GB</td>
                                <c:if test="${!allList}">
                                    <td><a class="nav-link"
                                           href="<c:url value="/edit?product=ram&id=${ram.idRam}#menu"/>">Edit</a>
                                    </td>
                                    <td><a class="nav-link"
                                           href="<c:url value="/delete?product=ram&id=${ram.idRam}#menu"/>">Delete</a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <c:if test="${allList}">
                            <tr>
                                <td colspan="2"><a class="nav-link" href="<c:url value="/list?product=ram"/>">...</a>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                    <br>
                </div>
            </div>
        </div>
    </c:if>

    <!-- List of gpu -->
    <c:if test="${allList || gpuList != null}">
        <div class="container">
            <div class="row">
                <div class="mx-auto">
                    <a class="nav-link" href="<c:url value="/list?product=gpu"/>"><h3>Graphic</h3></a>
                    <br>
                    <table class="table" id="table">
                        <thead class="tab-header-area">
                        <tr>
                            <th><a class="nav-link"
                                   href="<c:url value="/list?product=gpu&pageSize=${pageSize}&pageIndex=${pageIndex}&orderBy=brand&direction=${direction == 'DESC' ? 'ASC' : 'DESC'}#table"/>">Brand</a>
                            </th>
                            <c:if test="${!allList}">
                                <th colspan="2"><a class="nav-link"
                                                   href="<c:url value="/create?product=gpu#menu"/>">Add</a>
                                </th>
                            </c:if>
                        </tr>
                        </thead>
                        <c:forEach items="${gpuList}" var="gpu">
                            <tr>
                                <td>${gpu.brand}</td>
                                <c:if test="${!allList}">
                                    <td><a class="nav-link"
                                           href="<c:url value="/edit?product=gpu&id=${gpu.idGpu}#menu"/>">Edit</a>
                                    </td>
                                    <td><a class="nav-link"
                                           href="<c:url value="/delete?product=gpu&id=${gpu.idGpu}#menu"/>">Delete</a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <c:if test="${allList}">
                            <tr>
                                <td><a class="nav-link" href="<c:url value="/list?product=gpu"/>">...</a></td>
                            </tr>
                        </c:if>
                    </table>
                    <br>
                </div>
            </div>
        </div>
    </c:if>

    <!-- Links for others pages -->
    <c:if test="${!allList}">
        <div class="container">
            <div class="row">
                <div class="mx-auto">
                    <br>
                    <table class="table">
                        <tr>
                            <td>
                                <c:if test="${pageIndex > 0}">
                                    <a class="nav-link"
                                       href="<c:url value="/list?product=${product}&pageSize=${pageSize}&pageIndex=0&orderBy=${orderBy}&direction=${direction}#table"/>">
                                        << </a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${pageIndex > 0}">
                                    <a class="nav-link"
                                       href="<c:url value="/list?product=${product}&pageSize=${pageSize}&pageIndex=${pageIndex - 1}&orderBy=${orderBy}&direction=${direction}#table"/>">
                                        < </a>
                                </c:if>
                            </td>
                            <td>Page ${pageIndex + 1} / ${pageCount}</td>
                            <td>
                                <c:if test="${pageIndex + 1 < pageCount}">
                                    <a class="nav-link"
                                       href="<c:url value="/list?product=${product}&pageSize=${pageSize}&pageIndex=${pageIndex + 1}&orderBy=${orderBy}&direction=${direction}#table"/>">
                                        > </a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${pageIndex + 1 < pageCount}">
                                    <a class="nav-link"
                                       href="<c:url value="/list?product=${product}&pageSize=${pageSize}&pageIndex=${pageCount - 1}&orderBy=${orderBy}&direction=${direction}#table"/>">
                                        >> </a>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <label>
                                    <select onchange="changePageSize(this.value)">
                                        <option value="10">10</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                        <option value="500">500</option>
                                        <option value="1000">1000</option>
                                    </select>
                                </label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </c:if>

</article>

<hr>

<script>
    function changePageSize(pageSize) {
        location.href = "/pclist/list?product=${product}&pageSize=" + pageSize + "&pageIndex=0&orderBy=${orderBy}&direction=${direction}#table";
    }
</script>

<%@include file="includes/footer.jsp" %>

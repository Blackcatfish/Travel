<div class="tabs_tabs tabs1_tabs">
    <ul>
        <li class="hotels active"><a href="#tabs-1">酒店</a></li>
        <li class="train"><a href="#tabs-2">火车票</a></li>
    </ul>
</div>
<div class="tabs_content tabs1_content">
    <div id="tabs-1">
        <form action="search.html" class="form1" method="post">
            <div class="row">
                <div class="col-sm-4 col-md-4">
                    <div class="input1_wrapper">
                        <label>搜索:</label>
                        <div class="input2_inner">
                            <input type="text" value="${param.keywords}" name="keywords"/>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="input1_wrapper">
                        <label>价格:</label>
                        <div class="input2_inner">
                            <input type="text" value="${param.min}" name="min"/>
                        </div>
                    </div>
                </div>
                <div style="float:left;height:66px;line-height:66px;padding-top:10px">-</div>
                <div class="col-sm-4 col-md-3">
                    <div class="input1_wrapper">
                        <label>&nbsp;</label>
                        <div class="input2_inner">
                            <input type="text" value="${param.max}" name="max"/>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-2" style="width:16%">
                    <div class="button1_wrapper">
                        <button type="submit" class="btn-default btn-form1-submit">搜索</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div id="tabs-2">
        <form action="javascript:;" class="form1">
            <div class="row">
                <div class="col-sm-4 col-md-4">
                    <div class="select1_wrapper">
                        <label>起始地:</label>
                        <div class="select1_inner">
                            <select class="select2 select" style="width: 100%">
                                <option value="1">Please Select</option>
                                <option value="2">Alaska</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <div class="select1_wrapper">
                        <label>目的地:</label>
                        <div class="select1_inner">
                            <select class="select2 select" style="width: 100%">
                                <option value="1">Please Select</option>
                                <option value="2">Alaska</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-2">
                    <div class="input1_wrapper">
                        <label>出发日期:</label>
                        <div class="input1_inner">
                            <input type="text" class="input datepicker" value="Mm/Dd/Yy">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-2">
                    <div class="button1_wrapper">
                        <button type="submit" class="btn-default btn-form1-submit">Search</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
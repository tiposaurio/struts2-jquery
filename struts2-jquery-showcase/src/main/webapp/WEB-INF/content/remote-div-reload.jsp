<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<h2>Remote Divs with reloadable content</h2>

<p class="text">
	Remote divs and select boxes with AJAX content they reload content automatically by a given interval or triggered by events.
</p>
<strong>Div reloads : <span id="counter1"></span></strong>
<img id="indicator1"
     src="images/indicator.gif"
     alt="Loading..."
     style="display:none"/>
<s:url var="ajax1" value="/ajax1.action"/>
<sj:div id="div1"
        href="%{ajax1}"
        indicator="indicator1"
        reloadTopics="reloaddiv1"
        onCompleteTopics="completediv1"
        effect="highlight"
        cssClass="result ui-widget-content ui-corner-all">
</sj:div>
<sj:a
		id="refreshlink"
		onClickTopics="refreshdiv"
		button="true"
		buttonIcon="ui-icon-refresh"
		>
	Refresh Div
</sj:a>

<br/><br/>

<strong>Div reloads every 10 seconds : <span id="counter2"></span></strong>
<img id="indicator2"
     src="images/indicator.gif"
     alt="Loading..."
     style="display:none"/>
<s:url var="ajax2" value="/ajax2.action"/>
<sj:div id="div2"
        href="%{ajax2}"
        indicator="indicator2"
        reloadTopics="reloaddiv2"
        onCompleteTopics="completediv2"
        effect="highlight"
        cssClass="result ui-widget-content ui-corner-all">
</sj:div>

<br/><br/>

<strong>List Reloads : <span id="counter3"></span></strong>
<s:form id="formSelectOne" action="echo" theme="simple" cssClass="yform">
	<fieldset>
		<legend>AJAX Form</legend>
		<div class="type-select">
			<label for="echo">List: </label>
			<s:url var="remoteurl" action="jsonsample"/>
			<sj:select
					reloadTopics="reloadlist"
					onCompleteTopics="completelist"
					href="%{remoteurl}"
					id="echo"
					name="echo"
					list="languageList"/>
		</div>
	</fieldset>
</s:form>
<sj:a
		id="refreshlink2"
		onClickTopics="refreshlist"
		button="true"
		buttonIcon="ui-icon-refresh"
		>
	Refresh List
</sj:a>
<sj:submit
		id="refreshsubmit2"
		onClickTopics="reloaddiv3"
		button="true"
		buttonIcon="ui-icon-refresh"
		/>

<br/><br/>

<strong>Div reloads every 15 seconds with form values : <span id="counter4"></span></strong>
<img id="indicator3"
     src="images/indicator.gif"
     alt="Loading..."
     style="display:none"/>
<sj:div id="div3"
        formIds="formSelectOne"
        indicator="indicator3"
        reloadTopics="reloaddiv3"
        onCompleteTopics="completediv3"
        effect="highlight"
        cssClass="result ui-widget-content ui-corner-all">
</sj:div>

<br/><br/>

<strong>Div with updateFreq every 5000 milliseconds</strong>
<img id="indicator4"
     src="images/indicator.gif"
     alt="Loading..."
     style="display:none"/>
<s:url var="ajax3" value="/ajax3.action"/>
<sj:div id="div4"
        href="%{ajax3}"
        indicator="indicator4"
        updateFreq="5000"
        effect="highlight"
        cssClass="result ui-widget-content ui-corner-all">
</sj:div>

<h4>Source Code</h4>

<sj:tabbedpanel id="localtabs" cssClass="list">
	<sj:tab id="tab1" target="javascript" label="JavaScript Code"/>
	<sj:tab id="tab2" target="jsp" label="JSP Code"/>
	<div id="javascript">
	  <pre>
            <code class="html">
var refreshDiv1 = 0;
var refreshDiv2 = 0;
var refreshDiv3 = 0;
var refreshList = 0;

$.subscribe('refreshlist', function(event,data) {
	$.publish('reloadlist');
});
$.subscribe('refreshdiv', function(event,data) {
	$.publish('reloaddiv1');
});
$.subscribe('completediv1', function(event,data) {
	if(event.originalEvent.status == &quot;success&quot;)
	{
		$('#counter1').html(++refreshDiv1);
	}
});
$.subscribe('completediv2', function(event,data) {
	if(event.originalEvent.status == &quot;success&quot;)
	{
		$('#counter2').html(++refreshDiv2);
		setTimeout( function() {
			$.publish('reloaddiv2');
		}, 10000 );
	}
});
$.subscribe('completediv3', function(event,data) {
	if(event.originalEvent.status == &quot;success&quot;)
	{
		$('#counter4').html(++refreshDiv3);
		setTimeout( function() {
			$.publish('reloaddiv3');
		}, 15000 );
	}
});
$.subscribe('completelist', function(event,data) {
	if(event.originalEvent.status == &quot;success&quot;)
	{
		$('#counter3').html(++refreshList);
	}
});
			</code>
	  </pre>
	</div>
	<div id="jsp">
	  <pre>
            <code class="html">
&lt;strong&gt;Div reloads : &lt;span id=&quot;counter1&quot;&gt;&lt;/span&gt;&lt;/strong&gt;
&lt;s:url id=&quot;ajax1&quot; value=&quot;/ajax1.action&quot;/&gt;
&lt;sj:div id=&quot;div1&quot;
		href=&quot;%{ajax1}&quot;
		indicator=&quot;indicator1&quot;
		reloadTopics=&quot;reloaddiv1&quot;
		onCompleteTopics=&quot;completediv1&quot;
		effect=&quot;highlight&quot;
		cssClass=&quot;result ui-widget-content ui-corner-all&quot;&gt;
	&lt;img id=&quot;indicator1&quot;
		src=&quot;images/indicator.gif&quot;
		alt=&quot;Loading...&quot;
		style=&quot;display:none&quot;/&gt;
&lt;/sj:div&gt;
&lt;sj:a
	id=&quot;refreshlink&quot;
	onClickTopics=&quot;refreshdiv&quot;
	button=&quot;true&quot;
	buttonIcon=&quot;ui-icon-refresh&quot;
&gt;
	Refresh Div
&lt;/sj:a&gt;

&lt;br/&gt;&lt;br/&gt;

&lt;strong&gt;Div reloads every 10 seconds : &lt;span id=&quot;counter2&quot;&gt;&lt;/span&gt;&lt;/strong&gt;
&lt;s:url id=&quot;ajax2&quot; value=&quot;/ajax2.action&quot;/&gt;
&lt;sj:div id=&quot;div2&quot;
		href=&quot;%{ajax2}&quot;
		indicator=&quot;indicator2&quot;
		reloadTopics=&quot;reloaddiv2&quot;
		onCompleteTopics=&quot;completediv2&quot;
		effect=&quot;highlight&quot;
		cssClass=&quot;result ui-widget-content ui-corner-all&quot;&gt;
	&lt;img id=&quot;indicator2&quot;
		src=&quot;images/indicator.gif&quot;
		alt=&quot;Loading...&quot; style=&quot;display:none&quot;/&gt;
&lt;/sj:div&gt;

&lt;br/&gt;&lt;br/&gt;

&lt;strong&gt;List Reloads : &lt;span id=&quot;counter3&quot;&gt;&lt;/span&gt;&lt;/strong&gt;
&lt;s:form id=&quot;formSelectOne&quot; action=&quot;echo&quot; theme=&quot;simple&quot; cssClass=&quot;yform&quot;&gt;
	&lt;fieldset&gt;
		&lt;legend&gt;AJAX Form&lt;/legend&gt;
		&lt;div class=&quot;type-select&quot;&gt;
			&lt;label for=&quot;echo&quot;&gt;List: &lt;/label&gt;
			&lt;s:url id=&quot;remoteurl&quot; action=&quot;jsonsample&quot;/&gt;
			&lt;sj:select
				reloadTopics=&quot;reloadlist&quot;
				onCompleteTopics=&quot;completelist&quot;
				href=&quot;%{remoteurl}&quot; id=&quot;echo&quot;
				name=&quot;echo&quot;
				list=&quot;languageList&quot;/&gt;
		&lt;/div&gt;
	&lt;/fieldset&gt;
&lt;/s:form&gt;
&lt;sj:a
	id=&quot;refreshlink2&quot;
	onClickTopics=&quot;refreshlist&quot;
	button=&quot;true&quot;
	buttonIcon=&quot;ui-icon-refresh&quot;
&gt;
	Refresh List
&lt;/sj:a&gt;
&lt;sj:submit
	id=&quot;refreshsubmit2&quot;
	onClickTopics=&quot;reloaddiv3&quot;
	button=&quot;true&quot;
	buttonIcon=&quot;ui-icon-refresh&quot;
/&gt;

&lt;br/&gt;&lt;br/&gt;

&lt;strong&gt;Div reloads every 15 seconds with form values : &lt;span id=&quot;counter4&quot;&gt;&lt;/span&gt;&lt;/strong&gt;
&lt;sj:div id=&quot;div3&quot;
		formIds=&quot;formSelectOne&quot;
		indicator=&quot;indicator3&quot;
		reloadTopics=&quot;reloaddiv3&quot;
		onCompleteTopics=&quot;completediv3&quot;
		effect=&quot;highlight&quot;
		cssClass=&quot;result ui-widget-content ui-corner-all&quot;&gt;
	&lt;img id=&quot;indicator3&quot;
			src=&quot;images/indicator.gif&quot;
			alt=&quot;Loading...&quot;
			style=&quot;display:none&quot;/&gt;
&lt;/sj:div&gt;

&lt;br/&gt;&lt;br/&gt;

&lt;strong&gt;Div with updateFreq every 5000 milliseconds&lt;/strong&gt;
&lt;img id=&quot;indicator4&quot;
		src=&quot;images/indicator.gif&quot;
		alt=&quot;Loading...&quot;
		style=&quot;display:none&quot;/&gt;
&lt;s:url id=&quot;ajax3&quot; value=&quot;/ajax3.action&quot;/&gt;
&lt;sj:div id=&quot;div4&quot;
		href=&quot;%{ajax3}&quot;
		indicator=&quot;indicator4&quot;
		updateFreq=&quot;5000&quot;
		effect=&quot;highlight&quot;
		cssClass=&quot;result ui-widget-content ui-corner-all&quot;&gt;
&lt;/sj:div&gt;
			</code>
	  </pre>
	</div>
</sj:tabbedpanel>

